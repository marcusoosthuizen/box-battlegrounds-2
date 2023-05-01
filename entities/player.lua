entity = {}

function entity:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function entity:init(x, y, size, plNum, points, colorType)
  -- Declaring Player Variables --
  self.x = x
  self.y = y
  self.xVel = 0
  self.yVel = 0
  self.size = size
  self.speed = 6900
  self.particleCount = 0
  self.plNum = plNum
  self.points = points
  self.colorType = colorType

  -- Assigning Controls Based on Player Number --
  if plNum == 1 then
    self.keys = {'w', 'a', 's', 'd'}
  else
    self.keys = {'up', 'left', 'down', 'right'}
  end
  self.color = color_settings[self.plNum][self.colorType]
end

function entity:updateControls()
  if engine.roundType == 7 then
    if self.plNum == 1 then
      self.keys = {'s', 'd', 'w', 'a'}
    else
      self.keys = {'down', 'right', 'up', 'left'}
    end
    self.color = color_settings[self.plNum][self.colorType]
  else
    if self.plNum == 1 then
      self.keys = {'w', 'a', 's', 'd'}
    else
      self.keys = {'up', 'left', 'down', 'right'}
    end
    self.color = color_settings[self.plNum][self.colorType]
  end
end

function entity:updateVel(dt)
  local xDirection = 0
  local yDirection = 0

  -- Checking for Input --
  if love.keyboard.isDown(self.keys[1]) and engine.slowmo ~= true then
    if engine.roundType ~= 1 or self.y >= 720 - self.size then
      yDirection = -1
    end
  end
  if love.keyboard.isDown(self.keys[2]) and engine.slowmo ~= true then
    xDirection = -1
  end
  if love.keyboard.isDown(self.keys[3]) and engine.slowmo ~= true and engine.roundType ~= 1 then
    yDirection = 1
  end
  if love.keyboard.isDown(self.keys[4]) and engine.slowmo ~= true then
    xDirection = 1
  end

  -- Adjusting Directional Inputs --
  if xDirection ~= 0 and yDirection ~= 0 then
    xDirection = xDirection * 0.71
    yDirection = yDirection * 0.71
  end

  -- Applying Direction to Velocity --
  self.xVel = self.xVel + xDirection * self.speed / self.size * dt

  if engine.roundType == 1 then
    self.yVel = self.yVel + yDirection * self.speed / self.size * dt * 35
  else
    self.yVel = self.yVel + yDirection * self.speed / self.size * dt
  end
end

function entity:applyVel(dt)
  -- Applying Velocity to Position --
  self.x = self.x + self.xVel
  self.y = self.y + self.yVel

  self.particleCount = self.particleCount + dt
  if self.particleCount > .05 then
    engine.spawnParticles(self.x, self.y, self.xVel * -1, self.yVel * -1, self.size, self.color, 1)
    self.particleCount = 0
  end

  -- Applying Friction to Velocity --
  if engine.roundType ~= 9 then
    self.xVel = self.xVel - self.xVel * dt * 4
    self.yVel = self.yVel - self.yVel * dt * 4
  end
end

return entity


    --self.color[1] = (self.color[1] + 1) / 2
    --self.color[2] = (self.color[2] + 1) / 2
    --self.color[3] = (self.color[3] + 1) / 2