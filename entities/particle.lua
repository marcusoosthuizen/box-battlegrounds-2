entity = {}

function entity:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function entity:init(x, y, xVel, yVel, size, color)
  self.x = x
  self.y = y
  self.xVel = xVel
  self.yVel = yVel
  self.size = size
  self.color = color
end

function entity:update(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
  self.size = self.size - dt * 30
end

return entity