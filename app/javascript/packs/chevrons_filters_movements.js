function moveChevrons() {

  const filter1 = document.getElementById('filter1');
  const filter2 = document.getElementById('filter2');
  const filter3 = document.getElementById('filter3');
  const filter4 = document.getElementById('filter4');
  const filter5 = document.getElementById('filter5');
  const filter6 = document.getElementById('filter6');
  const filter7 = document.getElementById('filter7');
  const filter8 = document.getElementById('filter8');
  const filter9 = document.getElementById('filter9');


  filter1.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });


  filter8.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });

  filter9.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });

  filter2.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });

  filter7.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });

  filter3.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("open-chevron");
   });







};


export { moveChevrons};
