local les8 = require("les8")
local gfx = require("les8.gfx")

local draw = require("src.draw")
local entity = require("src.entity")
require("src.game")

g_game.init()

local go = entity.player.spawn()

les8.run(function()

  g_game.update_input()
  if g_game.input.is_released.LEFT_ARROW then
    print("LEFT_ARROW released!")
  end

  g_game.update()

  go.on_update(go)

  gfx.clear(32.0 / 256.0, 64.0 / 256.0, 128.0 / 256.0, 1.0)
  go.on_draw(go)
  draw.flush()
  gfx.present()
end)

g_game.deinit()
