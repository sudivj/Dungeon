-- Camera by hump library -- Link: https://github.com/vrld/hump

Cam = {}

    -- Code --

function Cam.load(posx, posy)
    camera = require "lib/hump/camera"
    cam = camera(50 + (700 / 2),50 + (500 / 2))
    value = 0
    camrot = 0
end

function Cam.update(dt)
    cam_rotation()
    camrot = math.cos(value / 25)
    cam:rotateTo(camrot / 20)
end

function cam_rotation() -- Rotate camera
    if value > 145 then value = 0 end
    value = value + 1
end
