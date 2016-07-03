# Reinitialize CKEDITOR instance when switching pages
$(document).on 'page:change', ->
  if $('#post_content').length
    if typeof CKEDITOR != 'undefined'
      if CKEDITOR.instances['post_content'] == undefined
        CKEDITOR.replace 'post_content'
    return
  else
    if CKEDITOR.instances.post_content
      CKEDITOR.remove(CKEDITOR.instances['post_content'])
# Loading styles for code snippets
$ ->
  $('pre code').each (i, block) ->
    hljs.highlightBlock(block)
