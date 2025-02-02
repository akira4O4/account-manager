local color = require("src/color")
local BeginConfig = {
    open_btn = {
        mode = "fill",
        x = 0,
        y = 0,
        w = 300,
        h = 100,
        rx = 20,
        ry = 20,
        segment = 20,
        color = color.red
    },
    open_btn_text = {
        x = 0,
        y = 0,
        size = 20,
        font = "assets/fonts/FatPixelFont.ttf",
        data = "OPEN",
        color = color.white
    },
    open_btn_text_bounce = {
        fraq = 2,
        amplitude = 5
    },
    open_btn_spring = {
        w = {
            x = 300,
            k = 100,
            d = 10,
            moved_pull = 2,
            pressed_pull = 50
        },
        h = {
            x = 100,
            k = 100,
            d = 10,
            moved_pull = 2,
            pressed_pull = 50
        }
    }
}
return BeginConfig
