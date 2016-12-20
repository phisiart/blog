PDFLATEX=pdflatex
PDF2SVG=pdf2svg

SRC = $(wildcard *.tex)
PDF = $(patsubst %.tex, %.pdf, $(SRC))
SVG = $(wildcard *.tex, %.svg, $(SRC))

%.pdf: %.tex
	$(PDFLATEX) $^ > /dev/null 2>&1

%.svg: %.pdf
	$(PDF2SVG) $^ $@ > /dev/null 2>&1

