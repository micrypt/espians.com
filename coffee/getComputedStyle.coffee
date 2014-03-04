window.getComputedStyle = (el, pseudo) ->
  @el = el
  @getPropertyValue = (prop) ->
    re = /(\-([a-z]){1})/g
    if (prop == 'float') then prop = 'styleFloat'
    if (re.test(prop))
      prop = prop.replace(re, () -> return arguments[2].toUpperCase())
    return if el.currentStyle[prop] then el.currentStyle[prop] else null
  return @