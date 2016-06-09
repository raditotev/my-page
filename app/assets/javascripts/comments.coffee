jQuery ->
  if $('#form-comment-content').val() ==  ""
    $('#create-comment-button').prop('disabled', true)

  $('#form-comment-content').keyup ->
    if $('#form-comment-content').val() !=  ""
      $('#create-comment-button').prop('disabled', false)
    else
      $('#create-comment-button').prop('disabled', true)

