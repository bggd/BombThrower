local sdl2 = require("les8.sdl2")

local prev_keydown = {
  ESCAPE = false,
  RETURN = false,
  LEFT_ARROW = false,
  RIGHT_ARROW = false,
}

local function handle_input()

  local scancodes = sdl2.GetKeyboardState()

  local keydown = {table.unpack(prev_keydown)}
  for k, _ in pairs(prev_keydown) do keydown[k] = false end
  local pressed = {table.unpack(keydown)}
  local released = {table.unpack(keydown)}

  if scancodes[sdl2.SCANCODE.ESCAPE] then
    keydown.ESCAPE = true
  elseif scancodes[sdl2.SCANCODE.RETURN] then
    keydown.RETURN = true
  elseif scancodes[sdl2.SCANCODE.LEFT] or scancodes[sdl2.SCANCODE.A] then
    keydown.LEFT_ARROW = true
  elseif scancodes[sdl2.SCANCODE.RIGHT] or scancodes[sdl2.SCANCODE.D] then
    keydown.RIGHT_ARROW = true
  end

  for k, v in pairs(keydown) do
    if prev_keydown[k] ~= v then
      if v then
        pressed[k] = true
      else
        released[k] = true
      end
    end
  end

  prev_keydown = keydown

  return {
    is_keydown = keydown,
    is_pressed = pressed,
    is_released = released
  }

end

return handle_input
