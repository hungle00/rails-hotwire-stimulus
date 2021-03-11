import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["modal"]

  /*initialize() {
    console.log(this.modalTarget);
    console.log(this.element);
  }*/

  open() {
    this.toogleModal();
  }

  close() {  
    this.toogleModal();
  }

  toogleModal() {
    document.body.classList.toggle('modal-active');
    this.modalTarget.classList.toggle('opacity-0');
    this.modalTarget.classList.toggle('pointer-events-none'); 
  }
}
