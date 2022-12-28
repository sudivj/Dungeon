Enemy = {}
enemy = {}

local frame_number = 1
local startX = 0
local startY = 0
local timer = 0

    -- Code --

function Enemy.load()
    require "src/player"
    require "src/bullet"
    sprite_name = "src/sprites/Enemy-sp/Enemy-left-f1.png"
end

function Enemy.update(dt)

    local Spawn_time = (love.math.random(100 - (Score / 2), 400))

    if Spawn_time < 50 then
        Spawn_time = 50
    end

    if timer > (Spawn_time) then
        spawn_enemy()
        timer = 0
    end

    for i,e in ipairs(enemy) do

        -- Move --

        if e.x > player.x - ((64 * width) / 2) then
            if frame_number < 1 then
                sprite_name = "src/sprites/Enemy-sprites/Enemy-left-f2.png"
            else
                sprite_name = "src/sprites/Enemy-sprites/Enemy-left-f1.png"
            end

            e.x = e.x - 1
        end

        if e.x < player.x - ((64 * width) / 2) then
            if frame_number < 1 then
                sprite_name = "src/sprites/Enemy-sprites/Enemy-right-f2.png"
            else
                sprite_name = "src/sprites/Enemy-sprites/Enemy-right-f1.png"
            end

            e.x = e.x + 1
        end

        if e.y > player.y - ((64 * height) / 2) then
            e.y = e.y - 1
        end

        if e.y < player.y - ((64 * height) / 2) then
            e.y = e.y + 1
        end
        
        -- Change costume --

        e.sp = love.graphics.newImage(sprite_name)

        -- Kill when bullet collided --
        for j,v in ipairs(bullets) do
            if v.x > e.x and v.x < e.x + (64 * width) and v.y > e.y and v.y < e.y + (64 * height) then
                table.remove(enemy, i)
                Sounds.slime_death:play()
                table.remove(bullets, j)
            end
        end
    end

    timer = timer + 1
    change_frame()    
end

function Enemy.draw() 
    for i,v in ipairs(enemy) do
        love.graphics.draw(v.sp, v.x, v.y, 0, width)
    end
end

function change_frame() -- Frames
    frame_number = frame_number + 0.03
    if frame_number > 2.03 then
        frame_number = 0
    end
end

local function random_position(coordinate) -- Generate random position for Enemy
    if coordinate == 0 then

        startX = love.math.random(0, 800)

        if love.math.random(0, 1) == 0 then
            startY = -64
        else
            startY = 600
        end
    elseif coordinate == 1 then

        startY = love.math.random(0, 600)

        if love.math.random(0, 1) == 0 then
            startX = -64
        else
            startX = 800
        end
    end
end

function spawn_enemy() -- Spawning the Enemy
    random_position(love.math.random(0, 1))
    table.insert(enemy, {x = startX, y = startY, sp = sprite_name})
end