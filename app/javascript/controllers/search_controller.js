import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "input", "results" ]

  search() {
    fetch(`/movies?query=${this.inputTarget.value}`)
      .then(response => response.text())
      .then(html => {
        this.resultsTarget.innerHTML = html
      })
  }
}
