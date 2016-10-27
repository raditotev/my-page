//= require jquery
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require wow.min
//= require_directory .

var wow = new WOW ({
  offset:  75,          // distance to the element when triggering the animation (default is 0)
  mobile: false,       // trigger animations on mobile devices (default is true)
});

 //Hide flash messages after 3s
$(function() {
  var flashCallback;
  flashCallback = function() {
    return $("#notice").fadeOut();
  };
  $("#notice").bind('click', (function(_this) {
    return function(ev) {
      return $("#notice").fadeOut();
    };
  })(this));
  return setTimeout(flashCallback, 3000);
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

  // Email validation
  var re = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i
  var validEmail = false;

  function validateEmail (target){
    $(target).change(function(){
      var match = re.test($(this).val());
      if (!match) {
        var selector = (target == '#contact_from') ? 'label:first' : 'label:eq(1)'
        $(selector).append("<span id='invalid-email'> Please enter valid email</span>")
        $(this).addClass("incorrect");
        validEmail = false;
      } else {
        $('#invalid-email').remove();
        $(this).removeClass("incorrect");
        validEmail = true;
      }
    });
  }
  validateEmail("#contact_email");

  // Disable Contact form button
  $("#contact_name, #contact_email, #contact_message").on("change keyup", function(){
    if($("#contact_name").val() != "" && $("#contact_email").val() != ""
                                                          && $("#contact_message").val() !=""
                                                          && validEmail)
    {
      $("#send_message").prop("disabled", false);
    } else {
      $("#send_message").prop("disabled", true);
    }
  });

  // Disable Comment form button
  $("#comment_content").keyup(function(){
    if($("#comment_content").val() != ""){
      $("#create-comment").prop("disabled", false);
    } else {
      $("#create-comment").prop("disabled", true);
    }
  });
});


