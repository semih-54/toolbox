import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="votes"
export default class extends Controller {
  static targets = [ "app" ]

  connect() {
    
  }

  vote(event) {
    event.preventDefault()
    fetch(event.target.action, {
      method: event.target._method ? event.target._method.value.toUpperCase() : event.target.method,
      headers: {
        "Accept": "text/plain",
        "Content-Type": "multipart/form-data",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      },
      body: new FormData(event.target)
    })
    .then(response => response.text())
    .then(html => {
      console.log("success", html)
      this.element.innerHTML = html
    }
    )
  }
}
