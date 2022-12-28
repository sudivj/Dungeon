Pointer = {}

    -- Code --

function Pointer.load()
    Pointer.x = 0
    Pointer.y = 0
    Pointer.sprite = love.graphics.newImage("src/sprites/pointer.png")
end

function Pointer.update(posx, posy)
    Pointer.x = posx - 6
    Pointer.y = posy - 6
end

function Pointer.draw()
    if gameplay == 0 then
        if drawpointer == 1 then -- Pointer
            love.graphics.print("PRESS 'r' to hide pointer", 100, 500, 0, 1)
            love.graphics.draw(Pointer.sprite, Pointer.x, Pointer.y, 0, 2)
        else
            love.graphics.print("PRESS 'r' to show pointer", 100, 500, 0, 1)
        end
    end
end

function keypress(key)
    if key == "r" then
        if drawpointer == 1 then
            drawpointer = 0
        elseif drawpointer == 0 then
            drawpointer = 1
        end
    end 
end