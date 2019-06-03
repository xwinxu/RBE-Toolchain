# Golang

## Packages
Programs start running in package main.

Convention: package name is same as last element of import path
> "math/rand" package comprises files with package rand

Exported (capitalized) names are accessible from outside the package

## Functions
2+ consecutive named function params share a type, omit the type from all but the last
```
x int, y int
same as
x, y int
```
Can also return multiple results

## Named return values
Treated as variables defined at top of function

- Should be used to document the meaning of the return values
- `return` w/o args returns the named return values ("naked" return)

## Variables
`var` statement
If initializer is there, can omit the type
```
var i, j int = 1, 2 // initialize

var i = 2 // omit
```

### Short variable declaration
Inside a function: use `k := 3` instead of `var k int = 3`

Outside functions: begin w/ keyword and no using `:=`

## Basic Types
```
bool

string

int int8/16/32/64
uint uint8/16/32/64/uintptr

byte // alias for uint8

rune // alias for int32
    // unicode code point

float32 float 64

complex64 complex128
```