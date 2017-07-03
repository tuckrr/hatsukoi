-- koi.ui
-- handles the ui/heads up/etc on a panel and otherwise

ui = {}
uift = {}

function ui.newUI(fpsP)
  return setmetatable({
    drawFPS = fpsP
  }, {__index = uift})
end

function uift:update(dt)
end

function uift:draw()
  if self.drawFPS then
    love.graphics.print(string.format('%d', love.timer.getFPS()), 16, 16)
  end
end

return ui
