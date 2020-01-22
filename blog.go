package main

import (
	"html/template"
	"net/http"
	"time"
)

type Post struct {
	Title   string
	Posted  time.Time
	Updated time.Time
	Slug    string
}

type PostListData struct {
	PageTitle string
	Posts     []Post
}

func main() {
	fs := http.FileServer(http.Dir("static/"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	tmpl := template.Must(template.ParseFiles("layout.html"))
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		data := PostListData{
			PageTitle: "Blog Posts",
			Posts: []Post{
				{Title: "Post 1", Posted: time.Now().UTC()},
				{Title: "Post 2", Posted: time.Now().UTC()},
				{Title: "Post 3", Posted: time.Now().UTC()},
			},
		}
		tmpl.Execute(w, data)
	})
	http.ListenAndServe(":8080", nil)
}
