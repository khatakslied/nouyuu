import { Controller } from "stimulus"

const idSet = new Set();

export default class extends Controller {
  static targets = ["tile", "input", "link", "form"]

  changeClass(event) {
    if (event.currentTarget.dataset.plotId) {
      this.selectPlot(event)
    } else {
      this.selectFree(event)
    }
  }

  selectFree(event) {
    event.currentTarget.classList.toggle('selected')
    if (idSet.has(event.currentTarget.id)){
      idSet.delete(event.currentTarget.id)
    } else {
      idSet.add(event.currentTarget.id)
    };
    const idArray = new Array(...idSet)
    this.inputTarget.value = idArray
  }

  selectPlot(event) {
    // Can we do this with Stimulus?
    const selectedTiles = document.getElementsByClassName('selected');
    while (selectedTiles.length > 0) {
    selectedTiles[0].classList.remove('selected');
    }
    console.log(selectedTiles)
    const tiles = document.querySelectorAll(`div[data-plot-id='${event.currentTarget.dataset.plotId}']`);
    tiles.forEach(tile => {
      tile.classList.toggle('selected');
    });
  }


  displayForm() {
    this.formTarget.classList.toggle('d-none')
  }
}
