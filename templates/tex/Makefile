LATEX?=pdflatex
LATEXFLAGS?=-halt-on-error

TEX:=$(wildcard *.tex)
PDF:=$(TEX:%.tex=%.pdf)

.PHONY: buildclean build clean cleanall

buildclean: build clean

build: $(PDF)

clean:
	rm -rf *.aux *.log *.nav *.out *.snm *.toc || true

cleanall: clean
	rm -rf *.pdf || true

%.pdf: %.tex
	$(LATEX) $(LATEXFLAGS) $<
	$(LATEX) $(LATEXFLAGS) $<
	# run twice for labels
