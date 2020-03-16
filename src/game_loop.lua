local game_loop = {}


function game_loop.title()
  if g_game.input.is_pressed.RETURN then
    g_game.set_update(game_loop.in_game)
  end
end

function game_loop.in_game()
  print("IN GAME")
end

function game_loop.game_over()
end

return game_loop
