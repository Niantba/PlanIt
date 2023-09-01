import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Import the rangePlugin from the flatpickr library
// import rangePlugin from "./flatpickr/dist/plugins/rangePlugin";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    new flatpickr(this.element, {
      enableTime: true
      // more options available on the documentation!
    });
  }
}
