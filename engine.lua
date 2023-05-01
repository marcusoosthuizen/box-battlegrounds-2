engine = {}

engine.preRound = 0
engine.slowmo = false
engine.slowmoPass = 0
engine.deathWait = 1
engine.winner = 0

engine.showfps = 0
engine.shakeX = 0
engine.shakeY = 0
engine.shake = 0

engine.flash = 0
engine.flashColor = 0
engine.roundType = 0
engine.roundTypes = {'Gravity Mayhem', 'Lights Out', 'Super Speed', 'Rumble Showdown', 'Black Holes!', 'Orb Drought', 'Reversed Controls?!', "OwO", "Deep Space", "Lovely Loopies", "Knock Out of This World", "Flash Bang",     "Boss Battle??", "Lasers!", "Battle Royale", "Turf Conflict"}
engine.roundImgs = {}
for i = 1,12,1
do
  table.insert(engine.roundImgs, love.graphics.newImage("/assets/modes/mode" .. i .. ".png"))
  --print("/assets/modes/mode" .. i .. ".png")
end
table.insert(engine.roundImgs, love.graphics.newImage("/assets/modes/mode" .. 0 .. ".png"))
-- Boss Ideas: Snake like boss and boss that splits apart when hit --
engine.mapType = 0
engine.mapTypes = {"Maze", "Brawl", "Hazardous", "Prairie"}

engine.menuTypes = {{"Red", "Org", "Ylw"}, {"Blu", "Grn", "Ppl"}, {"Off", "On"}}

engine.pickupSpawn = 0

function engine.slowmoCheck()
  if engine.slowmo then
    if engine.slowmoPass == 2 then
      engine.slowmoPass = 0
      return true
    else
      engine.slowmoPass = engine.slowmoPass + 1
      return false
    end
  end
  return true
end

function engine.spawnParticles(x, y, xVel, yVel, size, color, amount)
  for i = 1,amount,1
  do
    table.insert(particles, particle:new(nil))
    particles[#particles]:init(math.random(x, x + size), math.random(y, y + size), math.random(xVel, 0) * 40 + math.random(-1, 1) * 20, math.random(yVel, 0) * 40 + math.random(-1, 1) * 20, size / 8, color)
  end
end

function engine.updateParticles(dt)
  for i = 1,#particles,1
  do
    particles[i]:update(dt)
  end

  for i = #particles,1,-1
  do
    if particles[i].size < 0 then
      table.remove(particles, i)
    end
  end
end

function engine.updatePickups(dt)
  for i = 1,#pickups,1
  do
    pickups[i]:floatUpdate(dt)
  end

  for i = #pickups,1,-1
  do
    if engine.puCollisionCheck(pickups[i].x, pickups[i].y, pickups[i].size) then
      engine.spawnParticles(pickups[i].x - 10, pickups[i].y - 10, 0, 0, pickups[i].size + 10, pickups[i].color, 10)
      table.remove(pickups, i)
    end
  end
end

function engine.shakeScreen(dt)
  engine.shakeX = 0
  engine.shakeY = 0
  if engine.shake > 0 then
    engine.shakeX = math.random(0, 16) - 4
    engine.shakeY = math.random(0, 16) - 4
    engine.shake = engine.shake - 1 * dt
  end
end

function engine.plCollisionCheck(dt)
  local knockbackMulti = 1
  if engine.roundType == 11 then
    knockbackMulti = 3
  end
  if pl1.x + pl1.size > pl2.x and pl1.x < pl2.x + pl2.size and pl1.y + pl1.size > pl2.y and pl1.y < pl2.y + pl2.size then
    pl1.x = pl1.x + math.sqrt(pl2.xVel * pl2.xVel + pl2.yVel * pl2.yVel) * pl2.size / 400
    pl1.y = pl1.y + math.sqrt(pl2.xVel * pl2.xVel + pl2.yVel * pl2.yVel) * pl2.size / 400
    pl2.x = pl2.x + math.sqrt(pl1.xVel * pl1.xVel + pl1.yVel * pl1.yVel) * pl1.size / 400
    pl2.y = pl2.y + math.sqrt(pl1.xVel * pl1.xVel + pl1.yVel * pl1.yVel) * pl1.size / 400

    pl1.size = pl1.size - math.sqrt(pl2.xVel * pl2.xVel + pl2.yVel * pl2.yVel) * pl2.size / 200
    pl2.size = pl2.size - math.sqrt(pl1.xVel * pl1.xVel + pl1.yVel * pl1.yVel) * pl1.size / 200

    pl1.xVel = (pl1.xVel * -0.8 - pl2.xVel * -0.8) * knockbackMulti
    pl1.yVel = (pl1.yVel * -0.8 - pl2.yVel * -0.8) * knockbackMulti
    pl2.xVel = (pl2.xVel * -0.8 + pl1.xVel * -0.8) * knockbackMulti
    pl2.yVel = (pl2.yVel * -0.8 + pl1.yVel * -0.8) * knockbackMulti

    engine.spawnParticles(pl1.x, pl1.y, pl1.xVel, pl1.yVel, pl1.size, pl1.color, pl1.size / 2)
    engine.spawnParticles(pl2.x, pl2.y, pl2.xVel, pl2.yVel, pl2.size, pl2.color, pl1.size / 2)
    
    engine.shake = 0.2
  end
end

function engine.puCollisionCheck(x, y, size)
  local increase = 1
  if engine.roundType == 5 then
    increase = -1
  end
  
  if x + size > pl1.x and x < pl1.x + pl1.size and y + size > pl1.y and y < pl1.y + pl1.size then
    pl1.size = pl1.size + 8 * increase
    pl1.x = pl1.x - 4 * increase
    pl1.y = pl1.y - 4 * increase
    return true
  end
  if x + size > pl2.x and x < pl2.x + pl2.size and y + size > pl2.y and y < pl2.y + pl2.size then
    pl2.size = pl2.size + 8 * increase
    pl2.x = pl2.x - 4 * increase
    pl2.y = pl2.y - 4 * increase
    return true
  end
  return false
end

function engine.boundaryCheck()
  if pl1.x < 0 then
    pl1.x = 0
    pl1.xVel = pl1.xVel * -0.5
  end
  if pl1.x + pl1.size > 1080 then
    pl1.x = 1080 - pl1.size
    pl1.xVel = pl1.xVel * -0.5
  end
  if pl1.y < 0 then
    pl1.y = 0
    pl1.yVel = pl1.yVel * -0.5
  end
  if pl1.y + pl1.size > 720 then
    pl1.y = 720 - pl1.size
    if engine.roundType == 1 then
      pl1.yVel = 0
    else
      pl1.yVel = pl1.yVel * -0.5
    end
  end

  if pl2.x < 0 then
    pl2.x = 0
    pl2.xVel = pl2.xVel * -0.5
  end
  if pl2.x + pl2.size > 1080 then
    pl2.x = 1080 - pl2.size
    pl2.xVel = pl2.xVel * -0.5
  end
  if pl2.y < 0 then
    pl2.y = 0
    pl2.yVel = pl2.yVel * -0.5
  end
  if pl2.y + pl2.size > 720 then
    pl2.y = 720 - pl2.size
    if engine.roundType == 1 then
      pl2.yVel = 0
    else
      pl2.yVel = pl2.yVel * -0.5
    end
  end
end

function engine.loop()
  if pl1.x < 0 then
    pl1.x = 1080 - pl1.size
  end
  if pl1.x + pl1.size > 1080 then
    pl1.x = 0
  end
  if pl1.y < 0 then
    pl1.y = 720 - pl1.size
  end
  if pl1.y + pl1.size > 720 then
    pl1.y = 0
  end

  if pl2.x < 0 then
    pl2.x = 1080 - pl2.size
  end
  if pl2.x + pl2.size > 1080 then
    pl2.x = 0
  end
  if pl2.y < 0 then
    pl2.y = 720 - pl2.size
  end
  if pl2.y + pl2.size > 720 then
    pl2.y = 0
  end
end

function engine.specialModes(dt)
  if engine.roundType == 1 then
    pl1.yVel = pl1.yVel + 100 * dt
    pl2.yVel = pl2.yVel + 100 * dt
  end
  if engine.roundType == 3 then
    pl1:updateVel(dt)
    pl2:updateVel(dt)

    engine.plCollisionCheck()
    engine.shakeScreen(dt)

    pl1:applyVel(dt)
    pl2:applyVel(dt)
    
    engine.boundaryCheck()
    pl1:updateVel(dt)
    pl2:updateVel(dt)

    engine.plCollisionCheck()
    engine.shakeScreen(dt)

    pl1:applyVel(dt)
    pl2:applyVel(dt)
    
    engine.boundaryCheck()
  end
  if engine.roundType == 4 then
    engine.shake = 1
    engine.shakeScreen(dt)
    pl1.size = pl1.size - 1.5 * dt
    pl2.size = pl2.size - 1.5 * dt
  end
  if engine.roundType == 6 then
    pickups = {}
  end
  if engine.roundType == 12 then
    engine.flash = engine.flash - dt
    if engine.flash <= -1.5 then
      engine.flash = 1.5
    else
      if engine.flash >= 0 then
        engine.flashColor = engine.flash
      else
        engine.flashColor = 0
      end
    end
  end
end

function engine.deathLogic(dt)
  if pl1.size < 40 and pl1.size > 0 then
    engine.slowmo = true
    pl1.size = 0
    pl1.xVel = 0
    pl1.yVel = 0
    engine.deathWait = 1
    engine.spawnParticles(pl1.x, pl1.y, 0, 0, 40, pl1.color, 40)
  end
  if pl2.size < 40 and pl2.size > 0 then
    engine.slowmo = true
    pl2.size = 0
    pl2.xVel = 0
    pl2.yVel = 0
    engine.deathWait = 1
    engine.spawnParticles(pl2.x, pl2.y, 0, 0, 40, pl2.color, 40)
  end

  if pl1.size <= 0 then
    engine.deathWait = engine.deathWait - dt
    if engine.deathWait < 0 and pl2.xVel < 0.2 and pl2.yVel < 0.2 or engine.deathWait < 0 and engine.roundType == 9 then
      state = -2
      pl1.x = -200
      pl1.y = -325
      pl1.xVel = 0
      pl1.yVel = 0
      engine.winner = 1
      pl2.points = pl2.points + 1
    end
  end
  if pl2.size <= 0 then
    engine.deathWait = engine.deathWait - dt
    if engine.deathWait < 0 and pl1.xVel < 0.2 and pl1.yVel < 0.2 or engine.deathWait < 0 and engine.roundType == 9 then
      state = -2
      pl2.x = 1280
      pl2.y = -325
      pl2.xVel = 0
      pl2.yVel = 0
      engine.winner = 0
      pl1.points = pl1.points + 1
    end
  end
end

function engine.roundLogic(dt)
  engine.preRound = engine.preRound + dt
  if engine.preRound > 1 then
    engine.preRound = 1
  end
  --if love.keyboard.isDown("r") then
  --  pl1:init(200, 325, 80, 1, 0)
  --  pl2:init(805, 325, 80, 2, 0)

  --  pickups = {}
  --  particles = {}
  
    
  --  if engine.roundType == 5 then
  --    table.insert(pickups, pickup:new(nil))
  --    pickups[1]:init(525, 345, {0, 0, 0}, false)
  --  else
  --    table.insert(pickups, pickup:new(nil))
  --    pickups[1]:init(525, 345, {0.8, 0.5, 0.8}, false)
  --  end
  --end
  --if love.keyboard.isDown("t") and engine.fpsTime >= 0 then
  --  engine.fpsTime = -.2
  --  if engine.showfps then
  --    engine.showfps = false
  --  else
  --    engine.showfps = true
  --  end
  --end

  pl1:updateVel(dt)
  pl2:updateVel(dt)

  engine.plCollisionCheck()
  --engine.shakeScreen(dt)

  pl1:applyVel(dt)
  pl2:applyVel(dt)
  

  engine.specialModes(dt)
  if engine.roundType ~= 10 then
    engine.boundaryCheck()
  else
    engine.loop()
  end

 
  engine.deathLogic(dt)

  

  engine.pickupSpawn = engine.pickupSpawn + dt
  local daColor = {}
  if engine.pickupSpawn > 2 then
    if #pickups < 6 then
      if engine.roundType == 5 then
        daColor = {0, 0, 0}
      else
        daColor = {math.random(5, 10) * 0.1, math.random(5, 10) * 0.1, math.random(5, 10) * 0.1}
      end
      table.insert(pickups, pickup:new(nil))
      pickups[#pickups]:init(math.random(10, 1040), math.random(10, 680), daColor, true)
    end
    engine.pickupSpawn = 0
  end

end

engine.fps = 60
engine.fpsCount = 0
engine.fpsTime = 0
function engine.calcfps(dt)
  engine.fpsTime = engine.fpsTime + dt
  engine.fpsCount = engine.fpsCount + 1
  if engine.fpsTime >= .1 then
    if engine.fps ~= 0 then engine.fps = (engine.fps + engine.fpsCount * 10) / 2
    else engine.fps = engine.fpsCount * 10 end
    engine.fpsCount = 0
    engine.fpsTime = 0
  end
end

engine.menuFactor = 0
engine.buttonRed = {1, 0.3, 0.3}
engine.buttonBlue = {0.3, 0.3, 1}
engine.hover = false
engine.roundFade = false

function engine.menuLogic(dt)
  local mouseX = love.mouse.getX()
  local mouseY = love.mouse.getY()

  
  if state == 1 then
    pl1:updateVel(dt)
    pl2:updateVel(dt)
    pl1:applyVel(dt)
    pl2:applyVel(dt)
    pl1.x = 482
    pl2.x = 562
    pl1.y = 42
    pl2.y = 170

    
    if mouseX > 380 and mouseX < 700 and mouseY > 550 and mouseY < 630 then
      engine.buttonBlue = {0.5, 0.5, 1}
      if love.mouse.isDown(1) and engine.hover then
        engine.menuFactor = 1
        engine.hover = false
        engine.buttonBlue = {0.3, 0.3, 1}
      else
        if love.mouse.isDown(1) == false then
          engine.hover = true 
        end
      end
    else
      if mouseX > 380 and mouseX < 700 and mouseY > 400 and mouseY < 480 then
        engine.buttonRed = {1, 0.5, 0.5}
        if love.mouse.isDown(1) and engine.hover then
          engine.menuFactor = -1
          engine.hover = false
          engine.buttonRed = {1, 0.3, 0.3}
        else
          if love.mouse.isDown(1) == false then
            engine.hover = true 
          end
        end
      else
        engine.hover = false
        engine.buttonRed = {1, 0.3, 0.3}
        engine.buttonBlue = {0.3, 0.3, 1}
      end
    end

    state = state + dt * 4 * engine.menuFactor
    --if state >= 2 then
    --  engine.menuFactor = 0
    --  state = 2
    --end
  end
  
  if state > 1 then
    if mouseX > 380 and mouseX < 700 and mouseY > 600 and mouseY < 680 and state == 2 then
      engine.buttonRed = {1, 0.5, 0.5}
      if love.mouse.isDown(1) and engine.hover then
        engine.menuFactor = -1
        engine.hover = false
        engine.buttonRed = {1, 0.3, 0.3}
      else
        if love.mouse.isDown(1) == false then
          engine.hover = true 
        end
      end
    else
      engine.optionButtons(mouseX, mouseY)
    end
    
    state = state + dt * 4 * engine.menuFactor
    if state <= 1 then
      engine.menuFactor = 0
      state = 1
    end
    if state >= 2 then
      engine.menuFactor = 0
      state = 2
    end
  end

  if state < 1 then
    pl1:updateVel(dt)
    pl2:updateVel(dt)
    pl1:applyVel(dt)
    pl2:applyVel(dt)


    state = state + dt * 4 * engine.menuFactor
    if state >= 1 then
      engine.menuFactor = 0
      state = 1
    end
    if state <= 0 and engine.roundFade ~= true then
      engine.menuFactor = 0
      state = 0
    end

    if love.keyboard.isDown("return") and state == 0 then
      state = -0.01
      engine.roundFade = true
    end

    if state < 0 then
      state = state - dt
      if state < -1 and state > -2 then
        --love.timer.sleep(0.5)
        state = -1
        engine.preRound = -5
        pl1:init(200, 325, 80, 1, pl1.points, pl1.colorType)
        pl2:init(805, 325, 80, 2, pl2.points, pl2.colorType)


        pickups = {}
        particles = {}
      
        
        if engine.roundType == 5 then
          table.insert(pickups, pickup:new(nil))
          pickups[1]:init(525, 345, {0, 0, 0}, false)
        else
          table.insert(pickups, pickup:new(nil))
          pickups[1]:init(525, 345, {0.8, 0.5, 0.8}, false)
        end
      end
    end
  end

end

function engine.optionButtons(mouseX, mouseY)
  if mouseX > 705 and mouseX < 725 and mouseY > 140 and mouseY < 170 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      pl1.colorType = pl1.colorType - 1
      if pl1.colorType <= 0 then
        pl1.colorType = 3
      end
      pl1:updateControls()
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  elseif mouseX > 895 and mouseX < 915 and mouseY > 140 and mouseY < 170 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      pl1.colorType = pl1.colorType + 1
      if pl1.colorType >= 4 then
        pl1.colorType = 1
      end
      pl1:updateControls()
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  elseif mouseX > 705 and mouseX < 725 and mouseY > 260 and mouseY < 290 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      pl2.colorType = pl2.colorType - 1
      if pl2.colorType <= 0 then
        pl2.colorType = 3
      end
      pl2:updateControls()
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  elseif mouseX > 895 and mouseX < 915 and mouseY > 260 and mouseY < 290 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      pl2.colorType = pl2.colorType + 1
      if pl2.colorType >= 4 then
        pl2.colorType = 1
      end
      pl2:updateControls()
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  elseif mouseX > 705 and mouseX < 735 and mouseY > 380 and mouseY < 410 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      if engine.showfps == 1 then
        engine.showfps = 0
      else
        engine.showfps = 1
      end
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  elseif mouseX > 885 and mouseX < 915 and mouseY > 380 and mouseY < 410 and state == 2 then
    if love.mouse.isDown(1) and engine.hover then
      if engine.showfps == 1 then
        engine.showfps = 0
      else
        engine.showfps = 1
      end
      engine.hover = false
    else
      if love.mouse.isDown(1) == false then
        engine.hover = true 
      end
    end
  else
    engine.buttonRed = {1, 0.3, 0.3}
    engine.hover = false
  end
end

function engine.preRoundLogic(dt)
  engine.preRound = engine.preRound + dt
end

engine.postRound = {0, 360, 0, 0, 0, 0, 0, 0, -500, 0, 0, 1, 0, 0, 0, 0, 0, 0}
engine.postRoundTimer = 0
engine.vicVel = 0
engine.vicEyes = 1

engine.randomRound = 13
engine.roundBlanks = {}

function engine.postRoundLogic(dt)
  engine.postRoundTimer = engine.postRoundTimer + dt

  if engine.postRoundTimer > 0 and engine.postRoundTimer < 2 then
    engine.postRound[1] = engine.postRound[1] + dt * 3
    if engine.postRound[1] > 1 then
      engine.postRound[1] = 1
    end

    engine.postRound[3] = pl1.x
    engine.postRound[4] = pl1.y
    engine.postRound[5] = pl1.size
    engine.postRound[6] = pl2.x
    engine.postRound[7] = pl2.y
    engine.postRound[8] = pl2.size

    if engine.winner == 0 then
      engine.postRound[10] = pl1.points - 1
      engine.postRound[11] = pl2.points
    else
      engine.postRound[10] = pl1.points
      engine.postRound[11] = pl2.points - 1
    end

  elseif engine.postRoundTimer > 2 and engine.postRoundTimer < 3 then
    engine.postRound[2] = engine.postRound[2] - dt * 720
    engine.postRound[9] = engine.postRound[9] + dt * 720
    
    pl1.x = pl1.x + (200 - engine.postRound[3]) * dt
    pl1.y = pl1.y + (400 - engine.postRound[4]) * dt
    pl1.size = pl1.size + (80 - engine.postRound[5]) * dt

    pl2.x = pl2.x + (805 - engine.postRound[6]) * dt
    pl2.y = pl2.y + (400 - engine.postRound[7]) * dt
    pl2.size = pl2.size + (80 - engine.postRound[8]) * dt

    for i = 1,#pickups,1
    do
      pickups[i].size = pickups[i].size - 30 * dt
      pickups[i].x = pickups[i].x + dt * 15
      if pickups[i].size < 0 then pickups[i].size = 0 end
    end
  
  elseif engine.postRoundTimer > 3 and engine.postRoundTimer < 4.5 then
    pl1.x = 200
    pl1.y = 400
    pl1.size = 80

    pl2.x = 805
    pl2.y = 400
    pl2.size = 80

    pickups = {}

  
  elseif engine.postRoundTimer > 4.5 and engine.postRoundTimer < 8 then
    engine.postRound[10] = pl1.points
    engine.postRound[11] = pl2.points


    if engine.winner == 0 then
      engine.vicVel = engine.vicVel - 20 * dt

      pl1.y = pl1.y - engine.vicVel

      if pl1.y > 400 then
        pl1.y = 400
        engine.vicVel = 5
      end

      pl2.xVel = pl2.xVel + dt * 30 * engine.vicEyes
      pl2.yVel = 14
      if pl2.xVel > 10 then
        engine.vicEyes = -1
        pl2.xVel = 10
      end
      if pl2.xVel < -10 then
        engine.vicEyes = 1
        pl2.xVel = -10
      end
    else
      engine.vicVel = engine.vicVel - 20 * dt

      pl2.y = pl2.y - engine.vicVel

      if pl2.y > 400 then
        pl2.y = 400
        engine.vicVel = 5
      end

      pl1.xVel = pl1.xVel + dt * 30 * engine.vicEyes
      pl1.yVel = 14
      if pl1.xVel > 10 then
        engine.vicEyes = -1
        pl1.xVel = 10
      end
      if pl1.xVel < -10 then
        engine.vicEyes = 1
        pl1.xVel = -10
      end
    end
  -- YOU WIN --

  elseif engine.postRoundTimer > 8 and pl1.points == 3 or engine.postRoundTimer > 8 and pl2.points == 3 then
    engine.postRound[10] = pl1.points
    engine.postRound[11] = pl2.points


    if engine.winner == 0 then
      engine.vicVel = engine.vicVel - 20 * dt

      pl1.y = pl1.y - engine.vicVel

      if pl1.y > 400 then
        pl1.y = 400
        engine.vicVel = 5
      end

      pl2.xVel = pl2.xVel + dt * 30 * engine.vicEyes
      pl2.yVel = 14
      if pl2.xVel > 10 then
        engine.vicEyes = -1
        pl2.xVel = 10
      end
      if pl2.xVel < -10 then
        engine.vicEyes = 1
        pl2.xVel = -10
      end
    else
      engine.vicVel = engine.vicVel - 20 * dt

      pl2.y = pl2.y - engine.vicVel

      if pl2.y > 400 then
        pl2.y = 400
        engine.vicVel = 5
      end

      pl1.xVel = pl1.xVel + dt * 30 * engine.vicEyes
      pl1.yVel = 14
      if pl1.xVel > 10 then
        engine.vicEyes = -1
        pl1.xVel = 10
      end
      if pl1.xVel < -10 then
        engine.vicEyes = 1
        pl1.xVel = -10
      end
    end

    engine.postRound[12] = engine.postRound[12] - dt
    if engine.postRound[12] < 0 then
      engine.postRound[12] = 0
    end

    if engine.postRoundTimer > 10 then
      if love.keyboard.isDown("return") then
        engine.randomRound = 0
        engine.roundBlanks = {}
        engine.greatReset()
        engine.randomRound = 13
        state = 1
        engine.roundFade = false
        pl1.points = 0
        pl2.points = 0
      end
    end

  elseif engine.postRoundTimer > 8 and engine.postRoundTimer < 9 then
    pl1.x = 200
    pl1.y = 400
    pl1.xVel = 0
    pl1.yVel = 0

    pl2.x = 805
    pl2.y = 400
    pl2.xVel = 0
    pl2.yVel = 0

    engine.postRound[12] = engine.postRound[12] - dt
    if engine.postRound[12] < 0 then
      engine.postRound[12] = 0
    end

    engine.postRound[13] = engine.postRound[13] + dt
    if engine.postRound[13] > 1 then
      engine.postRound[13] = 1
    end
  
  
  elseif engine.postRoundTimer > 9 and engine.postRoundTimer < 11 then
    pl1.x = 200
    pl1.y = 400
    pl1.xVel = 10
    pl1.yVel = -5

    pl2.x = 805
    pl2.y = 400
    pl2.xVel = -10
    pl2.yVel = -5
    engine.postRound[15] = 1

    engine.postRound[14] = engine.postRound[14] + dt * 6
    if engine.postRound[14] >= 1 then
      while engine.postRound[14] ~= 0
      do
        engine.postRound[14] = math.random(1, 12)

        engine.postRound[17] = true
        for i = 1,#engine.roundBlanks,1
        do
          if engine.roundBlanks[i] == engine.postRound[14] then
            engine.postRound[17] = false
          end
        end

        if engine.postRound[14] ~= engine.randomRound and engine.postRound[17] == true then
          engine.randomRound = engine.postRound[14]
          engine.postRound[14] = 0
        end
      end
    end
  
  
  elseif engine.postRoundTimer > 12.5 and engine.postRoundTimer < 13.5 then
    engine.postRound[16] = engine.postRound[16] + dt
  
  elseif engine.postRoundTimer > 13.5 and engine.postRoundTimer < 14 then
    engine.greatReset()
  end
  
end


function engine.greatReset()
  engine.roundType = engine.randomRound
  table.insert(engine.roundBlanks, engine.roundType)
  engine.preRound = -5
  engine.slowmo = false
  engine.slowmoPass = 0
  engine.deathWait = 1
  engine.winner = 0

  engine.postRound = {0, 360, 0, 0, 0, 0, 0, 0, -500, 0, 0, 1, 0, 0, 0, 0}
  engine.postRoundTimer = 0
  engine.vicVel = 0
  engine.vicEyes = 1

  pl1:init(200, 325, 80, 1, pl1.points, pl1.colorType)
  pl2:init(805, 325, 80, 2, pl2.points, pl2.colorType)
  pl1:updateControls()
  pl2:updateControls()

  pickups = {}
  particles = {}

  
  if engine.roundType == 5 then
    table.insert(pickups, pickup:new(nil))
    pickups[1]:init(525, 345, {0, 0, 0}, false)
  elseif engine.roundType ~= 6 then
    table.insert(pickups, pickup:new(nil))
    pickups[1]:init(525, 345, {0.8, 0.5, 0.8}, false)
  end
  state = -1

end

return engine