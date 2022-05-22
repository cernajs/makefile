#!/bin/bash

set -ueo pipefail
set -x

build_page() {
	local page=$(basename -s .md $1)
    shift

    pandoc \
        --template template.html \
        -B _menu.html "src/${page}.md" \
        "$@" \
        > "public_html/${page}.html"
}

