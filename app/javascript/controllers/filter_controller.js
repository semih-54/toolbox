// app/javascript/controllers/filter_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "category", "list"]

  submit() {
    console.log("submit");
    const url = `${this.formTarget.action}?category_id=${this.categoryTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.listTarget.outerHTML = data
      })
  }

}
