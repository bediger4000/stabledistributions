package main

import (
	"fmt"
	"os"
	"time"

	rng "github.com/leesper/go_rng"
)

func main() {

	gamma1 := 1.0
	gamma2 := 1.0
	location1 := 0.0
	location2 := 2.0

	crng1 := rng.NewCauchyGenerator(time.Now().UnixNano() + int64(os.Getpid()))
	crng2 := rng.NewCauchyGenerator(time.Now().UnixNano() + int64(os.Getpid()))

	for i := 0; i < 100000; i++ {
		a := crng1.Cauchy(location1, gamma1)
		b := crng2.Cauchy(location2, gamma2)

		fmt.Printf("%.05f\t%.05f\t%.05f\n", a, b, a+b)
	}

}
