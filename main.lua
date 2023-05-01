
color_settings = {{{1, 0, 0}, {1, 0.6, 0}, {1, 1, 0}}, {{0, 0, 1}, {0, 1, 0}, {1, 0, 1}}}

function love.load()
  love.window.setMode( 1080, 720 )
  love.window.setTitle("Box Battlegrounds 2")
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(255,255,255)
  font = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 16)
  font2 = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 25)
  love.graphics.setFont(font)
  fontTitle = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 100)
  fontTitle2 = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 65)
  fontMenu = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 50)
  fontMenu2 = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 35)
  fontRound = love.graphics.newFont('/assets/Silkscreen-Regular.ttf', 150)


  engine = require 'engine'
  render = require 'render'
  player = require 'entities/player'
  particle = require 'entities/particle'
  pickup = require 'entities/pickup'
  map = require 'entities/map'
  
  pl1 = player:new(nil)
  pl2 = player:new(nil)
  pl1:init(200, 325, 80, 1, 0, 1)
  pl2:init(805, 325, 80, 2, 0, 1)
  pl1:updateControls()
  pl2:updateControls()

  mp = map:new(nil)
  mp:init(engine.mapType)

  particles = {}
  pickups = {}

  state = 1
  
  --table.insert(pickups, pickup:new(nil))
  --if engine.roundType == 5 then
  --  pickups[1]:init(525, 345, {0, 0, 0}, false)
  --else
  --  pickups[1]:init(525, 345, {0.8, 0.5, 0.8}, false)
  --end

  
end

function love.update(dt)
  --print(state)
  engine.calcfps(dt)
  if state == -1 then
    if engine.preRound > 0 then
      
      if engine.slowmoCheck() then
        engine.roundLogic(dt)
      end

    else
      engine.preRoundLogic(dt)
    end
  else
    if state <= -2 then
      engine.postRoundLogic(dt)
    else
      engine.menuLogic(dt)
    end
  end

  engine.updateParticles(dt)
  engine.updatePickups(dt)
  engine.shakeScreen(dt)

end

function love.draw()

  if state <= -1 then
    render.roundDraw()
    if engine.preRound < 1 then
      render.preRoundDraw()
    end
    if state <= -2 then
      render.postRoundDraw()
    end
  else
    render.menuDraw()
  end
end