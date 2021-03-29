import { flatpickr } from '../component/flatpickr';
// import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr("[data-behavior='flatpickr']", {
  altInput: true,
  altFormat: "j F, Y",
  dateFormat: "d-m-Y",
  "locale": French,
  minDate: "today",
})


export {flatpickr};
