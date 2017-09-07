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

	userJSON := `{"username": "dennis", "balance": 200}`
	reader := strings.NewReader(userJSON)
	req, err := inst.NewRequest("GET", "/hi", reader)
	if err != nil {
		t.Fatalf("Failed to create req1: %v", err)
	}
	if err != nil {
		t.Fatalf("Failed to create req1: %v", err)
	}
	ctx := appengine.NewContext(req)

	w := httptest.NewRecorder()
	RequestHandler(ctx, w, req)
	if str := w.Body.String(); str != "200" {
		t.Fatalf("Error")
	}
}
