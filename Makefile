SRC = $(wildcard inkscape/*.svg)
TGT = $(subst inkscape/,,$(SRC)) \
      $(subst inkscape/,png/,$(patsubst %.svg,%.png,$(SRC))) \
      $(subst inkscape/,pdf/,$(patsubst %.svg,%.pdf,$(SRC))) \
      $(subst inkscape/,eps/,$(patsubst %.svg,%.eps,$(SRC))) \

all: $(TGT)

%.svg: inkscape/%.svg
	svgo -i $< -o $@

temp:
	mkdir -p temp

png:
	mkdir -p png

eps:
	mkdir -p eps

pdf:
	mkdir -p pdf

temp/%.png: inkscape/%.svg temp
	inkscape --export-png=$@ $<

png/%.png: temp/%.png png
	optipng -clobber -out $@ $<

pdf/%.pdf: inkscape/%.svg pdf
	inkscape --export-pdf=$@ $<

eps/%.eps: inkscape/%.svg eps
	inkscape --export-eps=$@ $<
