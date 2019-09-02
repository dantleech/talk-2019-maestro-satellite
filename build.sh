#!/sbin/bash
set -x
ls dot/*.dot | sed -e 's/.dot//g' | parallel --bar -I% --max-args 1 dot %".dot" -Tpng -o %".png"
pandoc -t beamer slides.md -o slides.pdf --slide-level=2 -V classoption:aspectratio=169
