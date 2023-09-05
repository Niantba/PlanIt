import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-page"
export default class extends Controller {
  static targets = ["show"]
  connect() {
  }

  show() {
    this.showTarget.classList.toggle("d-none")
  }
}
