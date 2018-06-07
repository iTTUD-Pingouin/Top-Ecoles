function clickToSubmit() {
  document.addEventListener('keypress', (event) => {
    if (event.charCode === 13) {
    document.getElementById('submit-search').click();
    }

  });

};


export { clickToSubmit };
