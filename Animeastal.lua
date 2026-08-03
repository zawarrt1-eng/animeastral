-- ==========================================
-- 👑 AUTO FARM: ANIME ASTRAL (V46 - Dual Target & Auto All Drops)
-- ==========================================
local coreGui = game:GetService("CoreGui")
local player = game:GetService("Players").LocalPlayer
local workspace = game:GetService("Workspace")
local vim = game:GetService("VirtualInputManager") 
local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")

local guiName = "AnimeAstralHub"

local MAX_ROOM_RADIUS = 400 
local MAX_DUNGEON_RADIUS = 2000 

local states = {
    CursedRush = false,
    ExpFarm = false,
    AutoClick = false,
    AutoCollectItem = false, -- 📦 สวิตช์ครอบจักรวาล (เก็บทุกอย่าง)
    AutoFire = false,

    StandPos = nil,
    PointA = nil,
    PointB = nil,
    CurrentExpTarget = "A",
    
    AutoTrialEasy = false,
    AutoTrialMedium = false,
    AutoTrialHard = false
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

-- 🗺️ เช็คสถานะการอยู่ในดันเจี้ยน
local function isInDungeon()
    local myPos = getMyPosition()
    if not myPos then return false end
    
    local arenas = workspace:FindFirstChild("BossRushArenas")
    if arenas then
        for _, room in ipairs(arenas:GetChildren()) do
            local refPart = room:FindFirstChildWhichIsA("BasePart", true)
            if refPart and (refPart.Position - myPos).Magnitude <= MAX_DUNGEON_RADIUS then
                return true
            end
        end
    end
    
    local enemyFolder = workspace:FindFirstChild("ClientEnemyVisuals")
    if enemyFolder then
        for _, obj in ipairs(enemyFolder:GetChildren()) do
            if obj:IsA("Model") and isAlive(obj) then
                return true
            end
        end
    end
    
    return false
end

-- 👹 หาบอส
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

-- 📦 ฟังก์ชันครอบจักรวาล: สแกนหา "เฉพาะไอเทมที่กด E เก็บได้จริงๆ" (แก้บักวาปเข้าประตู)
local lastScanTick = 0
local cachedItem = nil

local function getAnyCollectible()
    local myPos = getMyPosition()
    if not myPos then return nil end

    -- 1. เช็คของชิ้นเดิมก่อนว่ายังมีอยู่ และปุ่มยังกด E ได้ไหม
    if cachedItem and cachedItem.Parent then
        local p = cachedItem:FindFirstChildWhichIsA("ProximityPrompt", true)
        if p and p.Enabled and p.KeyboardKeyCode == Enum.KeyCode.E then
            return cachedItem
        end
    end

    if tick() - lastScanTick < 1 then return nil end
    lastScanTick = tick()

    local bestItem = nil
    local shortestDist = 10000 

    for _, obj in ipairs(workspace:GetDescendants()) do
        -- 2. ต้องเป็นตัวกดที่ "เปิดใช้งานอยู่" และ "เป็นปุ่ม E เท่านั้น"
        if obj:IsA("ProximityPrompt") and obj.Enabled and obj.KeyboardKeyCode == Enum.KeyCode.E then
            
            -- 3. 🛑 ตัวกรองป้องกันการวาปไปหา "ประตู, ทางเข้า, บอร์ด, หรือ NPC"
            local textToCheck = string.lower(obj.ActionText .. " " .. obj.Name .. " " .. (obj.Parent and obj.Parent.Name or ""))
            local isBlacklisted = false
            
            -- ลิสต์คำที่มักจะเป็นประตู หรือระบบของแมพ ไม่ใช่ไอเทมดรอป
            local badWords = {"enter", "exit", "leave", "door", "portal", "talk", "speak", "npc", "board", "trial", "dungeon", "teleport", "open"}
            
            for _, word in ipairs(badWords) do
                if string.find(textToCheck, word) then
                    isBlacklisted = true
                    break
                end
            end

            -- 4. ถ้าผ่านตัวกรองมาได้ แปลว่าเป็นไอเทมแน่นอน
            if not isBlacklisted then
                local model = obj:FindFirstAncestorWhichIsA("Model")
                local isPlayer = model and game:GetService("Players"):GetPlayerFromCharacter(model)
                
                if not isPlayer then
                    local part = obj.Parent
                    if part and part:IsA("BasePart") then
                        local dist = (part.Position - myPos).Magnitude
                        if dist < shortestDist then
                            shortestDist = dist
                            bestItem = part
                        end
                    end
                end
            end
        end
    end
    
    cachedItem = bestItem
    return bestItem
end

-- 👾 หามอนสเตอร์ทั่วไป
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

-- ==========================================
-- ⚡ MAIN LOOP: Cursed Rush & Auto Collect
-- ==========================================
_G.FarmLoop = runService.Heartbeat:Connect(function()
    pcall(function()
        if not states.CursedRush and not states.AutoCollectItem then return end

        local char = player.Character
        if not char then return end
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        if not isInDungeon() then
            releaseE()
            return 
        end

        local boss = getBoss()
        
        -- 📦 ระบบเก็บของครอบจักรวาล (ทำก่อนตีมอน)
        local targetItemToCollect = nil
        if states.AutoCollectItem then
            targetItemToCollect = getAnyCollectible()
        end

        if targetItemToCollect then
            if currentTargetFinger ~= targetItemToCollect then
                releaseE()
                currentTargetFinger = targetItemToCollect
            end
            
            local targetCFrame = targetItemToCollect.CFrame * CFrame.new(0, 2, 0)
            
            if (rootPart.Position - targetCFrame.Position).Magnitude > 5 then
                releaseE()
                rootPart.CFrame = targetCFrame
            else
                if not isHoldingE then
                    local prompt = targetItemToCollect:FindFirstChildWhichIsA("ProximityPrompt") 
                                   or targetItemToCollect:FindFirstChildWhichIsA("ProximityPrompt", true)
                    
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

        -- ⚔️ โหมดตีมอน
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

-- ==========================================
-- 🌟 EXP Farm
-- ==========================================
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
-- 🚀 ระบบเข้าดันเจี้ยน Time Trial (แจ้งเตือนปุ๊บกดปั๊บ)
-- ==========================================
task.spawn(function()
    local playerGui = player:WaitForChild("PlayerGui")
    
    while task.wait(1) do
        pcall(function()
            local targetPopups = {}
            if states.AutoTrialEasy then table.insert(targetPopups, "Notify_TimeTrial_Easy") end
            if states.AutoTrialMedium then table.insert(targetPopups, "Notify_TimeTrial_Medium") end
            if states.AutoTrialHard then table.insert(targetPopups, "Notify_TimeTrial_Hard") end
            
            local hudMain = playerGui:FindFirstChild("HUD") and playerGui.HUD:FindFirstChild("Main")
            local gamemodeNotify = hudMain and hudMain:FindFirstChild("GamemodeNotify")
            
            if gamemodeNotify then
                for _, popupName in ipairs(targetPopups) do
                    local popup = gamemodeNotify:FindFirstChild(popupName)
                    
                    if popup and popup.Visible then
                        local actions = popup:FindFirstChild("Actions")
                        local yesButton = actions and actions:FindFirstChild("YES")
                        
                        if yesButton and yesButton:IsA("ImageButton") and yesButton.Visible then
                            pcall(function()
                                for _, conn in ipairs(getconnections(yesButton.MouseButton1Click)) do conn:Fire() end
                                for _, conn in ipairs(getconnections(yesButton.Activated)) do conn:Fire() end
                                for _, conn in ipairs(getconnections(yesButton.MouseButton1Down)) do conn:Fire() end
                            end)
                            
                            local gfxUI = playerGui:FindFirstChild("GFX")
                            local notifyUI = playerGui:FindFirstChild("Notify")
                            if gfxUI then gfxUI.Enabled = false end
                            if notifyUI then notifyUI.Enabled = false end
                            
                            if yesButton.AbsoluteSize.X > 0 and yesButton.AbsolutePosition.X > 0 then
                                local inset, _ = guiService:GetGuiInset()
                                local posX = yesButton.AbsolutePosition.X + (yesButton.AbsoluteSize.X / 2)
                                local posY = yesButton.AbsolutePosition.Y + (yesButton.AbsoluteSize.Y / 2) + inset.Y 
                                
                                vim:SendMouseMoveEvent(posX, posY, game)
                                task.wait(0.1)
                                vim:SendMouseButtonEvent(posX, posY, 0, true, game, 0)
                                task.wait(0.1)
                                vim:SendMouseButtonEvent(posX, posY, 0, false, game, 0)
                            end
                            
                            if gfxUI then gfxUI.Enabled = true end
                            if notifyUI then notifyUI.Enabled = true end
                            
                            task.wait(8)
                        end
                    end
                end
            end
        end)
    end
end)

-- ==========================================
-- 🎯 ฟาร์มตีมอนดันเจี้ยน Time Trial
-- ==========================================
task.spawn(function()
    local currentMob = nil
    local clearedMobs = {} 

    runService.Heartbeat:Connect(function()
        if not states.AutoTrialEasy and not states.AutoTrialMedium and not states.AutoTrialHard then
            currentMob = nil
            clearedMobs = {}
            return
        end

        pcall(function()
            local char = player.Character
            if not char then return end
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end

            local arenasFolder = workspace:FindFirstChild("TimeTrialArenas")
            if not arenasFolder then return end

            if currentMob then
                local hum = currentMob:FindFirstChild("Humanoid")
                local mobRoot = currentMob:FindFirstChild("HumanoidRootPart")
                if not hum or not mobRoot or hum.Health <= 0 then
                    clearedMobs[currentMob] = true 
                    currentMob = nil
                end
            end

            if not currentMob then
                local activeMobs = {}
                local sumPos = Vector3.new(0, 0, 0)

                for _, obj in ipairs(arenasFolder:GetDescendants()) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
                        local hum = obj.Humanoid
                        local mobRoot = obj.HumanoidRootPart
                        if hum.Health > 0 and obj.Name ~= player.Name and not clearedMobs[obj] then
                            table.insert(activeMobs, obj)
                            sumPos = sumPos + mobRoot.Position
                        end
                    end
                end

                if #activeMobs > 0 then
                    local centerPos = sumPos / #activeMobs
                    local bestTarget = nil
                    local shortestDistToCenter = 999999

                    for _, mob in ipairs(activeMobs) do
                        local mobRoot = mob:FindFirstChild("HumanoidRootPart")
                        if mobRoot then
                            local distToCenter = (mobRoot.Position - centerPos).Magnitude
                            if distToCenter < shortestDistToCenter then
                                shortestDistToCenter = distToCenter
                                bestTarget = mob
                            end
                        end
                    end

                    if bestTarget then
                        currentMob = bestTarget
                        local mobRoot = currentMob:FindFirstChild("HumanoidRootPart")
                        if mobRoot then
                            rootPart.CFrame = mobRoot.CFrame * CFrame.new(0, 3, 3)
                        end
                    end
                else
                    clearedMobs = {}
                end
            end
        end)
    end)
end)

-- ==========================================
-- 🔥 ฟาร์มดันเจี้ยนไฟ (Fire Dungeon)
-- ==========================================
task.spawn(function()
    local currentTarget = nil
    local clearedTargets = {} 

    runService.Heartbeat:Connect(function()
        if not states.AutoFire then
            currentTarget = nil
            clearedTargets = {}
            return
        end

        pcall(function()
            local char = player.Character
            if not char then return end
            local rootPart = char:FindFirstChild("HumanoidRootPart")
            if not rootPart then return end

            local enemyFolder = workspace:FindFirstChild("ClientEnemyVisuals")
            if not enemyFolder then return end

            if currentTarget then
                local isModelValid = false
                if currentTarget.Parent and currentTarget:IsA("Model") then
                    local hum = currentTarget:FindFirstChild("Humanoid")
                    local root = currentTarget:FindFirstChild("HumanoidRootPart")
                    if hum and hum.Health > 0 and root then 
                        isModelValid = true 
                    end
                end

                if not isModelValid then
                    clearedTargets[currentTarget] = true 
                    currentTarget = nil
                end
            end

            if not currentTarget then
                local closestTarget = nil
                local shortestDistance = math.huge

                for _, obj in ipairs(enemyFolder:GetChildren()) do
                    if obj:IsA("Model") and not clearedTargets[obj] then
                        local hum = obj:FindFirstChild("Humanoid")
                        local mobRoot = obj:FindFirstChild("HumanoidRootPart")
                        
                        if hum and mobRoot and hum.Health > 0 then
                            local distance = (mobRoot.Position - rootPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestTarget = obj
                            end
                        end
                    end
                end

                if closestTarget then
                    currentTarget = closestTarget
                else
                    clearedTargets = {} 
                end
            end

            if currentTarget then
                local targetRoot = currentTarget:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    rootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3) 
                end
            end
        end)
    end)
end)

-- ==========================================
-- 🎨 สร้างหน้าจอ UI (Astral Hub)
-- ==========================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = guiName
screenGui.Parent = coreGui 

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 420)
frame.Position = UDim2.new(0.5, -160, 0.5, -180)
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
title.Text = "👑 ASTRAL HUB (V46 - AUTO ALL DROPS)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 11
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

local totalTabs = 5
local function createTab(name, index)
    local btn = Instance.new("TextButton", tabContainer)
    btn.Size = UDim2.new(1/totalTabs, -2, 1, 0)
    btn.Position = UDim2.new((index-1)/totalTabs, 1, 0, 0)
    btn.BackgroundColor3 = index == 1 and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
    btn.TextColor3 = index == 1 and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

    local page = Instance.new("Frame", pageContainer)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = (index == 1)

    return btn, page
end

local tabs = {}
local pages = {}

tabs[1], pages[1] = createTab("🗡️ Curs", 1)
tabs[2], pages[2] = createTab("🌟 EXP", 2)
tabs[3], pages[3] = createTab("⏱️ Trial", 3)
tabs[4], pages[4] = createTab("🐉 Meli", 4)
tabs[5], pages[5] = createTab("⚙️ Set", 5)

local function switchTab(index)
    for i = 1, totalTabs do
        tabs[i].BackgroundColor3 = (i == index) and Color3.fromRGB(255, 180, 50) or Color3.fromRGB(40, 40, 50)
        tabs[i].TextColor3 = (i == index) and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(200, 200, 200)
        pages[i].Visible = (i == index)
    end
end

for i = 1, totalTabs do
    tabs[i].MouseButton1Down:Connect(function() switchTab(i) end)
end

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
    btn.TextSize = 11
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
createBtn(pages[1], "📍 Set Stand (จุดยืนรอ)", 20, Color3.fromRGB(60, 120, 200), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.StandPos = c.HumanoidRootPart.CFrame end
end)
createToggle(pages[1], "🚀 Cursed Rush (ตีมอนในแมพ)", 70, "CursedRush", "ExpFarm")

-- Tab 2: EXP
createBtn(pages[2], "📍 Set Point A (จุดที่ 1)", 10, Color3.fromRGB(150, 60, 200), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.PointA = c.HumanoidRootPart.CFrame print("ตั้งจุด A แล้ว!") end
end)
createBtn(pages[2], "📍 Set Point B (จุดที่ 2)", 50, Color3.fromRGB(200, 60, 100), function()
    local c = player.Character if c and c:FindFirstChild("HumanoidRootPart") then states.PointB = c.HumanoidRootPart.CFrame print("ตั้งจุด B แล้ว!") end
end)
createToggle(pages[2], "🌟 Auto EXP Farm (สลับตี)", 90, "ExpFarm", "CursedRush")

-- Tab 3: Time Trial 
createToggle(pages[3], "⏱️ Auto Time Trial Easy", 20, "AutoTrialEasy", nil)
createToggle(pages[3], "⏱️ Auto Time Trial Medium", 70, "AutoTrialMedium", nil)
createToggle(pages[3], "⏱️ Auto Time Trial Hard", 120, "AutoTrialHard", nil) 

-- Tab 4: Meliodas & Special (บอส / เก็บของ)
createToggle(pages[4], "🔥 Auto Fire Dungeon", 20, "AutoFire", nil)
createToggle(pages[4], "📦 Auto Collect All (เก็บทุกอย่าง)", 70, "AutoCollectItem", nil) -- ใช้สวิตช์ครอบจักรวาลตัวนี้

-- Tab 5: Settings
createToggle(pages[5], "🖱️ Auto Click (ออโต้คลิก)", 20, "AutoClick", nil)
createBtn(pages[5], "🗑️ Clear All Positions", 70, Color3.fromRGB(200, 50, 50), function()
    states.StandPos = nil
    states.PointA = nil
    states.PointB = nil
    print("❌ ล้างค่าการตั้งค่าทั้งหมดแล้ว!")
end)

print("✅ Astral Hub V46 (Auto All Drops Optimized) Loaded Successfully!")