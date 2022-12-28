require "src/pointer"
require "src/player"

Items = {}

    -- Code --

function Items.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    Gun.load()
    Bullets_Display.load()
    Health.load()
end

function Items.update(px, py)
    Gun.update(px, py)
    Bullets_Display.update()
    Health.update()
end

function Items.draw()
    Gun.draw()
    Bullets_Display.draw()
    Health.draw()
end



-- Display Bullets --

Bullets_Display = {}
local timer = 250
local reload_time = 80
shoot = 0

function Bullets_Display.load()
    Bullets_Display.display_sprite = love.graphics.newImage("src/sprites/bullet.png")
end

function Bullets_Display.update(dt)
    timer = timer + 1
    if timer > (reload_time - (Score / 2)) then
        timer = (reload_time + 10)
    end
    if timer < (reload_time - (Score / 2)) then
        Bullets_Display.display_sprite = love.graphics.newImage("src/sprites/bullet-empty.png")
    end
    if timer > (reload_time - (Score / 2)) then
        Bullets_Display.display_sprite = love.graphics.newImage("src/sprites/bullet.png")
    end
end

function Bullets_Display.draw()
    love.graphics.draw(Bullets_Display.display_sprite, 116, 66, 0, 1.5, 1.5, 16, 16)
    if timer < reload_time then
        love.graphics.print(timer, 116, 60)
        shoot = 0
    elseif timer > reload_time then
        love.graphics.print("RELOADED", 116, 60)
        shoot = 1
    end

end

function mouse(button) 
    if button == 1 then
        down = 1
        if timer > (reload_time) then
            Bullets_Display.display_sprite = love.graphics.newImage("src/sprites/bullet-empty.png")
            timer = 0
        end
    else
        if timer > (reload_time) then
            Bullets_Display.display_sprite = love.graphics.newImage("src/sprites/bullet.png")
        end
    end
end



-- Gun --

Gun = {}

function Gun.load()
    gun = {
        x = 0,
        y = 0,
        sprite = love.graphics.newImage("src/sprites/gun.png"),
        draw_from_x = 0,
        draw_x = 0,
        angle = 0
    }
end

function Gun.update(px, py)
    gun.x = px
    gun.y = py
    local dx = (Pointer.x - gun.x)
    local dy = -(Pointer.y - gun.y)
    gun.angle = math.atan2(Pointer.x - gun.x, -(Pointer.y - gun.y))
    if gun.x > Pointer.x then
        gun.sprite = love.graphics.newImage("src/sprites/gun.png")
        gun.draw_from_x = 32
    elseif gun.x < Pointer.x then
        gun.sprite = love.graphics.newImage("src/sprites/gun1.png")
        gun.draw_from_x = 32
    end
end

function Gun.draw()
    love.graphics.draw(gun.sprite, gun.x, gun.y + 10, gun.angle, 1.5, 1.5, 6, gun.draw_from_x)
end



-- Health -- 

Health = {}

function Health.load()
    health_slef = {}
    health_slef.img = love.graphics.newImage("src/sprites/Health/heart-3.png")
    local img_name = "src/sprites/Health/heart-3.png"
end

function Health.update(dt)
    if lives == 3 then
        img_name = "src/sprites/Health/heart-3.png"
    elseif lives == 2 then
        img_name = "src/sprites/Health/heart-2.png"
    elseif lives == 1 then
        img_name = "src/sprites/Health/heart-1.png"
    elseif lives == 0 then
        img_name = "src/sprites/Health/death.png"
    end
    health_slef.img = love.graphics.newImage(img_name)
    if img_name == "src/sprites/Health/death.png" then
        gameplay = 1
    end
end

function Health.draw()
    love.graphics.draw(health_slef.img, 250, 60 ,0, 3)
end