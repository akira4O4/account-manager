local Spring = {}

Spring.__index = Spring

function Spring:new(x, k, d)
    local obj = setmetatable({}, self)
    obj.x = x or 0
    obj.k = k or 100
    obj.d = d or 10
    obj.v = 0
    obj.target_x = x
    return obj
end

function Spring:update(dt)
    local a = -self.k * (self.x - self.target_x) - self.d * self.v
    self.v = self.v + a * dt
    self.x = self.x + self.v * dt
end

function Spring:pull(f)
    self.x = self.x + f
end

return Spring
