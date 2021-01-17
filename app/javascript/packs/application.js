// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "bootstrap"
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


var all = document.getElementsByTagName("*");
function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
function changeColor() { 
let a = x ;
  window.setInterval(function(){
     a.style.backgroundColor = getRandomColor();
  }, 150);
}
var x;
function haveFun() {
  for (var i=0, max=all.length; i < max; i++) {
    x = all[i];
    changeColor();
  }
}

$(document).on('click', '.dev-dont-click', function () {
  haveFun();
});
