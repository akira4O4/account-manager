local utils = {}

function utils.get_windows_size()
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    return w, h
end

function utils.get_windows_cxcy()
    local cx = love.graphics.getWidth() / 2
    local cy = love.graphics.getHeight() / 2
    return cx, cy
end

function utils.get_mouse_position()
    return love.mouse.getPosition()
end

function utils.is_mouse_in_rect(mx, my, xywh)
    local x, y, w, h = xywh[1], xywh[2], xywh[3], xywh[4]
    return mx >= x and mx <= (x + w) and my >= y and my <= (y + h)
end

return utils
