package main

import (
	"flag"
	"fmt"
	"math/rand"
)

func main() {
	m1 := flag.Float64("m1", 0.0, "first distribution's mean")
	m2 := flag.Float64("m2", 1.0, "second distribution's mean")
	s1 := flag.Float64("s1", 1.0, "first distribution's standard deviation")
	s2 := flag.Float64("s2", 3.0, "second distribution's standard deviation")
	itr := flag.Int("i", 100000, "numer of normally distributed samples")

	flag.Parse()

	mean1 := *m1
	mean2 := *m2
	iterations := *itr
	stdDev1 := *s1
	stdDev2 := *s2

	for i := 0; i <= iterations; i++ {
		f := (rand.NormFloat64()*stdDev1 + mean1)
		g := (rand.NormFloat64()*stdDev2 + mean2)
		fmt.Printf("%.06f\t%.05f\t%.05f\n", f, g, f+g)
	}
}
