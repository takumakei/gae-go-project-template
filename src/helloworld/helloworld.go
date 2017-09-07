package helloworld

import (
	"fmt"
	"net/http"
	"time"

	cache "github.com/patrickmn/go-cache"
	"golang.org/x/net/context"
	"google.golang.org/appengine/log"
)

var c = cache.New(1*time.Minute, 2*time.Minute)

// RequestHandler accepts a request and returns a result
func RequestHandler(ctx context.Context, w http.ResponseWriter, r *http.Request) {
	log.Infof(ctx, "request url: "+r.URL.String())
	c.Set("key", "200", cache.DefaultExpiration)
	result, _ := c.Get("key")
	fmt.Fprint(w, result)
}
