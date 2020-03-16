local les8 = require("les8")
local mat4 = require("les8.mat4")

local init_shader = require("src.init_shader")
local preload_images = require("src.preload_images")
local handle_input = require("src.handle_input")
local game_loop = require("src.game_loop")

g_game = {}

g_game.shader = nil
g_game.input = nil

g_game.on_update = nil


function g_game.init()
  les8.init()

  preload_images()

  g_game.shader = init_shader()

  les8.gfx.set_shader(g_game.shader)
  les8.gfx.set_projection_matrix(mat4.ortho(0.0, 640.0, 480.0, 0.0, -1.0, 1.0))

  g_game.set_update(game_loop.title)

end

function g_game.deinit()
  les8.shader.destroy(g_game.shader)
end

function g_game.update_input()
  g_game.input = handle_input()
end

function g_game.set_update(update_function)
  g_game.on_update = update_function
end

function g_game.update()
  assert(type(g_game.on_update) == 'function')
  g_game.on_update()
end
