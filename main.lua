local Rect = require("src/Rect")
local Text = require("src/text")
local Spring = require("src/spring")
local Bounce = require("src/bounce")
local utils = require("src/utils")
local color = require("src/color")

function love.load()
    love.graphics.setBackgroundColor(color.deep_gray)
    local win_cx, win_cy = utils.get_windows_cxcy()

    local font_path = "assets/fonts/FatPixelFont.ttf"

    open_btn = Rect:new("fill", color.red)
    open_btn_text = Text:new("OPEN", 20, color.white, font_path)

    open_btn:set_cxcywh(win_cx, win_cy, 300, 100)
    open_btn:set_other_attributes(20, 20, 20)

    open_btn_text:set_cxcy(win_cx, win_cy + 20)
    open_btn_w_spring = Spring:new(open_btn.w, 50, 5)
    open_btn_h_spring = Spring:new(open_btn.h, 50, 5)
    open_btn_text_bounce = Bounce:new(2, 5)
end

function love.update(dt)
    open_btn_text_bounce:sin_bounce_update(dt)
    open_btn_w_spring:update(dt)
    open_btn_h_spring:update(dt)
end

function love.draw()
    open_btn:draw()
    open_btn_text:draw(nil, open_btn_text.y + open_btn_text_bounce.offset)
end

function love.mousemoved(mx, my)
end

function love.mousepressed(x, y, button)
    if utils.is_mouse_in_rect(x, y, { open_btn:get_xywh() }) then
    end
end
