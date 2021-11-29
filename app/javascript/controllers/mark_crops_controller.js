import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['button']
  static values = { number: Number }

  connect() {
    this.numberValueChanged()
  }

  mark(event) {
    if (event.currentTarget.classList.contains('marked')) {
      this.numberValue--
    } else {
      this.numberValue++
    }
    event.currentTarget.classList.toggle('marked')
  }

  numberValueChanged() {
    this.buttonTarget.innerHTML = `Plant seeds ${this.numberValue}`
    if (this.numberValue === 0) {
      this.buttonTarget.classList.add('d-none')
    } else {
      this.buttonTarget.classList.remove('d-none')
    }
  }
}
