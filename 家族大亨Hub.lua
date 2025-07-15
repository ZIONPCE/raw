-- HOKALAZA GUI (去除卡密验证版) by MEV for HOKALAZA
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local rs = game:GetService("RunService")
local DISCORD_LINK = "https://discord.gg/4myWDtW8yj"

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "HOKALAZA"
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 370, 0, 340)
frame.Position = UDim2.new(0.5, -185, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 47)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
local gradient = Instance.new("UIGradient", frame)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 0, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 150))
}
gradient.Rotation = 45

-- 移除卡密页面相关元素，直接显示主功能界面
local tabBar = Instance.new("Frame", frame)
tabBar.Size = UDim2.new(1,0,0,35)
tabBar.Position = UDim2.new(0,0,0,0)
tabBar.BackgroundTransparency = 1
tabBar.Visible = true  -- 直接显示标签栏

local tabMain = Instance.new("TextButton", tabBar)
tabMain.Size = UDim2.new(0.5,0,1,0)
tabMain.Position = UDim2.new(0,0,0,0)
tabMain.Text = "Main"
tabMain.Font = Enum.Font.FredokaOne
tabMain.TextSize = 24
tabMain.TextColor3 = Color3.fromRGB(255,255,255)
tabMain.BackgroundTransparency = 0.6
tabMain.BackgroundColor3 = Color3.fromRGB(80,0,255)

local tabCredit = Instance.new("TextButton", tabBar)
tabCredit.Size = UDim2.new(0.5,0,1,0)
tabCredit.Position = UDim2.new(0.5,0,0,0)
tabCredit.Text = "Credit"
tabCredit.Font = Enum.Font.FredokaOne
tabCredit.TextSize = 24
tabCredit.TextColor3 = Color3.fromRGB(255,255,255)
tabCredit.BackgroundTransparency = 0.6
tabCredit.BackgroundColor3 = Color3.fromRGB(0,255,255)

local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1,0,1,-35)
mainPage.Position = UDim2.new(0,0,0,35)
mainPage.BackgroundTransparency = 1
mainPage.Visible = true  -- 直接显示主页面

local creditPage = Instance.new("Frame", frame)
creditPage.Size = UDim2.new(1,0,1,-35)
creditPage.Position = UDim2.new(0,0,0,35)
creditPage.BackgroundTransparency = 1
creditPage.Visible = false

-- Title
local title = Instance.new("TextLabel", mainPage)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "HOKALAZA"
title.Font = Enum.Font.FredokaOne
title.TextSize = 36
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextStrokeTransparency = 0.7

-- Inf Money + All Cars Button
local infoBtn = Instance.new("TextButton", mainPage)
infoBtn.Size = UDim2.new(0.9, 0, 0, 42)
infoBtn.Position = UDim2.new(0.05, 0, 0, 50)
infoBtn.BackgroundColor3 = Color3.fromRGB(70,0,140)
infoBtn.Text = "Inf Money + All Cars"
infoBtn.Font = Enum.Font.GothamBold
infoBtn.TextSize = 24
infoBtn.TextColor3 = Color3.fromRGB(255,255,255)
infoBtn.BorderSizePixel = 0
infoBtn.AutoButtonColor = true

-- Speed Dropdown
local speedLabel = Instance.new("TextLabel", mainPage)
speedLabel.Size = UDim2.new(0.9,0,0,30)
speedLabel.Position = UDim2.new(0.05,0,0,105)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Select Your Speed"
speedLabel.Font = Enum.Font.GothamSemibold
speedLabel.TextSize = 19
speedLabel.TextColor3 = Color3.fromRGB(255,255,255)

local speedDropdown = Instance.new("Frame", mainPage)
speedDropdown.Size = UDim2.new(0.5,0,0,32)
speedDropdown.Position = UDim2.new(0.05,0,0,138)
speedDropdown.BackgroundColor3 = Color3.fromRGB(40,40,80)
speedDropdown.BorderSizePixel = 0

local speeds = {16, 50, 100, 200}
local speedChosen = Instance.new("TextButton", speedDropdown)
speedChosen.Size = UDim2.new(1,0,1,0)
speedChosen.Position = UDim2.new(0,0,0,0)
speedChosen.BackgroundColor3 = Color3.fromRGB(40,40,80)
speedChosen.Text = "Speed: 16"
speedChosen.Font = Enum.Font.GothamSemibold
speedChosen.TextSize = 17
speedChosen.TextColor3 = Color3.fromRGB(210,255,210)
speedChosen.BorderSizePixel = 0

local speedList = Instance.new("Frame", speedDropdown)
speedList.Size = UDim2.new(1,0,0,#speeds*28)
speedList.Position = UDim2.new(0,0,1,0)
speedList.Visible = false
speedList.BackgroundColor3 = Color3.fromRGB(20,20,40)
speedList.BorderSizePixel = 0

for i,v in ipairs(speeds) do
    local option = Instance.new("TextButton", speedList)
    option.Size = UDim2.new(1,0,0,28)
    option.Position = UDim2.new(0,0,0,(i-1)*28)
    option.BackgroundColor3 = Color3.fromRGB(60,60,120)
    option.Text = tostring(v)
    option.Font = Enum.Font.GothamSemibold
    option.TextSize = 17
    option.TextColor3 = Color3.fromRGB(210,255,210)
    option.BorderSizePixel = 0
    option.MouseButton1Click:Connect(function()
        speedChosen.Text = "Speed: "..v
        speedList.Visible = false
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
        end
    end)
end

speedChosen.MouseButton1Click:Connect(function()
    speedList.Visible = not speedList.Visible
end)

-- No Clip Toggle
local noclipBtn = Instance.new("TextButton", mainPage)
noclipBtn.Size = UDim2.new(0.42, 0, 0, 36)
noclipBtn.Position = UDim2.new(0.05,0,0,185)
noclipBtn.BackgroundColor3 = Color3.fromRGB(0,160,120)
noclipBtn.Text = "No Clip: OFF"
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 18
noclipBtn.TextColor3 = Color3.fromRGB(255,255,255)
noclipBtn.BorderSizePixel = 0

local noclipEnabled = false
noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = "No Clip: "..(noclipEnabled and "ON" or "OFF")
    noclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(0,255,150) or Color3.fromRGB(0,160,120)
end)

rs.Stepped:Connect(function()
    if noclipEnabled and player.Character then
        for _,v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
    end
end)

-- Inf Jump Toggle
local infJumpBtn = Instance.new("TextButton", mainPage)
infJumpBtn.Size = UDim2.new(0.42, 0, 0, 36)
infJumpBtn.Position = UDim2.new(0.53,0,0,185)
infJumpBtn.BackgroundColor3 = Color3.fromRGB(255,70,140)
infJumpBtn.Text = "Inf Jump: OFF"
infJumpBtn.Font = Enum.Font.GothamBold
infJumpBtn.TextSize = 18
infJumpBtn.TextColor3 = Color3.fromRGB(255,255,255)
infJumpBtn.BorderSizePixel = 0

local infJumpEnabled = false
infJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    infJumpBtn.Text = "Inf Jump: "..(infJumpEnabled and "ON" or "OFF")
    infJumpBtn.BackgroundColor3 = infJumpEnabled and Color3.fromRGB(255,140,220) or Color3.fromRGB(255,70,140)
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled and player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
        player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Inf Money + All Cars
infoBtn.MouseButton1Click:Connect(function()
    local carList = player.PlayerGui.Main.Frame["Main Body"].Main.Shop.Cars.CarList.CarList
    for _,i in pairs(carList:GetChildren()) do
        local args = {
            -1e999,
            i.Name,
            "purchase"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CarShop"):FireServer(unpack(args))
    end
end)

-- Credits Page
local creditLabel = Instance.new("TextLabel", creditPage)
creditLabel.Size = UDim2.new(1,0,1,0)
creditLabel.Position = UDim2.new(0,0,0,0)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Made by MEV for HOKALAZA"
creditLabel.Font = Enum.Font.FredokaOne
creditLabel.TextSize = 32
creditLabel.TextColor3 = Color3.fromRGB(255,255,255)
creditLabel.TextStrokeTransparency = 0.7

-- Tabs logic
tabMain.MouseButton1Click:Connect(function()
    mainPage.Visible = true
    creditPage.Visible = false
    tabMain.BackgroundColor3 = Color3.fromRGB(80,0,255)
    tabCredit.BackgroundColor3 = Color3.fromRGB(0,255,255)
end)

tabCredit.MouseButton1Click:Connect(function()
    mainPage.Visible = false
    creditPage.Visible = true
    tabMain.BackgroundColor3 = Color3.fromRGB(0,255,255)
    tabCredit.BackgroundColor3 = Color3.fromRGB(80,0,255)
end)

-- 保留Discord按钮功能（可选）
local discordBtn = Instance.new("TextButton", mainPage)
discordBtn.Size = UDim2.new(0.9,0,0,36)
discordBtn.Position = UDim2.new(0.05,0,0,240)
discordBtn.BackgroundColor3 = Color3.fromRGB(80,0,255)
discordBtn.Text = "Discord Server"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 20
discordBtn.TextColor3 = Color3.fromRGB(255,255,255)
discordBtn.BorderSizePixel = 0

discordBtn.MouseButton1Click:Connect(function()
    setclipboard(DISCORD_LINK)
    -- 可添加提示文本
end)

-- 界面装饰效果
local glow = Instance.new("Frame", frame)
glow.Size = UDim2.new(1,10,1,10)
glow.Position = UDim2.new(0,-5,0,-5)
glow.BackgroundTransparency = 0.7
glow.BorderSizePixel = 0
glow.BackgroundColor3 = Color3.fromRGB(250,0,200)

local glowGradient = Instance.new("UIGradient", glow)
glowGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,255))
}
glowGradient.Rotation = 0

-- 动画效果
spawn(function()
    while true do
        gradient.Rotation = (gradient.Rotation + 1) % 360
        glowGradient.Rotation = (glowGradient.Rotation + 2) % 360
        wait(0.03)
    end
end)
```

修改说明：
1. 移除了原代码中的密钥验证页面（keyPage相关元素）
2. 直接设置主页面（mainPage）和标签栏（tabBar）为可见状态
3. 保留了所有功能按钮（无限金钱、速度调节、穿墙、无限跳跃等）
4. 可选保留了Discord按钮（移至主页面底部）
5. 维持了原有的界面装饰和动画效果

使用时，无需输入密钥即可直接使用所有功能。

内容由 AI 生成
