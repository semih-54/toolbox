import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="votes"
export default class extends Controller {
  connect() {
    console.log("Hello, votes!", this.element)
  }
}
