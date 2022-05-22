COURSES = \
        NAIL062 \
        NDBI025 \
        NDMI002 \
        NDMI011 \
        NJAZ070 \
        NJAZ072 \
        NJAZ074 \
        NJAZ090 \
        NJAZ091 \
        NMAI054 \
        NMAI057 \
        NMAI058 \
        NMAI059 \
        NMAI069 \
        NPRG030 \
        NPRG031 \
        NPRG045 \
        NPRG062 \
        NSWI120 \
        NSWI141 \
        NSWI170 \
        NSWI177 \
        NTIN060 \
        NTIN061 \
        NTIN071 \
        NTVY014 \
        NTVY015 \
        NTVY016 \
        NTVY017 \



PAGES_TMP=$(addsuffix .html, $(COURSES))
PAGES_HTML=$(addprefix public_html/, $(PAGES_TMP))

all: $(PAGES_HTML) _menu.md _menu.html public_html/index.html main.css

.PHONY: all clean


_menu.md: src/N*.meta ./bin/make_menu.sh
        ./bin/make_menu.sh src/N*.meta >_menu.md

_menu.html: _menu.md
        pandoc _menu.md >_menu.html

public_html/%.html: src/%.md template.html _menu.html
        pandoc --template template.html -B _menu.html -o $@ $< --metadata-file


ppublic_html/index.html: src/index.md template.html _menu.html
        pandoc --template template.html -B  _menu.html  src/index.md >public_html/index.html

clean:
        rm -f public_html/*.html _menu.html _menu.md


