#!/bin/bash
for filename in *.tex; do
    name=${filename%.tex}
    pdflatex ${name}.tex
    pdf2svg ${name}.pdf ${name}.svg
done

rm *.aux
rm *.log
rm *.pdf

