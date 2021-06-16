-- https://bezhermoso.github.io/2016/01/20/making-perfect-ramen-lua-os-x-automation-with-hammerspoon/
-- https://github.com/Hammerspoon/hammerspoon/issues/370

hs.hotkey.bind({"alt"}, "`", function ()
  focusScreen(hs.window.focusedWindow():screen():next())
end)

hs.hotkey.bind({"alt", "shift"}, "`", function()
  focusScreen(hs.window.focusedWindow():screen():previous())
end)

function isInScreen(screen, win)
  return win:screen() == screen
end

function focusScreen(screen)
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))

  if #windows > 0 then
    windows[1]:becomeMain()
    windows[1]:focus()
  else
    hs.window.desktop():focus()
  end

  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end
