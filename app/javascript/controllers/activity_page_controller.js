import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-page"
export default class extends Controller {
  static targets = ["show", "arrowdown", "comment", "arrowright", "delete"]
  connect() {
  }

  show() {
    this.showTarget.classList.toggle("d-none")
    this.arrowdownTarget.classList.toggle("d-none")
    this.commentTarget.classList.toggle("d-none")
    this.arrowrightTarget.classList.toggle("d-none")
    this.deleteTarget.classList.toggle("d-none")
  }
}
