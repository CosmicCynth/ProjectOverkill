player = require"player"

function love.load()
    player.load()

    floor = {}
    floor.x = 0
    floor.y = 590
    floor.width = 800
    floor.height = 10
end

function love.update(dt)
    player.update(dt)
end

function love.draw()
    player.draw()
    love.graphics.rectangle("fill",floor.x,floor.y,floor.width,floor.height)
end

function checkAABB(a, b)
    return a.x < b.x + b.width and
           b.x < a.x + a.width and
           a.y < b.y + b.height and
           b.y < a.y + a.height
end