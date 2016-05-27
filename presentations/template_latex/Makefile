FILE=main
TEX=$(wildcard *.tex)
#FIG = figures
#LOGO = ../../logos/
#DIA = $(wildcard $(FIG)*.dia)
#DIA		= $(wildcard ../../figures/vision_archi/*.dia)
#FEPS	= $(DIA:.dia=.eps)
#EPS		= $(wildcard ../../logos/*.eps) $(FEPS) $(wildcard ../../figures/vision_archi/*.eps)
#PDF		= $(EPS:.eps=.pdf)

#.PRECIOUS : $(EPS)

all: $(FILE).pdf

#%.eps: %.dia
#	dia $< -e $@
#
#%.pdf: %.eps
#	epstopdf $<

$(FILE).pdf: $(TEX)
#	make -C $(FIG)
	pdflatex $(FILE).tex
#	bibtex $(FILE)
#	pdflatex $(FILE).tex
	pdflatex $(FILE).tex

##$(FILE).pdf: $(FILE).tex $(PDF)
#$(FILE).pdf: $(FILE).tex $(DIA)
#	make -C $(FIG)
#	make -C $(LOGO)
##	pdflatex $(FILE).tex
##	bibtex $(FILE)
#	pdflatex $(FILE).tex
#	pdflatex $(FILE).tex

okular: $(FILE).pdf
	okular $(FILE).pdf &
	
evince: $(FILE).pdf
	evince $(FILE).pdf &

clean:
#	make -C $(FIG) clean
	rm -f $(FILE).aux $(FILE).log $(FILE).out $(FILE).bbl $(FILE).blg $(FILE).toc 
	rm -f $(FILE).nav $(FILE).snm
#	rm -f $(PDF) 
#	rm -f $(FEPS)

mrproper: clean
	rm -f $(FILE).pdf
