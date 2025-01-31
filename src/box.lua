local color=require("src/color")
local utils=require("src/utils")

local Box={}
Box.__index=Box

function Box:new(mode,x,y,w,h,color,rx,ry,segment)
   local obj=setmetatable({},self)
   obj.mode=mode or "fill"
   obj.x=x or 0 
   obj.y=y or 0 
   obj.w=w or 0 
   obj.h=h or 0
   obj.color=color or color.white
   obj.rx=rx
   obj.ry=ry
   obj.segment=segment
   return obj
end

function Box:area()
   return self.w*self.h
end

function Box:draw(mode,rx,ry,segment)
   x=x or 0
   y=y or 0
   rx=rx or 0
   ry=ry or 0
   segment= segment or 0

   old_color={love.graphics.getColor()}
   love.graphics.setColor(self.color)
   love.graphics.push()
   love.graphics.translate(self.x,self.y)
   love.graphics.rectangle(self.mode,-self.w/2,-self.h/2,self.w,self.h,self.rx,self.ry,self.segment)
   love.graphics.setColor(old_color)
   love.graphics.pop()
end

return Box