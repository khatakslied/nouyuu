import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["widget"]

  loadWidget() {
    const key = "f9ac0380a8f3131924de73e411894a23";
    const url = `https://api.openweathermap.org/data/2.5/weather?q=Tokyo&units=metric&appid=${key}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.widgetTarget.innerText = data.name
        this.widgetTarget.innerText = new Date(data.dt).toLocaleTimeString("en-US")
        this.widgetTarget.innerText = data.weather[0].description
        this.widgetTarget.innerText = `${data.main.temp}°C`
      });
  }
}






submit.addEventListener('submit', (event) => {
  event.preventDefault();
