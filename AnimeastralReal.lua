-- ==========================================
-- 👑 AUTO FARM: ANIME ASTRAL (V39 - Lobby Smart Pause)
-- ==========================================
local coreGui = game:GetService("CoreGui")
local player = game:GetService("Players").LocalPlayer
local workspace = game:GetService("Workspace")
local vim = game:GetService("VirtualInputManager") 
local runService = game:GetService("RunService")

local guiName = "AnimeAstralHub"

-- 🛑 ระยะปลอดภัย
local MAX_ROOM_RADIUS = 400 -- ระยะหามอนสเตอร์
local MAX_DUNGEON_RADIUS = 2000 -- ระยะเช็คว่าเราอยู่ในดันเจี้ยนหรืออยู่เมือง

local states = {
    CursedRush = false,
    AutoCollect = false,
    ExpFarm = false,
    AutoClick = false,
    StandPos = nil,
    PointA = nil,
    PointB = nil,
    CurrentExpTarget = "A"
}

if coreGui:FindFirstChild(guiName) then coreGui[guiName]:Destroy() end

-- 🛡️ Anti-AFK
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

-- 🖱️ Auto Click
task.spawn(function()
    while task.wait() do 
        if states.AutoClick then
            pcall(function()
                local char = player.Character
                if char then
                    local tool = char:FindFirstChildOfClass("Tool")
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
    local hum = obj:FindFirstChildWhichIsA("Humanoid")
    return hum and hum.Health > 0
end

local function getMyPosition()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        return char.HumanoidRootPart.Position
    end
    return nil
end

-- 🗺️ ระบบเช็คว่าเราอยู่ในดันเจี้ยนหรือไม่ (ถ้าอยู่เมืองจะ return false)
local function isInDungeon()
    local myPos = getMyPosition()
    if not myPos then return false end
    
    local arenas = workspace:FindFirstChild("BossRushArenas")
    if arenas then
        for _, room in ipairs(arenas:GetChildren()) do
            local refPart = room:FindFirstChildWhichIsA("BasePart", true)
            -- ถ้าตัวเราอยู่ใกล้โครงสร้างของดันเจี้ยน แปลว่าไม่ได้อยู่เมือง
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
    local arenas = workspace:FindFirstChild("BossRushArenas")
    if arenas then
        for _, room in ipairs(arenas:GetChildren()) do
            local map = room:FindFirstChild("Map")
            if map then
                local boss = map:FindFirstChild("Model")
                if boss and isAlive(boss) then
                    local root = boss:FindFirstChild("HumanoidRootPart") or boss.PrimaryPart
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
    local arenas = workspace:FindFirstChild("BossRushArenas")
    if arenas then
        for _, room in ipairs(arenas:GetChildren()) do
            local finger = room:FindFirstChild("SukunaFinger")
            if finger then
                local fPart = finger:IsA("BasePart") and finger or finger:FindFirstChildWhichIsA("BasePart")
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
    local enemyFolder = workspace:FindFirstChild("ClientEnemyVisuals")
    if enemyFolder then
        for _, obj in ipairs(enemyFolder:GetChildren()) do
            if obj:IsA("Model") then
                local root = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart
                local hum = obj:FindFirstChildWhichIsA("Humanoid")
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

-- 🌟 หามอนสำหรับ EXP Farm
local function getMobNearPoint(pointCFrame, radius)
    if not pointCFrame then return nil end
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and isAlive(obj) and obj.Name ~= player.Name then
            local root = obj:FindFirstChild("HumanoidRootPart")
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

-- ⚡ ระบบฟาร์มหลัก: Cursed Rush & Auto Collect
if _G.FarmLoop then _G.FarmLoop:Disconnect() end

_G.FarmLoop = runService.Heartbeat:Connect(function()
    pcall(function()
        if not states.CursedRush and not states.AutoCollect then return end

        local char = player.Character
        if not char then return end
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        -- 🛑 ถ้าอยู่เมือง (Lobby) ให้ข้ามการวาปไปเลย เพื่อให้ Auto Rejoin ดึงเข้าดันได้
        if not isInDungeon() then
            releaseE()
            return 
        end

        local boss = getBoss()
        local finger = getFinger()

        -- เก็บนิ้ว (เฉพาะตอนอยู่ในดัน)
        if states.AutoCollect and finger then
            local fingerPart = finger:IsA("BasePart") and finger or finger:FindFirstChildWhichIsA("BasePart")
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
                        local prompt = finger:FindFirstChildWhichIsA("ProximityPrompt", true)
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

        -- โหมด Cursed Rush (ทำงานเฉพาะตอนอยู่ในดัน)
        if states.CursedRush then
            if boss then
                releaseE()
                local bossPart = boss:IsA("BasePart") and boss or boss:FindFirstChildWhichIsA("BasePart")
                if bossPart then rootPart.CFrame = bossPart.CFrame * CFrame.new(0, 0, 4) end
                return 
            else
                releaseE()
                local activeMob = getBestVisualMob()
                if activeMob then
                    local mobPart = activeMob:FindFirstChild("HumanoidRootPart") or activeMob.PrimaryPart
                    if mobPart then rootPart.CFrame = mobPart.CFrame * CFrame.new(0, 0, 3.5) end
                else
                    -- เช็คระยะ StandPos ถ้าไกลเกินไปแสดงว่าแมพบังคับย้าย ไม่ต้องดึงกลับ (ป้องกันบัค)
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

-- 🌟 ระบบฟาร์มรอง: EXP Farm
task.spawn(function()
    while task.wait(0.05) do
        pcall(function()
            if states.ExpFarm then
                local char = player.Character
                if not char then return end
                local rootPart = char:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end

                releaseE()
                if states.PointA and states.PointB then
                    local targetPoint = (states.CurrentExpTarget == "A") and states.PointA or states.PointB
                    local targetMob = getMobNearPoint(targetPoint, 100)

                    if targetMob then
                        local mobPart = targetMob:FindFirstChildWhichIsA("BasePart")
                        if mobPart then rootPart.CFrame = mobPart.CFrame * CFrame.new(0, 4, 4) end
                    else
                        states.CurrentExpTarget = (states.CurrentExpTarget == "A") and "B" or "A"
                        local newTarget = (states.CurrentExpTarget == "A") and states.PointA or states.PointB
                        rootPart.CFrame = newTarget
                        task.wait(0.5) 
                    end
                end
            end
        end)
    end
end)

-- ==========================================
-- 🎨 สร้างหน้าต่าง UI (ส่วนเดิม)
-- ==========================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = guiName
screenGui.Parent = coreGui 

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true 
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 200, 50)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 15, 0, 5)
title.BackgroundTransparency = 1
title.Text = "👑 ASTRAL HUB (V39 SMART LOBBY)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 13
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 28, 0, 28)
minimizeBtn.Position = UDim2.new(1, -38, 0, 10)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.Parent = frame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 45, 0, 45)
miniBtn.Position = UDim2.new(0, 20, 0, 100)
miniBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
miniBtn.Text = "👑"
miniBtn.TextSize = 22
miniBtn.Visible = false
miniBtn.Active = true
miniBtn.Draggable = true
miniBtn.Parent = screenGui
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(1, 0)
local mStroke = Instance.new("UIStroke", miniBtn)
mStroke.Color = Color3.fromRGB(255, 200, 50)
mStroke.Thickness = 2

minimizeBtn.MouseButton1Down:Connect(function() frame.Visible = false; miniBtn.Visible = true end)
miniBtn.MouseButton1Down:Connect(function() frame.Visible = true; miniBtn.Visible = false end)

local tabContainer = Instance.new("Frame", frame)
tabContainer.Size = UDim2.new(1, -20, 0, 35)
tabContainer.Position = UDim2.new(0, 10, 0, 45)
tabContainer.BackgroundTransparency = 1

local pageContainer = Instance.new("Frame", frame)
pageContainer.Size = UDim2.new(1, 0, 1, -90)
pageContainer.Position = UDim2.new(0, 0, 0, 85)
pageContainer.BackgroundTransparency = 1

local function createTab(name, index, totalTabs)
    local btn = Instance.new("TextButton", tabContainer)
    btn.Size = UDim2.new(1/totalTabs, -4, 1, 0)
    btn.Position = UDim2.new((index-1)/totalTabs, 2, 0, 0)
    btn.BackgroundColor3 = index == 1 and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
    btn.TextColor3 = index == 1 and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    local page = Instance.new("Frame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (index == 1)

    return btn, page
end

local tabs = {}
local pages = {}

tabs[1], pages[1] = createTab("🗡️ Cursed", 1, 3)
tabs[2], pages[2] = createTab("🌟 EXP", 2, 3)
tabs[3], pages[3] = createTab("⚙️ Settings", 3, 3)

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
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -30, 0, 34)
    btn.Position = UDim2.new(0, 15, 0, posY)
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Down:Connect(function()
        callback()
        btn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        task.wait(0.1)
        btn.BackgroundColor3 = color
    end)
    return btn
end

local function createToggle(parent, text, posY, stateKey, exclusiveKey)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -30, 0, 34)
    btn.Position = UDim2.new(0, 15, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Text = text .. " : OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Down:Connect(function()
        states[stateKey] = not states[stateKey]
        if exclusiveKey and states[stateKey] then states[exclusiveKey] = false end

        if states[stateKey] then
            btn.BackgroundColor3 = Color3.fromRGB(255, 180, 50) 
            btn.TextColor3 = Color3.fromRGB(20, 20, 20)
            btn.Text = text .. " : ON"
        else
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50) 
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.Text = text .. " : OFF"
        end
    end)
end

-- Tab 1: Cursed
createBtn(pages[1], "📍 Set Stand (จุดยืนรอ)", 10, Color3.fromRGB(60, 120, 200), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.StandPos = c.HumanoidRootPart.CFrame end
end)
createToggle(pages[1], "🚀 Cursed Rush (ตีมอนในแมพ)", 50, "CursedRush", "ExpFarm")
createToggle(pages[1], "🖐️ Auto Collect (เก็บนิ้วก่อนตี)", 90, "AutoCollect", nil)

-- Tab 2: EXP
createBtn(pages[2], "📍 Set Point A (จุดที่ 1)", 10, Color3.fromRGB(150, 60, 200), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.PointA = c.HumanoidRootPart.CFrame print("ตั้งจุด A แล้ว!") end
end)
createBtn(pages[2], "📍 Set Point B (จุดที่ 2)", 50, Color3.fromRGB(200, 60, 100), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.PointB = c.HumanoidRootPart.CFrame print("ตั้งจุด B แล้ว!") end
end)
createToggle(pages[2], "🌟 Auto EXP Farm (สลับตี)", 90, "ExpFarm", "CursedRush")

-- Tab 3: Settings
createToggle(pages[3], "🖱️ Auto Click (ออโต้คลิก)", 10, "AutoClick", nil)
createBtn(pages[3], "🗑️ Clear All Positions", 50, Color3.fromRGB(200, 50, 50), function()
    states.StandPos = nil
    states.PointA = nil
    states.PointB = nil
    print("❌ ล้างค่าการตั้งค่าทั้งหมดแล้ว!")
end)

print("✅ Astral Farm V39 (Smart Lobby Pause) Loaded!")