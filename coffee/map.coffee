dragBG = (() ->
  _dragBG = (el) ->
    @el = el
    @mouse_is_down = false
    @init()
    return

  _dragBG.prototype =
    onMousemove: (e) ->
      if !@mouse_is_down then return
      tg = e.target
      x = e.clientX
      y = e.clientY
      tg.style.backgroundPosition = (x - this.origin_x + this.origin_bg_pos_x) + 'px ' + (y - this.origin_x + this.origin_bg_pos_y) + 'px'
      return

    onMousedown: (e) ->
      @mouse_is_down = true
      @origin_x = e.clientX
      @origin_y = e.clientY
      return

    onMouseup: (e) ->
      tg = e.target
      styles = getComputedStyle(tg)
      @mouse_is_down = false
      @origin_bg_pos_x = parseInt(styles.getPropertyValue('background-position').split(' ')[0], 10)
      @origin_bg_pos_y = parseInt(styles.getPropertyValue('background-position').split(' ')[1], 10)
      return

    init: () ->
      styles = getComputedStyle(@el)
      @origin_bg_pos_x = parseInt(styles.getPropertyValue('background-position').split(' ')[0], 10)
      @origin_bg_pos_y = parseInt(styles.getPropertyValue('background-position').split(' ')[1], 10)
      @el.addEventListener('mousedown', @onMousedown.bind(@), false)
      @el.addEventListener('mouseup', @onMouseup.bind(@), false)
      @el.addEventListener('mousemove', @onMousemove.bind(@), false)
      @el.addEventListener('touchstart', @onMousedown.bind(@), false)
      @el.addEventListener('touchend', @onMouseup.bind(@), false)
      @el.addEventListener('touchmove', @onMousemove.bind(@), false)
      return

  (el) ->
    new _dragBG(el)
    return
  )()