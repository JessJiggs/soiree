import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-task"
export default class extends Controller {
  static targets = ["infos", "form", "task"]

  connect() {
    console.log(this.infosTarget);
    console.log(this.formTarget);
    console.log(this.taskTarget);
  }

  displayForm() {
    this.infosTarget.classList.add('d-none');
    this.formTarget.classList.remove('d-none');
  }

  // update(event) {
  //   event.preventDefault();
  //   const url = this.formTarget.action

  //   fetch(url, {
  //     method: 'PATCH',
  //     headers: { 'Accept': 'text/html' },
  //     body: new FormData(this.formTarget)
  //   })
  //     .then(response => response.text())
  //     .then((data) => {
  //       this.taskTarget.outerHTML = data;
  //     })
  // }

}
