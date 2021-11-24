import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["list",]

  connect() {
    this.listTarget.textContent = 'Hello, Stimulus!'
  }
}
