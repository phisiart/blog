PDFLATEX=pdflatex
PDF2SVG=pdf2svg
RM=rm

SRC = $(wildcard *.tex)
SVG = $(patsubst %.tex, %.svg, $(SRC))

%.svg: %.tex
	$(PDFLATEX) $< > /dev/null 2>&1
	$(PDF2SVG) $*.pdf $@ > /dev/null 2>&1
	$(RM) $*.pdf $*.aux $*.log

.PHONY: all clean

all: $(SVG)

clean:
	$(RM) $(SVG)
