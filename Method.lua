--[[
    @Z某人翻译
    @description Shrimp game troll script
    https://www.roblox.com/games/7606564092/Shrimp-Game
]]

local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

local WindowConfig = {
    Title = "虾游戏工具 | 作者: depso",
    Size = UDim2.fromOffset(350, 300),
}

--// 大厅检查
if game.PlaceId == 7606564092 then
    ReGui:Window(WindowConfig):Center():Label({
        Text = "请加入一场比赛!"
    })
    return
end

--// 服务
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--// 远程事件
local Remotes = ReplicatedStorage.Remotes
local Events = Remotes.Events

local SpawnReference = workspace.SpawnReference
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local PlayerScripts = LocalPlayer.PlayerScripts
local Character = nil
local Humanoid = nil

local Controller = PlayerScripts.Controller
local EffectsEvent = Events.EffectsEvent

function ViewMe()
    Camera.CameraSubject = Character
end

--// 创建窗口
local Window = ReGui:Window(WindowConfig):Center()

--// 调试
local Debug = Window:TreeNode({Title="调试"})
local Console = Debug:Console({
    ReadOnly = true,
    AutoScroll = true,
    MaxLines = 50
})

--// 游戏
local Games = Window:TreeNode({Title="游戏"})
local SkipGames = Games:Checkbox({
    Value = true,
    Label = "跳过游戏"
})

--// 玩家
local Player = Window:TreeNode({Title="玩家"})
local NoFreze = Player:Checkbox({
    Value = false,
    Label = "不冻结"
})
local TheMethod = Player:Checkbox({
    Value = false,
    Label = "特殊方法"
})
local WalkSpeed = Player:SliderInt({
    Label = "滑块",
    Value = 18,
    Minium = 18,
    Maxium = 200
})

--// Spectator
local Spectator = Window:TreeNode({Title="旁观者"})
Spectator:Button({
    Text = "成为旁观者",
    Callback = function()
        Humanoid.Health = 0
    end
})

local ViewConnection
Spectator:Button({
    Text = "观察自己",
    Callback = function()
        ViewMe()

        --// 连接摄像机目标更改
        if ViewConnection then return end
        ViewConnection = Camera:GetPropertyChangedSignal("CameraSubject"):Connect(ViewMe)
    end
})

local Row = Spectator:Row()
Row:Button({
    Text = "传送到随机玩家",
    Callback = function()
        if not TeleportToRandomPlayer then return end
        TeleportToRandomPlayer()
    end
})
local AutoTeleport = Row:Checkbox({
    Value = false,
    Label = "自动传送?"
})

--// 过场动画
local Cutscenes = Window:TreeNode({Title="过场动画"})
local AnnoyCamera = Cutscenes:Checkbox({
    Value = false,
    Label = "干扰摄像机",
    Callback = function(self, Value)
        if Value then return end
        if not SetCameraAnnoyEnabled then return end
        
        SetCameraAnnoyEnabled(Value)
    end
})
local CutscenesDisabled = Cutscenes:Checkbox({
    Value = false,
    Label = "禁止过场动画",
})

--// 表情动作
local Emotes = Window:TreeNode({Title="表情动作"})
local Dance = Emotes:Combo({
	Selected = "牙线舞",
	Label = "舞蹈",
	Items = {
		["牙线舞"] = 10714340543,
		["后空翻"] = 15693621070,
		["桑巴"] = 16270690701,
        ["托马斯全旋"] = 10214311282,
        ["健身"] = 10713990381,
        ["坏女孩"] = 15963314052,
        ["时尚"] = 10714091938,
        ["热力出发"] = 85267023718407,
        ["舞蹈"] = 13749312543,
	}
})

Emotes:Checkbox({
    Value = false,
    Label = "跳舞",
    Callback = function(self, Value)
        if not SetDance then return end

        if not Value then
            SetDance(nil)
            return
        end

        SetDance(Dance.Value)
    end,
})

--// 传送
local Teleports = Window:TreeNode({Title="传送"})
Teleports:Combo({
	Label = "位置",
	Items = SpawnReference:GetChildren(),
    Callback = function(self, Folder)
        local Part = Folder:FindFirstChildWhichIsA("BasePart", true)
        local Pivot = Part:GetPivot()

        Character:PivotTo(Pivot)
    end
})

--// 控制台通信
local Event = Instance.new("BindableEvent")
Event.Event:Connect(function(...)
    Console:AppendText(...)
end)

function WriteLog(...)
    print(...)
    Event:Fire(...)
end

function SetFrozen(Frozen: boolean)
    LocalPlayer:SetAttribute("MovementOverride", Frozen)
end

function GetPlayerNumberTag(Player: Player)
    return Player:GetAttribute("Tag")
end

function IsEliminated(Player: Player)
    return Player:GetAttribute("Eliminated")
end

function GetPlayers(FilterEliminated: boolean)
    local Response = {}

    for _, Player in next, Players:GetPlayers() do
        --// 检查玩家是否被淘汰
        local Eliminated = IsEliminated(Player) 
        if FilterEliminated and Eliminated then continue end
        
        table.insert(Response, Player)
    end

    return Response
end

function TeleportToRandomPlayer()
    local Players = GetPlayers(true)
    local Player = Players[math.random(1, #Players)]
    local Pivot = Player.Character:GetPivot()

    Character:PivotTo(Pivot)
end

function UpdateWalkSpeed()
    --// 行走速度
    if TheMethod.Value then
        Humanoid.WalkSpeed = 1200
    else
        Humanoid.WalkSpeed = WalkSpeed.Value
    end
end

function ClearAnimations()
    for _, Track in Humanoid:GetPlayingAnimationTracks() do
        Track:Stop()
    end
end

function ResetVelocity()
    local Root = Humanoid.RootPart
    local Velocity = Root.Velocity

    Root.Velocity = Vector3.new(0, Velocity.Y < 0 and math.abs(Velocity.Y) or 0.5,0)
end

local AnnoyLoop = false
function SetCameraAnnoyEnabled(Enabled)
    --// 检查是否已启用
    if AnnoyLoop and Enabled then return end
    AnnoyLoop = Enabled

    local Rotation = CFrame.Angles(0,math.rad(180),0)
    local Offset = CFrame.new(0,-1.5,-3)

    Humanoid.PlatformStand = true

    --// 干扰摄像机
    while AnnoyLoop do
        ResetVelocity()
        --ClearAnimations()

        --// 将角色旋转到摄像机位置
        local Pivot = Camera:GetRenderCFrame() * Offset * Rotation
        Character:PivotTo(Pivot)

        task.wait()
    end

    Humanoid.PlatformStand = false
end

function CharacterAdded(New: Model)
    if not New then return end

    Character = New
    Humanoid = New:WaitForChild("Humanoid")

    --// 连接行走速度更改
    Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(UpdateWalkSpeed)

    if AutoTeleport.Value then
        TeleportToRandomPlayer()
    end

    --// 禁止反作弊
    local AntiCheat = Character:WaitForChild("AnimationHandler")
    AntiCheat.Disabled = true
    --AntiCheat:Destroy()

    WriteLog("反作弊已移除")
end

function FireTouchPart(Part: BasePart)
	local TouchTransmitter = Part:FindFirstChildOfClass("TouchTransmitter")
	if not TouchTransmitter then return end

    --// 传送到部件，因为大多数漏洞利用都有一个损坏的
    FireTouchTransmitter
	Character:PivotTo(Part:GetPivot())
end

local DanceTrack = nil
function SetDance(AnimationId)
    --// 清除当前舞蹈
    if DanceTrack then 
        DanceTrack:Stop()
        DanceTrack:Destroy()
    end

    if not AnimationId then return end

    --// 创建动画
    local Animation = Instance.new("Animation")
    Animation.AnimationId = `rbxassetid://{AnimationId}`

      --// 将动画加载到人形生物中
    DanceTrack = Humanoid:LoadAnimation(Animation)
    DanceTrack.Looped = true
    DanceTrack:Play()
end

--// 状态
local PentathlonSkip = false
local MingleTeleport = true
local SkippedLightGame = false

function SkipPentathlon()
    local PacketsOrder = {
        {"开始小游戏", 1},
        {"扔信封", 99},
        {"小游戏完成", "打画片"},
        {"开始小游戏", 2},
        {"扔石头", 60},
        {"小游戏完成", "掷石子"},
        {"开始小游戏", 3},
        {"小游戏完成", "弹珠"},
        {"开始小游戏", 4},
        {"扔陀螺", 60},
        {"小游戏完成", "陀螺"},
        {"开始小游戏", 5},
        {"小游戏完成", "踢毽子"},
        {"五项全能完成"}
    }

    PentathlonSkip = true
    
    while wait(1) and PentathlonSkip do
        for _, Packet in PacketsOrder do
            EffectsEvent:FireServer(unpack(Packet))
            wait(.5)
        end
    end
end

local EventHooks = {
    ["灯光游戏"] = function(Action, Args)
        if Action ~= "绿色" then return end
        if SkippedLightGame then return end 

        SkippedLightGame = true

        local Victory = workspace.LightGameBlocker
        FireTouchPart(Victory)

        WriteLog("灯光游戏已跳过")
    end,
    ["蜂巢游戏"] = function(Action, Args)
        if Action ~= "开始" then return end

        EffectsEvent:FireServer("成功", true)
        ClearAnimations()

        WriteLog("蜂巢游戏已跳过")

        return true
    end,
    ["五项全能"] = function(Action, Args)
        if Action == "开始游戏" then
            SkipPentathlon()
            return true
        elseif Action == "停止游戏" then
            PentathlonSkip = false
            
            WriteLog("五项全能已完成")
            ClearAnimations()
        elseif Action == "更新小游戏" then
            return true
        end
    end,
    ["混合游戏"] = function(Action, Args)
        if Action == "TurnOnDoorLights" then
            if not MingleTeleport then return end
            MingleTeleport = false

            --// 传送到房间
            local RoomPivot = Args[3].BoundingBox.CFrame
            Character:PivotTo(RoomPivot)
            
            WriteLog("已传送到混合游戏房间")
        end

        if Action == "关闭门灯" then
            MingleTeleport = true
        end
    end
}

function NewEffectsEvent(Old, ...)
    local Args = {...}

    local EventName = Args[1]
    local Action = Args[2]

    local Hook = EventHooks[EventName]
    local Eliminated = IsEliminated(LocalPlayer)

    --// 检查是否存在钩子
    if not Eliminated and Hook and SkipGames.Value then 
        --// 检查是否应拦截调用
        local Intercept = Hook(Action, Args) 
        if Intercept then return end 
    end

    --// 检查跳过动画
    if Action == "过场动画" or Action == "开始过场动画" then
        WriteLog("检查到过场动画")
        if CutscenesDisabled.Value then return end
    end

    --// 防止隐形
    -- if Action:find("隐形") then
    --     WriteLog("检测到隐形")
    --     if InvisibilityDisabled.Value then return end
    -- end

    return Old(unpack(Args))
end

--// 挂钩EffectsEvent
while true do
    local Connections = getconnections(EffectsEvent.OnClientEvent)

    --// 挂钩函数
    for _, Signal in next, Connections do
        local Func = Signal.Function

        if not islclosure(Func) then continue end

        --// 挂钩函数
        local Old
        Old = hookfunction(Func, function(...) 
            return NewEffectsEvent(Old, ...) 
        end)

        WriteLog("已挂钩EffectsEvent")
    end

    --// 检查连接是否已加载
    if #Connections > 0 then break end

    wait()
end

--// 加载角色
CharacterAdded(LocalPlayer.Character)

--// 连接事件
LocalPlayer.CharacterAdded:Connect(CharacterAdded)
LocalPlayer.AttributeChanged:Connect(function(Name: string)
    if Name == "MovementOverride" and NoFreze.Value then
        SetFrozen(false)
    end
end)
Controller.AttributeChanged:Connect(function(Name: string)
    local Value = Controller:GetAttribute(Name)

    if Name == "CameraEnabled" and AnnoyCamera.Value then
        WriteLog("干扰摄像机:", not Value)
        SetCameraAnnoyEnabled(not Value)
    end
end)
Players.AttributeChanged:Connect(function(Name: string)
    if Name == "状态" and AutoTeleport.Value then
        TeleportToRandomPlayer()
    end
end)