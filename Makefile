MAIN := template/main.typ
TYPST ?= typst
FLAGS := --root . --font-path fonts

.PHONY: pdf watch notes clean

pdf:
	$(TYPST) compile $(FLAGS) $(MAIN) example.pdf

watch:
	$(TYPST) watch $(FLAGS) $(MAIN) example.pdf

# Speaker notes for pdfpc: `pdfpc example.pdf`
notes:
	$(TYPST) query $(FLAGS) $(MAIN) --field value --one "<pdfpc-file>" > example.pdfpc

clean:
	rm -f example.pdf example.pdfpc
