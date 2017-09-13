local koi = require 'koi.koi'

-- main file for LADX example

function love.load() -- startup
	love.graphics.setDefaultFilter('nearest', 'nearest')
	map = require 'examples/ladx_example'
	interface = koi.ui.newUI(true)
end

function love.update(dt) -- update
	map:update(dt)
end

function love.draw() -- draw
	love.graphics.scale(map.drawScale)
	map:drawTiles()
	map:drawObjects()
	interface:draw()
end
