import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "completed" ]

  toogle(event) {
    //console.log(this.completedTarget.checked)
    //console.log(this.data.get("update-url"))
    let formData = new FormData()
    formData.append("todo[completed]", this.completedTarget.checked)
    fetch(this.data.get("update-url"), {
      body: formData,
      method: 'PATCH',
      credentials: "include",
      dataType: "script",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name=csrf-token]').content
      },
    })
    .then((resp) => {
      if(resp.status != 204) {
        event.target.checked = !event.target.checked
      }
    })
  }
}
