#!/bin/bash
set -uo pipefail

IGTOP=$(readlink -f "$(dirname "$0")/../..")
TOOL="$IGTOP/image/gpt/ab_userdata/image.d/bin/slot-shared-manifest"
TMP=$(mktemp -d -t slot-shared.XXXXXX)
trap 'rm -rf "$TMP"' EXIT

pass=0
fail=0

check() {
    local name=$1; shift
    if "$@"; then
        echo "PASS: $name"
        ((pass++))
    else
        echo "FAIL: $name"
        ((fail++))
    fi
}

new_root() {
    local root="$TMP/$1"
    mkdir -p "$root/etc/rpi-image-gen/slot-shared.d"
    echo "$root"
}

valid_manifest() {
    local root
    root=$(new_root valid)
    cat >"$root/etc/rpi-image-gen/slot-shared.d/a.conf" <<'EOF'
Version=1
Path=/var/lib/z
Path=/etc/ssh
EOF
    cat >"$root/etc/rpi-image-gen/slot-shared.d/b.conf" <<'EOF'
Version=1
Path=/var//lib/a/
EOF
    "$TOOL" "$root" >/dev/null || return 1
    diff -u - "$root/etc/rpi-image-gen/slot-shared.manifest" <<'EOF'
Version=1
Path=/etc/ssh
Path=/var/lib/a
Path=/var/lib/z
EOF
}

relative_rejected() {
    local root
    root=$(new_root relative)
    printf 'Version=1\nPath=var/lib/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/a.conf"
    ! "$TOOL" "$root" >/dev/null 2>&1
}

duplicate_rejected() {
    local root
    root=$(new_root duplicate)
    printf 'Version=1\nPath=/etc/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/a.conf"
    printf 'Version=1\nPath=/etc/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/b.conf"
    ! "$TOOL" "$root" >/dev/null 2>&1
}

cross_dropin_overlap_rejected() {
    local root
    root=$(new_root overlap)
    printf 'Version=1\nPath=/etc/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/a.conf"
    printf 'Version=1\nPath=/etc/app/state\n' >"$root/etc/rpi-image-gen/slot-shared.d/b.conf"
    ! "$TOOL" "$root" >/dev/null 2>&1
}

same_dropin_nested_ordered() {
    local root
    root=$(new_root nested)
    printf 'Version=1\nPath=/etc/app/state\nPath=/etc/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/a.conf"
    "$TOOL" "$root" >/dev/null || return 1
    local parent child
    parent=$(grep -n '^Path=/etc/app$' "$root/etc/rpi-image-gen/slot-shared.manifest" | cut -d: -f1)
    child=$(grep -n '^Path=/etc/app/state$' "$root/etc/rpi-image-gen/slot-shared.manifest" | cut -d: -f1)
    test "$parent" -lt "$child"
}

bad_version_rejected() {
    local root
    root=$(new_root version)
    printf 'Version=2\nPath=/etc/app\n' >"$root/etc/rpi-image-gen/slot-shared.d/a.conf"
    ! "$TOOL" "$root" >/dev/null 2>&1
}

check valid-manifest valid_manifest
check relative-rejected relative_rejected
check duplicate-rejected duplicate_rejected
check cross-dropin-overlap-rejected cross_dropin_overlap_rejected
check same-dropin-nested-ordered same_dropin_nested_ordered
check bad-version-rejected bad_version_rejected

echo "Passed: $pass"
echo "Failed: $fail"
test "$fail" -eq 0
