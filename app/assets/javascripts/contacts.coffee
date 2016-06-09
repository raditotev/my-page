jQuery ->
  if $('#contact_name').val() ==  "" || $('#contact_email').val() ==  "" || $('#contact_message').val() ==  ""
    $('#send_message').prop('disabled', true)

  $('#contact_name').keyup ->
    if $('#contact_name').val() ==  "" || $('#contact_email').val() ==  "" || $('#contact_message').val() ==  ""
      $('#send_message').prop('disabled', true)
    else
      $('#send_message').prop('disabled', false)

  $('#contact_email').keyup ->
    if $('#contact_name').val() ==  "" || $('#contact_email').val() ==  "" || $('#contact_message').val() ==  ""
      $('#send_message').prop('disabled', true)
    else
      $('#send_message').prop('disabled', false)

  $('#contact_message').keyup ->
    if $('#contact_name').val() ==  "" || $('#contact_email').val() ==  "" || $('#contact_message').val() ==  ""
      $('#send_message').prop('disabled', true)
    else
      $('#send_message').prop('disabled', false)
