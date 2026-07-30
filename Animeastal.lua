local coreGui = game:GetService((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
local player = game:GetService((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)).LocalPlayer
local workspace = game:GetService((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
local vim = game:GetService((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
local runService = game:GetService((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
local guiName = (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
local MAX_ROOM_RADIUS = 400
local MAX_DUNGEON_RADIUS = 2000
local states = {
CursedRush = false,
AutoCollect = false,
ExpFarm = false,
AutoClick = false,
StandPos = nil,
PointA = nil,
PointB = nil,
CurrentExpTarget = (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
}
if coreGui:FindFirstChild(guiName) then coreGui[guiName]:Destroy() end
task.spawn(function()
while true do
task.wait(300)
pcall(function()
vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
task.wait(0.1)
vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end)
end
end)
task.spawn(function()
while task.wait() do
if states.AutoClick then
pcall(function()
local char = player.Character
if char then
local tool = char:FindFirstChildOfClass((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if tool then
tool:Activate()
else
vim:SendMouseButtonEvent(400, 300, 0, true, game, 0)
task.wait(0.01)
vim:SendMouseButtonEvent(400, 300, 0, false, game, 0)
end
end
end)
end
end
end)
local function isAlive(obj)
local hum = obj:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
return hum and hum.Health > 0
end
local function getMyPosition()
local char = player.Character
if char and char:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) then
return char.HumanoidRootPart.Position
end
return nil
end
local function isInDungeon()
local myPos = getMyPosition()
if not myPos then return false end
local arenas = workspace:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local refPart = room:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), true)
if refPart and (refPart.Position - myPos).Magnitude <= MAX_DUNGEON_RADIUS then
return true
end
end
end
return false
end
local function getBoss()
local myPos = getMyPosition()
if not myPos then return nil end
local bestBoss = nil
local shortestDistance = MAX_ROOM_RADIUS
local arenas = workspace:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local map = room:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if map then
local boss = map:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if boss and isAlive(boss) then
local root = boss:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) or boss.PrimaryPart
if root then
local dist = (root.Position - myPos).Magnitude
if dist < shortestDistance then
shortestDistance = dist
bestBoss = boss
end
end
end
end
end
end
return bestBoss
end
local function getFinger()
local myPos = getMyPosition()
if not myPos then return nil end
local bestFinger = nil
local shortestDistance = MAX_ROOM_RADIUS
local arenas = workspace:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local finger = room:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if finger then
local fPart = finger:IsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and finger or finger:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if fPart then
local dist = (fPart.Position - myPos).Magnitude
if dist < shortestDistance then
shortestDistance = dist
bestFinger = finger
end
end
end
end
end
return bestFinger
end
local function getBestVisualMob()
local myPos = getMyPosition()
if not myPos then return nil end
local bestMob = nil
local shortestDistance = MAX_ROOM_RADIUS
local enemyFolder = workspace:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if enemyFolder then
for _, obj in ipairs(enemyFolder:GetChildren()) do
if obj:IsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) then
local root = obj:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) or obj.PrimaryPart
local hum = obj:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if root and hum and hum.Health > 0 then
local dist = (root.Position - myPos).Magnitude
if dist < shortestDistance then
shortestDistance = dist
bestMob = obj
end
end
end
end
end
return bestMob
end
local function getMobNearPoint(pointCFrame, radius)
if not pointCFrame then return nil end
for _, obj in pairs(workspace:GetChildren()) do
if obj:IsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and isAlive(obj) and obj.Name ~= player.Name then
local root = obj:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if root then
local dist = (root.Position - pointCFrame.Position).Magnitude
if dist <= radius then return obj end
end
end
end
return nil
end
local isHoldingE = false
local currentPrompt = nil
local currentTargetFinger = nil
local holdStartTime = 0
local function releaseE()
if isHoldingE then
if currentPrompt then currentPrompt:InputHoldEnd() end
vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
isHoldingE = false
currentPrompt = nil
currentTargetFinger = nil
end
end
if _G.FarmLoop then _G.FarmLoop:Disconnect() end
_G.FarmLoop = runService.Heartbeat:Connect(function()
pcall(function()
if not states.CursedRush and not states.AutoCollect then return end
local char = player.Character
if not char then return end
local rootPart = char:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if not rootPart then return end
if not isInDungeon() then
releaseE()
return
end
local boss = getBoss()
local finger = getFinger()
if states.AutoCollect and finger then
local fingerPart = finger:IsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and finger or finger:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if fingerPart then
if currentTargetFinger ~= finger then
releaseE()
currentTargetFinger = finger
end
local targetCFrame = fingerPart.CFrame * CFrame.new(0, 2, 0)
if (rootPart.Position - targetCFrame.Position).Magnitude > 5 then
releaseE()
rootPart.CFrame = targetCFrame
else
if not isHoldingE then
local prompt = finger:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), true)
if prompt then
currentPrompt = prompt
prompt:InputHoldBegin()
else
vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
end
isHoldingE = true
holdStartTime = tick()
else
if tick() - holdStartTime > 5 then releaseE() end
end
end
return
end
end
if states.CursedRush then
if boss then
releaseE()
local bossPart = boss:IsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and boss or boss:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if bossPart then rootPart.CFrame = bossPart.CFrame * CFrame.new(0, 0, 4) end
return
else
releaseE()
local activeMob = getBestVisualMob()
if activeMob then
local mobPart = activeMob:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) or activeMob.PrimaryPart
if mobPart then rootPart.CFrame = mobPart.CFrame * CFrame.new(0, 0, 3.5) end
else
if states.StandPos then
local distToStand = (rootPart.Position - states.StandPos.Position).Magnitude
if distToStand > 3 and distToStand < 1000 then
rootPart.CFrame = states.StandPos
end
end
end
return
end
end
end)
end)
task.spawn(function()
while task.wait(0.05) do
pcall(function()
if states.ExpFarm then
local char = player.Character
if not char then return end
local rootPart = char:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if not rootPart then return end
releaseE()
if states.PointA and states.PointB then
local targetPoint = (states.CurrentExpTarget == (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and states.PointA or states.PointB
local targetMob = getMobNearPoint(targetPoint, 100)
if targetMob then
local mobPart = targetMob:FindFirstChildWhichIsA((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
if mobPart then rootPart.CFrame = mobPart.CFrame * CFrame.new(0, 4, 4) end
else
states.CurrentExpTarget = (states.CurrentExpTarget == (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end) or (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
local newTarget = (states.CurrentExpTarget == (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) and states.PointA or states.PointB
rootPart.CFrame = newTarget
task.wait(0.5)
end
end
end
end)
end
end)
local screenGui = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
screenGui.Name = guiName
screenGui.Parent = coreGui
local frame = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), frame).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), frame)
stroke.Color = Color3.fromRGB(255, 200, 50)
stroke.Thickness = 2
local title = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame
local minimizeBtn = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -38, 0, 10)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
minimizeBtn.Text = (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.Parent = frame
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), minimizeBtn).CornerRadius = UDim.new(0, 6)
local miniBtn = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
miniBtn.Size = UDim2.new(0, 45, 0, 45)
miniBtn.Position = UDim2.new(0, 20, 0, 100)
miniBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
miniBtn.Text = (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
miniBtn.TextSize = 22
miniBtn.Visible = false
miniBtn.Active = true
miniBtn.Draggable = true
miniBtn.Parent = screenGui
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), miniBtn).CornerRadius = UDim.new(1, 0)
local mStroke = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), miniBtn)
mStroke.Color = Color3.fromRGB(255, 200, 50)
mStroke.Thickness = 2
minimizeBtn.MouseButton1Down:Connect(function() frame.Visible = false; miniBtn.Visible = true end)
miniBtn.MouseButton1Down:Connect(function() frame.Visible = true; miniBtn.Visible = false end)
local tabContainer = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), frame)
tabContainer.Size = UDim2.new(1, -20, 0, 35)
tabContainer.Position = UDim2.new(0, 10, 0, 45)
tabContainer.BackgroundTransparency = 1
local pageContainer = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), frame)
pageContainer.Size = UDim2.new(1, 0, 1, -90)
pageContainer.Position = UDim2.new(0, 0, 0, 85)
pageContainer.BackgroundTransparency = 1
local function createTab(name, index, totalTabs)
local btn = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), tabContainer)
btn.Size = UDim2.new(1/totalTabs, -4, 1, 0)
btn.Position = UDim2.new((index-1)/totalTabs, 2, 0, 0)
btn.BackgroundColor3 = index == 1 and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
btn.TextColor3 = index == 1 and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
btn.Text = name
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), btn).CornerRadius = UDim.new(0, 4)
local page = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), pageContainer)
page.Size = UDim2.new(1, 0, 1, 0)
page.BackgroundTransparency = 1
page.Visible = (index == 1)
return btn, page
end
local tabs = {}
local pages = {}
tabs[1], pages[1] = createTab((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 1, 3)
tabs[2], pages[2] = createTab((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 2, 3)
tabs[3], pages[3] = createTab((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 3, 3)
local function switchTab(index)
for i = 1, 3 do
tabs[i].BackgroundColor3 = (i == index) and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
tabs[i].TextColor3 = (i == index) and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
pages[i].Visible = (i == index)
end
end
tabs[1].MouseButton1Down:Connect(function() switchTab(1) end)
tabs[2].MouseButton1Down:Connect(function() switchTab(2) end)
tabs[3].MouseButton1Down:Connect(function() switchTab(3) end)
local function createBtn(parent, text, posY, color, callback)
local btn = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), parent)
btn.Size = UDim2.new(1, -30, 0, 34)
btn.Position = UDim2.new(0, 15, 0, posY)
btn.BackgroundColor3 = color
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = text
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), btn).CornerRadius = UDim.new(0, 6)
btn.MouseButton1Down:Connect(function()
callback()
btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
task.wait(0.1)
btn.BackgroundColor3 = color
end)
return btn
end
local function createToggle(parent, text, posY, stateKey, exclusiveKey)
local btn = Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), parent)
btn.Size = UDim2.new(1, -30, 0, 34)
btn.Position = UDim2.new(0, 15, 0, posY)
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
btn.TextColor3 = Color3.fromRGB(200, 200, 200)
btn.Text = text .. (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), btn).CornerRadius = UDim.new(0, 6)
btn.MouseButton1Down:Connect(function()
states[stateKey] = not states[stateKey]
if exclusiveKey and states[stateKey] then states[exclusiveKey] = false end
if states[stateKey] then
btn.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
btn.TextColor3 = Color3.fromRGB(20, 20, 20)
btn.Text = text .. (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
else
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
btn.TextColor3 = Color3.fromRGB(200, 200, 200)
btn.Text = text .. (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)
end
end)
end
createBtn(pages[1], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 10, Color3.fromRGB(60, 120, 200), function()
local c = player.Character if c and c:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) then states.StandPos = c.HumanoidRootPart.CFrame end
end)
createToggle(pages[1], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 50, (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
createToggle(pages[1], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 90, (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), nil)
createBtn(pages[2], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 10, Color3.fromRGB(150, 60, 200), function()
local c = player.Character if c and c:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) then states.PointA = c.HumanoidRootPart.CFrame print((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) end
end)
createBtn(pages[2], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 50, Color3.fromRGB(200, 60, 100), function()
local c = player.Character if c and c:FindFirstChild((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) then states.PointB = c.HumanoidRootPart.CFrame print((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end)) end
end)
createToggle(pages[2], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 90, (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
createToggle(pages[3], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 10, (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), nil)
createBtn(pages[3], (function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end), 50, Color3.fromRGB(200, 50, 50), function()
states.StandPos = nil
states.PointA = nil
states.PointB = nil
print((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
end)
print((function(s)local a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"local d=""local function f(c)for i=1,#a do if a:sub(i,i)==c then return i-1 end end return 0 end for i=1,#s,4 do local b1,b2,b3,b4=f(s:sub(i,i)),f(s:sub(i+1,i+1)),f(s:sub(i+2,i+2)),f(s:sub(i+3,i+3))local c1=(b1<<2)|(b2>>4)local c2=((b2&15)<<4)|(b3>>2)local c3=((b3&3)<<6)|b4 d=d..string.char(c1)if s:sub(i+2,i+2)~="="then d=d..string.char(c2)end if s:sub(i+3,i+3)~="="then d=d..string.char(c3)end end return d end))
