Sounds = { -- Sound effects from: https://mixkit.co/
    gunshot = love.audio.newSource("src/sounds/Gunshot.wav", "static"),
    player_hurt = love.audio.newSource("src/sounds/player_damage.wav", "static"),
    game_over = love.audio.newSource("src/sounds/lose.wav", "static"),
    main_music = love.audio.newSource("src/sounds/Main_music.wav", "stream"),
    slime_death = love.audio.newSource("src/sounds/Slime-death.wav", "static")
}

function play_sound(effect) -- Plays sounds to the given argument
    if effect == "bullets" then
        Sounds.gunshot:setVolume(1)
        Sounds.gunshot:play()
    end
    if effect == "player" then
        Sounds.player_hurt:setVolume(1)
        Sounds.player_hurt:play()
    end
    if effect == "gameover" then
        Sounds.game_over:setVolume(1)
        Sounds.game_over:play()
    end
    if effect == "main" then
        Sounds.main_music:play()
    end
end