local Rect = require("src.Rect")
local Text = require("src.text")
local Spring = require("src.spring")
local Bounce = require("src.bounce")
local utils = require("src/utils")
local color = require("src/color")
local Background = require("configs.background")
local BeginConfig = require("configs.begin")

function love.load()
    love.graphics.setBackgroundColor(Background.color)
    local win_cx, win_cy = utils.get_windows_cxcy()

    open_btn = Rect:new(
        BeginConfig.open_btn.mode,
        BeginConfig.open_btn.color
    )

    open_btn:set_cxcywh(
        win_cx,
        win_cy,
        BeginConfig.open_btn.w,
        BeginConfig.open_btn.h
    )

    open_btn:set_other_attributes(
        BeginConfig.open_btn.rx,
        BeginConfig.open_btn.ry,
        BeginConfig.open_btn.segment
    )

    open_btn_text = Text:new(
        BeginConfig.open_btn_text.data,
        BeginConfig.open_btn_text.size,
        BeginConfig.open_btn_text.color,
        BeginConfig.open_btn_text.font
    )
    open_btn_text:set_cxcy(win_cx, win_cy + 20)

    open_btn_text_bounce = Bounce:new(
        BeginConfig.open_btn_text_bounce.fraq,
        BeginConfig.open_btn_text_bounce.amplitude
    )

    open_btn_w_spring = Spring:new(
        BeginConfig.open_btn_spring.w.x,
        BeginConfig.open_btn_spring.w.k,
        BeginConfig.open_btn_spring.w.d
    )
    open_btn_h_spring = Spring:new(
        BeginConfig.open_btn_spring.h.x,
        BeginConfig.open_btn_spring.h.k,
        BeginConfig.open_btn_spring.h.d
    )
end

function love.update(dt)
    open_btn_text_bounce:sin_bounce_update(dt)
    open_btn_text.new_y = open_btn_text.y + open_btn_text_bounce.offset
    open_btn_w_spring:update(dt)
    open_btn_h_spring:update(dt)

    love.graphics.push()
    love.graphics.translate(open_btn.cx, open_btn.cy)
    open_btn.w = open_btn_w_spring.x
    open_btn.h = open_btn_h_spring.x
    open_btn.x = open_btn.cx - open_btn.w / 2
    open_btn.y = open_btn.cy - open_btn.h / 2
    love.graphics.pop()
end

function love.draw()
    open_btn:draw()
    open_btn_text:draw(nil, open_btn_text.new_y)
end

function love.mousemoved(mx, my)
    if utils.is_mouse_in_rect(mx, my, { open_btn:get_xywh() }) then
        open_btn.color = color.white
        open_btn_text.color = color.red
        open_btn_w_spring:pull(BeginConfig.open_btn_spring.w.moved_pull)
        open_btn_h_spring:pull(BeginConfig.open_btn_spring.h.moved_pull)
    else
        open_btn.color = BeginConfig.open_btn.color
        open_btn_text.color = BeginConfig.open_btn_text.color
    end
end

function love.mousepressed(x, y, button)
    if utils.is_mouse_in_rect(x, y, { open_btn:get_xywh() }) then
        open_btn_w_spring:pull(BeginConfig.open_btn_spring.w.pressed_pull)
        open_btn_h_spring:pull(BeginConfig.open_btn_spring.h.pressed_pull)
    end
end
