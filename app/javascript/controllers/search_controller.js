import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "input" ]

  search() {
    const query = this.inputTarget.value.trim();
    const url = query ? `/movies?query=${query}` : "/";

    Turbo.visit(url, { frame: "movies_list" });
  }
}
