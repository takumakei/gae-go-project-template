package helloworld

import (
	"net/http/httptest"
	"strings"
	"testing"

	"google.golang.org/appengine"
	"google.golang.org/appengine/aetest"
)

func TestSample1(t *testing.T) {
	inst, err := aetest.NewInstance(nil)
	if err != nil {
		t.Fatalf("Failed to create instance: %v", err)
	}
	defer inst.Close()

	userJson := `{"username": "dennis", "balance": 200}`
	reader := strings.NewReader(userJson)
	req, err := inst.NewRequest("GET", "/hi", reader)
	if err != nil {
		t.Fatalf("Failed to create req1: %v", err)
	}
	if err != nil {
		t.Fatalf("Failed to create req1: %v", err)
	}
	ctx := appengine.NewContext(req)

	w := httptest.NewRecorder()
	RequestHandler(w, req, ctx)
	if str := w.Body.String(); str != "200" {
		t.Fatalf("Error")
	}
}