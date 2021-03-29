import { flatpickr } from '../component/flatpickr';

const startDateInput = document.getElementById('reservation_date_in');
const endDateInput = document.getElementById('reservation_date_out');
console.log(startDateInput)
console.log(endDateInput)

flatpickr("[data-behavior='flatpickr']", {
  altInput: true,
  minDate: "today",
  altFormat: "F j, Y",
  dateFormat: "d-m-Y",
  "locale": French,
})


/


export {flatpickr};
