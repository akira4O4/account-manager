local Bounce = {}
Bounce.__index = Bounce

function Bounce:new(fraq, amplitude)
    local obj = setmetatable({}, self)
    obj.fraq = fraq or 1           -- default 1 Hz
    obj.amplitude = amplitude or 0 -- default 10 Pixel
    obj.time = 0                   -- 0
    obj.offst = 0
    return obj
end

function Bounce:sin_bounce_update(dt)
    self.time = self.time + dt
    self.offset = math.sin(self.time * self.fraq) * self.amplitude
end

return Bounce
