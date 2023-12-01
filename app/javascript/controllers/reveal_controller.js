import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = ["toggle"]
  connect() {
    console.log("hello");
  }

  toggle(event) {
    event.preventDefault()
    this.toggleTarget.classList.toggle("d-none")
  }
}
