import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map", "banner", "mapContainer"]

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.mapContainerTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    });
    this.#addMarkersToMap()
  }

  fire() {
    this.mapTarget.classList.remove("d-none");
    this.bannerTarget.classList.add("d-none");
  }

  hide() {
    this.mapTarget.classList.add("d-none");
    this.bannerTarget.classList.remove("d-none");
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }
}
