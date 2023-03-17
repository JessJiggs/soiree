import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["input", "preview"]
    displayPreview(event){
      const reader = new FileReader();
      reader.onload = (event) => {
        this.previewTarget.src = event.currentTarget.result;
      }
      reader.readAsDataURL(this.inputTarget.files[0])
      this.previewTarget.classList.remove('hidden');
    }
}
