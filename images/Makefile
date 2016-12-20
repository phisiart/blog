PDFLATEX=pdflatex
PDF2SVG=pdf2svg

SRC = $(wildcard *.tex)
PDF = $(patsubst %.tex, %.pdf, $(SRC))
SVG = $(wildcard *.tex, %.svg, $(SRC))

all:
	echo $(SVG)

$(PDF): $(SRC)
	$(PDFLATEX) $^

$(SVG): $(PDF)
	$(PDF2SVG) $^ $@

