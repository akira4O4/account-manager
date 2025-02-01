local Rect = require("src/Rect")
local Text = require("src/text")
local Spring = require("src/spring")
local utils = require("src/utils")
local color = require("src/color")

function love.load()
    local win_cx, win_cy = utils.get_windows_cxcy()

    local font_path = "assets/fonts/FatPixelFont.ttf"

    open_btn = Rect:new("fill", color.red)
    open_btn_text = Text:new("OPEN", 20, color.white, font_path)
    open_btn_spring = Spring:new()
    open_btn_spring:init(300, 100, 10)

    open_btn:set_cxcywh(win_cx, win_cy, 300, 100, 20, 20, 20)
    open_btn_text:set_cxcy(win_cx, win_cy + 20)
end

function love.update(dt)
    open_btn_spring:update(dt)
    open_btn.w = open_btn_spring.x
    open_btn.x = open_btn.cx - open_btn.w / 2
    -- open_btn.h = open_btn_spring.x
end

function love.draw()
    open_btn:draw()
    open_btn_text:draw()
end

function love.mousemoved(mx, my)
    if utils.is_mouse_in_rect(mx, my, { open_btn:get_xywh() }) then
        open_btn.color = color.blud
    else
        open_btn.color = color.red
    end
end

function love.mousepressed(x, y, button)
    if utils.is_mouse_in_rect(x, y, { open_btn:get_xywh() }) then
        open_btn_spring:pull(50)
        open_btn:translate(open_btn.cx, open_btn.cy)
    end
end
