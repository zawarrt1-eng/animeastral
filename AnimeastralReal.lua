local coreGui = game:GetService(string.char(67, 111, 114, 101, 71, 117, 105))
local player = game:GetService(string.char(80, 108, 97, 121, 101, 114, 115)).LocalPlayer
local workspace = game:GetService(string.char(87, 111, 114, 107, 115, 112, 97, 99, 101))
local vim = game:GetService(string.char(86, 105, 114, 116, 117, 97, 108, 73, 110, 112, 117, 116, 77, 97, 110, 97, 103, 101, 114))
local runService = game:GetService(string.char(82, 117, 110, 83, 101, 114, 118, 105, 99, 101))
local guiName = string.char(65, 110, 105, 109, 101, 65, 115, 116, 114, 97, 108, 72, 117, 98)
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
CurrentExpTarget = string.char(65)
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
local tool = char:FindFirstChildOfClass(string.char(84, 111, 111, 108))
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
local hum = obj:FindFirstChildWhichIsA(string.char(72, 117, 109, 97, 110, 111, 105, 100))
return hum and hum.Health > 0
end
local function getMyPosition()
local char = player.Character
if char and char:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) then
return char.HumanoidRootPart.Position
end
return nil
end
local function isInDungeon()
local myPos = getMyPosition()
if not myPos then return false end
local arenas = workspace:FindFirstChild(string.char(66, 111, 115, 115, 82, 117, 115, 104, 65, 114, 101, 110, 97, 115))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local refPart = room:FindFirstChildWhichIsA(string.char(66, 97, 115, 101, 80, 97, 114, 116), true)
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
local arenas = workspace:FindFirstChild(string.char(66, 111, 115, 115, 82, 117, 115, 104, 65, 114, 101, 110, 97, 115))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local map = room:FindFirstChild(string.char(77, 97, 112))
if map then
local boss = map:FindFirstChild(string.char(77, 111, 100, 101, 108))
if boss and isAlive(boss) then
local root = boss:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or boss.PrimaryPart
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
local arenas = workspace:FindFirstChild(string.char(66, 111, 115, 115, 82, 117, 115, 104, 65, 114, 101, 110, 97, 115))
if arenas then
for _, room in ipairs(arenas:GetChildren()) do
local finger = room:FindFirstChild(string.char(83, 117, 107, 117, 110, 97, 70, 105, 110, 103, 101, 114))
if finger then
local fPart = finger:IsA(string.char(66, 97, 115, 101, 80, 97, 114, 116)) and finger or finger:FindFirstChildWhichIsA(string.char(66, 97, 115, 101, 80, 97, 114, 116))
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
local enemyFolder = workspace:FindFirstChild(string.char(67, 108, 105, 101, 110, 116, 69, 110, 101, 109, 121, 86, 105, 115, 117, 97, 108, 115))
if enemyFolder then
for _, obj in ipairs(enemyFolder:GetChildren()) do
if obj:IsA(string.char(77, 111, 100, 101, 108)) then
local root = obj:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or obj.PrimaryPart
local hum = obj:FindFirstChildWhichIsA(string.char(72, 117, 109, 97, 110, 111, 105, 100))
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
if obj:IsA(string.char(77, 111, 100, 101, 108)) and isAlive(obj) and obj.Name ~= player.Name then
local root = obj:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
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
local rootPart = char:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
if not rootPart then return end
if not isInDungeon() then
releaseE()
return
end
local boss = getBoss()
local finger = getFinger()
if states.AutoCollect and finger then
local fingerPart = finger:IsA(string.char(66, 97, 115, 101, 80, 97, 114, 116)) and finger or finger:FindFirstChildWhichIsA(string.char(66, 97, 115, 101, 80, 97, 114, 116))
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
local prompt = finger:FindFirstChildWhichIsA(string.char(80, 114, 111, 120, 105, 109, 105, 116, 121, 80, 114, 111, 109, 112, 116), true)
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
local bossPart = boss:IsA(string.char(66, 97, 115, 101, 80, 97, 114, 116)) and boss or boss:FindFirstChildWhichIsA(string.char(66, 97, 115, 101, 80, 97, 114, 116))
if bossPart then rootPart.CFrame = bossPart.CFrame * CFrame.new(0, 0, 4) end
return
else
releaseE()
local activeMob = getBestVisualMob()
if activeMob then
local mobPart = activeMob:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) or activeMob.PrimaryPart
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
local rootPart = char:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116))
if not rootPart then return end
releaseE()
if states.PointA and states.PointB then
local targetPoint = (states.CurrentExpTarget == string.char(65)) and states.PointA or states.PointB
local targetMob = getMobNearPoint(targetPoint, 100)
if targetMob then
local mobPart = targetMob:FindFirstChildWhichIsA(string.char(66, 97, 115, 101, 80, 97, 114, 116))
if mobPart then rootPart.CFrame = mobPart.CFrame * CFrame.new(0, 4, 4) end
else
states.CurrentExpTarget = (states.CurrentExpTarget == string.char(65)) and string.char(66) or string.char(65)
local newTarget = (states.CurrentExpTarget == string.char(65)) and states.PointA or states.PointB
rootPart.CFrame = newTarget
task.wait(0.5)
end
end
end
end)
end
end)
local screenGui = Instance.new(string.char(83, 99, 114, 101, 101, 110, 71, 117, 105))
screenGui.Name = guiName
screenGui.Parent = coreGui
local frame = Instance.new(string.char(70, 114, 97, 109, 101))
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), frame).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), frame)
stroke.Color = Color3.fromRGB(255, 200, 50)
stroke.Thickness = 2
local title = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = string.char(55357, 56401, 32, 65, 83, 84, 82, 65, 76, 32, 72, 85, 66, 32, 40, 86, 51, 57, 32, 83, 77, 65, 82, 84, 32, 76, 79, 66, 66, 89, 41)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame
local minimizeBtn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -38, 0, 10)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
minimizeBtn.Text = string.char(45)
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.Parent = frame
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), minimizeBtn).CornerRadius = UDim.new(0, 6)
local miniBtn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
miniBtn.Size = UDim2.new(0, 45, 0, 45)
miniBtn.Position = UDim2.new(0, 20, 0, 100)
miniBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
miniBtn.Text = string.char(55357, 56401)
miniBtn.TextSize = 22
miniBtn.Visible = false
miniBtn.Active = true
miniBtn.Draggable = true
miniBtn.Parent = screenGui
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), miniBtn).CornerRadius = UDim.new(1, 0)
local mStroke = Instance.new(string.char(85, 73, 83, 116, 114, 111, 107, 101), miniBtn)
mStroke.Color = Color3.fromRGB(255, 200, 50)
mStroke.Thickness = 2
minimizeBtn.MouseButton1Down:Connect(function() frame.Visible = false; miniBtn.Visible = true end)
miniBtn.MouseButton1Down:Connect(function() frame.Visible = true; miniBtn.Visible = false end)
local tabContainer = Instance.new(string.char(70, 114, 97, 109, 101), frame)
tabContainer.Size = UDim2.new(1, -20, 0, 35)
tabContainer.Position = UDim2.new(0, 10, 0, 45)
tabContainer.BackgroundTransparency = 1
local pageContainer = Instance.new(string.char(70, 114, 97, 109, 101), frame)
pageContainer.Size = UDim2.new(1, 0, 1, -90)
pageContainer.Position = UDim2.new(0, 0, 0, 85)
pageContainer.BackgroundTransparency = 1
local function createTab(name, index, totalTabs)
local btn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), tabContainer)
btn.Size = UDim2.new(1/totalTabs, -4, 1, 0)
btn.Position = UDim2.new((index-1)/totalTabs, 2, 0, 0)
btn.BackgroundColor3 = index == 1 and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
btn.TextColor3 = index == 1 and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
btn.Text = name
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), btn).CornerRadius = UDim.new(0, 4)
local page = Instance.new(string.char(70, 114, 97, 109, 101), pageContainer)
page.Size = UDim2.new(1, 0, 1, 0)
page.BackgroundTransparency = 1
page.Visible = (index == 1)
return btn, page
end
local tabs = {}
local pages = {}
tabs[1], pages[1] = createTab(string.char(55357, 56801, 65039, 32, 67, 117, 114, 115, 101, 100), 1, 3)
tabs[2], pages[2] = createTab(string.char(55356, 57119, 32, 69, 88, 80), 2, 3)
tabs[3], pages[3] = createTab(string.char(9881, 65039, 32, 83, 101, 116, 116, 105, 110, 103, 115), 3, 3)
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
local btn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), parent)
btn.Size = UDim2.new(1, -30, 0, 34)
btn.Position = UDim2.new(0, 15, 0, posY)
btn.BackgroundColor3 = color
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Text = text
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), btn).CornerRadius = UDim.new(0, 6)
btn.MouseButton1Down:Connect(function()
callback()
btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
task.wait(0.1)
btn.BackgroundColor3 = color
end)
return btn
end
local function createToggle(parent, text, posY, stateKey, exclusiveKey)
local btn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110), parent)
btn.Size = UDim2.new(1, -30, 0, 34)
btn.Position = UDim2.new(0, 15, 0, posY)
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
btn.TextColor3 = Color3.fromRGB(200, 200, 200)
btn.Text = text .. string.char(32, 58, 32, 79, 70, 70)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 12
Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114), btn).CornerRadius = UDim.new(0, 6)
btn.MouseButton1Down:Connect(function()
states[stateKey] = not states[stateKey]
if exclusiveKey and states[stateKey] then states[exclusiveKey] = false end
if states[stateKey] then
btn.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
btn.TextColor3 = Color3.fromRGB(20, 20, 20)
btn.Text = text .. string.char(32, 58, 32, 79, 78)
else
btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
btn.TextColor3 = Color3.fromRGB(200, 200, 200)
btn.Text = text .. string.char(32, 58, 32, 79, 70, 70)
end
end)
end
createBtn(pages[1], string.char(55357, 56525, 32, 83, 101, 116, 32, 83, 116, 97, 110, 100, 32, 40, 3592, 3640, 3604, 3618, 3639, 3609, 3619, 3629, 41), 10, Color3.fromRGB(60, 120, 200), function()
local c = player.Character if c and c:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) then states.StandPos = c.HumanoidRootPart.CFrame end
end)
createToggle(pages[1], string.char(55357, 56960, 32, 67, 117, 114, 115, 101, 100, 32, 82, 117, 115, 104, 32, 40, 3605, 3637, 3617, 3629, 3609, 3651, 3609, 3649, 3617, 3614, 41), 50, string.char(67, 117, 114, 115, 101, 100, 82, 117, 115, 104), string.char(69, 120, 112, 70, 97, 114, 109))
createToggle(pages[1], string.char(55357, 56720, 65039, 32, 65, 117, 116, 111, 32, 67, 111, 108, 108, 101, 99, 116, 32, 40, 3648, 3585, 3655, 3610, 3609, 3636, 3657, 3623, 3585, 3656, 3629, 3609, 3605, 3637, 41), 90, string.char(65, 117, 116, 111, 67, 111, 108, 108, 101, 99, 116), nil)
createBtn(pages[2], string.char(55357, 56525, 32, 83, 101, 116, 32, 80, 111, 105, 110, 116, 32, 65, 32, 40, 3592, 3640, 3604, 3607, 3637, 3656, 32, 49, 41), 10, Color3.fromRGB(150, 60, 200), function()
local c = player.Character if c and c:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) then states.PointA = c.HumanoidRootPart.CFrame print(string.char(3605, 3633, 3657, 3591, 3592, 3640, 3604, 32, 65, 32, 3649, 3621, 3657, 3623, 33)) end
end)
createBtn(pages[2], string.char(55357, 56525, 32, 83, 101, 116, 32, 80, 111, 105, 110, 116, 32, 66, 32, 40, 3592, 3640, 3604, 3607, 3637, 3656, 32, 50, 41), 50, Color3.fromRGB(200, 60, 100), function()
local c = player.Character if c and c:FindFirstChild(string.char(72, 117, 109, 97, 110, 111, 105, 100, 82, 111, 111, 116, 80, 97, 114, 116)) then states.PointB = c.HumanoidRootPart.CFrame print(string.char(3605, 3633, 3657, 3591, 3592, 3640, 3604, 32, 66, 32, 3649, 3621, 3657, 3623, 33)) end
end)
createToggle(pages[2], string.char(55356, 57119, 32, 65, 117, 116, 111, 32, 69, 88, 80, 32, 70, 97, 114, 109, 32, 40, 3626, 3621, 3633, 3610, 3605, 3637, 41), 90, string.char(69, 120, 112, 70, 97, 114, 109), string.char(67, 117, 114, 115, 101, 100, 82, 117, 115, 104))
createToggle(pages[3], string.char(55357, 56753, 65039, 32, 65, 117, 116, 111, 32, 67, 108, 105, 99, 107, 32, 40, 3629, 3629, 3650, 3605, 3657, 3588, 3621, 3636, 3585, 41), 10, string.char(65, 117, 116, 111, 67, 108, 105, 99, 107), nil)
createBtn(pages[3], string.char(55357, 56785, 65039, 32, 67, 108, 101, 97, 114, 32, 65, 108, 108, 32, 80, 111, 115, 105, 116, 105, 111, 110, 115), 50, Color3.fromRGB(200, 50, 50), function()
states.StandPos = nil
states.PointA = nil
states.PointB = nil
print(string.char(10060, 32, 3621, 3657, 3634, 3591, 3588, 3656, 3634, 3585, 3634, 3619, 3605, 3633, 3657, 3591, 3588, 3656, 3634, 3607, 3633, 3657, 3591, 3627, 3617, 3604, 3649, 3621, 3657, 3623, 33))
end)
print(string.char(9989, 32, 65, 115, 116, 114, 97, 108, 32, 70, 97, 114, 109, 32, 86, 51, 57, 32, 40, 83, 109, 97, 114, 116, 32, 76, 111, 98, 98, 121, 32, 80, 97, 117, 115, 101, 41, 32, 76, 111, 97, 100, 101, 100, 33))
