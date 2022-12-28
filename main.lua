width = 0.7
height = 0.7
gameplay = 0
Score = 0
drawpointer = 0

    -- Code --

-- Main load function --

Game = {}
function love.load()
    myfont = love.graphics.setNewFont("src/Font/Monocraft.otf", 16) -- Font from: https://fontesk.com/monocraft-font/
    myfont:setFilter( "nearest", "nearest")

    require "src/enemy"
    require "src/player"
    require "src/cam"
    require "src/screen"
    require "src/pointer"
    require "src/bullet"
    require "src/sound-effects"

    Player.load()
    Cam.load()
    Enemy.load()
    Screen.load()
    Pointer.load()
    Bullet.load()
end

-- Main Update function --

function love.update(dt)
    play_sound("main")
    if gameplay == 0 then
        Cam.update(dt)
        Player.update(dt)
        Enemy.update(dt)
        Pointer.update(love.mouse.getX(), love.mouse.getY())
        Bullet.update(dt)
        Screen.update(dt)
        Score = round(love.timer.getTime(), 0)
    end
end

-- Main draw function --

function love.draw()
    cam:attach()
        love.graphics.print(Score, 650, 58, 0, 1.5)
        Screen.draw() -- Draw first
        Enemy.draw()
        Bullet.draw()
        Player.draw()
        Pointer.draw()
    cam:detach()
end

function round(num, idp) -- Rounding a number| Code from:- https://love2d.org/forums/memberlist.php?mode=viewprofile&u=103181  
    local mult = 10^(idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

function love.mousepressed(x, y, button) -- Mouse Function
    bullet_shoot(x, y, button, math.atan2((x - player.x), (y - player.y)))
    mouse(button)   
end

function love.keypressed(key, scancode) -- Keyboard Function
    keypress(key)
end