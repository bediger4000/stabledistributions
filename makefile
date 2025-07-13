CAUCHYPLOTS = cauchy_histo.png cauchy_combo.png cauchy_combo_pdf.png
all: $(CAUCHYPLOTS)

normalcombo: normalcombo.go
	go build normalcombo.go

cauchycombo: cauchycombo.go
	go build cauchycombo.go

normal.dat: normalcombo
	./normalcombo > normal.dat

cauchy.dat: cauchycombo
	./cauchycombo > cauchy.dat

$(CAUCHYPLOTS): cauchy.dat cauchy_plots.r
	R --no-save < cauchy_plots.r

clean:
	-rm -rf cauchycombo normalcombo
	-rm -rf normal.dat
	-rm -rf cauchy.dat
	-rm -rf $(CAUCHYPLOTS)
