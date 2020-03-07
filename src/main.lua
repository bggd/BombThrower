local les8 = require("les8")
local sdl2 = require("les8.sdl2")
local mat4 = require("les8.mat4")

local init_shader = require("src.init_shader")
local preload_images = require("src.preload_images")
local draw = require("src.draw")

les8.init()

preload_images()

local shader = init_shader()

les8.gfx.set_shader(shader)
les8.gfx.set_projection_matrix(mat4.ortho(0.0, 640.0, 480.0, 0.0, -1.0, 1.0))

draw.set_texture(IMAGE.PLAYER_RUN_00)

les8.run(function()

  scancodes = sdl2.GetKeyboardState()
  if scancodes[sdl2.SCANCODE.ESCAPE] then
    print("exit")
  end

  les8.gfx.clear(0.0, 0.0, 0.0, 1.0)
  draw.rect(0, 0, 64, 64)
  draw.flush()
  les8.gfx.present()
end)

les8.shader.destroy(shader)
