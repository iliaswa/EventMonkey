import 'mapbox-gl/dist/mapbox-gl.css'

mapboxgl.accessToken = 'pk.eyJ1IjoiZ2Vvcmdlb3BoaWxsIiwiYSI6ImNsYTJtbGdoYjAxemYzbm83eWZudnp4cGEifQ.QWBzF3h3Ll7yRZx-MdJlUgpk.eyJ1IjoiZ2Vvcmdlb3BoaWxsIiwiYSI6ImNsYTJtbGdoYjAxemYzbm83eWZudnp4cGEifQ.QWBzF3h3Ll7yRZx-MdJlUg';
const map = new mapboxgl.Map({
container: 'map', // container ID
style: 'mapbox://styles/mapbox/streets-v12', // style URL
center: [-74.5, 40], // starting position [lng, lat]
zoom: 9, // starting zoom
});
