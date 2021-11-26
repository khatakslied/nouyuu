import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["crop", "tag", "basket"]

  connect() {
    // console.log(this.cropTarget)
  }

  mark(event) {
    event.currentTarget.classList.toggle('red')
    // event.basketTarget.style.color = 'red'
    // ?    console.log(this.basketTarget)
  }
}
