$ ->
  $('.fancybox').hover ->
    $(this).find('img').fadeTo(250, 0.2)
  , ->
    $(this).find('img').fadeTo(250, 1)

  $('.fancybox').each ->
    $this = $(this)
    $this.fancybox
      openEffect: 'fade'
      closeEffect: 'fade'
      openSpeed: 500
      type: 'iframe'
      width: $this.data('width')
      height: $this.data('height')
      title: $this.data('title')