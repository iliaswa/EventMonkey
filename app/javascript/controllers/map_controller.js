import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    console.log("hello")
    mapboxgl.accessToken = this.apiKeyValue
    //here
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  //here
  #addMarkersToMap() {
      new mapboxgl.Marker()
        .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
        .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 30, maxZoom: 16, duration: 10000 })
  }
}
