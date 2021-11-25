import { Controller } from "stimulus"

const idSet = new Set();

export default class extends Controller {
  static targets = ["tile", "input", "link", "form"]

  changeClass(event) {
    event.currentTarget.classList.toggle('selected')
    if (idSet.has(event.currentTarget.id)){
      idSet.delete(event.currentTarget.id)
    } else {
      idSet.add(event.currentTarget.id)
    };
    const idArray = new Array(...idSet)
    this.inputTarget.value = idArray
  }

  displayForm() {
    this.formTarget.classList.toggle('d-none')
  }
}
