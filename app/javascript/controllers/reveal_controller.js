import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
export default class extends Controller {
  static targets = ["toggle"]

  toggle(event) {
    event.preventDefault()
    this.toggleTarget.classList.toggle("d-none")
  }
}
