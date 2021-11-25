import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "crop", "searchInput", "card"]

  connect() {
    console.log(this.formTarget)
  }

  select() {
    this.cardTarget.style.text = "red"
  }
}
