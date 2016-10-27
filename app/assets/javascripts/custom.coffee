$ ->
  flashCallback = ->
    $("#notice").fadeOut()
  $("#notice").bind 'click', (ev) =>
    $("#notice").fadeOut()
  setTimeout flashCallback, 3000


