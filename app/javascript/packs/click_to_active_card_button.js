
function clickToActiveCardButton() {
  document.querySelectorAll(".card-image-button").forEach((p) => {
    p.addEventListener("click", (event) => {
      event.currentTarget.classList.remove("card-image-button-active");
    });
  })
};


export { clickToActiveCardButton };
