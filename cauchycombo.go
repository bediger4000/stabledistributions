package main

import (
	"flag"
	"fmt"
	"os"
	"time"

	rng "github.com/leesper/go_rng"
)

func main() {
	g1 := flag.Float64("g1", 1.0, "first distribution's gamma value")
	g2 := flag.Float64("g2", 1.0, "second distribution's gamma value")
	l1 := flag.Float64("l1", 0.0, "first distribution's location")
	l2 := flag.Float64("l2", 0.0, "second distribution's location")
	n := flag.Int("n", 100000, "number of samples of cauchy distributions")

	flag.Parse()

	gamma1 := *g1
	gamma2 := *g2
	location1 := *l1
	location2 := *l2
	iterations := *n

	crng1 := rng.NewCauchyGenerator(time.Now().UnixNano() + int64(os.Getpid()))
	crng2 := rng.NewCauchyGenerator(time.Now().UnixNano())

	for i := 0; i < iterations; i++ {
		a := crng1.Cauchy(location1, gamma1)
		b := crng2.Cauchy(location2, gamma2)

		fmt.Printf("%.05f\t%.05f\t%.05f\n", a, b, a+b)
	}

}
