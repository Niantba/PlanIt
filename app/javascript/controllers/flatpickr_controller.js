import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate", "date" ]
  static values = {
    type: String
  }

  connect() {
    console.log(this.typeValue);
    if(this.typeValue === "full") {
      flatpickr(this.startDateTarget, {
        altInput: true,
        // plugins: [new rangePlugin({ input: "#end_date"})]
      })
      flatpickr(this.endDateTarget, {
        altInput: true
      })
    } else if (this.typeValue === "time") {
      flatpickr(this.element, {
        noCalendar: true,
        enableTime: true,
        dateFormat: 'h:i K',
      })
    } else if (this.typeValue === "expense") {
      flatpickr(this.dateTarget, {
        altInput: true
      })
    }
  }
}
