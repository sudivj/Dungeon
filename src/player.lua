Player = {}

lives = 3
local mouse_X = 0

    -- Code --

function Player.load()
    require "src/items"
    require "src/enemy"
    
    player = {
        x = 400,
        y = 300,
        sprite = love.graphics.newImage("src/sprites/player-right.png"),
        speed = 5
    }

    Items.load()
end

function Player.update(dt)
    collision_check()
    movement()
    rotate_player(l)
    maintian_health()

    Items.update(player.x, player.y)
end

function Player.draw()
    love.graphics.draw(player.sprite, player.x, player.y, 0, width, height,64 / 2, 64 / 2)
    Items.draw()
end

function rotate_player() -- Rotate towards mouse
    mouse_X = love.mouse.getX()
    if player.x > love.mouse.getX() + 32 then
        player.sprite = love.graphics.newImage("src/sprites/player-left.png")
    elseif player.x < love.mouse.getX() then
        player.sprite = love.graphics.newImage("src/sprites/player-right.png")
    end
end

function maintian_health() -- Player health
    for i,e in ipairs(enemy) do
        if e.x < player.x + (64 * width) and e.x + (64 * width) > player.x then
            if e.y + (24 * height) < player.y + (64 * height) and e.y + (64 * height) > player.y then
                table.remove(enemy, i)
                play_sound("player")
                lives = lives - 1
            end
        end
    end
end

function collision_check() -- Checking boarder collisions
    if player.x < 100 + ((64 * width) / 2) then
        player.x = 100 + ((64 * width) / 2)
    elseif player.x > walls.length - ((64 * width) / 2) then
        player.x = walls.length - ((64 * width) / 2)
    elseif player.y < 100 + ((64 * width) / 2) then
        player.y = 100 + ((64 * width) / 2)
    elseif player.y > walls.breath - ((64 * width) / 2) then
        player.y = walls.breath - ((64 * width) / 2)
    end
end

function movement() -- Player movements
    if love.keyboard.isDown('w', 'up') then
        player.y = player.y - player.speed
    elseif love.keyboard.isDown('s', 'down') then
        player.y = player.y + player.speed
    elseif love.keyboard.isDown('a', 'left') then
        player.x = player.x - player.speed
    elseif love.keyboard.isDown('d', 'right') then
        player.x = player.x + player.speed
    end
end