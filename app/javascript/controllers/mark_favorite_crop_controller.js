import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

  mark(event) {
    event.currentTarget.classList.toggle('marked')
  }
}
