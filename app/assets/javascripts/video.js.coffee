$ ->
  $('.bootstrapTooltip').tooltip()

  $('.mainRadioButton').click ->
    $(@).attr('checked', 'checked')
    $(@).parents('table').find('input.mainRadioButton[checked=checked]').not(@).removeAttr('checked')

  $('.toggleVideoInfo').click ->
    $('.videoInfo').toggle()
    if $(@).is(':checked')
      $('.videoInfo').find('input').prop('disabled', false)
    else
      $('.videoInfo').find('input').prop('disabled', true)