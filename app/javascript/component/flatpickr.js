import { flatpickr } from '../component/flatpickr';

flatpickr("[data-behavior='flatpickr']", {
  altInput: true,
  altFormat: "F j, Y",
  dateFormat: "d-m-Y",
  "locale": French,
})

export {flatpickr};
