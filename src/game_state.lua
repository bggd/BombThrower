local game_state = {}


function game_state.title()
  if g_game.input.is_pressed.RETURN then
    g_game.set_update(game_state.in_game)
  end
end

function game_state.in_game()
  print("IN GAME")
end

function game_state.game_over()
end

return game_state
