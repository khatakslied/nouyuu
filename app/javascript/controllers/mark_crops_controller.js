import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []
  static values = { marked: Boolean }

  mark(event) {
    event.currentTarget.classList.toggle('marked')
  }
}
