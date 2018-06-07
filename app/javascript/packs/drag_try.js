

function drag () {
  window.Sortable = require('sortablejs')
  const simpleList = document.getElementById("simpleList")
  Sortable.create(simpleList, { animation: 450});
};

// Simple list




export { drag };
