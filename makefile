all: cauchya.hist cauchyb.hist cauchy.hist

normalcombo: normalcombo.go
	go build normalcombo.go

cauchycombo: cauchycombo.go
	go build cauchycombo.go

normal.dat: normalcombo
	./normalcombo > normal.dat

cauchy.dat: cauchycombo
	./cauchycombo > cauchy.dat

cauchya.hist: histogram.py cauchy.dat
	cut -f1 cauchy.dat | ./histogram.py -i 0.2 -m -10 -r 21 -p - > cauchya.hist
cauchyb.hist: histogram.py cauchy.dat
	cut -f2 cauchy.dat | ./histogram.py -i 0.2 -m -10 -r 21 -p - > cauchyb.hist
cauchy.hist: histogram.py cauchy.dat
	cut -f3 cauchy.dat | ./histogram.py -i 0.2 -m -10 -r 21 -p - > cauchy.hist

clean:
	-rm -rf cauchycombo normalcombo
	-rm -rf normal.dat
	-rm -rf cauchy.dat cauchya.hist cauchyb.hist cauchy.hist
