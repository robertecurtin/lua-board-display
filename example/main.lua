local DisplayGrid = require 'src/DisplayGrid'

local image_config = {
  width = 20,
  height = 20,
  count_x = 40,
  count_y = 30
}

local display_grid = DisplayGrid(image_config, 20)
local x = 1
local y = 1
display_grid.run(function()
  display_grid.display_image(x, y, './example/images/x.png')
  x = x + 1
  if x > image_config.count_x then
    x = 1
    y = y + 1
  end
end)
