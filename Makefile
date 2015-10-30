SRC = $(wildcard inkscape/*.svg)
TGT = $(subst inkscape/,,$(SRC))

all: $(TGT)

%.svg: inkscape/%.svg
	svgo -i $< -o $@
