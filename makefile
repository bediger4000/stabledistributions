CAUCHYPLOTS = cauchy_histo.png cauchy_combo.png cauchy_combo_pdf.png
NORMALPLOTS = normal_ratio.png
MULTIPLOTS = multi_uniform.png

all: $(CAUCHYPLOTS) $(NORMALPLOTS) $(MULTIPLOTS)

normalcombo: normalcombo.go
	go build normalcombo.go

cauchycombo: cauchycombo.go
	go build cauchycombo.go

multiuniform: multiuniform.go
	go build multiuniform.go

normal.dat: normalcombo
	./normalcombo > normal.dat

multi.dat: multiuniform
	./multiuniform > multi.dat

cauchy.dat: cauchycombo
	./cauchycombo > cauchy.dat

$(CAUCHYPLOTS): cauchy.dat cauchy_plots.r
	R --no-save < cauchy_plots.r

$(NORMALPLOTS): normal.dat ratio_plots.r
	R --no-save < ratio_plots.r

$(MULTIPLOTS): multi.dat multi_plots.r
	R --no-save < multi_plots.r

clean:
	-rm -rf cauchycombo normalcombo multiuniform
	-rm -rf normal.dat cauchy.dat multi.dat normal.dat
	-rm -rf $(CAUCHYPLOTS)
	-rm -rf $(NORMALPLOTS)
	-rm -rf $(MULTIPLOTS)
