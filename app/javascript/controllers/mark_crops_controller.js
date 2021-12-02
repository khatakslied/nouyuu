import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button"]
  static values = { num: Number }

  connect() {
    this.numValue = this.buttonTarget.innerHTML
    this.numValueChanged()
  }

  mark(event) {
    if (event.currentTarget.classList.contains('marked')) {
      this.numValue--
    } else {
      this.numValue++
    }
    event.currentTarget.classList.toggle('marked')
  }

  numValueChanged() {
    if (this.numValue === 0) {
      this.buttonTarget.classList.add('d-none')
    } else {
      console.log(this.numValue)
      this.buttonTarget.classList.remove('d-none')
      this.buttonTarget.innerHTML = this.numValue
    }
  }
}
