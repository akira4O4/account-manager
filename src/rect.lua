local color = require("src/color")
local utils = require("src/utils")

local Rect = {}
Rect.__index = Rect

function Rect:new(mode, rect_color)
   local obj = setmetatable({}, self)
   obj.mode = mode or "fill"
   obj.cx = 0
   obj.cy = 0
   obj.x = 0
   obj.y = 0
   obj.w = 0
   obj.h = 0
   obj.rx = 0
   obj.ry = 0
   obj.segment = 0
   obj.color = rect_color or color.white
   return obj
end

function Rect:set_cxcywh(cx, cy, w, h)
   self.cx = cx or 0
   self.cy = cy or 0
   self.w = w or 0
   self.h = h or 0
   self.x = self.cx - self.w / 2
   self.y = self.cy - self.h / 2
end

function Rect:set_xywh(x, y, w, h)
   self.x = x or 0
   self.y = y or 0
   self.w = w or 0
   self.h = h or 0
   self.cx = self.x + self.w / 2
   self.cy = self.y + self.h / 2
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

function Rect:draw(x, y, w, h, rx, ry, segment)
   x = x or self.x
   y = y or self.y
   w = w or self.w
   h = h or self.h
   rx = rx or self.rx
   ry = ry or self.ry
   segment = segment or self.segment
   local old_color = { love.graphics.getColor() }
   love.graphics.setColor(self.color)
   love.graphics.rectangle(self.mode, x, y, w, h, rx, ry, segment)
   love.graphics.setColor(old_color)
end

return Rect
