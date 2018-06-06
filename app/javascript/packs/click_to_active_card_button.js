
function clickToActiveCardButton() {

  document.querySelectorAll(".card-image-button").forEach((p) => {


    p.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("card-image-button-active");
    });
  })
};


export { clickToActiveCardButton };


