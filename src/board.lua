local lgi = require('lgi')
local Clutter = lgi.require('Clutter', '1.0')
local Gio = lgi.require('Gio', '2.0')

return function(image_config, min_duration_in_msec)
  local app = Gio.Application { application_id = 'org.curtin.lua.board' }
  local timeline = Clutter.Timeline { duration = min_duration_in_msec, loop = true }
  local stage = Clutter.Stage.get_default()

  stage.color = Clutter.Color(0, 0, 0, 255)
  stage.title = 'Board'
  stage.width = image_config.width * image_config.count_x
  stage.height = image_config.height * image_config.count_y

  local images = {}
  local function generate_default_images(image_config, stage)
    for i = 1, image_config.count_x do
      for j = 1, image_config.count_y do
        local image = Clutter.Texture {
          filename = nil,
          width =   image_config.width,
          height =  image_config.height,
          fixed_x = image_config.width * (i - 1),
          fixed_y = image_config.height * (j - 1),
          reactive = true,
          on_button_press_event = function() app:release() return true end,
        }
        stage:add_actor(image)
        image:show()
        images[i .. ',' .. j] = image
      end
    end
  end

  function stage:on_button_press_event(event)
    app:release()
    return true
  end

  local function run(callback)
    function timeline:on_new_frame(frame_num)
        callback()
    end

    generate_default_images(image_config, stage)
    app:run {}
  end

  local function display_image(x, y, image_filename)
    local image = images[x .. ',' .. y]
    if image then
      image:set_from_file(image_filename)
    end
  end

  function app:on_activate()
    self:hold()
    stage:show()
    timeline:start()
  end

  return {
    run = run,
    display_image = display_image
  }
end
