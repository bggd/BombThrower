local les8 = require("les8")

local shader_decl = {
  input_layout = {
    {
      semantic_name = "POSITION",
      semantic_index = 0,
      num_float = 2
    },
    {
      semantic_name = "TEXCOORD",
      semantic_index = 0,
      num_float = 2
    }
  },

  vertex_shader = '',
  pixel_shader = ''
}

local function init_shader()

  local file = io.open("assets/vertex_shader.bin", "rb")
  shader_decl.vertex_shader = file:read("*a")
  io.close(file)
  file = io.open("assets/pixel_shader.bin", "rb")
  shader_decl.pixel_shader = file:read("*a")
  io.close(file)

  local shader = les8.shader.create(shader_decl)
  assert(shader)

  return shader

end

return init_shader
