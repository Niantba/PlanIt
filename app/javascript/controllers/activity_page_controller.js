import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity-page"
export default class extends Controller {
  static targets = ["activity"]
  connect() {
  }

  show() {
    this.activityTarget.classList.toggle('expanded')
  }
}
