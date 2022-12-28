Bullet = {}
bullets = {}

local bulletspeed = 850
local bulletssprite = love.graphics.newImage("src/sprites/Bullet.png")

    -- Code --

function Bullet.load()
    require "src/items"
    require "src/player"
end

function Bullet.update(dt)
    for i,v in ipairs(bullets) do
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)
        if v.x < 0 or v.x > 800 then
            table.remove(bullets, i)
        elseif v.y < 0 or v.y > 600 then
            table.remove(bullets, i)
        end
    end
end

function Bullet.draw()
    for i,v in ipairs(bullets) do
		love.graphics.draw(bulletssprite, v.x, v.y, v.bullet_angle)
	end
end

function bullet_shoot(x, y, button, angle) -- Shooting bullets | Code from: https://love2d.org/wiki/Tutorial:Fire_Toward_Mouse
    if shoot == 1 then
        local stratX = player.x
        local stratY = player.y
        local mouseX = x
        local mouseY = y

        local angle = math.atan2((mouseY - stratY), (mouseX - stratX)) 

        local bulletDX = bulletspeed * math.cos(angle)
        local bulletDY = bulletspeed * math.sin(angle)
        table.insert(bullets, {x = stratX, y = stratY, dx = bulletDX, dy = bulletDY, bullet_angle = angle}, play_sound("bullets"))
    end
end



