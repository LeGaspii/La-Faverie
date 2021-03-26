const checkboxes = document.querySelectorAll('.inbox input[type="checkbox"]');


function handleCheck(e) {
  let lastChecked;
  let inBetween = false;
  if (e.shiftKey && this.checked) {
    checkboxes.forEach(checkbox => {
      console.log(checkbox)
      if (checkbox == this || checkbox == lastChecked) {
        inBetween = !inBetween;
        console.log('on vérifie')
      }
      if (inBetween) {
        checkbox.checked = true;
      }
    })
  }
  lastChecked = this
}

const checkos = checkboxes.forEach(checkbox => checkbox.addEventListener('click', handleCheck));


export { handleCheck, checkboxes, checkos };
