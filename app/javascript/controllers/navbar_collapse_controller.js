import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-test"
export default class extends Controller {
  static targets = [ "banner", "info", "map", "list" ]
  connect() {
  }

  scroll() {
    this.bannerTarget.classList.toggle("sticky", window.scrollY > 0);
    this.infoTarget.classList.toggle("sticky", window.scrollY > 0);
    this.mapTarget.classList.toggle("d-none", window.scrollY > 0);
    this.listTarget.classList.toggle("sticky", window.scrollY > 0);
  }

}
