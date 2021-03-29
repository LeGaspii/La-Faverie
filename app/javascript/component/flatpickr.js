import { flatpickr } from '../component/flatpickr';

const startDateInput = document.getElementById('reservation_date_in');
const endDateInput = document.getElementById('reservation_date_out');

// flatpickr("[data-behavior='flatpickr']", {
//   altInput: true,
//   altFormat: "F j, Y",
//   dateFormat: "d-m-Y",
//   "locale": French,
// })


if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
endDateInput.disabled = true

flatpickr(startDateInput, {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
});

console.log('im in the file')

startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};



export {flatpickr};
