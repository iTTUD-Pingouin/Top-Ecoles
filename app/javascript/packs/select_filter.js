function selectFilter() {

  document.querySelectorAll(".btn-filter-selection").forEach((btn) => {



    btn.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active-filter-selection");

      if (event.currentTarget.classList.contains("address")) {
        document.querySelectorAll(".target-address").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("statut")) {
        document.querySelectorAll(".target-statut").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("filieres")) {
        document.querySelectorAll(".target-filieres").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }


      if (event.currentTarget.classList.contains("sections-int")) {
        document.querySelectorAll(".target-sections-int").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("commune")) {
        document.querySelectorAll(".target-commune").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("pensionnat")) {
        document.querySelectorAll(".target-pensionnat").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("rating")) {
        document.querySelectorAll(".target-rating").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

      if (event.currentTarget.classList.contains("price")) {
        document.querySelectorAll(".target-price").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }


      if (event.currentTarget.classList.contains("classementnat")) {
        document.querySelectorAll(".target-classementnat").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }


      if (event.currentTarget.classList.contains("multiple-redoublement")) {
        document.querySelectorAll(".target-multiple-redoublement").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }

       if (event.currentTarget.classList.contains("SR")) {
        document.querySelectorAll(".target-SR").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }


if (event.currentTarget.classList.contains("MR")) {
        document.querySelectorAll(".target-MR").forEach((div) => {
          div.classList.toggle("hide-filter")
        })
      }






    });
  });


};


export { selectFilter };
