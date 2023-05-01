entity = {}

function entity:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function entity:init(x, y, color, grow)
  self.x = x
  self.y = y
  self.yOriginal = y
  self.size = 30
  if grow then
    self.size = 0
  end
  self.color = color
  self.float = 0
  self.particleCount = 0
end

function entity:floatUpdate(dt)
  if self.size < 30 and state ~= -2 then
    self.size = self.size + dt * 50
    self.x = self.x - dt * 25
    self.yOriginal = self.yOriginal - dt * 25
  end
  self.float = self.float + 1 * dt * 4
  self.particleCount = self.particleCount + 1 * dt * 4
  if self.float >= math.pi * 2 then
    self.float = 0
  end
  if self.particleCount >= .3 then
    self.particleCount = 0
    engine.spawnParticles(self.x - 10, self.y - 10, 0, 0, self.size + 10, self.color, 1)
  end
  self.y = self.yOriginal + math.sin(self.float) * 8
end

return entity