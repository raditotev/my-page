//= require jquery
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require wow.min
//= require_directory .

var wow = new WOW ({
  offset:       75,          // distance to the element when triggering the animation (default is 0)
  mobile:       false,       // trigger animations on mobile devices (default is true)
});

$(function(){
  // Initialize wow effects
  wow.init();

  //Show project name on mouse over
  $('.project-thumb').on({
    mouseenter: function(){
      $(this).animate({opacity: 0.8});
      $(this).children("span").show();
    },
    mouseleave: function(){
      $(this).animate({opacity: 1});
      $(this).children("span").hide();
    },
    click: function(){
      $(this).animate({opacity: 1});
      $(this).children("span").hide();
    }
  });

  // Underline active link in navbar
  var url = window.location;
  $('.navbar-inverse .navbar-nav li a').filter(function() {
      return this.href == url;
  }).parent().addClass('active-link');
});


