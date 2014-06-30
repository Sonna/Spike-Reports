## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files (complete with bibliography, if present) from
## your markdown file.
## -  Change the paths at the top of the file as needed.
## -  Using `make` without arguments will generate html, tex, and pdf
##  output files from all of the files with the designated markdown
##  extension. The default is `.md` but you can change this.
## -  You can specify an output format with `make tex`, `make pdf` or
## -  `make html`.
## -  Doing `make clean` will remove all the .tex, .html, and .pdf files
##  in your working directory. Make sure you do not have files in these
##  formats that you want to keep!

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## Pandoc extensions
MARKDOWN = markdown+multiline_tables+grid_tables+table_captions+yaml_metadata_block+definition_lists+raw_tex+footnotes+citations

## All markdown files in the working directory
SRC = $(wildcard markdown/*.$(MEXT))

## Location of Pandoc support files.
PREFIX = /Users/Sonna/.pandoc

## Location of your working bibliography file
BIB = /Users/Sonna/Documents/bibs/References.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = apsa


PDFS = output/spike_reports.pdf
HTML = output/spike_reports.html
TEX = output/spike_reports.tex


all:  $(PDFS) $(HTML) $(TEX)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)

ouput/%.html:	markdown/%.md
	pandoc -r $(MARKDOWN) -w html -S --template=$(PREFIX)/templates/html.template --css=$(PREFIX)/marked/kultiad-serif.css --filter pandoc-citeproc --bibliography=$(BIB) --mathjax --number-sections -o $@ $<

output/%.tex:	markdown/%.md
	pandoc -r $(MARKDOWN) -w latex -s -S --latex-engine=/usr/texbin/pdflatex --filter pandoc-citeproc --bibliography=$(BIB) --mathjax --number-sections -o $@ $<

output/%.pdf:	markdown/%.md
	pandoc -r $(MARKDOWN) -s -S --latex-engine=/usr/texbin/pdflatex --filter pandoc-citeproc --bibliography=$(BIB) --mathjax --number-sections -o $@ $<

clean:
	rm -f *.html *.pdf *.tex
