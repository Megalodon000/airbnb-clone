import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateWishlistStatus() {

    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if (isUserLoggedIn === "false") {
      document.querySelector(".js-login").click()
      return;
    }


    if(this.element.dataset.status === "false"){
      this.element.classList.remove("fill-none");
      this.element.classList.add("fill-primary");
      this.element.dataset.status = "true";
    }
    else {
      this.element.classList.remove("fill-primary");
      this.element.classList.add("fill-none");
      this.element.dataset.status = "false";
    }
  }

  addPropertyToWishlist(propertyId, userId) {
    const params = {
      property_id: propertyId,
      user_id: userId,
    };

    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(params)
    };

    fetch("/api/wishlists", options)
      .then(response => {
        if (!response.ok) {
          throw Error(response.status);
        }
        return response.json();
      })
      .then(data => {
        console.log(data);
      })
      .catch(error => {
        console.error(error);
      });
  }
}
