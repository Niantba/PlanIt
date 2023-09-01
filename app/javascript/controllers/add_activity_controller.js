import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-activity"
export default class extends Controller {
  static targets = ["form", "plus"]
  connect() {
  }

  // add() {
  //   this.formTarget.classList.toggle("d-none")
  // }

  close(event) {
    // console.log(this.element);
    // event.preventDefault()
    // // if form form.classList.contain("d-none")
    // if(this.formTarget.contains(event.target)|| this.plusTarget.contains(event.target)) {
    //   console.log("clique");
    // } else {
    //   // this.formTarget.classList.add("d-none");
    // }
  }
}
