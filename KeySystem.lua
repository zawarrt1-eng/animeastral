local coreGui = game:GetService("CoreGui")
local keyGuiName = "AstralKeySystem"

-- ลียร์ UI เก่าทิ้งถ้ามีการรันซ้ำ
if coreGui:FindFirstChild(keyGuiName) then coreGui[keyGuiName]:Destroy() end

-- ==========================================
-- 🔑 ตั้งค่า KEY ของคุณตรงนี้ (Hardcoded สำหรับตอนนี้)
-- ==========================================
local correctKey = "ASTRAL-2026-VIP" 

-- 🎨 สร้าง UI หน้าต่างกรอก Key
local screenGui = Instance.new("ScreenGui", coreGui)
screenGui.Name = keyGuiName

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 200, 50)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "🔑 กรุณาใส่ Key เพื่อใช้งาน Astral Hub"
title.TextColor3 = Color3.fromRGB(255, 200, 50)
title.Font = Enum.Font.GothamBold
title.TextSize = 13

local keyInput = Instance.new("TextBox", frame)
keyInput.Size = UDim2.new(1, -40, 0, 40)
keyInput.Position = UDim2.new(0, 20, 0, 40)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Text = ""
keyInput.PlaceholderText = "วาง Key ที่นี่..."
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 13
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 4)

local submitBtn = Instance.new("TextButton", frame)
submitBtn.Size = UDim2.new(1, -40, 0, 35)
submitBtn.Position = UDim2.new(0, 20, 0, 95)
submitBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Text = "ตรวจสอบ Key"
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 13
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 4)

-- ⚙️ ระบบตรวจสอบ Key
submitBtn.MouseButton1Down:Connect(function()
    if keyInput.Text == correctKey then
        submitBtn.Text = "✅ Key ถูกต้อง! กำลังโหลด..."
        submitBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        task.wait(1)
        
        -- ปิดหน้าต่าง Key
        screenGui:Destroy()
        
        -- 🚀 Fetch สคริปต์หลักของคุณมารัน (ใส่ลิ้งค์ Raw ของไฟล์หลักตรงนี้)
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zawarrt1-eng/animeastral/main/Animeastal.lua"))()
        end)
        
        if not success then
            warn("Astral Hub Error: Failed to load main script -> ", err)
        end
    else
        submitBtn.Text = "❌ Key ผิดพลาด!"
        submitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        submitBtn.Text = "ตรวจสอบ Key"
        submitBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    end
end)