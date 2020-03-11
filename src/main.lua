local les8 = require("les8")

local draw = require("src.draw")
require("src.game")

g_game.init()

draw.set_texture(IMAGE.PLAYER_RUN_00)

les8.run(function()

  g_game.update_input()
  if g_game.input.is_released.LEFT_ARROW then
    print("LEFT_ARROW released!")
  end

  les8.gfx.clear(0.0, 0.0, 0.0, 1.0)
  draw.rect(0, 0, 64, 64)
  draw.flush()
  les8.gfx.present()
end)

g_game.deinit()
