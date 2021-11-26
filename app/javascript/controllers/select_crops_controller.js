import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["basket"]

  connect() {
    console.log(this.cropTargets)
  }

  mark(event) {
    event.preventDefault();
    this.cropTargets.forEach((element) => {
      element.classList.toggle('favorited-card')
    });
  }
}
