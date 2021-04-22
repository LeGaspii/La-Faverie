// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("flatpickr")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.css")
import { French } from "flatpickr/dist/l10n/fr.js"
// Internal imports, e.g:
import { auto_close } from '../component/auto_close';
import { highligth } from '../component/highligth';
import { projectsTitle } from '../component/projects';
// import { handleCheck, checkboxes, checkos } from '../component/shit_checkbox';
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  auto_close();
  highligth();
  projectsTitle();

  flatpickr("[data-behavior='flatpickr']", {
    altInput: true,
    altFormat: "j F, Y",
    dateFormat: "d-m-Y",
    "locale": French,
    minDate: "today",
  })

});

require("trix")
require("@rails/actiontext")
