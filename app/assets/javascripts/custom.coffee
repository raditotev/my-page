$ ->
  flashCallback = ->
    $("#notice").fadeOut()
  $("#notice").bind 'click', (ev) =>
    $("#notice").fadeOut()
  setTimeout flashCallback, 3000

  $('textarea').click ->
    $(this).animate({height: '100px'})


