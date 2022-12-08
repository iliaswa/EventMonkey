import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    //here
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v11"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

  }
  //here
  #addMarkersToMap() {
    new mapboxgl.Marker({"color": "#570DF8"})
    .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
    .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 3000 })
  }
}
