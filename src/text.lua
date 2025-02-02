local color = require("src/color")

local Text = {}
Text.__index = Text

function Text:new(data, size, text_color, font)
    local obj = setmetatable({}, self)
    obj.x = 0
    obj.y = 0
    obj.cx = 0
    obj.cy = 0
    obj.r = 0
    obj.sx = 1
    obj.sy = 1
    obj.ox = 0
    obj.oy = 0
    obj.data = data or ""
    obj.size = size or 12
    obj.font = font and love.graphics.newFont(font, size) or love.graphics.newFont(size)
    obj.w = obj.font:getWidth(obj.data)
    obj.h = obj.font:getHeight()
    obj.color = text_color or color.white
    return obj
end

function Text:set_cxcy(cx, cy)
    self.cx = cx or self.cx
    self.cy = cy or self.cy
    self.x = cx - self.w / 2
    self.y = cy - self.h / 2
end

function Text:set_xy(x, y)
    self.x = x or self.x
    self.y = y or self.y
    self.cx = x + self.w / 2
    self.cy = y + self.h / 2
end

function Text:set_other_attributes(r, sx, sy, ox, oy)
    self.r = r or self.r
    self.sx = sx or self.sx
    self.sy = sy or self.sy
    self.ox = ox or self.ox
    self.oy = oy or self.oy
end

function Text:draw(x, y, r, sx, sy, ox, oy)
    x = x or self.x
    y = y or self.y
    r = r or self.r
    sx = sx or self.sx
    sy = sy or self.sy
    ox = ox or self.ox
    oy = oy or self.oy

    local old_color = { love.graphics.getColor() }
    love.graphics.push()
    love.graphics.setColor(self.color)
    love.graphics.setFont(self.font)
    love.graphics.print(self.data, x, y, r, sx, sy, ox, oy)
    love.graphics.setColor(old_color)
    love.graphics.pop()
end

return Text
