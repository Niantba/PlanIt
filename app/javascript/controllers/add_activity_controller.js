import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-activity"
export default class extends Controller {
  static targets = ["form", "plus"]
  connect() {
  }

  add() {
    this.formTarget.classList.remove("d-none")
  }

  close(event) {
    event.preventDefault()
    if(this.element === this.formTarget || this.formTarget.contains(event.target)
       || this.element === this.plusTarget || this.plusTarget.contains(event.target)) {
      console.log("clique");
    } else {
      this.formTarget.classList.add("d-none");
    }
  }
}
