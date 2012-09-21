$(document).ready ->
  $('.bootstrapTooltip').tooltip()

  $('.mainRadioButton').click ->
    $(@).attr('checked', 'checked')
    $(@).parents('table').find('input.mainRadioButton[checked=checked]').not(@).removeAttr('checked')