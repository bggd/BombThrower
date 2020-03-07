local texture = require("src.texture")

IMAGE = {}
IMAGE.PLAYER_RUN_00 = nil
IMAGE.PLAYER_RUN_01 = nil

local function load_image(path)
  file = io.open(path, "rb")
  local image_buffer = file:read("*a")
  io.close(file)
  image = texture.create(image_buffer)
  return image
end

local function preload_images()
  IMAGE.PLAYER_RUN_00 = load_image("assets/images/player-run-00.png")
  IMAGE.PLAYER_RUN_01 = load_image("assets/images/player-run-01.png")
end

return preload_images
