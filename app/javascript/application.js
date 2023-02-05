// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import jquery from "jquery"
window.$ = window.jQuery = jquery
import "./packs/area_select.js"
import "./packs/area_search.js"