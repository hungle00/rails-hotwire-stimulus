import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["source", "filterable"]

  filter() {
    let filterTerm = this.sourceTarget.value
    this.filterableTargets.forEach((el, i) => {
      let filterableKey = el.getAttribute("data-filter-key")

      el.classList.toggle("not-found", !filterableKey.includes(filterTerm))
    });
  }
}
