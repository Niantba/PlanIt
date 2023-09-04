import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" ]
  static values = {
    type: String
  }

  connect() {
    if(this.typeValue === "full") {
      flatpickr(this.startDateTarget, {
        // plugins: [new rangePlugin({ input: "#end_date"})]
      })
      flatpickr(this.endDateTarget, {})
    } else if (this.typeValue === "time") {
      flatpickr(this.element, {
        noCalendar: true,
        enableTime: true,
        dateFormat: 'h:i K'
      })
    }
  }
}
