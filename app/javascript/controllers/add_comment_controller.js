import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-comment"
export default class extends Controller {
  static targets = ["form", "plus"]
  connect() {
  }

  add() {
    this.formTarget.classList.remove("d-none")
  }
}
