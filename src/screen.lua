Screen = {}
walls = {}

local playonce = 0
-- Background image --

    -- Code --

function Screen.load()
    require "src/cam"
    require "src/sound-effects"
    
    walls.length = 700
    walls.breath = 500
    walls.sprite = love.graphics.newImage("src/sprites/full-wall.png")
    Cam.load(walls.length, walls.width)
    End_screen = love.graphics.newImage("src/sprites/Gameover-benner.png")
end

function Screen.update(dt)
    if gameplay == 1 and playonce == 0 then
        play_sound("gameover")
        playonce = 1
    end
end

function Screen.draw()
    love.graphics.draw(walls.sprite, 100, 100, 0)
    if gameplay == 1 then -- When game is over
        love.graphics.draw(End_screen, -25, -25, 0)
        love.graphics.setColor(1,0,0)
        love.graphics.print(Score, 500, 328, 0, 2)
    end
end 