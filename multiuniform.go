package main

import (
	"flag"
	"fmt"
	"os"
	"time"

	rng "github.com/leesper/go_rng"
)

func main() {
	m := flag.Int("m", 100000, "how many iterations")
	n := flag.Int("n", 5, "how many uniform distributions to sum together")
	flag.Parse()

	prngs := make([]*rng.UniformGenerator, *n)

	for i := 0; i < *n; i++ {
		prngs[i] = rng.NewUniformGenerator(time.Now().UnixNano() + int64(os.Getpid()))
	}

	fmt.Println("sum")
	for i := 0; i < *m; i++ {
		sum := 0.0
		for _, rng := range prngs {
			sum += rng.Float64()
		}
		fmt.Printf("%.06f\n", sum)
	}
}
