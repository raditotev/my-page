# Loading styles for code snippets
$ ->
  $('pre code').each (i, block) ->
    hljs.highlightBlock(block)
