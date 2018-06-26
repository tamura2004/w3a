package main

import (
	"fmt"
	"log"
	"math/rand"
	"os"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

func main() {
	file, err := os.Create("10m.csv")
	handleErr(err)
	defer file.Close()

	var count int
	go func(){
		t := time.NewTicker(time.Second)
		for {
			select {
			case <- t.C:
				log.Println(count)
			}
		}
	}()

	for i := 0; i < 1000000; i++ {
		count = i

		if i == 777777 {
			fmt.Fprint(file, "2018-07-01,654321,weird\n")
		} else {
			fmt.Fprintf(file, "2018-07-01,%06d,happy\n", rand.Intn(100000))
		}
	}
}

func handleErr(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
