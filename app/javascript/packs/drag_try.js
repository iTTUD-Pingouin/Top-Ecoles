

function drag () {
  window.Sortable = require('sortablejs')
  const simpleList = document.getElementById("simpleList")
  Sortable.create(simpleList);
};

// Simple list




export { drag };
