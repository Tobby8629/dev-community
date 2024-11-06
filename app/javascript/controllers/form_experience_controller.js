import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-experience"
export default class extends Controller {
  static targets = ["endDate", "current"]

  connect() {
  }

  initialize() {
    const condi = this.currentTarget.checked
    this.disable(condi)
  }

  currently_working (event) {
     this.disable(event.target.checked)
  }

  disable (condi) {
    if (condi){
      this.endDateTarget.setAttribute("disabled", true)
      this.endDateTarget.value=""
    }
    else {
      this.endDateTarget.removeAttribute("disabled")
    }
  }
}
