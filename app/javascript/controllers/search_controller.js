import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class SearchController extends Controller {
  static targets = [ "input", "pageSelect" ]

  connect() {
    console.log("Search controller conectado!")  // Esto ayudará a confirmar si el controlador se carga
  }

  search() {
    const query = this.inputTarget.value.trim();
    const url = query ? `/movies?query=${query}` : "/";

    Turbo.visit(url, { frame: "movies_list" });
  }

  goToPage(event) {
    console.log('entre')
    const selectedPage = event.target.value
    console.log(`Cambiando a la página ${selectedPage}`)

    Turbo.visit(`?page=${selectedPage}`)
  }
}
