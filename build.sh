#!/usr/bin/env bash
# Concatenate the source parts into the single-file app and syntax-check the script.
set -e
cd "$(dirname "$0")"
{ cat src/01_head.html; echo '<script>'; cat src/02_core.js src/03_route.js src/04_render.js src/05_app.js src/06_panels.js; echo '</script></body></html>'; } > videodraw.html
cat src/02_core.js src/03_route.js src/04_render.js src/05_app.js src/06_panels.js > /tmp/videodraw_all.js
node --check /tmp/videodraw_all.js && echo "built videodraw.html ($(wc -c < videodraw.html) bytes)"
