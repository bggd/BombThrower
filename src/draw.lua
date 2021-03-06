local gfx = require("les8.gfx")

local draw = {}

local current_texture = nil
local src_x1, src_y1, src_x2, src_y2 = 0, 0, 0, 0
local vertex_buffer = {}
local num_vertex = 0

function draw.set_texture(texture)
  assert(texture)
  if current_texture ~= texture then
    draw.flush()
  end
  current_texture = texture
  src_x1 = 0.0
  src_y1 = 1.0
  src_x2 = 1.0
  src_y2 = 0.0
  gfx.set_texture(current_texture.tex)
end

function draw.set_source_rect(x1, y1, x2, y2)
  src_x1 = x1
  src_y1 = y1
  src_x2 = x2
  src_y2 = y2
end

function draw.rect(x1, y1, x2, y2)
  for k, i in ipairs({x1, y1, src_x1, src_y2,
                      x1, y2, src_x1, src_y1,
                      x2, y2, src_x2, src_y1,
                      x2, y2, src_x2, src_y1,
                      x2, y1, src_x2, src_y2,
                      x1, y1, src_x1, src_y2}) do
    vertex_buffer[num_vertex + 1] = i
    num_vertex = num_vertex + 1
  end
end

function draw.flush()
  if num_vertex > 0 then
    gfx.draw_triangles(vertex_buffer)
    for k, v in pairs(vertex_buffer) do vertex_buffer[k] = nil end
  end
  num_vertex = 0
end

return draw
