import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["crop"]

  select() {
    this.cropTarget.classList.togle('active')
  }
}
