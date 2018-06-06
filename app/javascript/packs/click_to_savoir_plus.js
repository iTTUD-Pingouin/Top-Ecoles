
function clickToEnSavoirPlus() {

  document.querySelectorAll(".main-card").forEach((card) => {

    const buttonESP = card.querySelector(".en-savoir-plus");
    const buttonESP2 = card.querySelector(".en-savoir-plus2");


    buttonESP.addEventListener("click", (event) => {
        const hoverCard = card.querySelector(".hover-card");
        hoverCard.classList.toggle("open");
      });

    buttonESP2.addEventListener("click", (event) => {
        const hoverCard2 = card.querySelector(".hover-card");
        hoverCard2.classList.toggle("open");
      });

  });



};

export { clickToEnSavoirPlus };


