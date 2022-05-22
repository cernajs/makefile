#!/bin/bash

set -ueo pipefail
set -x

build_page() {	
    local temp="$(basename $1)"
    local page="$(basename "${temp}" .html)"
    shift

    pandoc \
        --template template.html \
        -B _menu.html "src/${page}.md" \
        "$@"
        echo $page
}
