<!-- oss-factory:v1
{"id":"20261018-rpi-image-gen-queue","kind":"state","project":"rpi-image-gen","from":"chatgpt","to":["factory"],"status":"working","civ":{"city_id":"oss:rpi-image-gen"},"dedupe_key":"promotion-queue:raspberrypi/rpi-image-gen","lease":{"owner":"RpiExistingReviewRepair","claim":"raspberrypi/rpi-image-gen#338","state":"claimed","claimed_at":"2026-10-18T08:03:57.293282+00:00","expires_at":"2026-10-18T10:03:57.293282+00:00"}}
-->

# rpi-image-gen canonical existing-upstream queue

Origin: https://github.com/raspberrypi/rpi-image-gen · Owning coordination fork: https://github.com/kvnloo/rpi-image-gen

The fork has Issues and Discussions disabled. This documentation-only branch/PR is the single canonical queue; do not create a factory fallback or duplicate implementation PR. Last audit: 2026-10-18. Provisional registry route: [existing factory registration PR193](https://github.com/kvnloo/oss-factory/pull/193), exact proposal commit `fe81698edcd77dc4d2a41254933903e06236d3ae`; not merged into factory main. Project `rpi-image-gen`, city `oss:rpi-image-gen`; provisional membership, no invented physical placement.

## Authorization and claim

Kevin's explicit active-conversation campaign authorizes scoped coordination, actual review repair on existing PR338 if current repository policy permits, and one factual technical-evidence reply; no duplicate origin PR, default-branch merge, force-push, settings change, repeated Actions-approval ping, paid model/fallback, or hardware claim. This receipt records that bounded approval, not an independent grant. Global coordinator assigned this worker an available slot (at most six campaign claims). Worker RpiExistingReviewRepair claims **only PR338 repair/qualification**, before source mutation, under the machine-envelope lease. PR335 is review/design classification only, not an implementation claim.

## Goal lock

- Target: `kvnloo/rpi-image-gen:docs/cloud-init-imager-boundary@b3e1aa9fdbe846750d32bce2ee9b4c509262c442` / existing [origin PR338](https://github.com/raspberrypi/rpi-image-gen/pull/338).
- Controls: exact original head above; current origin `master@d7616a28bbb552db77cfd7bf90888f7a9ef22f33` (PR API cached base differs: `bb4dbeed8cc4231a4fcf4ca50be51038550c6fa1`; Git/defaultBranchRef agree on current master).
- Requirement: original sample contributor Daniel F. Dickinson's [positive Scope wording](https://github.com/raspberrypi/rpi-image-gen/pull/338#issuecomment-5897181777), plus learmj's [CHANGES_REQUESTED review](https://github.com/raspberrypi/rpi-image-gen/pull/338#pullrequestreview-5532978237).
- Proof: render actual changed Markdown using the project's Markdown conversion path in isolated tooling; open generated HTML in a real browser, inspect Scope, Usage and navigation. Before-fix render records negative wording; after-fix render must explain the first-boot NoCloud use positively while retaining CIDATA/IDP/Imager boundaries. This is **documentation proof only**, not image generation, hardware boot, cloud provisioning, Imager write, or upstream CI proof.

## Ready

None verified ready. No merges authorized.

## Existing upstream review

| Origin | Exact existing source | Requirement and review | Disposition / next step |
| --- | --- | --- | --- |
| [335](https://github.com/raspberrypi/rpi-image-gen/pull/335) | `fix/rota-disable-eeprom-update@341dbfb429da5fd729274b09df19d2fa81bca0ba` | EEPROM/read-only boot report [270](https://github.com/raspberrypi/rpi-image-gen/issues/270); learmj [latest inline](https://github.com/raspberrypi/rpi-image-gen/pull/335#discussion_r4285541151) and [changes requested](https://github.com/raspberrypi/rpi-image-gen/pull/335#pullrequestreview-5536420831): direction unclear. | **ORIGIN_LIVE / HOLD / blocked-external design decision**. Current branch conflicts. Do not select token or service gate; see Held section. |
| [337](https://github.com/raspberrypi/rpi-image-gen/pull/337) | `docs/layer-version-selection@3cbc1baa2340a881ca5bc01365ed7c8c05bf2f46` | Existing replacement/version mechanism, refs [162](https://github.com/raspberrypi/rpi-image-gen/issues/162). Complete current conversation/reviews/inline sweep: no comments/reviews. | **ORIGIN_LIVE / CHECK**. No source work or test claim this wave. |
| [338](https://github.com/raspberrypi/rpi-image-gen/pull/338) | `docs/cloud-init-imager-boundary@b3e1aa9fdbe846750d32bce2ee9b4c509262c442` | Contributor positive-scope request + learmj changes requested. | **ORIGIN_LIVE / open review repair**, claimed above. Preserve original commit and Daniel F. Dickinson's sample attribution. |
| [339](https://github.com/raspberrypi/rpi-image-gen/pull/339) | `docs/merged-usr-dpkgopts@8290d3d24dd1888b34ff90717304983aba392e8b` | Existing merged-usr filter behavior, refs [283](https://github.com/raspberrypi/rpi-image-gen/pull/283). Complete current conversation/reviews/inline sweep: none. | **ORIGIN_LIVE / CHECK**. No source work or test claim this wave. |
| [340](https://github.com/raspberrypi/rpi-image-gen/pull/340) | `docs/python-venv-dependencies@da16170c588f5341426e48a0d5cc2fe310a00ef0` | Existing PATH/isolated-venv behavior, refs [293](https://github.com/raspberrypi/rpi-image-gen/issues/293). Complete current conversation/reviews/inline sweep: none. | **ORIGIN_LIVE / CHECK**. No source work or test claim this wave. |

All five existing PRs were authored by account owner Kevin Rajan (kvnloo); do not invent third-party authorship for that account. Original actual contributor credit remains with Daniel F. Dickinson for cloud-init skeleton commit `e7a4d8575f38bc1e399c9a9aa781dcfde27f0dd0`. learmj owns the maintainer review/design context. No source PR is closed or replaced by this queue.

## Needs proof

PR338 exact candidate and rendered browser evidence pending. CI rollup is absent on all five captured exact heads; absent check data is not a passing test nor code failure. No Actions approval/settings workaround requested.

## Held or superseded

PR335: learmj rejected direct `image-rota` coupling in security policy ([earlier inline](https://github.com/raspberrypi/rpi-image-gen/pull/335#discussion_r4154057719)). Latest inline considers moving `boot:rpi:firmware-readonly` to generic `image:<something>:immutable`, but explicitly has not decided the token, and questions whether a trait is needed at all versus `ConditionPathIsReadWrite=/boot/firmware` in the EEPROM updater service. A service drop-in cannot know whether a particular update needs boot-partition writes; the answer depends on hardware and installed image and is determined by `rpi-eeprom-update`. Current master image-rota v6.1.0 still provides only `image`; security policy v1.0.1 enables/disables the service from the existing `eepromupd` boolean. Current boot layout changes (boot.img / optional boot.sig, read-only mount) must be preserved. This is **not** a request to invent a trait or drop-in. Remaining gate: maintainer decision about capability abstraction versus updater-owned runtime eligibility, plus real relevant hardware evidence if required; subsequent integration must resolve current image-layer conflicts. No PR335 source changes in this wave.

## Landed

None established in this wave.

## Discovery, policy and evidence provenance

- Authoritative factory policy read from current factory main `f9ab500d9ac44944d7299311d990f79c46e1877b`: AGENTS, CONTROL_PLANE, HITL, projects, PROMOTION_QUEUES. Registry proposal above supplies the new provisional route.
- Origin current tracked tree has no AGENTS/CONTRIBUTING/CODE_OF_CONDUCT or origin AI restriction found. `contrib/README.adoc` accepts PRs, marks community additions best-effort/possibly lagging, and requires no secrets. Existing authorized same-PR docs repair is within that contribution path. Source scope stays one README, no speculative behavior changes.
- GraphQL all-five conversations, submitted reviews, per-review comments, and reviewThreads used `first:100`; every parent and nested pagination flag was false. PR338 has one contributor conversation comment, learmj review body “See comments”, **zero inline review threads/comments exposed**, independently checked public `/files` HTML (no inline discussion anchors). No invented missing inline request. PR335 has three inline threads including latest October15 discussion; all fully read.
- Fork open PRs empty, all-state fork issue/PR search empty, all26 branch refs inspected (no coordination/promotion/queue branch), legacy factory repo-name search empty. No prior canonical queue found. Parent scoped this worker as queue coordinator. Reconcile post-create races before source mutation.
- Git/defaultBranchRef pin actual upstream master; source-only trace: example installs cloud-init/userconf-pi and NoCloud config; datasource list `[NoCloud, None]`, `/boot/firmware` seedfrom commented out; usage describes separate FAT32 CIDATA USB. IDP provisioning docs define image.json layout/provisioning map, not Imager customisation. External current pi-gen stage2 cloud-init installs seed files under `/boot/firmware`; Imager stages customisation only for a supported init format. These are code/document facts, not executed device behavior.

Evidence and result will be appended here/this PR, with exact candidate, native commands, generated render, origin write links or explicit none, remaining review gate, and lease release. No project details belong in Factory14 beyond this repository/queue locator.

## PR338 rendered-source result (2026-10-18)

**ORIGIN_LIVE / LIMITED / addressed-needs-rerun.** Existing authorized branch was fast-forward pushed to [`f7ff6465e68be05a82afc5d080532fa9f9f639a0`](https://github.com/kvnloo/rpi-image-gen/commit/f7ff6465e68be05a82afc5d080532fa9f9f639a0); [origin PR338](https://github.com/raspberrypi/rpi-image-gen/pull/338) now reports that exact head against master `d7616a28bbb552db77cfd7bf90888f7a9ef22f33`, mergeable. Original `b3e1aa9fdbe846750d32bce2ee9b4c509262c442` is retained; normal integration merge `19486ff7f9532de60e2c6d286fc24efb5483d9e8` has parents original head + current master, followed by the one-README repair. Daniel F. Dickinson is credited as co-author for the adapted proposed Scope, and original skeleton/history remains intact. No duplicate origin PR/default merge/force-push.

Actual native comparison: before source mutation rendered `b3e1aa9fdbe846750d32bce2ee9b4c509262c442` using `docs/generate.py:md2html(format="markdown")`; opened in Chromium and observed negative Scope without first-boot/minimal-base purpose. After edits, rendered exact `f7ff6465e68be05a82afc5d080532fa9f9f639a0` once with the same helper, inspected actual generated Scope and unchanged Usage in Chromium, captured full-page evidence, and clicked the new relative provisioning link to actual IDP HTML. This is not a string-only assertion. Minimal standalone wrapper, not GitHub styling or a full site build; adjacent provisioning is unchanged checked-in generated HTML, not rebuilt. Python3.14.8, Markdown3.11.1, Jinja2 3.1.6, PyYAML6.0.3, python-debian1.1.1, Chromium153.0.8010.36.

Durable proof on this coordination branch: [machine result and exact native commands](evidence/pr338/result.json), [reproducible renderer](evidence/pr338/render_readme.py), [original generated HTML](evidence/pr338/control/contrib/src/cloud-init/README.html), [candidate generated HTML](evidence/pr338/head/contrib/src/cloud-init/README.html), [before screenshot](evidence/pr338/before-scope.webp), [after screenshot](evidence/pr338/after-scope.webp), [actual adjacent navigation](evidence/pr338/provisioning-navigation.png), [candidate observed browser DOM](evidence/pr338/head-browser.json). Paths are repository-root relative in the PR files/branch; no generated HTML was added to the source PR.

Source facts separately pinned: [NoCloud datasource config](https://github.com/raspberrypi/rpi-image-gen/blob/d7616a28bbb552db77cfd7bf90888f7a9ef22f33/contrib/src/cloud-init/files/sys-tweaks/99_raspberry-pi.cfg#L1-L6), [layer installation](https://github.com/raspberrypi/rpi-image-gen/blob/d7616a28bbb552db77cfd7bf90888f7a9ef22f33/contrib/src/cloud-init/layer/cloud-init.yaml#L14-L20), [IDP emission/schema validation](https://github.com/raspberrypi/rpi-image-gen/blob/d7616a28bbb552db77cfd7bf90888f7a9ef22f33/builtin/hooks/postimage50-idp#L23-L34), [pi-gen seed placement](https://github.com/RPi-Distro/pi-gen/blob/59b67461533c2eef3564bc48eb3ce5c16e5c62ee/stage2/04-cloud-init/01-run.sh). [Current maintainer direction on184](https://github.com/raspberrypi/rpi-image-gen/issues/184#issuecomment-6219063622) distinguishes contrib cloud-init outside Imager from merged [275](https://github.com/raspberrypi/rpi-image-gen/pull/275)'s rpi-preseed scheme. Repair therefore does **not** assert all Imager customisation uses cloud-init.

PR335 source/review gate is unchanged: [Pi4 report270](https://github.com/raspberrypi/rpi-image-gen/issues/270) records failed pieeprom.sig writes and degraded state; reporter confirms existing eepromupd:n helps, but latest maintainer review explicitly leaves trait-versus-service architecture undecided. Source `genimage.cfg.in.erofs/ext4:87–103`, `slot-post-process.sh:27`, and security baseline corroborate image/read-only/policy context, not hardware behavior. No335 edits, no service drop-in, no speculative trait.

No full image/HW/cloud/Imager-write proof. Exact-head upstream CI rollup is absent, not a pass or a code failure. learmj CHANGES_REQUESTED remains; reviewer reassessment is the remaining PR338 gate. One factual evidence reply pending; no Actions approval ping. Lease remains held until final response/result receipt.
