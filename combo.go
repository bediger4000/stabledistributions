package main

import (
	"fmt"
	"math/rand"
)

func main() {
	mean1 := 0.0
	stdDev1 := 1.0
	mean2 := 0.0
	stdDev2 := 3.0

	for i := 0; i <= 100000; i++ {
		f := (rand.NormFloat64()*stdDev1 + mean1)
		g := (rand.NormFloat64()*stdDev2 + mean2)
		fmt.Printf("%.06f\n", f+g)
	}
}
