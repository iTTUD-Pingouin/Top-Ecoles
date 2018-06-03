function flipcard(){
  $(document).ready(function() {

  $( ".card2" ).click(function() {
  $('.face').toggleClass('front');
  $('.face').toggleClass('back');

  });

  });
};




export { flipcard };
