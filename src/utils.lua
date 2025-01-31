local utils={}

function utils.get_windows_size()
    w=love.graphics.getWidth()
    h=love.graphics.getHeight()
    return w,h
end

function utils.get_windows_cxcy()
    cx=love.graphics.getWidth()/2
    cy=love.graphics.getHeight()/2
    return cx,cy
end


return utils