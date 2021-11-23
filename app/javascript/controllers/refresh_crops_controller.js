import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "crops", "searchInput"]

  update() {
    const url = this.formTarget.action
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.cropsTarget.outerHTML = data;
      })
  }
}
