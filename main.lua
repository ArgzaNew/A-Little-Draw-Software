function love.load()
    love.window.setMode(640, 480)
    love.graphics.setBackgroundColor(1,1,1) 
    
    AllmouseMov={}
    ActualmouseMov = {}
    Paint = false

    RedLine=0/255
    BlueLine=0/255
    GreenLine=0/255
end

function love.draw()
    for i, v in ipairs(AllmouseMov) do
        for k = 2, #v do
            love.graphics.setColor(RedLine,BlueLine,GreenLine)
            love.graphics.line(v[k - 1].x, v[k - 1].y, v[k].x, v[k].y)
        end
    end
end

function love.mousemoved(x, y, dx, dy, istouch)
    if Paint then
        local point = {x = x, y = y}
        table.insert(ActualmouseMov, point)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        Paint = true
        ActualmouseMov = {}
        local point = {x = x, y = y}
        table.insert(ActualmouseMov, point)
        table.insert(AllmouseMov, ActualmouseMov)
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        Paint = false
    end
end

