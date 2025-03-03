player = {}

function player.load()
    player.x = 200
    player.y = 200
    player.width = 64
    player.height = 64
    player.speed = 200
    player.jumpForce = -500
    player.canJump = true

    player.gravity = 10
    player.acceleration = 0
end

function player.update(dt)
    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    --Gravity stuff
    player.acceleration = player.acceleration + player.gravity * dt

    if player.y >= 600-player.height then
        player.acceleration = 0
    end
    print("player acc:"..player.acceleration)

    --Jumping
    if checkAABB(player,floor) then
        player.acceleration = 0
        player.canJump = true
    end

    if love.keyboard.isDown("space") and player.canJump == true then
        player.canJump = false
        player.acceleration = player.acceleration + player.jumpForce * dt
    end

    --if not love.keyboard.isDown("space") and player.acceleration 

    --Player updating
    player.y = player.y + player.acceleration
end

function player.draw()
    love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
end

return player