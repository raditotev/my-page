//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require ckeditor/init
//= require ckeditor/config
//= require ckeditor/plugins/codesnippet/plugin
//= require ckeditor/plugins/codesnippet/lang/en
//= require ckeditor/plugins/widget/plugin
//= require ckeditor/plugins/widget/lang/en
//= require ckeditor/plugins/codesnippet/lib/highlight/highlight.pack
//= require_directory .

$(document).ready(function(){
  $('#menu').click(function(){
    $('#admin-links').toggle();
  });
});
