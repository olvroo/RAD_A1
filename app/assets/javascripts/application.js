// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}

function openLoginPage() {
  document.getElementById("loginPage").style.display = "block";
}

function closeLoginPage() {
  document.getElementById("loginPage").style.display = "none";
}

function openLoginForm() {
  document.getElementById("loginForm").style.display = "block";
  document.getElementById("loginPage").style.display = "none";
  document.getElementById("signupForm").style.display = "none";
}

function closeLoginForm() {
  document.getElementById("loginPage").style.display = "block";
  document.getElementById("loginForm").style.display = "none";
  document.getElementById("signupForm").style.display = "none";
}

function openSignupForm() {
  document.getElementById("signupForm").style.display = "block";
  document.getElementById("loginPage").style.display = "none";
  document.getElementById("loginForm").style.display = "none";
}

function closeSignupForm() {
  document.getElementById("loginPage").style.display = "block";
  document.getElementById("signupForm").style.display = "none";
  document.getElementById("loginForm").style.display = "none";
}