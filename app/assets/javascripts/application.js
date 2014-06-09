// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jqplot
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require jquery-ui
//= require best_in_place
//= require_tree .

/* Header for Mobile and tablet */
function show_menu() {
	document.getElementById("navbar_nav_id").style.display="block";
	document.getElementById("menu-icon-list").style.display="none";
	document.getElementById("menu-icon-close").style.display="block";
	document.getElementById("navbar-right").style.display="block";
} 
function close_menu() {
	document.getElementById("navbar_nav_id").style.display="none";
	document.getElementById("menu-icon-list").style.display="block";
	document.getElementById("menu-icon-close").style.display="none";
	document.getElementById("navbar-right").style.display="none";
} 

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

/* Marquee start and stop*/
function marquee_stop() {
  document.getElementById('updates_marquee').stop();
}
function marquee_start() {
  document.getElementById('updates_marquee').start();
}
