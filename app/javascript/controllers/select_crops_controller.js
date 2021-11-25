import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["crop"]

  connect() {
    console.log(this.cropTarget)
  }

  mark(event) {
    event.preventDefault()
    event.currentTarget.classList.toggle('favorited')
  }
}
