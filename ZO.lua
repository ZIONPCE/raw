game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "Z脚本测试版"; Text ="Z脚本测试版"; Duration = 25; })

local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "Z脚本测试版",
    Text = "反挂机已开启",
    Duration = 5, 
})

local Sound = Instance.new("Sound")
        Sound.Parent = game.SoundService
        Sound.SoundId = "rbxassetid://6011094380"
        Sound.Volume = 3
        Sound.PlayOnRemove = true
        Sound:Destroy()

print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/xiak27/637/refs/heads/main/xiao586.lua'))()
local Window = OrionLib:MakeWindow({Name ="Z脚本测试版", HidePremium = false, SaveConfig = true,IntroText = "Z脚本测试版", ConfigFolder = "Z脚本测试版"})

local Tab = Window:MakeTab({
    Name = "信息",
    Icon = "rbxassetid://10642752409",
    PremiumOnly = false
})

Tab:AddParagraph("Z脚本测试版版")
Tab:AddParagraph("作者roblox id:r4dhzm78")
Tab:AddParagraph("作者QQ3891722440")
Tab:AddParagraph("Q群1007580643")
Tab:AddParagraph("Q2群1045061775")
Tab:AddParagraph("倒卖马都飞天上去了")
local Tab = Window:MakeTab({
	Name = "设置",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("用户名:"," "..game.Players.LocalPlayer.Name.."")
Tab:AddParagraph("注入器:"," "..identifyexecutor().."")
Tab:AddParagraph("服务器的ID"," "..game.GameId.."")

Tab:AddButton({
	Name = "开启玩家进出服务器提示",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  	end
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddButton({
  Name = "穿墙",
  Callback = function()
  local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false
 
Noclip.Name = "穿墙"
Noclip.Parent = game.CoreGui
 
BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true
 
Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "穿墙"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0
 
Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "打开/关闭"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0
 
StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "状态:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true
 
Status.Name = "状态"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "关"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left
 
 
Toggle.MouseButton1Click:connect(function()
	if Status.Text == "关" then
		Clipon = true
		Status.Text = "开"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "开" then
		Clipon = false
		Status.Text = "关"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)
  end
})

Tab:AddTextbox({
	Name = "自定义头部大小",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)		game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.Head.Transparency = 1
v.Character.Head.BrickColor = BrickColor.new("Red")
v.Character.Head.Material = "Neon"
v.Character.Head.CanCollide = false
v.Character.Head.Massless = true
end)
end
end
end
end)    
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddTextbox({
	Name = "超广角设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		Workspace.CurrentCamera.FieldOfView = Value
	end
})

Tab:AddTextbox({
	Name = "最大视野设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		Workspace.CurrentCamera.FieldOfView = Value
	end
})

Tab:AddTextbox({
	Name = "最小视野设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = v
	end
})

Tab:AddButton({
  Name = "重新加入服务器",
  Callback = function()
game:GetService("TeleportService"):TeleportToPlaceInstance(
            game.PlaceId,
            game.JobId,
            game:GetService("Players").LocalPlayer
        )
  end
})

Tab:AddButton({
  Name = "离开服务器",
  Callback = function()
     game:Shutdown()
  end
})

Tab:AddButton({
  Name = "帧率显示",
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

Tab:AddButton({
  Name = "显示时间",
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
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
  end
})


Tab:AddButton({
  Name = "重开",
  Callback = function()

game.Players.LocalPlayer.Character.Head:Remove()

  end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		game:GetService("Lighting").Brightness = 2
game:GetService("Lighting").ClockTime = 14
game:GetService("Lighting").FogEnd = 100000
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
	end
})

local Tab = Window:MakeTab({
	Name = "其他脚本",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "沙脚本",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/114514lzkill/ShaHUB/refs/heads/main/ShaHUB.lua"))()
  end
})

Tab:AddButton({
  Name = "小空脚本",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaokong6/28285598/refs/heads/main/bbb.lua"))()
  end
})

local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "查看游戏中的所有玩家（包括血量条）",
  Callback = function()
      assert(Drawing, "missing dependency: 'Drawing'") local Players = game:GetService("Players") local RunService = game:GetService("RunService") local localPlayer = Players.LocalPlayer local camera = workspace.CurrentCamera local cache = {} local BOX_OUTLINE_COLOR = Color3.new(0, 0, 0) local BOX_COLOR = Color3.new(1, 0, 0) local NAME_COLOR = Color3.new(1, 1, 1) local HEALTH_OUTLINE_COLOR = Color3.new(0, 0, 0) local HEALTH_HIGH_COLOR = Color3.new(0, 1, 0) local HEALTH_LOW_COLOR = Color3.new(1, 0, 0) local CHAR_SIZE = Vector2.new(4, 6) local function create(class, properties) local drawing = Drawing.new(class) for property, value in pairs(properties) do drawing[property] = value end return drawing end local function floor2(v) return Vector2.new(math.floor(v.X), math.floor(v.Y)) end local function createEsp(player) local esp = {} esp.boxOutline = create("Square", {Color = BOX_OUTLINE_COLOR, Thickness = 3, Filled = false}) esp.box = create("Square", {Color = BOX_COLOR, Thickness = 1, Filled = false}) esp.name = create("Text", {Color = NAME_COLOR, Font = (syn and not RectDynamic) and 2 or 1, Outline = true, Center = true, Size = 13}) esp.healthOutline = create("Line", {Thickness = 3, Color = HEALTH_OUTLINE_COLOR}) esp.health = create("Line", {Thickness = 1}) cache[player] = esp end local function removeEsp(player) local esp = cache[player] if not esp then return end for _, drawing in pairs(esp) do drawing:Remove() end cache[player] = nil end local function updateEsp() for player, esp in pairs(cache) do local character, team = player.Character, player.Team if character and (not team or team ~= localPlayer.Team) then local cframe = character:GetPivot() local screen, onScreen = camera:WorldToViewportPoint(cframe.Position) if onScreen then local frustumHeight = math.tan(math.rad(camera.FieldOfView * 0.5)) * 2 * screen.Z local size = camera.ViewportSize.Y / frustumHeight * CHAR_SIZE local position = Vector2.new(screen.X, screen.Y) esp.boxOutline.Size = floor2(size) esp.boxOutline.Position = floor2(position - size * 0.5) esp.box.Size = esp.boxOutline.Size esp.box.Position = esp.boxOutline.Position esp.name.Text = string.lower(player.Name) esp.name.Position = floor2(position - Vector2.yAxis * (size.Y * 0.5 + esp.name.TextBounds.Y + 2)) local humanoid = character:FindFirstChildOfClass("Humanoid") local health = (humanoid and humanoid.Health or 100) / 100 esp.healthOutline.From = floor2(position - size * 0.5) - Vector2.xAxis * 5 esp.healthOutline.To = floor2(position - size * Vector2.new(0.5, -0.5)) - Vector2.xAxis * 5 esp.health.From = esp.healthOutline.To esp.health.To = floor2(esp.healthOutline.To:Lerp(esp.healthOutline.From, health)) esp.health.Color = HEALTH_LOW_COLOR:Lerp(HEALTH_HIGH_COLOR, health) esp.healthOutline.From = Vector2.yAxis esp.healthOutline.To = Vector2.yAxis end for _, drawing in pairs(esp) do drawing.Visible = onScreen end else for _, drawing in pairs(esp) do drawing.Visible = false end end end end Players.PlayerAdded:Connect(createEsp) Players.PlayerRemoving:Connect(removeEsp) RunService.RenderStepped:Connect(updateEsp) for idx, player in ipairs(Players:GetPlayers()) do if idx ~= 1 then createEsp(player) end end
  end
})

Tab:AddButton({
  Name = "飞行V3",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/fly.lua"))()
  end
})

Tab:AddButton({
  Name = "爬墙走脚本",
  Callback = function()
  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Wall-Walk-9153"))()
  end
})

Tab:AddButton({
  Name = "外国FE陆管",
  Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
  end
})

Tab:AddButton({
  Name = "画质提升(Z制作)(无法关闭)",
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

print("最高画质已载入! 由Z汉化")
  end
})

Tab:AddButton({
  Name = "画质提升(比上面的暗一点)(无法关闭)",
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
   print("Please select a mode")
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

print("RTX Graphics loaded! Created by BrickoIcko")

  end
})

Tab:AddButton({
  Name = "偷物品",
  Callback = function()
for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end
  end
})

Tab:AddButton({
  Name = "R15CB脚本",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/YE-R15CB-SCRIPT.lua"))()
  end
})

Tab:AddButton({
  Name = "老外键盘脚本",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt"))()
  end
})

Tab:AddButton({
  Name = "新版快速互动",
  Callback = function()
  game.ProximityPromptService.PromptButtonHoldBegan:Connect(function(v)
    v.HoldDuration = 0
end)
  end
})

Tab:AddButton({
  Name = "Mspaint脚本",
  Callback = function()
  loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/002c19202c9946e6047b0c6e0ad51f84.lua"))()
  end
})

local Tab = Window:MakeTab({
	Name = "死铁轨",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Section = Tab:AddSection({
        Name = "----------债券区----------"
})

Tab:AddButton({
  Name = "红叶脚本",
  Callback = function()
  loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
  end
})

Tab:AddButton({
  Name = "自动胜利",
  Callback = function()
  loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-Auto-Win-Script-for-Dead-Rails-Instant-win-AFK-farm-KEYLESS-39867"))()
  end
})

Tab:AddButton({
  Name = "刷债券(好用)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Anoonymouss69/ScriptHUB/refs/heads/main/AutoBonds"))()
  end
})

Tab:AddButton({
  Name = "全自动刷债券(比上面的强)",
  Callback = function()
  getgenv().BondFarmSetting = {
	Fast_Auto_Execute = true, -- Use queue_on_teleport to execute faster than your executor itself 
	Number_Of_Bonds_Targeted = 9e9, -- When your bonds reached the number you wanted, the will script automatically be stopped
	Tween_Duration = 23, -- The smaller number, the faster it goes (best is 23)
	Webhook_Url = "none",
	Main_Auto_SHOP_Delay = 70, -- auto server hop after time ended in main game
	Lobby_Auto_SHOP_Delay = 25, -- auto server hop after time ended in lobby
	Goto_Party_By_Walking_Only = false, -- if you set to false, it instantly teleport you to party creator, else it make you walk to party creator 
	Blackscreen_Save_Battery = true,
	Show_Bonds_Collected_On_Blackscreen = false
}
SaveNewSettings = true 
script_key = "DonjoSx_Was_Not_Here" -- Script key, don't remove this
loadstring(game:HttpGet("https://raw.githubusercontent.com/Umbrella-Scripter/Deadrails-Script/refs/heads/main/average-bond-farm.lua"))()
  end
})

Tab:AddButton({
  Name = "乌龟刷债券",
  Callback = function()
  getgenv().AutoExecute = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/hungquan99/HungHUB/main/loader.lua"))()
  end
})

Tab:AddButton({
  Name = "刷债券(中文)",
  Callback = function()
  loadstring(request({Url="https://raw.githubusercontent.com/ShenJiaoBen/Partial-Server-Ribbon/refs/heads/main/自动债券Linninew.lua"}).Body)()
  end
})

Tab:AddButton({
  Name = "刷债券(speed hub)(需解卡)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
  end
})

Tab:AddButton({
  Name = "Ringta刷债券",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/fjruie/newcopybonds.github.io/refs/heads/main/ringtadead.lua"))()
  end
})

Tab:AddButton({
  Name = "Ringta刷债券版本2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/BONDTESTINGSAVE.github.io/refs/heads/main/ern.lua"))()
  end
})

local Section = Tab:AddSection({
        Name = "----------功能类----------"
})

Tab:AddButton({
  Name = "无拉回飞行(moondiely)",
  Callback = function()
  loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-FLY-in-Dead-Rails-One-Click-Script-KEYLESS-by-Moondiety-39179"))()
  end
})

Tab:AddButton({
  Name = "无拉回飞行版本2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/selftilted/flighttosky/refs/heads/main/DeadRails"))()
  end
})

Tab:AddButton({
  Name = "近战武器攻速",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/DeadRails/refs/heads/main/V4SWING"))()
  end
})

Tab:AddButton({
  Name = "近战武器攻速(第二种)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/Dusty/refs/heads/main/NOTV4TRUST"))()
  end
})

Tab:AddButton({
  Name = "moondiely hub",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Dead-rails/refs/heads/main/Full-GUI'))()
  end
})

Tab:AddButton({
  Name = "骷髅Hub(垃圾手机执行起来很卡)",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/hungquan99/SkullHub/main/loader.lua'))()
  end
})

Tab:AddButton({
  Name = "Sanshub(不知道有啥用还要卡密)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/iopjklbnmsss/SansHubScript/refs/heads/main/SansHub"))()
  end
})

Tab:AddButton({
  Name = "TX(破国人脚本刷债券还不免费)",
  Callback = function()
  loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\54\52\68\99\116\76\77\53\47\114\97\119"))()
  end
})

Tab:AddButton({
  Name = "拿物品(需解卡)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/Bringall"))()
  end
})

Tab:AddButton({
  Name = "无限制焊接",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/hbjrev/airweld.github.io/refs/heads/main/RINGTA.lua'))()
  end
})

Tab:AddParagraph("卡密:ringta")

Tab:AddButton({
  Name = "铁拳(可以肘飞狼人)",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
  end
})

local Section = Tab:AddSection({
        Name = "-----------任务类----------"
})

Tab:AddButton({
  Name = "僵尸马",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/wehjf/Pestilenceringta.github.io/refs/heads/main/horseringta.lua"))()
  end
})

local Section = Tab:AddSection({
        Name = "----------娱乐类----------"
})

Tab:AddButton({
  Name = "Zusume hub(需解卡)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ZusumeHub/ZusumeHub/refs/heads/main/V3%20deadrails"))()
  end
})

local Section = Tab:AddSection({
        Name = "注意:复制的东西无法使用"
})

Tab:AddButton({
  Name = "Ringta(无需解卡超好用)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/NEWSPRINT.github.io/refs/heads/main/newsprint.lua"))()
  end
})

Tab:AddButton({
  Name = "Ringta(傻逼脚本老是更新还不是同一脚本)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/DEADRAILS.github.io/refs/heads/main/mainringta.lua"))()
  end
})

local Tab = Window:MakeTab({
	Name = "最强战场",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Section = Tab:AddSection({
        Name = "美化类"
})

Tab:AddButton({
  Name = "Fe美化防御",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
  end
})

Tab:AddButton({
  Name = "琦玉闪电侠美化",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt"))()
  end
})

Tab:AddButton({
  Name = "琦玉黑手党美化",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso'))()
  end
})

local Section = Tab:AddSection({
        Name = "实用类"
})

Tab:AddButton({
  Name = "快速垃圾桶",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"))()
  end
})

Tab:AddButton({
  Name = "自动防御",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
  end
})

Tab:AddButton({
  Name = "Glacier hub 2.0",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/xVicity/GLACIER/main/LATEST.lua"))()
  end
})

Tab:AddButton({
  Name = "锁定敌人",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/MerebennieOfficial/Bestaimbot/refs/heads/main/Merebennie"))()
  end
})

Tab:AddButton({
  Name = "饿狼1+2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Mark22028/Auto-Kyoto-Combo/refs/heads/main/Skibidi%20Sigma%20Combo.txt"))()
  end
})

Tab:AddButton({
  Name = "饿狼索尼克(执行后屏幕会变红)",
  Callback = function()
  loadstring(game:HttpGet("https://pastefy.app/4zLt8a2P/raw"))()
  end
})

Tab:AddButton({
  Name = "FE免费表情",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/NetlessScripter/GOKU/refs/heads/main/FREE%20EMOTES%20GUI"))()
  end
})

local Tab = Window:MakeTab({
	Name = "俄亥俄州",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "AL自动刷印钞机",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/pijiaobenMSJMleng/ehhdvdhd/refs/heads/main/good.lua"))()
  end
})

Tab:AddButton({
  Name = "Snow Hub(专治XA恶俗)(使用前必须退出XA群组)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/canxiaoxue666/SnowHubDemo/refs/heads/main/SnowHub"))() 
  end
})

Tab:AddButton({
  Name = "XA HUB 俄亥俄州(使用前请加入XA群组)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/Ohio"))()
  end
})

local Tab = Window:MakeTab({
	Name = "战争大亨",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "HubBloxy 菜单(卡密1318-9233)",
  Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/eFzmXhRE"))()
  end
})

local Section = Tab:AddSection({
        Name = "干脆不修了"
})

Tab:AddButton({
  Name = "黄某制作高光显示",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/player%20lighting"))()
  end
})

local Tab = Window:MakeTab({
	Name = "GB(内脏与黑火药)",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "不知名脚本(需解卡)",
  Callback = function()
  loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua'))()
  end
})

local Tab = Window:MakeTab({
	Name = "压力",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "超强脚本(Z汉化by)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/pressure"))()
  end
})

Tab:AddButton({
  Name = "挺好用的脚本(忍者无法加载)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/Kncrypt/refs/heads/main/Loader.lua"))()
  end
})

Tab:AddButton({
  Name = "小玄奘压力",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/pressure"))()
  end
})
