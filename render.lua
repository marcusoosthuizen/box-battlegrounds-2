render = {}

function render.menuDraw()
  if state > -1 and state < 1 then
    local menuOffset = (state) * 1080

    if state < 0 then menuOffset = 0 end

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontTitle2)
    love.graphics.print("How to Play", 300 + menuOffset, 10)

    love.graphics.setFont(font2)
    love.graphics.print("Player 1 Controls", 100 + menuOffset, 125)
    love.graphics.print("Player 2 Controls", 690 + menuOffset, 125)
    love.graphics.print("WASD Keys", 155 + menuOffset, 300)
    love.graphics.print("Arrow Keys", 750 + menuOffset, 300)

    love.graphics.setColor(pl1.color)
    love.graphics.rectangle("fill", 200 + menuOffset, 200, pl1.size, pl1.size)
    love.graphics.setColor(pl2.color)
    love.graphics.rectangle("fill", 800 + menuOffset, 200, pl2.size, pl2.size)
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Collect Orbs to Grow", 70 + menuOffset, 500)
    love.graphics.setColor(0.8, 0.5, 0.8)
    love.graphics.polygon("fill", 218 + menuOffset + 30 / 2, 423, 218 + menuOffset + 30, 423 + 30 / 2, 218 + menuOffset + 30 / 2, 423 + 30, 218 + menuOffset, 423 + 30 / 2)
    love.graphics.setColor(0.5, 0.8, 0.5)
    love.graphics.polygon("fill", 236 + menuOffset + 30 / 2, 432, 236 + menuOffset + 30, 432 + 30 / 2, 236 + menuOffset + 30 / 2, 432 + 30, 236 + menuOffset, 432 + 30 / 2)
    love.graphics.setColor(0.8, 0.5, 0.5)
    love.graphics.polygon("fill", 222 + menuOffset + 30 / 2, 440, 222 + menuOffset + 30, 440 + 30 / 2, 222 + menuOffset + 30 / 2, 440 + 30, 222 + menuOffset, 440 + 30 / 2)



    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Shrink your opponent", 660 + menuOffset, 500)

    love.graphics.setColor(pl1.color)
    love.graphics.rectangle("fill", 840 + menuOffset, 426, 40, 40)
    love.graphics.setColor(pl2.color)
    love.graphics.rectangle("fill", 800 + menuOffset, 406, 40, 40)

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 840 + menuOffset + 40 / 2 - 40 / 12 + -7, 426 + 40 / 10 + -6 / 2, 40 / 15, 40 / 3)
    love.graphics.rectangle("fill", 840 + menuOffset + 40 / 2 + 40 / 12 + -7, 426 + 40 / 10 + -6 / 2, 40 / 15, 40 / 3) 
    
    love.graphics.rectangle("fill", 800 + menuOffset + 40 / 2 - 40 / 12 + 7, 406 + 40 / 10 + 7 / 2, 40 / 15, 40 / 3)
    love.graphics.rectangle("fill", 800 + menuOffset + 40 / 2 + 40 / 12 + 7, 406 + 40 / 10 + 7 / 2, 40 / 15, 40 / 3) 
    
    --love.graphics.setColor(engine.buttonBlue)
    --love.graphics.rectangle("fill", 380 + menuOffset, 600, 320, 80)
    --love.graphics.setColor(0, 0, 0)
    --love.graphics.setLineWidth(8)
    --love.graphics.rectangle("line", 380 + menuOffset, 600, 320, 80)
    --love.graphics.setFont(fontMenu)
    --love.graphics.print("Continue", 397 + menuOffset, 600)
    love.graphics.setColor(0.4, 0.4, 0.4)
    love.graphics.print("(Press Enter to Continue)", 330 + menuOffset, 650)


    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 200 + menuOffset + pl1.size / 2 - pl1.size / 12 + pl1.xVel, 200 + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)
    love.graphics.rectangle("fill", 200 + menuOffset + pl1.size / 2 + pl1.size / 12 + pl1.xVel, 200 + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)

    
    love.graphics.rectangle("fill", 800 + menuOffset + pl2.size / 2 - pl2.size / 12 + pl2.xVel, 200 + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3)
    love.graphics.rectangle("fill", 800 + menuOffset + pl2.size / 2 + pl2.size / 12 + pl2.xVel, 200 + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3) 


    if state < 0 then
      love.graphics.setColor(0, 0, 0, state * -1)
      love.graphics.rectangle("fill", 0, 0, 1080, 720)
    end
    
  end
  if state > 0 and state < 2 then
    local menuOffset = (state - 1) * 1080
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontTitle)
    love.graphics.print("        Box\nBattlegrounds 2", 10 + menuOffset, 10)


    love.graphics.setColor(pl1.color)
    love.graphics.rectangle("fill", pl1.x + engine.shakeX + menuOffset, pl1.y + engine.shakeY, pl1.size, pl1.size)
    love.graphics.setColor(pl2.color)
    love.graphics.rectangle("fill", pl2.x + engine.shakeX + menuOffset, pl2.y + engine.shakeY, pl2.size, pl2.size)


    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", pl1.x + engine.shakeX + menuOffset + pl1.size / 2 - pl1.size / 12 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)
    love.graphics.rectangle("fill", pl1.x + engine.shakeX + menuOffset + pl1.size / 2 + pl1.size / 12 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)

    
    love.graphics.rectangle("fill", pl2.x + engine.shakeX + menuOffset + pl2.size / 2 - pl2.size / 12 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3)
    love.graphics.rectangle("fill", pl2.x + engine.shakeX + menuOffset + pl2.size / 2 + pl2.size / 12 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3)  

    love.graphics.setColor(engine.buttonRed)
    love.graphics.rectangle("fill", 380 + menuOffset, 400, 320, 80)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(8)
    love.graphics.rectangle("line", 380 + menuOffset, 400, 320, 80)
    love.graphics.setFont(fontMenu)
    love.graphics.print("Play", 465 + menuOffset, 400)

    love.graphics.setColor(engine.buttonBlue)
    love.graphics.rectangle("fill", 380 + menuOffset, 550, 320, 80)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(8)
    love.graphics.rectangle("line", 380 + menuOffset, 550, 320, 80)
    love.graphics.setFont(fontMenu)
    love.graphics.print("Options", 415 + menuOffset, 550)

    love.graphics.setFont(font2)
    love.graphics.print("Made by MarcusMO :)", 373 + menuOffset, 690)
  end
  if state > 1 and state < 3 then
    local menuOffset = (state - 2) * 1080
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontTitle2)
    love.graphics.print("Options", 375 + menuOffset, 10)

    love.graphics.setFont(fontMenu)
    love.graphics.print("Player 1 Color", 270 - fontMenu:getWidth("Player 1 Color") / 2 + menuOffset, 120)
    love.graphics.print("Player 2 Color", 270 - fontMenu:getWidth("Player 2 Color") / 2 + menuOffset, 240)
    love.graphics.print("Dev Stats", 270 - fontMenu:getWidth("Dev Stats") / 2 + menuOffset, 360)
    --love.graphics.print("Rounds to Win", 10 + menuOffset, 360)
    --love.graphics.print("Master Volume", 10 + menuOffset, 400)
    --love.graphics.print("Enabled Rounds", 710 + menuOffset, 120)

    love.graphics.print("< " .. engine.menuTypes[1][pl1.colorType] .. " >", 810 - fontMenu:getWidth("< " .. engine.menuTypes[1][pl1.colorType] .. " >") / 2 + menuOffset, 120)
    love.graphics.print("< " .. engine.menuTypes[2][pl2.colorType] .. " >", 810 - fontMenu:getWidth("< " .. engine.menuTypes[2][pl2.colorType] .. " >") / 2 + menuOffset, 240)
    love.graphics.print("< " .. engine.menuTypes[3][engine.showfps + 1] .. " >", 810 - fontMenu:getWidth("< " .. engine.menuTypes[3][engine.showfps + 1] .. " >") / 2 + menuOffset, 360)

    love.graphics.setColor(pl1.color[1] * 0.8, pl1.color[2] * 0.8, pl1.color[3] * 0.8)
    love.graphics.print(engine.menuTypes[1][pl1.colorType], 810 - fontMenu:getWidth(engine.menuTypes[1][pl1.colorType]) / 2 + menuOffset, 120)
    love.graphics.setColor(pl2.color[1] * 0.8, pl2.color[2] * 0.8, pl2.color[3] * 0.8)
    love.graphics.print(engine.menuTypes[2][pl2.colorType], 810 - fontMenu:getWidth(engine.menuTypes[2][pl2.colorType]) / 2 + menuOffset, 240)

    love.graphics.setColor(engine.buttonRed)
    love.graphics.rectangle("fill", 380 + menuOffset, 600, 320, 80)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(8)
    love.graphics.rectangle("line", 380 + menuOffset, 600, 320, 80)
    love.graphics.setFont(fontMenu)
    love.graphics.print("Back", 465 + menuOffset, 600)

    love.graphics.setFont(font)
    love.graphics.print("v1.0", 1035 + menuOffset, 700)
  end
end

function render.roundDraw()
    love.graphics.setFont(font)
  if engine.roundType == 9 then
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, 0, 1080, 720)
  end

  for i = 1,#particles,1
  do
    love.graphics.setColor(particles[i].color)
    if engine.roundType ~= 8 then
      love.graphics.rectangle("fill", particles[i].x, particles[i].y, particles[i].size, particles[i].size)
    else
      love.graphics.print("OwO", particles[i].x - 4, particles[i].y)
    end
  end

  love.graphics.setColor(0, 0, 0)
  for i = 1, #mp.hitboxes, 1
  do
    
    love.graphics.rectangle("fill", mp.hitboxes[i][1] + engine.shakeX, mp.hitboxes[i][2] + engine.shakeY, mp.hitboxes[i][3], mp.hitboxes[i][4])
  end

  for i = 1,#pickups,1
  do
    love.graphics.setColor(pickups[i].color)
    if engine.roundType ~= 8 then
      love.graphics.polygon("fill", pickups[i].x + engine.shakeX + pickups[i].size / 2, pickups[i].y + engine.shakeX, pickups[i].x + engine.shakeX + pickups[i].size, pickups[i].y + engine.shakeX + pickups[i].size / 2, pickups[i].x + engine.shakeX + pickups[i].size / 2, pickups[i].y + engine.shakeX + pickups[i].size, pickups[i].x + engine.shakeX, pickups[i].y + engine.shakeX + pickups[i].size / 2)
    else
      love.graphics.print("OwO", pickups[i].x - 4, pickups[i].y)
    end
  end

  love.graphics.setColor(pl1.color)
  love.graphics.rectangle("fill", pl1.x + engine.shakeX, pl1.y + engine.shakeY, pl1.size, pl1.size)
  love.graphics.setColor(pl2.color)
  love.graphics.rectangle("fill", pl2.x + engine.shakeX, pl2.y + engine.shakeY, pl2.size, pl2.size)

  love.graphics.setColor(0, 0, 0)

  if engine.roundType == 2 then
    love.graphics.rectangle("fill", 0, 0, 1080, 720)
    love.graphics.setColor({1, 1, 1})
  end

  if engine.roundType ~= 8 then
    love.graphics.rectangle("fill", pl1.x + engine.shakeX + pl1.size / 2 - pl1.size / 12 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)
    love.graphics.rectangle("fill", pl1.x + engine.shakeX + pl1.size / 2 + pl1.size / 12 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2, pl1.size / 15, pl1.size / 3)

    
    love.graphics.rectangle("fill", pl2.x + engine.shakeX + pl2.size / 2 - pl2.size / 12 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3)
    love.graphics.rectangle("fill", pl2.x + engine.shakeX + pl2.size / 2 + pl2.size / 12 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2, pl2.size / 15, pl2.size / 3)
  else
    love.graphics.print("O", pl1.x + engine.shakeX + pl1.size / 2 - pl1.size / 6 - 6 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2)
    love.graphics.print("O", pl1.x + engine.shakeX + pl1.size / 2 + pl1.size / 6 - 6 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2)
    love.graphics.print("W", pl1.x + engine.shakeX + pl1.size / 2 - 6 + pl1.xVel, pl1.y + engine.shakeY + pl1.size / 10 + pl1.yVel / 2 + 6)

    love.graphics.print("O", pl2.x + engine.shakeX + pl2.size / 2 - pl2.size / 6 - 6 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2)
    love.graphics.print("O", pl2.x + engine.shakeX + pl2.size / 2 + pl2.size / 6 - 6 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2)
    love.graphics.print("W", pl2.x + engine.shakeX + pl2.size / 2 - 6 + pl2.xVel, pl2.y + engine.shakeY + pl2.size / 10 + pl2.yVel / 2 + 6)
  end

  if engine.roundType == 12 then
    love.graphics.setColor({1, 1, 1, engine.flashColor})
    love.graphics.rectangle("fill", 0, 0, 1080, 720)
  end

  if engine.showfps == 1 then
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS( )) .. "\nEntity Count: " .. 2 + #particles + #pickups .. "\nPlayer 1 Pos: (" .. math.floor(pl1.x) .. " " .. math.floor(pl1.y) .. ")\nPlayer 1 Size: " .. math.floor(pl1.size) .. "\nPlayer 2 Pos: (" .. math.floor(pl2.x) .. " " .. math.floor(pl2.y) .. ")\nPlayer 2 Size: " .. math.floor(pl2.size), 6, 590)
  end
  

end

local function coolNumberFunction(floor, number, mode)
  if floor ~= 5 then
    number = (number * -1 - floor) * 3
  else
    number = (number * -1 - floor) * 1.5
  end
  
  if mode == 0 then
    if number > 1 then
      return 1
    end
    if number < 0 then
      return 0
    end
    return number
  end

  if number > 1 then
    return 0
  end
  if number < -1 then
    return 0
  end

  if number < 0 then
    number = number * -1
  end
  return 1 - number
end

function render.preRoundDraw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 1080, 120 * coolNumberFunction(0.375, engine.preRound * 2, 0))
  love.graphics.rectangle("fill", 0, 720 - 120 * coolNumberFunction(0.375, engine.preRound * 2, 0), 1080, 120)

  love.graphics.setColor(1, 0, 0)
  love.graphics.setFont(fontRound)
  love.graphics.push()
  love.graphics.scale(coolNumberFunction(2.25, engine.preRound, 1), coolNumberFunction(2.25, engine.preRound, 1)) 
  love.graphics.print(3, 540 / coolNumberFunction(2.25, engine.preRound, 1) - fontRound:getWidth(3) / 2, 360 / coolNumberFunction(2.25, engine.preRound, 1) - fontRound:getHeight(3) / 2)
  love.graphics.pop()

  love.graphics.setColor(1, 0.5, 0)
  love.graphics.setFont(fontRound)
  love.graphics.push()
  love.graphics.scale(coolNumberFunction(1.5, engine.preRound, 1), coolNumberFunction(1.5, engine.preRound, 1)) 
  love.graphics.print(2, 540 / coolNumberFunction(1.5, engine.preRound, 1) - fontRound:getWidth(2) / 2, 360 / coolNumberFunction(1.5, engine.preRound, 1) - fontRound:getHeight(2) / 2)
  love.graphics.pop()

  love.graphics.setColor(1, 1, 0)
  love.graphics.setFont(fontRound)
  love.graphics.push()
  love.graphics.scale(coolNumberFunction(0.75, engine.preRound, 1), coolNumberFunction(0.75, engine.preRound, 1)) 
  love.graphics.print(1, 540 / coolNumberFunction(0.75, engine.preRound, 1) - fontRound:getWidth(1) / 2, 360 / coolNumberFunction(0.75, engine.preRound, 1) - fontRound:getHeight(1) / 2)
  love.graphics.pop()

  love.graphics.setColor(0, 0, 1)
  love.graphics.setFont(fontRound)
  love.graphics.push()
  love.graphics.scale(coolNumberFunction(0, engine.preRound, 1), coolNumberFunction(0, engine.preRound, 1)) 
  love.graphics.print("GO!", 540 / coolNumberFunction(0, engine.preRound, 1) - fontRound:getWidth("GO!") / 2, 360 / coolNumberFunction(0, engine.preRound, 1) - fontRound:getHeight("GO!") / 2)
  love.graphics.pop()


  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 1080, 360 * coolNumberFunction(4, engine.preRound, 0))
  love.graphics.rectangle("fill", 0, 720 - 360 * coolNumberFunction(4, engine.preRound, 0), 1080, 360)
end

function render.postRoundDraw()
  if engine.winner == 1 then
    love.graphics.setColor(pl2.color[1] * 0.8, pl2.color[2] * 0.8, pl2.color[3] * 0.8)
  else
    love.graphics.setColor(pl1.color[1] * 0.8, pl1.color[2] * 0.8, pl1.color[3] * 0.8)
  end
  love.graphics.setFont(fontTitle)
  love.graphics.push()
  love.graphics.scale(engine.postRound[1], engine.postRound[1]) 
  love.graphics.print("Knockout", 540 / engine.postRound[1] - fontTitle:getWidth("Knockout") / 2, engine.postRound[2] / engine.postRound[1] - fontTitle:getHeight("Knockout") / 2)
  love.graphics.pop()

  love.graphics.push()
  love.graphics.scale(engine.postRound[12], engine.postRound[12])
  love.graphics.setColor(pl1.color[1] * 0.8, pl1.color[2] * 0.8, pl1.color[3] * 0.8)
  love.graphics.print(engine.postRound[10], 240 / engine.postRound[12] - fontTitle:getWidth(engine.postRound[10]) / 2, engine.postRound[9] / engine.postRound[12] - fontTitle:getHeight(engine.postRound[10]) / 2)
  love.graphics.setColor(pl2.color[1] * 0.8, pl2.color[2] * 0.8, pl2.color[3] * 0.8)
  love.graphics.print(engine.postRound[11], 845 / engine.postRound[12] - fontTitle:getWidth(engine.postRound[11]) / 2, engine.postRound[9] / engine.postRound[12] - fontTitle:getHeight(engine.postRound[11]) / 2)
  love.graphics.setColor(0, 0, 0)
  if engine.roundType == 2 or engine.roundType == 9 then
    love.graphics.setColor(1, 1, 1)
  end
  love.graphics.print("-", 540 / engine.postRound[12] - fontTitle:getWidth("-") / 2, engine.postRound[9] / engine.postRound[12] - fontTitle:getHeight("-") / 2)
  love.graphics.pop()


  if pl1.points ~= 3 and pl2.points ~= 3 then
    love.graphics.push()
    love.graphics.setColor(0, 0, 0)
    if engine.roundType == 2 or engine.roundType == 9 then
      love.graphics.setColor(1, 1, 1)
    end
    love.graphics.setLineWidth(8)
    love.graphics.scale(1 - engine.postRound[12], 1 - engine.postRound[12])
    love.graphics.print("Next Round", 540 / (1 - engine.postRound[12]) - fontTitle:getWidth("Next Round") / 2, engine.postRound[9] / (1 - engine.postRound[12]) - fontTitle:getHeight("Next Round") / 2 - 150)
    love.graphics.rectangle("line", 540 / (1 - engine.postRound[12]) - 60, 220 / (1 - engine.postRound[12]) - 60, 120, 120)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(engine.roundImgs[engine.randomRound], 540 / (1 - engine.postRound[12]) - 60, 220 / (1 - engine.postRound[12]) - 60, 0, 0.3797, 0.3797)

    love.graphics.setFont(fontMenu)
    love.graphics.setColor(0, 0, 0, engine.postRound[15])
    if engine.roundType == 2 or engine.roundType == 9 then
      love.graphics.setColor(1, 1, 1, engine.postRound[15])
    end
    love.graphics.print(engine.roundTypes[engine.randomRound], 540 / (1 - engine.postRound[12]) - fontMenu:getWidth(engine.roundTypes[engine.randomRound]) / 2, engine.postRound[9] / (1 - engine.postRound[12]) - fontMenu:getHeight(engine.roundTypes[engine.randomRound]) / 2 + 90)
    love.graphics.pop()
  else
    love.graphics.push()
    love.graphics.scale(1 - engine.postRound[12], 1 - engine.postRound[12])

    if pl1.points == 3 then
      love.graphics.setColor(pl1.color[1] * 0.8, pl1.color[2] * 0.8, pl1.color[3] * 0.8)
      love.graphics.print("Player 1 Wins!", 540 / (1 - engine.postRound[12]) - fontTitle:getWidth("Player 1 Wins!") / 2, (engine.postRound[9] - 150) / (1 - engine.postRound[12]) - fontTitle:getHeight("Player 1 Wins!") / 2)
    else
      love.graphics.setColor(pl2.color[1] * 0.8, pl2.color[2] * 0.8, pl2.color[3] * 0.8)
      love.graphics.print("Player 2 Wins!", 540 / (1 - engine.postRound[12]) - fontTitle:getWidth("Player 2 Wins!") / 2, (engine.postRound[9] - 150) / (1 - engine.postRound[12]) - fontTitle:getHeight("Player 2 Wins!") / 2)
    end
    love.graphics.pop()

    if engine.postRoundTimer > 10 then
      love.graphics.setColor(0.4, 0.4, 0.4)
      love.graphics.setFont(font2)
      love.graphics.print("(Press Enter to Return)", 330, 650)
    end
  end

  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, 0, 1080, 360 * engine.postRound[16])
  love.graphics.rectangle("fill", 0, 720 - 360 * engine.postRound[16], 1080, 360)

end

return render