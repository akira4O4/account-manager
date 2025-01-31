local color=require("src/color")
local Text={}
Text.__index=Text

function Text:new(data,size,color,font)
    local obj=setmetatable({},self)
    obj.data=data or ""
    obj.size=size or 12
    obj.font = font and love.graphics.newFont(font, size) or love.graphics.newFont(size)
    obj.w=obj.font:getWidth(obj.data) 
    obj.h=obj.font:getHeight()
    obj.color=color or color.white
    return obj
end

function Text:draw(x,y,r,sx,sy,ox,oy)
    r=r or 0
    sx=sx or 1
    sy=sy or 1
    ox=ox or 0
    oy=oy or 0
    old_color={love.graphics.getColor()}
    love.graphics.setColor(self.color) 
    love.graphics.setFont(self.font)
    love.graphics.print(self.data, x,y,r,sx,sy,ox,oy)
    love.graphics.setColor(old_color) 
end

return Text