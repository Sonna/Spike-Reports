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

COMPILER = pandoc

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## Pandoc extensions
PANDOC_EXTENSIONS = markdown \
                    multiline_tables \
                    grid_tables \
                    table_captions \
                    yaml_metadata_block \
                    definition_lists \
                    raw_tex \
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

## All markdown files in the working directory
IN_DIR = markdown
SRC = $(wildcard $(IN_DIR)/*.$(MEXT))

OUT_DIR = output
SRC_FILENAME = $(notdir $(SRC))
OUT = $(OUT_DIR)/$(SRC_FILENAME)


## Location of your working bibliography file
BIB = /Users/Sonna/Documents/bibs/References.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = csl/harvard-swinburne-university-of-technology.csl

## LaTeX Template
TEMPLATE = frontmatter/main.tex


OPTIONS = --latex-engine=/usr/texbin/pdflatex \
          --template=$(TEMPLATE) \
          --filter pandoc-citeproc \
          --csl=$(CSL) \
          --bibliography=$(BIB) \
          --mathjax \
          --number-sections \
          --table-of-contents


DOCX=$(OUT:.md=.docx)
PDFS=$(OUT:.md=.pdf)
HTML=$(OUT:.md=.html)
TEX=$(OUT:.md=.tex)


all:  $(DOCX) $(PDFS) $(HTML) $(TEX)

docx:	clean $(DOCX)
pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)

$(OUT_DIR):
	mkdir $(OUT_DIR)

$(OUT_DIR)/%.html:	$(IN_DIR)/%.md
	$(COMPILER) $(PREFLAGS) -w html -S $(OPTIONS) --template=templates/html.template --css=/Users/Sonna/.pandoc/marked/kultiad-serif.css -o $@ $<

$(OUT_DIR)/%.tex:	$(IN_DIR)/%.md
	$(COMPILER) $(PREFLAGS) -w latex -s -S $(OPTIONS) -o $@ $<

$(OUT_DIR)/%.pdf:	$(IN_DIR)/%.md
	$(COMPILER) $(PREFLAGS) -s -S $(OPTIONS) -o $@ $<

$(OUT_DIR)/%.docx:	$(IN_DIR)/%.md
	$(COMPILER) $(PREFLAGS) -s -S $(OPTIONS) -o $@ $<

clean:
	rm -f $(OUT_DIR)/*.html \
      $(OUT_DIR)/*.pdf \
      $(OUT_DIR)/*.tex \
      $(OUT_DIR)/*.docx
