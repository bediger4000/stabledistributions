package main

import (
	"flag"
	"fmt"
	"math/rand"
	"os"
	"time"

	rng "github.com/leesper/go_rng"
)

func main() {
	m := flag.Int("m", 100000, "how many iterations")
	n := flag.Int("n", 5, "how many uniform distributions to sum together")
	flag.Parse()

	prngs := make([]*rng.UniformGenerator, *n)
	factors := make([]float64, *n)

	for i := 0; i < *n; i++ {
		prngs[i] = rng.NewUniformGenerator(time.Now().UnixNano() + int64(os.Getpid()))
		factors[i] = rand.Float64() * float64(*n)
	}

	fmt.Println("sum")
	for i := 0; i < *m; i++ {
		sum := 0.0
		for k, rng := range prngs {
			sum += rng.Float64() * factors[k]
		}
		fmt.Printf("%.06f\n", sum)
	}
}
