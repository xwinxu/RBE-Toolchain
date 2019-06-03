package main

import (
	"fmt"
	"math/cmplx"
)

// return type is (int), \/ here
func add(x, y int) int {
	//func add(x int, y int) int {
	return x + y
}

// return multiple results
func swap(x, y string) (string, string) {
	return y, x
}

// named return values
func split(sum int) (x, y int) {
	x = sum * 4 / 9
	y = sum - x
	return
}

// var statement at package or function level
var c, python, java bool

var i, j int = 1, 2

var (
	ToBe   bool       = false
	MaxInt uint64     = 1<<64 - 1
	z      complex128 = cmplx.Sqrt(-5 + 12i)
)

func main() {
	// fmt.Println("Welcome!")
	// fmt.Println("The time is", time.Now(), "yea!")

	// fmt.Println(math.Pi) // not Math.pi

	// fmt.Println(add(42, 14))

	// a, b := swap("hello", "world")
	// fmt.Println(a, b)

	// fmt.Println(split(17)) // prints 7 10

	// var i int
	// fmt.Println(i, c, python, java) // 0 false false false

	// var c, python, java = true, false, "no!"
	// fmt.Println(i, j, c, python, java)

	// var i, j int = 1, 2
	// k := 3 // short variable dec
	// c, python, java := true, false, "no!"
	// fmt.Println(i, j, k, c, python, java)

	fmt.Printf("Type: %T Value: %v\n", ToBe, ToBe)
	fmt.Printf("Type: %T Value: %v\n", MaxInt, MaxInt)
	fmt.Printf("Type: %T Value: %v\n", z, z)
}
