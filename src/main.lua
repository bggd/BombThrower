local les8 = require("les8")
local mat4 = require("les8.mat4")

local init_shader = require("src.init_shader")

les8.init()

local shader = init_shader()

les8.gfx.set_shader(shader)
les8.gfx.set_projection_matrix(mat4.ortho(0.0, 640.0, 480.0, 0.0, -1.0, 1.0))

les8.run(function()
end)

les8.shader.destroy(shader)
