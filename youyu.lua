--[[
     credits:
    Inf Yield（又名Infinite Yield）
    mspaint v2 - 代码组织
    如需署名，请通知我
]]
if not getgenv().shared then
    getgenv().shared = {}
end
if not getgenv().voidware_loaded then
    getgenv().voidware_loaded = true
else
    local suc = pcall(function()
        shared.Voidware_InkGame_Library:Unload()
    end)
    if not suc then
        return 
    end
end
local isNew = false
pcall(function()
    if not isfolder("voidware_linoria") then makefolder("voidware_linoria"); isNew = true; end
    for _, v in pairs({"voidware_linoria/ink_game", "voidware_linoria/themes"}) do
        if not isfolder(v) then makefolder(v); isNew = true; end
    end
    for _, v in pairs({"voidware_linoria/ink_game/settings", "voidware_linoria/ink_game/themes"}) do
        if not isfolder(v) then makefolder(v); isNew = true; end
    end
    if isNew then
        writefile("voidware_linoria/themes/default.txt", "Jester")
        local suc = pcall(function()
            writefile("voidware_linoria/ink_game/settings/default.json", game:HttpGet("https://raw.githubusercontent.com/Erchobg/VoidwareProfiles/refs/heads/main/InkGame/ink_game/settings/default.json", true))
        end)
        if suc then
            writefile("voidware_linoria/ink_game/settings/autoload.txt", "default")
        end
    end
end)
task.spawn(function()
    pcall(function()
        if not isfile("Local_VW_Update_Log.json") then
            shared.UpdateLogBypass = true
        end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/VWUpdateLog.lua", true))()
        shared.UpdateLogBypass = nil
    end)
end)
local allowedlibs = {"Obsidian", "LinoriaLib"}
local default = "Obsidian"
local function getLibrary()
    local res = default
    if not isfile("Voidware_InkGame_Library_Choice.txt") then
        writefile("Voidware_InkGame_Library_Choice.txt", res)
    else
        local suc, opt = pcall(function()
            return readfile("Voidware_InkGame_Library_Choice.txt")
        end)
        if suc then
            res = tostring(opt)
        end
    end
    if not table.find(allowedlibs, res) then
        res = defaut
    end
    writefile("Voidware_InkGame_Library_Choice.txt", res)
    return res
end
local suc, targetlib = pcall(getLibrary)
if not suc then
    targetlib = default
end
--// 库 \\--
local repo = "https://raw.githubusercontent.com/mstudio45/"..tostring(targetlib).."/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
shared.Voidware_InkGame_Library = Library
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options
local Toggles
if targetlib == "Obsidian" then
    Options = getgenv().Library.Options
    Toggles = getgenv().Library.Toggles
else 
    Options = getgenv().Linoria.Options
    Toggles = getgenv().Linoria.Toggles   
end
local Window = Library:CreateWindow({
	Title = "Voidware - 墨水游戏",
    Footer = "discord.gg/voidware",
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	TabPadding = 2,
	MenuFadeTime = 0
})
local Tabs = {
    Main = Window:AddTab("主界面", "gamepad-2"),
    Other = Window:AddTab("其他", "settings"),
    Misc = Window:AddTab("杂项", "wrench"),
    Visuals = Window:AddTab("视觉效果", "eye"),
    ["UI 设置"] = Window:AddTab("UI 设置", "sliders-horizontal"),
}
local Maid = {}
Maid.__index = Maid
function Maid.new()
    return setmetatable({Tasks = {}}, Maid)
end
function Maid:Add(task)
    if typeof(task) == "RBXScriptConnection" or (typeof(task) == "Instance" and task.Destroy) or typeof(task) == "function" then
        table.insert(self.Tasks, task)
    end
    return task
end
function Maid:Clean()
    for _, task in ipairs(self.Tasks) do
		pcall(function()
			if typeof(task) == "RBXScriptConnection" then
				task:Disconnect()
			elseif typeof(task) == "Instance" then
				task:Destroy()
			elseif typeof(task) == "function" then
				task()
			end
		end)
    end
	table.clear(self.Tasks)
    self.Tasks = {}
end
local Services = setmetatable({}, {
	__index = function(self, key)
		local suc, service = pcall(game.GetService, game, key)
		if suc and service then
			self[key] = service
			return service
		else
			warn(`[服务] 警告: "{key}" 不是有效的Roblox服务。`)
			return nil
		end
	end
})
local SharedFunctions = {}
function SharedFunctions.GetBoosts(arg1, arg2, arg3)
    local boosts = arg1 and arg1:FindFirstChild("Boosts")
    if boosts then
        local boostVal = boosts:FindFirstChild(arg2)
        if boostVal then
            if arg2 == "Faster Sprint" then
                return 1.5 * boostVal.Value
            elseif arg2 == "Damage Boost" then
                return 0.1 * boostVal.Value
            else
                return 0.1 * boostVal.Value
            end
        end
    end
    return 0
end
function SharedFunctions.Invisible(arg1, arg2, arg3)
    for _, part in ipairs(arg1:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            if arg2 == 1 then
                part.Transparency = 1
            else
                part.Transparency = 1
            end
            if arg3 then
                part.CanCollide = false
            end
        end
    end
end
function SharedFunctions.CreateFolder(parent, name, lifetime, opts)
    local Folder = Instance.new("Folder")
    Folder.Name = name
    if opts then
        if opts.ObjectValue then
            Folder.Value = opts.ObjectValue
        end
        if opts.Attributes then
            for k, v in pairs(opts.Attributes) do
                Folder:SetAttribute(k, v)
            end
        end
    end
    Folder.Parent = parent
    if lifetime then
        task.delay(lifetime, function()
            if Folder and Folder.Parent then
                Folder:Destroy()
            end
        end)
    end
    return Folder
end
local Players = Services.Players
local Lighting = Services.Lighting
local RunService = Services.RunService
local HttpService = Services.HttpService
local TweenService = Services.TweenService
local UserInputService = Services.UserInputService
local ReplicatedStorage = Services.ReplicatedStorage
local ProximityPromptService = Services.ProximityPromptService
local lplr = Players.LocalPlayer
local localPlayer = lplr
local camera = workspace.CurrentCamera
type ESP = {
    Color: Color3,
    IsEntity: boolean,
    Object: Instance,
    Offset: Vector3,
    Text: string,
    TextParent: Instance,
    Type: string,
}
local Script = {
    GameStateChanged = Instance.new("BindableEvent"),
    GameState = "unknown",
    Services = Services,
    Maid = Maid.new(),
    Connections = {},
    Functions = {},
    ESPTable = {
        Player = {},
        Seeker = {},
        Hider = {},
        Guard = {},
        Door = {},
        None = {},
        Key = {},
        EscapeDoor = {}
    },
    Temp = {}
}
local States = {}
function Script.Functions.Alert(message: string, time_obj: number)
    Library:Notify(message, time_obj or 5)
    --if TogglesNotifySound..Value then
        local sound = Instance.new("Sound", workspace) do
            sound.SoundId = "rbxassetid://4590662766"
            sound.Volume = 2
            sound.PlayOnRemove = true
            sound:Destroy()
        end
    --end
end
function Script.Functions.Warn(message: string)
    warn("警告 - voidware:", message)
end
function Script.Functions.ESP(args: ESP)
    if not args.Object then return Script.Functions.Warn("透视对象为空") end
    local ESPManager = {
        Object = args.Object,
        Text = args.Text or "无文本",
        TextParent = args.TextParent,
        Color = args.Color or Color3.new(),
        Offset = args.Offset or Vector3.zero,
        IsEntity = args.IsEntity or false,
        Type = args.Type or "None",
        Highlights = {},
        Humanoid = nil,
        RSConnection = nil,
        Connections = {}
    }
    local tableIndex = #Script.ESPTable[ESPManager.Type] + 1
    if ESPManager.IsEntity and ESPManager.Object.PrimaryPart.Transparency == 1 then
        ESPManager.Object:SetAttribute("Transparency", ESPManager.Object.PrimaryPart.Transparency)
        ESPManager.Humanoid = Instance.new("Humanoid", ESPManager.Object)
        ESPManager.Object.PrimaryPart.Transparency = 0.99
    end
    local highlight = Instance.new("Highlight") do
        highlight.Adornee = ESPManager.Object
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = ESPManager.Color
        highlight.FillTransparency = Options.ESPFillTransparency.Value
        highlight.OutlineColor = ESPManager.Color
        highlight.OutlineTransparency = Options.ESPOutlineTransparency.Value
        highlight.Enabled = Toggles.ESPHighlight.Value
        highlight.Parent = ESPManager.Object
    end
    table.insert(ESPManager.Highlights, highlight)
    
    local billboardGui = Instance.new("BillboardGui") do
        billboardGui.Adornee = ESPManager.TextParent or ESPManager.Object
		billboardGui.AlwaysOnTop = true
		billboardGui.ClipsDescendants = false
		billboardGui.Size = UDim2.new(0, 1, 0, 1)
		billboardGui.StudsOffset = ESPManager.Offset
        billboardGui.Parent = ESPManager.TextParent or ESPManager.Object
	end
    local textLabel = Instance.new("TextLabel") do
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.Oswald
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.Text = ESPManager.Text
		textLabel.TextColor3 = ESPManager.Color
		textLabel.TextSize = Options.ESPTextSize.Value
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.TextStrokeTransparency = 0.75
        textLabel.Parent = billboardGui
	end
    function ESPManager.SetColor(newColor: Color3)
        ESPManager.Color = newColor
        for _, highlight in pairs(ESPManager.Highlights) do
            highlight.FillColor = newColor
            highlight.OutlineColor = newColor
        end
        textLabel.TextColor3 = newColor
    end
    function ESPManager.Destroy()
        if ESPManager.RSConnection then
            ESPManager.RSConnection:Disconnect()
        end
        if ESPManager.IsEntity and ESPManager.Object then
            if ESPManager.Object.PrimaryPart then
                ESPManager.Object.PrimaryPart.Transparency = ESPManager.Object.PrimaryPart:GetAttribute("Transparency")
            end
            if ESPManager.Humanoid then
                ESPManager.Humanoid:Destroy()
            end
        end
        for _, highlight in pairs(ESPManager.Highlights) do
            highlight:Destroy()
        end
        if billboardGui then billboardGui:Destroy() end
        if Script.ESPTable[ESPManager.Type][tableIndex] then
            Script.ESPTable[ESPManager.Type][tableIndex] = nil
        end
        for _, conn in pairs(ESPManager.Connections) do
            pcall(function()
                conn:Disconnect()
            end)
        end
        ESPManager.Connections = {}
    end
    ESPManager.RSConnection = RunService.RenderStepped:Connect(function()
        if not ESPManager.Object or not ESPManager.Object:IsDescendantOf(workspace) then
            ESPManager.Destroy()
            return
        end
        for _, highlight in pairs(ESPManager.Highlights) do
            highlight.Enabled = Toggles.ESPHighlight.Value
            highlight.FillTransparency = Options.ESPFillTransparency.Value
            highlight.OutlineTransparency = Options.ESPOutlineTransparency.Value
        end
        textLabel.TextSize = Options.ESPTextSize.Value
        if Toggles.ESPDistance.Value then
            textLabel.Text = string.format("%s\n[%s]", ESPManager.Text, math.floor(Script.Functions.DistanceFromCharacter(ESPManager.Object)))
        else
            textLabel.Text = ESPManager.Text
        end
    end)
    function ESPManager.GiveSignal(signal)
        table.insert(ESPManager.Connections, signal)
    end
    Script.ESPTable[ESPManager.Type][tableIndex] = ESPManager
    return ESPManager
end
function Script.Functions.SeekerESP(player : Player)
    if player:GetAttribute("IsHunter") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local esp = Script.Functions.ESP({
            Object = player.Character,
            Text = player.Name .. " (追捕者)",
            Color = Options.SeekerEspColor.Value,
            Offset = Vector3.new(0, 3, 0),
            Type = "Seeker"
        })
    end
end
function Script.Functions.HiderESP(player : Player)
    if player:GetAttribute("IsHider") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local esp = Script.Functions.ESP({
            Object = player.Character,
            Text = player.Name .. " (躲藏者)",
            Color = Options.HiderEspColor.Value,
            Offset = Vector3.new(0, 3, 0),
            Type = "Hider"
        })
        player:GetAttributeChangedSignal("IsHider"):Once(function()
            if not player:GetAttribute("IsHider") then
                esp.Destroy()
            end
        end)
    end
end
function Script.Functions.KeyESP(key)
    if key:IsA("Model") and key.PrimaryPart then
        local esp = Script.Functions.ESP({
            Object = key,
            Text = key.Name .. " (钥匙)",
            Color = Options.KeyEspColor.Value,
            Offset = Vector3.new(0, 1, 0),
            Type = "Key",
            IsEntity = true
        })
    end
end
function Script.Functions.DoorESP(door)
    if door:IsA("Model") and door.Name == "FullDoorAnimated" and door.PrimaryPart then
        local keyNeeded = door:GetAttribute("KeyNeeded") or "无"
        local esp = Script.Functions.ESP({
            Object = door,
            Text = "门 (所需钥匙: " .. keyNeeded .. ")",
            Color = Options.DoorEspColor.Value,
            Offset = Vector3.new(0, 2, 0),
            Type = "Door",
            IsEntity = true
        })
    end
end
function Script.Functions.EscapeDoorESP(door)
    if door:IsA("Model") and door.Name == "EXITDOOR" and door.PrimaryPart and door:GetAttribute("CANESCAPE") then
        local esp = Script.Functions.ESP({
            Object = door,
            Text = "逃生门",
            Color = Options.EscapeDoorEspColor.Value,
            Offset = Vector3.new(0, 2, 0),
            Type = "EscapeDoor",
            IsEntity = true
        })
    end
end
function Script.Functions.GuardESP(character)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local esp = Script.Functions.ESP({
            Object = character,
            Text = "守卫",
            Color = Options.GuardEspColor.Value,
            Offset = Vector3.new(0, 3, 0),
            Type = "Guard"
        })
        table.insert(esp.Connections, character.ChildAdded:Connect(function(v)
            if v.Name == "Dead" and v.ClassName == "Folder" then
                esp.Destroy()
            end
        end))
    end
end
function Script.Functions.PlayerESP(player: Player)
    if not (player.Character and player.Character.PrimaryPart and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0) then return end
    local playerEsp = Script.Functions.ESP({
        Type = "Player",
        Object = player.Character,
        Text = string.format("%s [%s]", player.DisplayName, player.Character.Humanoid.Health),
        TextParent = player.Character.PrimaryPart,
        Color = Options.PlayerEspColor.Value
    })
    playerEsp.GiveSignal(player.Character.Humanoid.HealthChanged:Connect(function(newHealth)
        if newHealth > 0 then
            playerEsp.Text = string.format("%s [%s]", player.DisplayName, newHealth)
        else
            playerEsp.Destroy()
        end
    end))
end
Script.Functions.SafeRequire = function(module)
    if Script.Temp[tostring(module)] then return Script.Temp[tostring(module)] end
    local suc, err = pcall(function()
        return require(module)
    end)
    if not suc then
        warn("[安全加载]：加载 "..tostring(module).." 失败 ("..tostring(err)..")")
    else
        Script.Temp[tostring(module)] = err
    end
    return suc and err
end
Script.Functions.ExecuteClick = function()
    local args = {
        "Clicked"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("Event"):FireServer(unpack(args))    
end
Script.Functions.CompleteDalgonaGame = function()
    Script.Functions.ExecuteClick()
    local args = {
        {
            Completed = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DALGONATEMPREMPTE"):FireServer(unpack(args))
    local args = {
        {
            Success = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DALGONATEMPREMPTE"):FireServer(unpack(args))
end
Script.Functions.PullRope = function(perfect)
    local args = {
        {
            PerfectQTE = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TemporaryReachedBindable"):FireServer(unpack(args))
end
function Script.Functions.RevealGlassBridge()
    local Effects = Script.Functions.SafeRequire(ReplicatedStorage.Modules.Effects) or {
        AnnouncementTween = function(args)
            Script.Functions.Alert(args.AnnouncementDisplayText, args.DisplayTime)
        end
    }
    local glassHolder = workspace:FindFirstChild("GlassBridge") and workspace.GlassBridge:FindFirstChild("GlassHolder")
    if not glassHolder then
        warn("在 workspace.GlassBridge 中未找到 GlassHolder")
        return
    end
    for _, tilePair in pairs(glassHolder:GetChildren()) do
        for _, tileModel in pairs(tilePair:GetChildren()) do
            if tileModel:IsA("Model") and tileModel.PrimaryPart then
                local primaryPart = tileModel.PrimaryPart
                for _, child in ipairs(tileModel:GetChildren()) do
                    if child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
                local isBreakable = primaryPart:GetAttribute("exploitingisevil") == true
                local targetColor = isBreakable and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
                local transparency = 0.5
                for _, part in pairs(tileModel:GetDescendants()) do
                    if part:IsA("BasePart") then
                        TweenService:Create(part, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                            Transparency = transparency,
                            Color = targetColor
                        }):Play()
                    end
                end
                local highlight = Instance.new("Highlight")
                highlight.FillColor = targetColor
                highlight.FillTransparency = 0.7
                highlight.OutlineTransparency = 0.5
                highlight.Parent = tileModel
            end
        end
    end
    Effects.AnnouncementTween({
        AnnouncementOneLine = true,
        FasterTween = true,
        DisplayTime = 10,
        AnnouncementDisplayText = "[Voidware]：安全瓷砖为绿色，易碎瓷砖为红色！"
    })
end
local EffectsModule
Script.Functions.OnLoad = function()
    EffectsModule = EffectsModule or Script.Functions.SafeRequire(ReplicatedStorage.Modules.Effects) or {
        AnnouncementTween = function(args)
            Script.Functions.Alert(args.AnnouncementDisplayText, args.DisplayTime)
        end
    }
    Script.Functions.EffectsNotification("Voidware - 墨水游戏加载完成！", 5)
    Script.Functions.EffectsNotification("加入 discord.gg/voidware 获取更新 :)", 5)
end
function Script.Functions.EffectsNotification(text, dur)
    EffectsModule = EffectsModule or Script.Functions.SafeRequire(ReplicatedStorage.Modules.Effects) or {
        AnnouncementTween = function(args)
            Script.Functions.Alert(args.AnnouncementDisplayText, args.DisplayTime)
        end
    }
    dur = dur or 5
    text = tostring(text)
    EffectsModule.AnnouncementTween({
        AnnouncementOneLine = true,
        FasterTween = true,
        DisplayTime = dur,
        AnnouncementDisplayText = text
    })
end
Script.Functions.BypassRagdoll = function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    if not Character then return end
    local Humanoid = Character:FindFirstChild("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Torso = Character:FindFirstChild("Torso")
    if not (Humanoid and HumanoidRootPart and Torso) then return end
    if Script.Temp.RagdollBlockConn then
        Script.Temp.RagdollBlockConn:Disconnect()
    end
    Script.Temp.RagdollBlockConn = Character.ChildAdded:Connect(function(child)
        if child.Name == "Ragdoll" then
            pcall(function() child:Destroy() end)
            pcall(function()
                Humanoid.PlatformStand = false
                Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            end)
        end
    end)
    for _, child in ipairs(Character:GetChildren()) do
        if child.Name == "Ragdoll" then
            pcall(function() child:Destroy() end)
        end
    end
    for _, folderName in pairs({"Stun", "RotateDisabled", "RagdollWakeupImmunity", "InjuredWalking"}) do
        local folder = Character:FindFirstChild(folderName)
        if folder then
            folder:Destroy()
        end
    end
    for _, obj in pairs(HumanoidRootPart:GetChildren()) do
        if obj:IsA("BallSocketConstraint") or obj.Name:match("^CacheAttachment") then
            obj:Destroy()
        end
    end
    local joints = {"Left Hip", "Left Shoulder", "Neck", "Right Hip", "Right Shoulder"}
    for _, jointName in pairs(joints) do
        local motor = Torso:FindFirstChild(jointName)
        if motor and motor:IsA("Motor6D") and not motor.Part0 then
            motor.Part0 = Torso
        end
    end
    for _, part in pairs(Character:GetChildren()) do
        if part:IsA("BasePart") and part:FindFirstChild("BoneCustom") then
            part.BoneCustom:Destroy()
        end
    end
end
Script.Functions.BypassDalgonaGame = function()
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    local Humanoid = Character and Character:FindFirstChild("Humanoid")
    local PlayerGui = LocalPlayer.PlayerGui
    local DebrisBD = LocalPlayer:WaitForChild("DebrisBD")
    local CurrentCamera = workspace.CurrentCamera
    local EffectsFolder = workspace:FindFirstChild("Effects")
    local ImpactFrames = PlayerGui:FindFirstChild("ImpactFrames")
    local originalCameraType = CurrentCamera.CameraType
    local originalCameraSubject = CurrentCamera.CameraSubject
    local originalFieldOfView = CurrentCamera.FieldOfView
    local shapeModel, outlineModel, pickModel, redDotModel
    if EffectsFolder then
        for _, obj in pairs(EffectsFolder:GetChildren()) do
            if obj:IsA("Model") and obj.Name:match("Outline$") then
                outlineModel = obj
            elseif obj:IsA("Model") and not obj.Name:match("Outline$") and obj.Name ~= "Pick" and obj.Name ~= "RedDot" then
                shapeModel = obj
            elseif obj.Name == "Pick" then
                pickModel = obj
            elseif obj.Name == "RedDot" then
                redDotModel = obj
            end
        end
    end
    local progressBar = ImpactFrames and ImpactFrames:FindFirstChild("ProgressBar")
    local pickViewportModel
    if ImpactFrames then
        for _, obj in pairs(ImpactFrames:GetChildren()) do
            if obj:IsA("ViewportFrame") and obj:FindFirstChild("PickModel") then
                pickViewportModel = obj.PickModel
                break
            end
        end
    end
    local Remotes = ReplicatedStorage:WaitForChild("Remotes")
    local DalgonaRemote = Remotes:WaitForChild("DALGONATEMPREMPTE")
    
    local cameraOverrideActive = true
    local cameraOverrideConnection
    
    task.spawn(function()
        SharedFunctions.CreateFolder(LocalPlayer, "RecentGameStartedMessage", 0.01)
        if shapeModel and shapeModel:FindFirstChild("shape") then
            TweenService:Create(shapeModel.shape, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                Position = shapeModel.shape.Position + Vector3.new(0, 0.5, 0)
            }):Play()
        end
        if shapeModel then
            for _, part in pairs(shapeModel:GetChildren()) do
                if part.Name == "DalgonaClickPart" and part:IsA("BasePart") then
                    TweenService:Create(part, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                        Transparency = 1
                    }):Play()
                end
            end
        end
        if pickModel and pickModel.Parent then
            TweenService:Create(pickModel, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                Transparency = 1
            }):Play()
        end
        if redDotModel and redDotModel.Parent then
            TweenService:Create(redDotModel, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                Transparency = 1
            }):Play()
        end
        if pickViewportModel then
            for _, part in pairs(pickViewportModel:GetDescendants()) do
                if part:IsA("BasePart") then
                    TweenService:Create(part, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                        Transparency = 1
                    }):Play()
                end
            end
        end
        if HumanoidRootPart then
            TweenService:Create(CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Quad), {
                CFrame = HumanoidRootPart.CFrame * CFrame.new(0.0841674805, 8.45438766, 6.69675446, 0.999918401, -0.00898250192, 0.00907994807, 3.31699681e-08, 0.710912943, 0.703280032, -0.0127722733, -0.703222632, 0.710854948)
            }):Play()
        end
        SharedFunctions.Invisible(Character, 0, true)
        DalgonaRemote:FireServer({
            Success = true
        })
        task.wait(2)
        for _, obj in pairs({shapeModel, outlineModel, pickModel, redDotModel, progressBar}) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        UserInputService.MouseIconEnabled = true
        if PlayerGui:FindFirstChild("Hotbar") and PlayerGui.Hotbar:FindFirstChild("Backpack") then
            TweenService:Create(PlayerGui.Hotbar.Backpack, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
        end
        if progressBar then
            DebrisBD:Fire(progressBar, 2)
            TweenService:Create(progressBar, TweenInfo.new(1.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
                Position = UDim2.new(progressBar.Position.X.Scale, 0, progressBar.Position.Y.Scale + 1, 0)
            }):Play()
        end
        task.wait(0.5)
        cameraOverrideActive = false
        
        CurrentCamera.CameraType = Enum.CameraType.Custom
        if Humanoid then
            CurrentCamera.CameraSubject = Humanoid
        end
        CurrentCamera.FieldOfView = originalFieldOfView or 70
        
        camera = CurrentCamera
    end)
    cameraOverrideConnection = RunService.RenderStepped:Connect(function()
        if not cameraOverrideActive then
            cameraOverrideConnection:Disconnect()
            return
        end
        
        if CurrentCamera.CameraType == Enum.CameraType.Scriptable then
            CurrentCamera.CameraType = Enum.CameraType.Custom
        end
        
        if Humanoid and CurrentCamera.CameraSubject ~= Humanoid then
            CurrentCamera.CameraSubject = Humanoid
        end
    end)
    return function()
        cameraOverrideActive = false
        if cameraOverrideConnection then
            cameraOverrideConnection:Disconnect()
        end
        
        for _, obj in pairs({shapeModel, outlineModel, pickModel, redDotModel, progressBar}) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        UserInputService.MouseIconEnabled = true
        CurrentCamera.CameraType = Enum.CameraType.Custom
        if Humanoid then
            CurrentCamera.CameraSubject = Humanoid
        end
        CurrentCamera.FieldOfView = originalFieldOfView or 70
        
        camera = CurrentCamera
    end
end
Script.Functions.GetRootPart = function()
    if not lplr.Character then return end
    local rp = lplr.Character:WaitForChild("HumanoidRootPart", 10)
    return rp
end
Script.Functions.GetHumanoid = function()
    if not lplr.Character then return end
    local rp = lplr.Character:WaitForChild("Humanoid", 10)
    return rp
end
local tools = {"Fork", "Bottle", "Knife"}
Script.Functions.GetFork = function()
    local res
    for _, index in pairs(tools) do
        local tool = lplr.Character:FindFirstChild(index) or lplr:FindFirstChild("Backpack") and lplr.Backpack:FindFirstChild(index)
        if tool then
            res = tool
            break
        end
    end
    return res
end
Script.Functions.FireForkRemote = function()
    local fork = Script.Functions.GetFork()
    if not fork then return end
    if fork.Parent.Name == "Backpack" then
        lplr.Character.Humanoid:EquipTool(fork)
    end
    fork = Script.Functions.GetFork()
    print(fork)
    if not fork then return end
    local args = {
        "UsingMoveCustom",
        fork,
        [4] = {
            Clicked = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UsedTool"):FireServer(unpack(args))
    print("已触发1")
    local args = {
        "UsingMoveCustom",
        fork,
        true,
        {
            Clicked = true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UsedTool"):FireServer(unpack(args))
    print("已触发2")
    
end
Script.Functions.JoinDiscordServer = function()
    local sInvite = "https://discord.com/invite/voidware"
    
    local function getInviteCode(sInvite)
        for i = #sInvite, 1, -1 do
            local char = sInvite:sub(i, i)
            if char == "/" then
                return sInvite:sub(i + 1, #sInvite)
            end
        end
        return sInvite
    end
    
    local function getInviteData(sInvite)
        local success, result = pcall(function()
            return HttpService:JSONDecode(request({
                Url = "https://ptb.discord.com/api/invites/".. getInviteCode(sInvite),
                Method = "GET"
            }).Body)
        end)
        if not success then
            warn("获取邀请数据失败:\n".. result)
            return
        end
        return success, result
    end
    local success, result = getInviteData(sInvite)
	if success and result then
        request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {
                    code = result.code
                },
                nonce = HttpService:GenerateGUID(false)
            })
        })
	end
    pcall(function()
        setclipboard("discord.gg/voidware")
    end)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Voidware Discord - discord.gg/voidware",
        Text = "已复制到剪贴板 (discord.gg/voidware)",
        Duration = 10,
    })
end
function Script.Functions.GetDalgonaRemote()
    return game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("DALGONATEMPREMPTE")
end
function Script.Functions.DistanceFromCharacter(position: Instance | Vector3)
    if typeof(position) == "Instance" then
        position = position:GetPivot().Position
    end
    if not alive then
        return (camera.CFrame.Position - position).Magnitude
    end
    return (rootPart.Position - position).Magnitude
end
Script.Functions.FixCamera = function()
    if workspace.CurrentCamera then
        pcall(function()
            workspace.CurrentCamera:Destroy()
        end)
    end
    local new = Instance.new("Camera")
    new.Parent = workspace
    workspace.CurrentCamera = new
    new.CameraType = Enum.CameraType.Custom
    new.CameraSubject = lplr.Character.Humanoid
end
Script.Functions.RestoreVisibility = function(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" and part.Name ~= "BoneCustom" then
            if part.Transparency >= 0.99 or part.LocalTransparencyModifier >= 0.99 then
                wasInvisible = true
                part.Transparency = 0
                part.LocalTransparencyModifier = 0
            end
        end
    end
    pcall(function()
        character.HumanoidRootPart.Transparency = 1
    end)
    pcall(function()
        character.Head.BoneCustom.Transparency = 1
    end)
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Accessory") or item:IsA("Clothing") then
            if item:IsA("Accessory") then
                local handle = item:FindFirstChild("Handle")
                if handle and handle.Transparency >= 0.99 then
                    handle.Transparency = 0
                end
            end
        end
    end
end
Script.Functions.CheckPlayersVisibility = function()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            Script.Functions.RestoreVisibility(player.Character)
        end
    end
end
function Script.Functions.SetupOtherPlayerConnection(player: Player)
    if player.Character then
        if Toggles.PlayerESP.Value then
            Script.Functions.PlayerESP(player)
        end
    end
    Library:GiveSignal(player.CharacterAdded:Connect(function(newCharacter)
        task.delay(0.1, function()
            if Toggles.PlayerESP.Value then
                Script.Functions.PlayerESP(player)
            end
        end)
    end))
end
function Script.Functions.DisableAntiFling()
    if Toggles.AntiFlingToggle.Value then
        Toggles.AntiFlingToggle:SetValue(false)
    end
end
function Script.Functions.EnableAntiFling()
    if not Toggles.AntiFlingToggle.Value then
        Toggles.AntiFlingToggle:SetValue(true)
    end
end
function Script.Functions.WinRLGL()
    if not lplr.Character then return end
    local call = Toggles.AntiFlingToggle.Value
    Script.Functions.DisableAntiFling()
    lplr.Character:PivotTo(CFrame.new(Vector3.new(-100.8, 1030, 115)))
    if call then
        task.delay(0.5, Script.Functions.EnableAntiFling)
    end
end
function Script.Functions.TeleportSafe()
    if not lplr.Character then return end
    pcall(function()
        Script.Temp.OldLocation = CFrame.new(lplr.Character.HumanoidRootPart.Position)
    end)
    local call = Toggles.AntiFlingToggle.Value
    Script.Functions.DisableAntiFling()
    lplr.Character:PivotTo(CFrame.new(Vector3.new(-108, 329.1, 462.1)))
    if call then
        task.delay(0.5, Script.Functions.EnableAntiFling)
    end
end
function Script.Functions.TeleportBackFromSafe()
    local OldLocation = Script.Temp.OldLocation
    if not OldLocation then
        warn("[位置无效]")
        return
    end
    if lplr.Character then
        lplr.Character:PivotTo(OldLocation)
    end
end
function Script.Functions.TeleportSafeHidingSpot()
    if not lplr.Character then return end
    local call = Toggles.AntiFlingToggle.Value
    Script.Functions.DisableAntiFling()
    lplr.Character:PivotTo(CFrame.new(Vector3.new(229.9, 1005.3, 169.4)))
    if call then
        task.delay(0.5, Script.Functions.EnableAntiFling)
    end
end
function Script.Functions.WinGlassBridge()
    if not lplr.Character then return end
    local call = Toggles.AntiFlingToggle.Value
    Script.Functions.DisableAntiFling()
    lplr.Character:PivotTo(CFrame.new(Vector3.new(-203.9, 520.7, -1534.3485)))
    if call then
        task.delay(0.5, Script.Functions.EnableAntiFling)
    end
end
local MAIN_ESP_META = {
    {
        metaName = "PlayerESP",
        text = "Player",
        default = false,
        color = {
            metaName = "PlayerEspColor",
            default = Color3.fromRGB(255, 255, 255)
        },
        func = function()
            for _, player in pairs(Players:GetPlayers()) do
                if player == localPlayer then continue end
                Script.Functions.PlayerESP(player)
            end
        end
    },
    {
        metaName = "GuardESP",
        text = "Guard",
        default = false,
        color = {
            metaName = "GuardEspColor",
            default = Color3.fromRGB(200, 100, 200)
        },
        func = function()
            local live = workspace:FindFirstChild("Live")
            if not live then return end
            for _, descendant in pairs(live:GetChildren()) do
                if descendant:IsA("Model") and descendant.Parent and descendant.Parent.Name == "Live" and descendant:FindFirstChild("TypeOfGuard") then
                    if string.find(descendant.Name, "RebelGuard") or string.find(descendant.Name, "FinalRebel") or string.find(descendant.Name, "HallwayGuard") or string.find(string.lower(descendant.Name), "aggro") then
                        Script.Functions.GuardESP(descendant)
                    end
                end
            end
        end,
        descendantcheck = function(descendant)
            if descendant:IsA("Model") and descendant.Parent and descendant.Parent.Name == "Live" and descendant:FindFirstChild("TypeOfGuard") then
                if string.find(descendant.Name, "RebelGuard") or string.find(descendant.Name, "FinalRebel") or string.find(descendant.Name, "HallwayGuard") or string.find(string.lower(descendant.Name), "aggro") then
                    Script.Functions.GuardESP(descendant)
                end
            end
        end
    }
}
local MainESPGroup = Tabs.Visuals:AddLeftGroupbox("主要透视", "eye") do
    for _, meta in pairs(MAIN_ESP_META) do
        MainESPGroup:AddToggle(meta.metaName, {
            Text = meta.text,
            Default = meta.default
        }):AddColorPicker(meta.color.metaName, {
            Default = meta.color.default
        })
        Toggles[meta.metaName]:OnChanged(function(call)
            if call then
                if meta.func then
                    meta.func(call)
                end
            else
                for _, esp in pairs(Script.ESPTable[meta.text]) do
                    esp.Destroy()
                end
            end
        end)
        if meta.descendantcheck then
            Library:GiveSignal(workspace.DescendantAdded:Connect(function(descendant)
                if not Toggles[meta.metaName].Value then return end
                meta.descendantcheck(descendant)
            end))
        end
    end
end
local ESP_META = {
    {
        metaName = "HiderESP",
        text = "Hider",
        default = false,
        color = {
            metaName = "HiderEspColor",
            default = Color3.fromRGB(0, 255, 0)
        },
        checkType = "player"
    },
    {
        metaName = "SeekerESP",
        text = "Seeker",
        default = false,
        color = {
            metaName = "SeekerEspColor",
            default = Color3.fromRGB(255, 0, 0)
        },
        checktype = "player"
    },
    {
        metaName = "KeyESP",
        text = "Key",
        default = false,
        color = {
            metaName = "KeyEspColor",
            default = Color3.fromRGB(255, 255, 0)
        },
        checktype = "key",
        descendantcheck = function(descendant)
            local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
            if not hideAndSeekMap then return end
            if descendant:IsA("Model") and descendant.Parent and descendant.Parent.Name == "KEYS" and descendant.Parent.Parent == hideAndSeekMap then
                Script.Functions.KeyESP(descendant)
            end
        end
    },
    {
        metaName = "DoorESP",
        text = "Door",
        default = false,
        color = {
            metaName = "DoorEspColor",
            default = Color3.fromRGB(0, 128, 255)
        },
        checktype = "door",
        descendantcheck = function(descendant)
            local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
            if not hideAndSeekMap then return end
            if descendant:IsA("Model") and descendant.Name == "FullDoorAnimated" and descendant.Parent and descendant.Parent.Parent and descendant.Parent.Parent.Name == "NEWFIXEDDOORS" then
                Script.Functions.DoorESP(descendant)
            end
        end
    },
    {
        metaName = "EscapeDoorESP",
        text = "Escape Door",
        default = false,
        color = {
            metaName = "EscapeDoorEspColor",
            default = Color3.fromRGB(255, 0, 255)
        },
        checktype = "escapedoor",
        descendantcheck = function(descendant)
            local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
            if not hideAndSeekMap then return end
            if descendant:IsA("Model") and descendant.Name == "EXITDOOR" and descendant.PrimaryPart and descendant:GetAttribute("CANESCAPE") then
                Script.Functions.EscapeDoorESP(descendant)
            end
        end
    },
}
local ESPGroupBox = Tabs.Visuals:AddLeftGroupbox("捉迷藏透视", "search") do
    for _, meta in pairs(ESP_META) do
        ESPGroupBox:AddToggle(meta.metaName, {
            Text = meta.text,
            Default = meta.default
        }):AddColorPicker(meta.color.metaName, {
            Default = meta.color.default
        })
        Toggles[meta.metaName]:OnChanged(function(call)
            if call then
                if not string.find(Script.GameState, "HideAndSeek") then return end
                if meta.checktype == "player" then
                    for _, player in pairs(Players:GetPlayers()) do
                        Script.Functions[meta.metaName](player)
                    end
                elseif meta.checktype == "key" then
                    local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
                    if hideAndSeekMap then
                        local keysFolder = hideAndSeekMap:FindFirstChild("KEYS")
                        if keysFolder then
                            for _, key in pairs(keysFolder:GetChildren()) do
                                Script.Functions.KeyESP(key)
                            end
                        end
                    end
                elseif meta.checktype == "door" then
                    local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
                    if hideAndSeekMap then
                        local newFixedDoors = hideAndSeekMap:FindFirstChild("NEWFIXEDDOORS")
                        if newFixedDoors then
                            for _, floor in pairs(newFixedDoors:GetChildren()) do
                                if floor.Name:match("^Floor") then
                                    for _, door in pairs(floor:GetChildren()) do
                                        Script.Functions.DoorESP(door)
                                    end
                                end
                            end
                        end
                    end
                elseif meta.checktype == "escapedoor" then
                    local hideAndSeekMap = workspace:FindFirstChild("HideAndSeekMap")
                    if hideAndSeekMap then
                        local newFixedDoors = hideAndSeekMap:FindFirstChild("NEWFIXEDDOORS")
                        if newFixedDoors then
                            for _, floor in pairs(newFixedDoors:GetChildren()) do
                                if floor.Name:match("^Floor") then
                                    for _, group in pairs(floor:GetChildren()) do
                                        if group.Name == "EXITDOORS" then
                                            for _, door in pairs(group:GetChildren()) do
                                                if door:IsA("Model") and door.Name == "EXITDOOR" and door.PrimaryPart and door:GetAttribute("CANESCAPE") then
                                                    Script.Functions.EscapeDoorESP(door)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else
                for _, esp in pairs(Script.ESPTable[meta.text]) do
                    esp.Destroy()
                end
            end
        end)
        Options[meta.color.metaName]:OnChanged(function(value)
            Script.ESPTable[meta.text] = Script.ESPTable[meta.text] or {}
            for _, esp in pairs(Script.ESPTable[meta.text]) do
                esp.SetColor(value)
            end
        end)
        if meta.descendantcheck then
            Library:GiveSignal(workspace.DescendantAdded:Connect(function(descendant)
                if not string.find(Script.GameState, "HideAndSeek") then return end
                if not Toggles[meta.metaName].Value then return end
                meta.descendantcheck(descendant)
            end))
        end
    end
end
local ESPSettingsGroupBox = Tabs.Visuals:AddRightGroupbox("透视设置", "sliders") do
    ESPSettingsGroupBox:AddToggle("ESPHighlight", {
        Text = "启用高亮",
        Default = true,
    })
    ESPSettingsGroupBox:AddToggle("ESPDistance", {
        Text = "显示距离",
        Default = true,
    })
    ESPSettingsGroupBox:AddSlider("ESPFillTransparency", {
        Text = "填充透明度",
        Default = 0.75,
        Min = 0,
        Max = 1,
        Rounding = 2
    })
    ESPSettingsGroupBox:AddSlider("ESPOutlineTransparency", {
        Text = "轮廓透明度",
        Default = 0,
        Min = 0,
        Max = 1,
        Rounding = 2
    })
    ESPSettingsGroupBox:AddSlider("ESPTextSize", {
        Text = "文本大小",
        Default = 22,
        Min = 16,
        Max = 26,
        Rounding = 0
    })
end
local SelfGroupBox = Tabs.Visuals:AddRightGroupbox("自身", "user") do
    SelfGroupBox:AddToggle("FOVToggle", {
        Text = "视野",
        Default = false
    })
    SelfGroupBox:AddSlider("FOVSlider", {
        Text = "视野值",
        Default = 60, 
        Min = 10,
        Max = 120,
        Rounding = 1
    })
end
local FunGroupBox = Tabs.Main:AddLeftGroupbox("功能", "zap") do
    FunGroupBox:AddToggle("InkGameAutowin", {
        Text = "自动获胜 â­",
        Default = false
    })
    Toggles.InkGameAutowin:OnChanged(function(call)
        if call then
            Script.Functions.Alert("自动获胜已启用！", 3)
            task.spawn(function()
                Script.Functions.EffectsNotification("自动获胜已启用！", 5)
            end)
            Script.Functions.HandleAutowin()
        else
            Script.Functions.Alert("自动获胜已禁用！", 3)
        end
    end)
    FunGroupBox:AddToggle("FlingAuraToggle", {
        Text = "抛射光环",
        Default = false
    })
    
    FunGroupBox:AddToggle("AntiFlingToggle", {
        Text = "防抛射",
        Default = false
    })
    
    Toggles.AntiFlingToggle:OnChanged(function(call)
        if call then
            Script.Temp.PauseAntiFling = nil
            Script.Functions.Alert("防抛射已启用", 3)
            Script.Temp.AntiFlingActive = true
            Script.Temp.AntiFlingLoop = task.spawn(function()
                local lastSafeCFrame = nil
                while Script.Temp.AntiFlingActive and not Library.Unloaded do
                    if Script.Temp.PauseAntiFling then return end
                    local character = lplr.Character
                    local root = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso"))
                    if root then
                        local gs = Script.GameState
                        local isActiveGame = gs and gs ~= "" and States[gs] ~= nil
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BodyMover") or part:IsA("BodyVelocity") or part:IsA("BodyGyro") or part:IsA("BodyThrust") or part:IsA("BodyAngularVelocity") then
                                part:Destroy()
                            end
                        end
                        local maxVel = 100
                        local vel = root.Velocity
                        if vel.Magnitude > maxVel then
                            root.Velocity = Vector3.new(
                                math.clamp(vel.X, -maxVel, maxVel),
                                math.clamp(vel.Y, -maxVel, maxVel),
                                math.clamp(vel.Z, -maxVel, maxVel)
                            )
                        end
                        if not lastSafeCFrame or (root.Position - lastSafeCFrame.Position).Magnitude < 20 then
                            lastSafeCFrame = root.CFrame
                        elseif isActiveGame and (root.Position - lastSafeCFrame.Position).Magnitude > 50 then
                            root.CFrame = lastSafeCFrame
                            root.Velocity = Vector3.zero
                        end
                    end
                    task.wait(0.05)
                end
            end)
        else
            Script.Functions.Alert("防抛射已禁用", 3)
            Script.Temp.AntiFlingActive = false
            if Script.Temp.AntiFlingLoop then
                task.cancel(Script.Temp.AntiFlingLoop)
            end
        end
    end)
    FunGroupBox:AddToggle("KillauraInkGame", {
        Text = "自动攻击",
        Default = false
    })
    Toggles.KillauraInkGame:OnChanged(function(call)
        if call then
            pcall(function()
                if Toggles.RedLightGodmode.Value then
                    Toggles.RedLightGodmode:SetValue(false)
                end
            end)
            local fork = Script.Functions.GetFork()
            if not fork then
                Script.Functions.Alert("未找到武器！", 3)
                Toggles.KillauraInkGame:SetValue(false)
                return
            end
            task.spawn(function()
                repeat
                    task.wait(0.5)
                    if Script.GameState == "RedLightGreenLight" then return end
                    Script.Functions.FireForkRemote()
                    local args = {
                        CFrame.new(lplr.Character.HumanoidRootPart.Position)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("rootCFrame"):FireServer(unpack(args))                  
                until not Toggles.KillauraInkGame.Value or Library.Unloaded
            end)
        end
    end)
    FunGroupBox:AddToggle("GhostMode", {
        Text = "幽灵模式",
        Default = false
    })
    Toggles.GhostMode:OnChanged(function(enabled)
        if enabled then
            Script.Functions.Alert("幽灵模式已激活", 3)
            Script.Temp.GhostModeEnabled = true
            
            local function setupGhostAppearance()
                local character = lplr.Character
                if not character then return end
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not rootPart then return end
                
                rootPart.Transparency = 0.4
                rootPart.Color = Color3.fromRGB(200, 200, 255)
                rootPart.Material = Enum.Material.Neon
            end
            local function hideCharacterParts()
                local character = lplr.Character
                if not character then return end
                
                for _, child in ipairs(character:GetDescendants()) do
                    if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
                        child.LocalTransparencyModifier = 1
                    elseif child:IsA("Decal") then
                        child.Transparency = 1
                    elseif child:IsA("LayerCollector") then
                        child.Enabled = false
                    end
                end
            end
            setupGhostAppearance()
            hideCharacterParts()
            Script.Temp.GhostModeLoop = RunService.Heartbeat:Connect(function()
                if not Script.Temp.GhostModeEnabled then return end
                
                local character = lplr.Character
                if not character then return end
                
                local humanoid = character:FindFirstChild("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if not humanoid or not rootPart or humanoid.RigType == Enum.HumanoidRigType.R6 then return end
                
                for _, child in ipairs(character:GetDescendants()) do
                    if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
                        child.LocalTransparencyModifier = 1
                    elseif child:IsA("Decal") then
                        child.Transparency = 1
                    elseif child:IsA("LayerCollector") then
                        child.Enabled = false
                    end
                end
                
                local originalCFrame = rootPart.CFrame
                local originalCameraOffset = humanoid.CameraOffset
                local floatingOffset = Vector3.new(0, humanoid.HipHeight + (rootPart.Size.Y / 2) - 0.8, 0)
                rootPart.CFrame = (rootPart.CFrame - floatingOffset) * CFrame.Angles(0, 0, math.rad(180))
                humanoid.CameraOffset = Vector3.new(0, -4.5, 0)
                
                local ghostAnimation = Instance.new("Animation")
                ghostAnimation.AnimationId = "http://www.roblox.com/asset/?id=11360825341"
                local animationTrack = humanoid.Animator:LoadAnimation(ghostAnimation)
                animationTrack.Priority = Enum.AnimationPriority.Action4
                animationTrack:Play()
                animationTrack.TimePosition = 0.15
                animationTrack:AdjustSpeed(0)
                
                RunService.RenderStepped:Wait()
                animationTrack:Stop()
                
                humanoid.CameraOffset = originalCameraOffset
                rootPart.CFrame = originalCFrame
            end)
            Script.Temp.GhostModeRespawn = lplr.CharacterAdded:Connect(function()
                if Script.Temp.GhostModeEnabled then
                    task.wait(0.6)
                    if Toggles.GhostMode.Value then
                        Toggles.GhostMode:SetValue(false)
                        Toggles.GhostMode:SetValue(true)
                    end
                end
            end)
        else
            Script.Functions.Alert("幽灵模式已关闭", 3)
            Script.Temp.GhostModeEnabled = false
            
            if Script.Temp.GhostModeLoop then
                Script.Temp.GhostModeLoop:Disconnect()
                Script.Temp.GhostModeLoop = nil
            end
            
            if Script.Temp.GhostModeRespawn then
                Script.Temp.GhostModeRespawn:Disconnect()
                Script.Temp.GhostModeRespawn = nil
            end
            local function restoreCharacterAppearance()
                local character = lplr.Character
                if not character then return end
                
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    rootPart.Transparency = 1
                end
                
                for _, child in ipairs(character:GetDescendants()) do
                    if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
                        child.LocalTransparencyModifier = 0
                    elseif child:IsA("Decal") then
                        child.Transparency = 0
                    elseif child:IsA("LayerCollector") then
                        child.Enabled = true
                    end
                end
            end
            restoreCharacterAppearance()
        end
    end)
    FunGroupBox:AddToggle("LightningGodAwakening", {
        Text = "闪电神觉醒",
        Default = false
    })
    Toggles.LightningGodAwakening:OnChanged(function(enabled)
        if enabled then
            Script.Functions.Alert("闪电神觉醒已启用", 3)
            Script.Temp.LightningGodEnabled = true
            
            local function executeLightningGodEffect()
                local character = lplr.Character
                if not character then return end
                
                local LightningGodModule = Script.Functions.SafeRequire(ReplicatedStorage.Modules.AbilityEffectsModules.LIGHTNINGGODAWAKENINGCLIENTEFFECTS)
                if not LightningGodModule then
                    Script.Functions.Alert("未找到闪电神模块！", 3)
                    return
                end
                
                local InterruptedFolder = Instance.new("Folder")
                InterruptedFolder.Name = "LightningGodInterrupted"
                InterruptedFolder.Parent = character
                
                local success, err = pcall(function()
                    LightningGodModule({
                        InterruptedFolder = InterruptedFolder,
                        Character = character,
                        ModuleName = "LIGHTNINGGODAWAKENING",
                        TimeLength = 5
                    })
                end)
                
                if not success then
                    Script.Functions.Alert("执行闪电神效果失败: " .. tostring(err), 3)
                else
                    Script.Functions.Alert("闪电神觉醒已执行！", 3)
                end
                
                task.delay(6, function()
                    if InterruptedFolder and InterruptedFolder.Parent then
                        InterruptedFolder:Destroy()
                    end
                end)
            end
            
            executeLightningGodEffect()
            
            Script.Temp.LightningGodLoop = task.spawn(function()
                repeat
                    task.wait(10)
                    if Script.Temp.LightningGodEnabled then
                        executeLightningGodEffect()
                    end
                until not Script.Temp.LightningGodEnabled or Library.Unloaded
            end)
            
            Script.Temp.LightningGodRespawn = lplr.CharacterAdded:Connect(function()
                if Script.Temp.LightningGodEnabled then
                    task.wait(1)
                    executeLightningGodEffect()
                end
            end)
        else
            Script.Functions.Alert("闪电神觉醒已禁用", 3)
            Script.Temp.LightningGodEnabled = false
            
            if Script.Temp.LightningGodLoop then
                task.cancel(Script.Temp.LightningGodLoop)
                Script.Temp.LightningGodLoop = nil
            end
            
            if Script.Temp.LightningGodRespawn then
                Script.Temp.LightningGodRespawn:Disconnect()
                Script.Temp.LightningGodRespawn = nil
            end
        end
    end)
    FunGroupBox:AddToggle("PhantomDash", {
        Text = "冲刺效果",
        Default = false
    }):AddColorPicker("PhantomDashColor", {
        Default = Color3.fromRGB(255, 255, 255)
    })
    
    Toggles.PhantomDash:OnChanged(function(call)
        if call then
            Script.Functions.Alert("幻影冲刺已启用", 3)
            Script.Temp.PhantomDashEnabled = true
            
            local function executePhantomDash()
                local character = lplr.Character
                if not character then return end
                
                local EffectsModule = Script.Functions.SafeRequire(ReplicatedStorage.Effects)
                if not EffectsModule then
                    Script.Functions.Alert("未找到效果模块！", 3)
                    return
                end
                
                local fakeDashingFolder = Instance.new("Folder")
                fakeDashingFolder.Name = "PhantomDashFolder"
                fakeDashingFolder.Parent = character
                Script.Temp.FakeDashingFolder = fakeDashingFolder
                
                fakeDashingFolder:SetAttribute("ICEROCKS", true)
                fakeDashingFolder:SetAttribute("LOOKVEC", "Forward")
                
                character:SetAttribute("ColorForEffects", Options.PhantomDashColor.Value)
                
                local success, err = pcall(function()
                    if EffectsModule.RenderDashEffects then
                        EffectsModule.RenderDashEffects({
                            Player = lplr,
                            DashingFolder = fakeDashingFolder
                        })
                    else
                        EffectsModule({
                            Player = lplr,
                            DashingFolder = fakeDashingFolder
                        })
                    end
                end)
                
                if not success then
                    Script.Functions.Alert("执行幻影冲刺失败: " .. tostring(err), 3)
                else
                    Script.Functions.Alert("幻影冲刺已执行！", 3)
                end
                
                task.delay(5, function()
                    if fakeDashingFolder and fakeDashingFolder.Parent then
                        fakeDashingFolder:Destroy()
                    end
                    if Script.Temp.FakeDashingFolder then
                        pcall(function()
                            Script.Temp.FakeDashingFolder:Destroy()
                        end)
                    end
                end)
            end
            
            executePhantomDash()
            
            Script.Temp.PhantomDashLoop = task.spawn(function()
                repeat
                    task.wait(8)
                    if Script.Temp.PhantomDashEnabled then
                        if Script.Temp.FakeDashingFolder then
                            pcall(function()
                                Script.Temp.FakeDashingFolder:Destroy()
                            end)
                        end
                        executePhantomDash()
                    end
                until not Script.Temp.PhantomDashEnabled or Library.Unloaded
            end)
            
            Script.Temp.PhantomDashRespawn = lplr.CharacterAdded:Connect(function()
                if Script.Temp.PhantomDashEnabled then
                    task.wait(1)
                    executePhantomDash()
                end
            end)
        else
            Script.Functions
