FILE=main
TEX=$(wildcard *.tex)
FIG = figures

all: $(FILE).pdf


$(FILE).pdf: $(TEX)
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex

okular: $(FILE).pdf
	okular $(FILE).pdf &
	
evince: $(FILE).pdf
	evince $(FILE).pdf &

clean:
	rm -f $(FILE).aux $(FILE).log $(FILE).out $(FILE).bbl $(FILE).blg $(FILE).toc 
	rm -f $(FILE).nav $(FILE).snm

mrproper: clean
	rm -f $(FILE).pdf
