package main

import (
    "fmt"
	"net/http"
)

// Handler is the entry point for this fission function
func Handler(w http.ResponseWriter, r *http.Request) {
    id := r.Header.Get("x-fission-params-id")
	msg := fmt.Sprintf("Hello, user %v\n", id)

	w.Write([]byte(msg))
}
