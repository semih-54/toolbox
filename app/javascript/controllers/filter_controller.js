

// app/javascript/controllers/filter_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  submit() {
    this.element.submit();
  }
}