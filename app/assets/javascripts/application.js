// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('touchstart', function (e) {
  $(".hover").removeClass('hover');
});

$(document).on('touchend', '.has-hover', function (e) {
  $(this).addClass('hover');
});

$(document).on('ready page:load', function () {

  $(".msg").each(function (index) {

    element = $(this);

    setTimeout(function () {
      element.addClass('is-visible');
    }, index * 6000);

    setTimeout(function () {
      element.removeClass('is-visible');
    }, index * 6000 + 5500);
  });

  $(".half[data-rotate]").each(function () {
    console.log('A witch!');
    $(this).css('transform', 'rotate(' + $(this).attr('data-rotate') + 'deg)');
  });
});