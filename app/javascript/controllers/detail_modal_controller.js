import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="detail-modal"
export default class extends Controller {
  static targets = ["toogle"]
  connect() {
  }
  closemodal(){
   this.toogleTarget.classList.add("hidden")
  }
}
