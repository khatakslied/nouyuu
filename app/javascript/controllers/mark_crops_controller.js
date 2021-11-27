import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []
  static values = { marked: Boolean }

  connect() {
    // console.log(this.cropTarget)
  }

  mark(event) {
    event.currentTarget.classList.toggle('marked')
  }
}
