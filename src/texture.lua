local les8 = require("les8")
local stbi_load_from_memory = require("les8.thirdparty").stbi_load_from_memory

local texture = {}

function texture.create(image_buffer)
  local data, w, h, c = stbi_load_from_memory(image_buffer)
  local texture_decl = {
    data = data,
    width = w,
    height = h
  }
  local texture = {
    tex = les8.texture.create(texture_decl),
    width = w,
    height = h
  }
  return texture
end

function texture.destroy(texture)
  assert(texture.tex)
  assert(texture.width > 0)
  assert(texture.height > 0)
  les8.texture.destroy(texture.tex)
  texture.tex = nil
  texture.width = 0
  texture.height = 0
end
