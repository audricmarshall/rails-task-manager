import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { message: String }

  connect() {
    console.log("Coucou"); // debug
  }

  confirm(event) {
    console.log("Confirm method", this.messageValue); // 2eme debug
    if (!window.confirm(this.messageValue)) {
      event.preventDefault();
    }
  }
}
