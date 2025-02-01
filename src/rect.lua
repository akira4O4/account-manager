local color = require("src/color")
local utils = require("src/utils")

local Rect = {}
Rect.__index = Rect

function Rect:new(mode, rect_color)
   local obj = setmetatable({}, self)
   obj.mode = mode or "fill"
   obj.color = rect_color or color.white
   return obj
end

function Rect:set_cxcywh(cx, cy, w, h, rx, ry, segment)
   self.cx = cx or 0
   self.cy = cy or 0
   self.w = w or 0
   self.h = h or 0
   self.x = cx - w / 2
   self.y = cy - h / 2
   self:set_other_attributes(rx, ry, segment)
end

function Rect:set_xywh(x, y, w, h, rx, ry, segment)
   self.x = x or 0
   self.y = y or 0
   self.w = w or 0
   self.h = h or 0
   self.cx = x + w / 2
   self.cy = y + h / 2
   self:set_other_attributes(rx, ry, segment)
end

function Rect:set_other_attributes(rx, ry, segment)
   self.rx = rx or 0
   self.ry = ry or 0
   self.segment = segment or 0
end

function Rect:get_xywh()
   return self.x, self.y, self.w, self.h
end

function Rect:get_cxcywh()
   return self.cx, self.cy, self.w, self.h
end

function Rect:translate(x, y)
   love.graphics.translate(x, y)
end

function Rect:draw()
   local old_color = { love.graphics.getColor() }
   love.graphics.setColor(self.color)
   love.graphics.rectangle(self.mode, self.x, self.y, self.w, self.h, self.rx, self.ry, self.segment)
   love.graphics.setColor(old_color)
end

return Rect
