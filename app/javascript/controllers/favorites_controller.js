import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["favorite"]
  connect() {
  }

  update() {
    console.log(this.favoriteTarget)
    this.favoriteTarget.setAttribute("disabled", "")
    // console.log(this.formTarget)

    fetch(this.formTarget.action, {
      method: this.formTarget.method,
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })

  //   .then(response => response.json())
  //   .then((data) => {
  //     console.log(data)
  //   })
  // }
}
}
