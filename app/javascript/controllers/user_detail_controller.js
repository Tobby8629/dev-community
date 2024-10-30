import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-detail"
export default class extends Controller {
  connect() {
  }

  initialize(){
    this.element.setAttribute('data-action', "click-> user-detail#showmodal")
  }


  showmodal(event){
    event.preventDefault()
    this.url = this.element.getAttribute("href")
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    }).then((response)=> response.text())
    .then((html)=> Turbo.renderStreamMessage(html))
  }
}
