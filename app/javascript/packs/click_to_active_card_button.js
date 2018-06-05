
function clickToActiveCardButton() {

  document.querySelectorAll(".card-image-button").forEach((p) => {


    p.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("card-image-button-active");
    });
  })
};


export { clickToActiveCardButton };



    // console.log(params[:selection]);

    // if (params[:selection].includes(params[:id].toString())) {

    //   p.classList.add("card-image-button-active")
    // };
