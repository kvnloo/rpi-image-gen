#!/usr/bin/env python3
"""Render the actual contrib README with the repository's Markdown converter."""
import argparse
import hashlib
import html
import importlib.util
import json
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('source', type=Path)
parser.add_argument('destination', type=Path)
args = parser.parse_args()
source = args.source.resolve()
readme = source / 'contrib/src/cloud-init/README.md'
spec = importlib.util.spec_from_file_location('rpi_docs_generate', source / 'docs/generate.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
fragment = module.md2html(readme.read_text(), format='markdown')
sha = subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip()
destination = args.destination.resolve()
page = destination / 'contrib/src/cloud-init/README.html'
page.parent.mkdir(parents=True, exist_ok=True)
page.write_text('<!doctype html><html lang="en"><head><meta charset="utf-8">'
                '<meta name="viewport" content="width=device-width, initial-scale=1">'
                '<title>cloud-init for rpi-image-gen — rendered source</title>'
                '<style>body{font:18px/1.55 sans-serif;max-width:850px;margin:2em auto;padding:0 1em}'
                'code{background:#eee;padding:.1em .3em}a{color:#1452a3}</style>'
                '</head><body><main>' + fragment + '</main><footer><hr><small>Source commit: '
                + html.escape(sha) + '</small></footer></body></html>')
# Adjacent documentation is the project's already-generated checked-in HTML,
# unchanged between the control and candidate, not a new full-site build.
provisioning = destination / 'docs/provisioning/index.html'
provisioning.parent.mkdir(parents=True, exist_ok=True)
provisioning.write_bytes((source / 'docs/provisioning/index.html').read_bytes())
metadata = {'tested_head': sha, 'source': str(readme),
            'source_sha256': hashlib.sha256(readme.read_bytes()).hexdigest(),
            'renderer': str(source / 'docs/generate.py') + ':md2html(format="markdown")',
            'renderer_sha256': hashlib.sha256((source / 'docs/generate.py').read_bytes()).hexdigest(),
            'generated': str(page), 'html_sha256': hashlib.sha256(page.read_bytes()).hexdigest(),
            'adjacent_provisioning': 'unchanged checked-in generated HTML; not rebuilt',
            'boundary': 'documentation rendering only; no image/hardware/cloud/Imager/CI execution'}
(destination / 'render-metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')
print(json.dumps(metadata, indent=2))
