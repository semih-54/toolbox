

// app/javascript/controllers/filter_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["filter"]

  connect() {
    console.log(this.contentTarget)
  }

  submit() {
    this.element.submit()
}

}
