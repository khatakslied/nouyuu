import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "crop", "searchInput", "card"]

  update() {
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.cropTarget.outerHTML = data;
      })
  }

  select() {
    this.cardTarget.style.text = "red"
  }
}
