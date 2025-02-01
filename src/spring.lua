local Spring = {}

Spring.__index = Spring

function Spring:new()
    local obj = setmetatable({}, self)
    return obj
end

function Spring:init(x, k, d)
    self.x = x or 0
    self.k = k or 100
    self.d = d or 10
    self.v = 0
    self.target_x = x
end

function Spring:update(dt)
    local a = -self.k * (self.x - self.target_x) - self.d * self.v
    self.v = self.v + a * dt
    self.x = self.x + self.v * dt
end

function Spring:pull(f, k, d)
    if k then self.k = k end
    if d then self.d = d end
    self.x = self.x + f
end

function Spring:animate(x, k, d)
    if k then self.k = k end
    if d then self.d = d end
    self.target_x = self.x
end

return Spring
