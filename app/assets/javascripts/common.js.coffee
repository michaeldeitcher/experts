closeDialog = false
$ ->
  $(document).bind 'pageinit', ->
    $('a[data-icon="delete"]').click ->
      closeDialog = true
  $(document).bind 'pagebeforeshow', ->
    if closeDialog
      $('.ui-dialog').dialog('close')
      closeDialog = false
