import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {

  static targets = [ "commentsList", "newComment" ]

  connect() {
    console.log("Hello, comments!", this.element)
    console.log( "Hello target" ,this.commentsListTarget)
  }

  addComment(event) {
    event.preventDefault()
    this.newCommentTarget.classList.toggle('d-none')
  }

}
