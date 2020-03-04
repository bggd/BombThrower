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
  local obj = {
    tex = les8.texture.create(texture_decl),
    width = w,
    height = h
  }
  return obj
end

function texture.destroy(tex)
  assert(tex.tex)
  assert(tex.width > 0)
  assert(tex.height > 0)
  les8.texture.destroy(tex.tex)
  tex.tex = nil
  tex.width = 0
  tex.height = 0
end

return texture
