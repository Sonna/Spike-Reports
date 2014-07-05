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

## Requires:
##   - Location of source files to convert
##   - Location of source files to convert
##   - Location of your working bibliography file
##   - Location of Citation Style Language (CSL) stylesheet
##   - Location of default LaTeX Template
##
PROJECT_NAME = spikes

SOURCE_DIRECTORY = markdown
TARGET_DIRECTORY = output

BIB = /Users/Sonna/Documents/bibs/References.bib
CSL = csl/harvard-swinburne-university-of-technology.csl
# TEMPLATE = templates/main.tex
TEMPLATE = templates/default_latex.template

COMPILER = pandoc

PANDOC_EXTENSIONS = markdown \
                    multiline_tables \
                    grid_tables \
                    table_captions \
                    pandoc_title_block \
                    yaml_metadata_block \
                    definition_lists \
                    footnotes \
                    citations

# Substring from array method. This methods finds the spaces between words
# and then subsitutes them with a new value, often commas between words.
#
#   e.g.
#
#     word1 word2 word3 -> word1, word2, word3
#
# Reference:
# - http://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_8.html
plus:=+
empty:=
space:= $(empty) $(empty)
extensions:= $(subst $(space),$(plus),$(PANDOC_EXTENSIONS))


PREFLAGS = -r $(extensions)

POSTFLAGS = --standalone \
            --smart \
            --latex-engine=/usr/texbin/pdflatex \
            --template=$(TEMPLATE) \
            --filter pandoc-citeproc \
            --csl=$(CSL) \
            --bibliography=$(BIB) \
            --mathjax \
            --chapters \
            --number-sections \
            --table-of-contents

## All markdown files in the source directory
# SRC = $(wildcard $(SOURCE_DIRECTORY)**/*.md)
SRC := $(shell find $(SOURCE_DIRECTORY) -name "*.md")

FILENAME = $(TARGET_DIRECTORY)/$(PROJECT_NAME)

DOCX = $(FILENAME:=.docx)
PDFS = $(FILENAME:=.pdf)
HTML = $(FILENAME:=.html)
TEX  = $(FILENAME:=.tex)


all:  $(DOCX) $(PDFS) $(HTML) $(TEX)

docx:	clean $(DOCX)
pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)


$(TARGET_DIRECTORY):
	mkdir $(TARGET_DIRECTORY)

$(HTML):	$(SRC)
	$(COMPILER) $(PREFLAGS) -w html $(POSTFLAGS) --template=templates/html.template --css=/Users/Sonna/.pandoc/marked/kultiad-serif.css -o $@ $^

$(TEX) $(PDFS) $(DOCX):	$(SRC)
	$(COMPILER) $(PREFLAGS) $(POSTFLAGS) -o $@ $^

clean:
	rm $(DOCX) $(PDFS) $(HTML) $(TEX)
