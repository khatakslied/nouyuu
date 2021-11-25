import { Controller } from "stimulus"

const idSet = new Set();

export default class extends Controller {
  static targets = ["tile", "input", "link", "form"]

  connect() {
    console.log(this.tileTargets)
  }

  changeClass(event) {
    event.currentTarget.classList.toggle('selected')
    if (idSet.has(event.currentTarget.id)){
      idSet.delete(event.currentTarget.id)
    } else {
      idSet.add(event.currentTarget.id)
    };
    console.log(idSet);
    const idArray = new Array(...idSet)
    console.log(idArray)
    this.inputTarget.value = idArray
  }

  displayForm() {
    this.formTarget.classList.toggle('d-none')
    console.log(this.formTarget.classList)
  }
}
