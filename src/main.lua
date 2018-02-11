local Board = require 'board'

local image_config = {
  width = 20,
  height = 20,
  count_x = 40,
  count_y = 30
}

local board = Board(image_config, 10)
local x = 1
local y = 1
board.run(function()
  board.display_image(x, y, '../images/x.png')
  x = x + 1
  if x > image_config.count_x then
    x = 1
    y = y + 1
  end
end)
