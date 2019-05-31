package main

import (
	"fmt"
	"net/http"
)

const (
	port = ":8080"
)

func HelloWorld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "HelloWorld ")
}

func main() {
	http.HandleFunc("/", HelloWorld)
	http.ListenAndServe(port, nil)
}
