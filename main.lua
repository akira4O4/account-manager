local Box=require("src/box")
local Text=require("src/text")
local utils=require("src/utils")
local color=require("src/color")

function love.load()
    win_w,win_h=utils.get_windows_size()
    win_cx,win_cy=utils.get_windows_cxcy()
    
    font_path="assets/fonts/FatPixelFont.ttf"

    login_user_btn=Box:new("fill",500,100,400,100,color.red,20,20,20)
    login_user_btn_text=Text:new("User",20,color.white,font_path)
    
    login_psw_btn=Box:new("fill",0,0,200,100,color.red,20,20,20)
    login_psw_btn_text=Text:new("Password",24,color.white,font_path)

end

function love.update(dt)
end

function love.draw()
    utils.save_system_coordinate() 
    old_color=utils.save_color()

    -- utils.translate(win_cx,win_cy)
    login_user_btn:draw()
    -- login_user_btn_text:draw(0,0,0,1,1,login_user_btn_text.w/2,login_user_btn_text.h/2-20) 
    
    utils.recover_system_coordinate()
end