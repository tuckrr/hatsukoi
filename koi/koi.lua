-- koi
-- made with löve
-- something like an engine

return {
  sprite = require 'koi.sprite',
  object = require 'koi.object',
  input = require 'koi.input', -- not sure if this gets wiped in prototype
  map = require 'koi.map',
  ui = require 'koi.ui'
  -- , camera = require 'koi.camera',
  -- logic = require 'koi.logic',
  -- editor = require 'koi.editor',
  -- audio = require 'koi.audio'
}

-- koi prototype (hatsukoi)
-- just a place to be able to start making tiny games w/ love
-- useful for game jams/small projects while developing koi in c++

--[[
Koi priorities/order:
* Get map up and running (storing map data)
* UI should be relatively quick
]]
