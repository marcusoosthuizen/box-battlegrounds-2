entity = {}

function entity:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end
-- Control max size based on map --
function entity:init(type)
  self.hitboxes = {}
  if type == 1 then
    table.insert(self.hitboxes, {80, 80, 240, 80})
    table.insert(self.hitboxes, {80, 280, 240, 80})
    table.insert(self.hitboxes, {240, 160, 80, 120})
    table.insert(self.hitboxes, {400, 0, 400, 80})
    table.insert(self.hitboxes, {400, 160, 280, 160})
    table.insert(self.hitboxes, {640, 320, 40, 200})
    table.insert(self.hitboxes, {680, 480, 400, 40})
    table.insert(self.hitboxes, {880, 0, 200, 80})
    table.insert(self.hitboxes, {880, 160, 120, 240})
  end
end

return entity