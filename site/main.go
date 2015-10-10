package tvapp

import (
	"fmt"
	"github.com/gorilla/mux"
	"google.golang.org/appengine"
	"google.golang.org/appengine/log"
	"net/http"
	"os"
	"text/template"
)

func init() {
	router := mux.NewRouter()
	router.HandleFunc("/tv/{page}", pageHandler)
	http.Handle("/", router)
}

func pageHandler(w http.ResponseWriter, r *http.Request) {
	v := mux.Vars(r)
	page := v["page"]
	c := appengine.NewContext(r)
	t := template.New("")
	t, err := t.ParseFiles("templates/" + page + ".tvml")

	fmt.Fprintf(w, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")
	err = t.ExecuteTemplate(w, "document",
		struct {
			BaseURL string
		}{
			BaseURL: baseURL(),
		})
	if err != nil {
		log.Errorf(c, "ERROR %+v", err)
	}
}

func baseURL() string {
	if os.Getenv("RUN_WITH_DEVAPPSERVER") != "" {
		return "http://localhost:8080"
	} else {
		return "http://tvmldemo.appspot.com"
	}
}
