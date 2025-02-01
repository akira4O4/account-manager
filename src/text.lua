local color = require("src/color")

local Text = {}
Text.__index = Text

function Text:new(data, size, text_color, font)
    local obj = setmetatable({}, self)
    obj.data = data or ""
    obj.size = size or 12
    obj.font = font and love.graphics.newFont(font, size) or love.graphics.newFont(size)
    obj.w = obj.font:getWidth(obj.data)
    obj.h = obj.font:getHeight()
    obj.color = text_color or color.white
    return obj
end

function Text:set_cxcy(cx, cy, r, sx, sy, ox, oy)
    self.cx = cx or 0
    self.cy = cy or 0
    self.x = cx - self.w / 2
    self.y = cy - self.h / 2
    self:set_other_attributes(r, sx, sy, ox, oy)
end

function Text:set_xy(x, y, r, sx, sy, ox, oy)
    self.x = x or 0
    self.y = y or 0
    self.cx = x + self.w / 2
    self.cy = y + self.h / 2
    self:set_other_attributes(r, sx, sy, ox, oy)
end

function Text:set_other_attributes(r, sx, sy, ox, oy)
    self.r = r or 0
    self.sx = sx or 1
    self.sy = sy or 1
    self.ox = ox or 0
    self.oy = oy or 0
end

function Text:draw()
    local old_color = { love.graphics.getColor() }
    love.graphics.push()
    love.graphics.setColor(self.color)
    love.graphics.setFont(self.font)
    love.graphics.print(self.data, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy)
    love.graphics.setColor(old_color)
    love.graphics.pop()
end

return Text
