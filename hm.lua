game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "黄某脚本中心"; Text ="死铁轨脚本整合中心"; Duration = 10; })

print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)

local Sound = Instance.new("Sound")
        Sound.Parent = game.SoundService
        Sound.SoundId = "rbxassetid://4590662766"
        Sound.Volume = 3
        Sound.PlayOnRemove = true
        Sound:Destroy()

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/wind%20ui.lua"))()

local Window = WindUI:CreateWindow({
    Title = "黄某脚本中心",
    Icon = "badge-check",
    Author = "作者:黄某",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "rbxassetid://135015304695782", -- rbxassetid only
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
})

Window:EditOpenButton({
    Title = "   打开黄某脚本   ",
    Icon = "crown",
    CornerRadiu = UDim.new(0,16),
    StrokeThickness = 3,
    Color = ColorSequence.new( 
        Color3.fromHex("6495ED"), 
        Color3.fromHex("FF4500"), 
        Color3.fromHex("9730DB")   
    ),
    Draggable = true,
})

local Tab = Window:Tab({
    Title = "黑名单",
    Icon = "skull",
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "最傻逼的黑名单人员",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Section = Tab:Section({ 
    Title = "Roblox.汉堡，现改名为Roblox.DC",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Section = Tab:Section({ 
    Title = "快手号:hbmh666888",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Tab = Window:Tab({
    Title = "通用",
    Icon = "house",
    Locked = false,
})

local Keybind = Tab:Keybind({
    Title = "按键绑定",
    Desc = "点击绑定的按键以快速打开UI",
    Value = "O",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

local Button = Tab:Button({
    Title = "黄某汉化键盘脚本",
    Desc = "跟忍者自带的键盘功能一样",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/Deltakeyboard"))()
    end
})

local Button = Tab:Button({
    Title = "FE抹脖子脚本",
    Desc = "搭配忍者键盘使用效果绝佳",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
    end
})

local Button = Tab:Button({
    Title = "Ghost hub",
    Desc = "范围超级广的hub脚本",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})

local Button = Tab:Button({
    Title = "自瞄",
    Desc = "故名思义",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/B0SBjPgH"))()
    end
})

local Button = Tab:Button({
    Title = "黄某高光显示",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/player%20lighting"))()
    end
})

local Button = Tab:Button({
    Title = "开启玩家进出服务器提示",
    Desc = "故名思义",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

local Button = Tab:Button({
    Title = "北京时间",
    Desc = "右上角显示时间",
    Locked = false,
    Callback = function()
    local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
    end
})

local Button = Tab:Button({
    Title = "帧数显示",
    Desc = "故名思义",
    Locked = false,
    Callback = function()
     local ScreenGui = Instance.new("ScreenGui") 
 local FpsLabel = Instance.new("TextLabel")
 
 
 ScreenGui.Name = "FPSGui" 
 ScreenGui.ResetOnSpawn = false 
 ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 
 FpsLabel.Name = "FPSLabel" 
 FpsLabel.Size = UDim2.new(0, 100, 0, 50) 
 FpsLabel.Position = UDim2.new(0, 10, 0, 10) 
 FpsLabel.BackgroundTransparency = 1 
 FpsLabel.Font = Enum.Font.SourceSansBold 
 FpsLabel.Text = "帧率: 0" 
 FpsLabel.TextSize = 20 
 FpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 FpsLabel.Parent = ScreenGui 
  
 function updateFpsLabel() 
     local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) 
     FpsLabel.Text = "帧率: " .. fps 
 end 
  
  game:GetService("RunService").RenderStepped:Connect(updateFpsLabel) 
  
 ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


 animateCredits()
    end
})

local Button = Tab:Button({
    Title = "爬墙",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Wall-Walk-9153"))()
    end
})

local Button = Tab:Button({
    Title = "无限跳",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

local Button = Tab:Button({
    Title = "选人甩飞",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()
    end
})

local Button = Tab:Button({
    Title = "飞行V3",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/fly.lua"))()
    end
})

local Button = Tab:Button({
    Title = "穿墙",
    Desc = "大部分服务器通用",
    Locked = false,
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "NoclipGUI"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 2
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleBar.Parent = frame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "穿墙"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextScaled = true
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0.1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.Text = "关闭"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = titleBar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -60, 0.1, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
minimizeButton.Text = "收缩"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Parent = titleBar

local toggleNoclipButton = Instance.new("TextButton")
toggleNoclipButton.Size = UDim2.new(0.8, 0, 0, 40)
toggleNoclipButton.Position = UDim2.new(0.1, 0, 0.4, 0)
toggleNoclipButton.Text = "穿墙: 关闭"
toggleNoclipButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
toggleNoclipButton.TextColor3 = Color3.new(1, 1, 1)
toggleNoclipButton.Parent = frame

local creditLabel = Instance.new("TextLabel")
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.Position = UDim2.new(0, 0, 0.85, 0)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = ""
creditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
creditLabel.TextScaled = true
creditLabel.Font = Enum.Font.SourceSansBold
creditLabel.Parent = frame

-- Noclip Functionality
local noclip = false
local function toggleNoclip()
    noclip = not noclip
    toggleNoclipButton.Text = noclip and "穿墙: 开启" or "穿墙: 关闭"
    toggleNoclipButton.BackgroundColor3 = noclip and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 100, 100)

    while noclip do
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
        task.wait()
    end
end

toggleNoclipButton.MouseButton1Click:Connect(toggleNoclip)

-- Minimize GUI Function
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, obj in pairs(frame:GetChildren()) do
        if obj ~= titleBar and obj ~= creditLabel then
            obj.Visible = not minimized
        end
    end
    frame.Size = minimized and UDim2.new(0, 250, 0, 30) or UDim2.new(0, 250, 0, 150)
    minimizeButton.Text = minimized and "展开" or "收缩"
end)

-- Close GUI Function
closeButton.MouseButton1Click:Connect(function()
    noclip = false
    screenGui:Destroy()
end)

print("穿墙UI加载成功！")
    end
})

local Button = Tab:Button({
    Title = "画质提升",
    Desc = "黄某制作，比较亮",
    Locked = false,
    Callback = function()
    local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

-- enable or disable shit

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

-- settings {

color.Enabled = false
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = false
bloom.Intensity = 0.1

sun.Enabled = false
sun.Intensity = 0.2
sun.Spread = 1

bloom.Enabled = false
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = false
blur.Size = 6

-- settings }


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	-- settings {
	ter.WaterWaveSize = 0.1
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 0.9
	ter.WaterReflectance = 0.05
	-- settings }
end
if config.Lighting then
	-- settings {
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
	-- settings }
end
local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 5.69
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.18
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
b.Enabled = true
b.Intensity = 0.99
b.Size = 9999 
b.Threshold = 0
local c = Instance.new("ColorCorrectionEffect", a)
c.Brightness = 0.015
c.Contrast = 0.25
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)
if getgenv().mode == "夏日" then
   c.TintColor = Color3.fromRGB(255, 220, 148)
elseif getgenv().mode == "秋季" then
   c.TintColor = Color3.fromRGB(217, 145, 57)
else
   warn("未选择模式")
   print("请选择一个模式")
   b:Destroy()
   c:Destroy()
end
local d = Instance.new("DepthOfFieldEffect", a)
d.Enabled = true
d.FarIntensity = 0.077
d.FocusDistance = 21.54
d.InFocusRadius = 20.77
d.NearIntensity = 0.277
local e = Instance.new("ColorCorrectionEffect", a)
e.Brightness = 0
e.Contrast = -0.07
e.Saturation = 0
e.Enabled = true
e.TintColor = Color3.fromRGB(255, 247, 239)
local e2 = Instance.new("ColorCorrectionEffect", a)
e2.Brightness = 0.2
e2.Contrast = 0.45
e2.Saturation = -0.1
e2.Enabled = true
e2.TintColor = Color3.fromRGB(255, 255, 255)
local s = Instance.new("SunRaysEffect", a)
s.Enabled = true
s.Intensity = 0.01
s.Spread = 0.146

print("最高画质已载入! 由黄某汉化")
    end
})

local Button = Tab:Button({
    Title = "画质提升2",
    Desc = "黄某制作，比上面的暗一些",
    Locked = false,
    Callback = function()
    local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 5.69
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.18
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
b.Enabled = true
b.Intensity = 0.99
b.Size = 9999 
b.Threshold = 0
local c = Instance.new("ColorCorrectionEffect", a)
c.Brightness = 0.015
c.Contrast = 0.25
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)
if getgenv().mode == "Summer" then
   c.TintColor = Color3.fromRGB(255, 220, 148)
elseif getgenv().mode == "Autumn" then
   c.TintColor = Color3.fromRGB(217, 145, 57)
else
   warn("No mode selected!")
   print("请选择一个模式")
   b:Destroy()
   c:Destroy()
end
local d = Instance.new("DepthOfFieldEffect", a)
d.Enabled = true
d.FarIntensity = 0.077
d.FocusDistance = 21.54
d.InFocusRadius = 20.77
d.NearIntensity = 0.277
local e = Instance.new("ColorCorrectionEffect", a)
e.Brightness = 0
e.Contrast = -0.07
e.Saturation = 0
e.Enabled = true
e.TintColor = Color3.fromRGB(255, 247, 239)
local e2 = Instance.new("ColorCorrectionEffect", a)
e2.Brightness = 0.2
e2.Contrast = 0.45
e2.Saturation = -0.1
e2.Enabled = true
e2.TintColor = Color3.fromRGB(255, 255, 255)
local s = Instance.new("SunRaysEffect", a)
s.Enabled = true
s.Intensity = 0.01
s.Spread = 0.146

print("RTX 光影加载完毕! 由黄某制作!")

    end
})

local Button = Tab:Button({
    Title = "快速互动",
    Desc = "无法关闭",
    Locked = false,
    Callback = function()
    game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(v)
    v.HoldDuration = 0
end)
    end
})

local Button = Tab:Button({
    Title = "偷物品",
    Desc = "偷其他玩家物品栏里的物品，有些不能使用",
    Locked = false,
    Callback = function()
    for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end
    end
})

local Button = Tab:Button({
    Title = "R15入人脚本",
    Desc = "前后移动...",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R15CB-SCRIPT.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Mspaint脚本",
    Desc = "需解卡",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/002c19202c9946e6047b0c6e0ad51f84.lua"))()
    end
})

local Slider = Tab:Slider({
    Title = "超广角设置",
    
    Step = 1,
    
    Value = {
        Min = 0,
        Max = 120,
        Default = 75,
    },
    Callback = function(value)
    game.Workspace.CurrentCamera.FieldOfView = value
    end
})

local Slider = Tab:Slider({
    Title = "移动速度",
    
    Step = 1,
    
    Value = {
        Min = 0,
        Max = 320,
        Default = 16,
    },
    Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local Slider = Tab:Slider({
    Title = "重力",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    
    Value = {
        Min = 0,
        Max = 1000,
        Default = 196,
    },
    Callback = function(value)
    game.Workspace.Gravity = value
    end
})

local Slider = Tab:Slider({
    Title = "跳跃高度",
    
    Step = 1,
    
    Value = {
        Min = 50,
        Max = 1000,
        Default = 50,
    },
    Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

local Button = Tab:Button({
    Title = "动画包",
    Desc = "没啥卵用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/HrXgGiND"))()
    end
})

local Button = Tab:Button({
    Title = "重开",
    Desc = "人物重置",
    Locked = false,
    Callback = function()
    game.Players.LocalPlayer.Character.Head:Remove()
    end
})

local Button = Tab:Button({
    Title = "重新加入服务器",
    Desc = "顾名思义",
    Locked = false,
    Callback = function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(
            game.PlaceId,
            game.JobId,
            game:GetService("Players").LocalPlayer
        )
    end
})

local Button = Tab:Button({
    Title = "多种18禁类型脚本",
    Desc = "适合整活",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
    end
})

local Tab = Window:Tab({
    Title = "特供脚本",
    Icon = "code",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Z脚本",
    Desc = "脚本由Zi-o制作",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZIONPCE/raw/refs/heads/main/ZiO.lua"))()
    end
})

local Button = Tab:Button({
    Title = "小空脚本",
    Desc = "脚本由晓空制作",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\120\105\97\111\54\54\55\55\56\47\51\49\55\56\72\117\98\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\120\105\97\111\72\117\98\46\108\117\97"))()
    end
})

local Button = Tab:Button({
    Title = "沙脚本",
    Desc = "脚本由沙记制作",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/114514lzkill/ShaHUB/refs/heads/main/ShaHUB.lua"))()
    end
})

local Button = Tab:Button({
    Title = "SansHub",
    Desc = "由黄某破除卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iopjklbnmsss/SansHubScript/refs/heads/main/SansHubx"))()
    end
})

local Tab = Window:Tab({
    Title = "各大脚本中心",
    Icon = "boxes",
    Locked = false,
})

local Button = Tab:Button({
    Title = "苏脚本",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kukunb/kukulol/refs/heads/main/SUscript.txt"))()
    end
})

local Button = Tab:Button({
    Title = "XA Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://xingtaiduan.pythonanywhere.com/Loader"))()
    end
})

local Button = Tab:Button({
    Title = "皮脚本",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
    end
})

local Button = Tab:Button({
    Title = "ISIS脚本",
    Desc = "汉化外国脚本，卡密ISIS-KEY-2025",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/S-WTB/-/refs/heads/main/ISIS加载器'))()
    end
})

local Tab = Window:Tab({
    Title = "死铁轨",
    Icon = "train-track",
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "----------债券区----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "红叶脚本",
    Desc = "需要解卡",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

local Button = Tab:Button({
    Title = "Nathub",
    Desc = "需要解卡",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
    end
})

local Button = Tab:Button({
    Title = "Moondiely 刷债券 V5",
    Desc = "超级强的刷债券脚本(需要解卡密)",
    Locked = false,
    Callback = function()
    getgenv().auto_bond=true loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Dead-rails/refs/heads/main/Auto-Win-With-Bonds'))()
    end
})

local Button = Tab:Button({
    Title = "自动刷债券",
    Desc = "无需解卡，黑屏请点一下屏幕即可恢复(在游玩时点击Exit即可取消自动执行",
    Locked = false,
    Callback = function()
    getgenv().BondFarmSetting = {
	Fast_Auto_Execute = true, -- Use queue_on_teleport to execute faster than your executor itself 
	Number_Of_Bonds_Targeted = 9e9, -- When your bonds reached the number you wanted, the will script automatically be stopped
	Tween_Duration = 23, -- The smaller number, the faster it goes (best is 23)
	Webhook_Url = "none",
	Main_Auto_SHOP_Delay = 70, -- auto server hop after time ended in main game
	Lobby_Auto_SHOP_Delay = 25, -- auto server hop after time ended in lobby
	Goto_Party_By_Walking_Only = false, -- if you set to false, it instantly teleport you to party creator, else it make you walk to party creator 
	Blackscreen_Save_Battery = false,
	Show_Bonds_Collected_On_Blackscreen = false
}
SaveNewSettings = true 
script_key = "DonjoSx_Was_Not_Here" -- Script key, don't remove this
loadstring(game:HttpGet("https://raw.githubusercontent.com/Umbrella-Scripter/Deadrails-Script/refs/heads/main/average-bond-farm.lua"))()
    end
})

local Button = Tab:Button({
    Title = "TX刷债券",
    Desc = "速度慢的一坨",
    Locked = false,
    Callback = function() loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\54\52\68\99\116\76\77\53\47\114\97\119"))()
    end
})

local Button = Tab:Button({
    Title = "自动胜利",
    Desc = "容易自杀",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-Auto-Win-Script-for-Dead-Rails-Instant-win-AFK-farm-KEYLESS-39867"))()
    end
})

local Button = Tab:Button({
    Title = "刷债券",
    Desc = "也挺好用，重复加载请打开忍者注入里的autoexecute里删除文件",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Anoonymouss69/ScriptHUB/refs/heads/main/AutoBonds"))()
    end
})

local Button = Tab:Button({
    Title = "乌龟刷债券",
    Desc = "也好用，无需卡密",
    Locked = false,
    Callback = function()
    getgenv().AutoExecute = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHUB/main/loader.lua"))()
    end
})

local Button = Tab:Button({
    Title = "霖溺刷债券",
    Desc = "中文版刷债券效果一般",
    Locked = false,
    Callback = function()
    loadstring(request({Url="https://raw.githubusercontent.com/ShenJiaoBen/Partial-Server-Ribbon/refs/heads/main/自动债券Linninew.lua"}).Body)()
    end
})

local Button = Tab:Button({
    Title = "Speed hub刷债券",
    Desc = "需解卡",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

local Button = Tab:Button({
    Title = "Ringta刷债券",
    Desc = "无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fjruie/newcopybonds.github.io/refs/heads/main/ringtadead.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Ringta刷债券",
    Desc = "第二版无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/BONDTESTINGSAVE.github.io/refs/heads/main/ern.lua"))()
    end
})

local Section = Tab:Section({ 
    Title = "----------功能区----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "Moondiely无拉回飞行",
    Desc = "点击main往下翻找到fly启用即可",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-FLY-in-Dead-Rails-One-Click-Script-KEYLESS-by-Moondiety-39179"))()
    end
})

local Button = Tab:Button({
    Title = "V开头无拉回飞行",
    Desc = "踏马的需要解卡，同样也跟上面脚本的步骤一样",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/selftilted/flighttosky/refs/heads/main/DeadRails"))()
    end
})

local Button = Tab:Button({
    Title = "Sentan快速攻击速度",
    Desc = "功能简洁推荐使用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/DeadRails/refs/heads/main/V4SWING"))()
    end
})

local Button = Tab:Button({
    Title = "不知名攻速脚本",
    Desc = "别和左右第一个功能一起按就可以，第三人称可以开",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/Dusty/refs/heads/main/NOTV4TRUST"))()
    end
})

local Button = Tab:Button({
    Title = "骷髅hub",
    Desc = "垃圾手机用起来很卡,但功能很多",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hungquan99/SkullHub/main/loader.lua'))()
    end
})

local Button = Tab:Button({
    Title = "Sanshub",
    Desc = "由黄某破除卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iopjklbnmsss/SansHubScript/refs/heads/main/dead"))()
    end
})

local Button = Tab:Button({
    Title = "拿物品",
    Desc = "需要解卡",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))()
    end
})

local Button = Tab:Button({
    Title = "无限制距离焊接",
    Desc = "卡密ringta,在新版本中已经废了",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hbjrev/airweld.github.io/refs/heads/main/RINGTA.lua'))()
    end
})

local Button = Tab:Button({
    Title = "铁拳",
    Desc = "可以击飞碰撞箱大的狼人，也可以击飞玩家(但不建议在战斗类服务器使用)",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

local Section = Tab:Section({ 
    Title = "----------任务区----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "僵尸马",
    Desc = "传送后需搭配攻速脚本打掉周围僵尸和狼人",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wehjf/Pestilenceringta.github.io/refs/heads/main/horseringta.lua"))()
    end
})

local Section = Tab:Section({ 
    Title = "----------娱乐区----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "Zusume hub",
    Desc = "需要解卡,复制的东西无法使用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZusumeHub/ZusumeHub/refs/heads/main/V3%20deadrails"))()
    end
})

local Button = Tab:Button({
    Title = "Ringta",
    Desc = "无需解卡也是好用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/DEADRAILS.github.io/refs/heads/main/mainringta.lua"))()
    end
})

local Tab = Window:Tab({
    Title = "最强战场",
    Icon = "swords",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Atrainz hub",
    Desc = "里面有隐身",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end
})

local Section = Tab:Section({ 
    Title = "----------琦玉美化----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "FE美化防御",
    Desc = "敌人能看见你的防御动作",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
    end
})

local Button = Tab:Button({
    Title = "琦玉-闪电侠美化",
    Desc = "速度快",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt"))()
    end
})

local Button = Tab:Button({
    Title = "琦玉-黑手党美化",
    Desc = "......",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso'))()
    end
})

local Button = Tab:Button({
    Title = "琦玉-宿傩动作包",
    Desc = "只是一个动作包",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/damir512/whendoesbrickdie/main/tspno.txt",true))()
    end
})

local Button = Tab:Button({
    Title = "琦玉-五条悟动作包",
    Desc = "皮肤会变为五条悟但别人还能看到你原来的皮肤",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibiditoilethaterfr2024/Script-protected-blud-/refs/heads/main/Protected_4902678279449732.txt"))()
    end
})

local Section = Tab:Section({ 
    Title = "----------实用功能----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "垃圾桶战神",
    Desc = "快速获取垃圾桶",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"))()
    end
})

local Button = Tab:Button({
    Title = "自动防御",
    Desc = "第一个启用后点击齿轮图标setup就行",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
    end
})

local Button = Tab:Button({
    Title = "Glacer Hub 2.0",
    Desc = "英文版hub类脚本，功能多",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xVicity/GLACIER/main/LATEST.lua"))()
    end
})

local Button = Tab:Button({
    Title = "平滑锁定敌人",
    Desc = "超好用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MerebennieOfficial/Bestaimbot/refs/heads/main/Merebennie"))()
    end
})

local Button = Tab:Button({
    Title = "向上自动冲刺打",
    Desc = "第四a向上打自动冲刺",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/OreoTech/refs/heads/main/Protected_6856895483929371.lua"))()
    end
})

local Section = Tab:Section({ 
    Title = "----------饿狼角色----------",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

local Button = Tab:Button({
    Title = "饿狼自动1+2",
    Desc = "失败次数高",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028/Auto-Kyoto-Combo/refs/heads/main/Skibidi%20Sigma%20Combo.txt"))()
    end
})

local Button = Tab:Button({
    Title = "饿狼-索尼克美化",
    Desc = "执行后屏幕会变红",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/4zLt8a2P/raw"))()
    end
})

local Tab = Window:Tab({
    Title = "被遗弃",
    Icon = "circle-dashed",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Mandy",
    Desc = "功能少的可怜",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MaybeNotMandy/forsaken/refs/heads/main/sae"))()
    end
})

local Button = Tab:Button({
    Title = "Funny hub",
    Desc = "无说明",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Forsaken-Funny-Hub-V2-42056"))()
    end
})

local Button = Tab:Button({
    Title = "Bob hub",
    Desc = "功能多点",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notzanocoddz4/BobHub/main/main.lua"))()
    end
})

local Tab = Window:Tab({
    Title = "俄亥俄州",
    Icon = "circle-dollar-sign",
    Locked = false,
})

local Button = Tab:Button({
    Title = "XA HUB 俄亥俄州",
    Desc = "使用前需加入Roblox XA HUB 群组",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/Ohio"))()
    end
})

local Button = Tab:Button({
    Title = "Snow Hub(专治XA恶俗)",
    Desc = "使用前请退出Roblox XA HUB群组，不然直接被踢",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/canxiaoxue666/SnowHubDemo/refs/heads/main/SnowHub"))() 
    end
})

local Button = Tab:Button({
    Title = "AL自动刷印钞",
    Desc = "......",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pijiaobenMSJMleng/ehhdvdhd/refs/heads/main/good.lua"))()
    end
})

local Tab = Window:Tab({
    Title = "战争大亨",
    Icon = "shield",
    Locked = false,
})

local Button = Tab:Button({
    Title = "HubBloxy 菜单",
    Desc = "卡密1318-9233",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/eFzmXhRE"))()
    end
})

local Tab = Window:Tab({
    Title = "墨水游戏",
    Icon = "gamepad-2",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Ringta",
    Desc = "英文版特别好用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})

local Button = Tab:Button({
    Title = "霖溺中文脚本",
    Desc = "比上面的功能少了一点",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua"))()
    end
})

local Button = Tab:Button({
    Title = "最强脚本",
    Desc = "有自动胜利",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexScriptX/Ink-Game-Script/refs/heads/main/Ink%20Game%20by%20AlexScriptX.lua"))()
    end
})

local Button = Tab:Button({
    Title = "void脚本",
    Desc = "会自动开启移速增加",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/inkgame.lua"))()
    end
})

local Tab = Window:Tab({
    Title = "压力",
    Icon = "door-closed",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Cennpy客户端V2",
    Desc = "黄某汉化",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/pressure"))()
    end
})

local Button = Tab:Button({
    Title = "好用脚本",
    Desc = "忍者无法加载",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/Loader.lua"))()
    end
})

local Button = Tab:Button({
    Title = "XXZ压力",
    Desc = "......",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/pressure"))()
    end
})

local Tab = Window:Tab({
    Title = "战争机器",
    Icon = "shield-user",
    Locked = false,
})

local Button = Tab:Button({
    Title = "自动刷钱",
    Desc = "一秒100,不用时请退出游戏",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/War-Machines-ProBaconHub-15461"))()
    end
})

local Tab = Window:Tab({
    Title = "在森林中存活99天",
    Icon = "tree-pine",
    Locked = false,
})

local Button = Tab:Button({
    Title = "TX脚本",
    Desc = "疑似最lj脚本",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/99-Nights-TX-XIAN-MIAN______-_-_--_-_-_-_--_-_-_-_--_-_-_-_-_--_-_-_-__------_-_-_-_.lua"))()
    end
})

local Button = Tab:Button({
    Title = "外国最强99夜脚本",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://soluna-script.vercel.app/99-Nights-in-the-Forest.lua"))()
    end
})