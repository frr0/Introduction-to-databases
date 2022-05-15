#!/bin/sh

name=$1

f_md=$name.md
f_pdf=$name.pdf

pandoc -s -i \
    --lua-filter=center.lua \
    --pdf-engine=xelatex \
    -V geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" \
    -V colorlinks \
    -V urlcolor=NavyBlue \
    -o $f_pdf $f_md +RTS -Ksize -RTS

# stuff to add
# 
# latex packges to put in the md file:
# - \usepackage{mathtools}
# - \usepackage{multicol}
    #--toc -N \
    #--highlight-style zenburn \
