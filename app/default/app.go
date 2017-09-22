package app

import (
	"helloworld"
	"net/http"

	"google.golang.org/appengine"
)

func init() {
	http.HandleFunc("/", handler)
}

func handler(w http.ResponseWriter, r *http.Request) {
	ctx := appengine.NewContext(r)
	helloworld.RequestHandler(ctx, w, r)
}
