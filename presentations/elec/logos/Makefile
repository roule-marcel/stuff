DIA = $(wildcard *.dia)
GFIG = $(DIA:.dia=.fig)
GEPS_gen = $(GFIG:.fig=.eps)
GEPS = $(GEPS_gen) $(wildcard *.eps)
GPDF = $(GEPS:.eps=.pdf)
GPNG = $(GEPS:.eps=.png)

all: $(GPDF)
#all: $(GEPS)

%.fig: %.dia
	dia $< -e $@

%.eps: %.fig
	fig2eps --nogv $<

%.pdf: %.eps
	epstopdf $<

%.png: %.eps
	convert $< $@

clean:
	rm -f $(GFIG) $(GEPS_gen) $(GPDF) $(GPNG)

mrproper: clean
