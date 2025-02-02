-- 过渡动画类
local Transition = {}
Transition.__index = Transition

function Transition:new(speed, onComplete)
    local obj = setmetatable({}, self)
    obj.screenWidth, obj.screenHeight = love.graphics.getDimensions()
    obj.radius = 0                 -- 扩展半径
    obj.expandSpeed = speed or 500 -- 扩展速度
    obj.effectComplete = false     -- 动画是否完成
    obj.onComplete = onComplete    -- 结束时执行的回调函数
    return obj
end

function Transition:update(dt)
    if not self.effectComplete then
        self.radius = self.radius + self.expandSpeed * dt
        local maxRadius = math.sqrt(self.screenWidth ^ 2 + self.screenHeight ^ 2) -- 屏幕对角线
        if self.radius >= maxRadius then
            self.effectComplete = true
            if self.onComplete then
                self.onComplete() -- 触发回调
            end
        end
    end
end

function Transition:draw()
    if not self.effectComplete then
        love.graphics.setColor(1, 1, 1, 1)                                                     -- 纯白色
        love.graphics.circle("fill", self.screenWidth / 2, self.screenHeight / 2, self.radius) -- 绘制扩展动画
    end
end

return Transition
