local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/rayfield.ui.lua'))()

local Window = WindUI:CreateWindow({
    Title = "Z脚本正式版",
    Icon = "moon",
    Author = "作者:ZiO",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(400, 300),
    Transparent = true,
    Theme = "Sky",
    User = {
        Enabled = true, 
        Callback = function() print("clicked") end, 
        Anonymous = true 
    },
})

Window:EditOpenButton({
    Title = "      打开Z脚本      ",
    Icon = "eye",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( 
        Color3.fromHex("FF00FF"), 
        Color3.fromHex("00FFFF"), 
        Color3.fromHex("800080")   
    ),
    Draggable = true,
})

local Tab = Window:Tab({
    Title = "信息",
    Icon = "warehouse",
    Locked = false,
})

local Paragraph = Tab:Paragraph({
    Title = "旧版UI脚本",
    Desc = "",
    Color = "Red",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "pointer",
            Title = "点击",
            Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ZIONPCE/raw/refs/heads/main/Z.lua"))() end,
        }
    }
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
    Title = "选人甩飞",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()
    end
})

local Button = Tab:Button({
    Title = "旋转",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

local Button = Tab:Button({
    Title = "开启玩家进出服务器提示",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
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
    Desc = "通用",
    Locked = false,
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

local Tab = Window:Tab({
    Title = "水墨游戏",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "VOIDWARE",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/inkgame.lua", true))()
    end
})

local Button = Tab:Button({
    Title = "siff",
    Desc = "无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
    end
})

local Tab = Window:Tab({
    Title = "偷走合集",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "偷走恶棍",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fqfqfqfqwgqghadfaffg/TeslHubCode/refs/heads/main/bob"))()
    end
})

local Button = Tab:Button({
    Title = "偷走汽车Hub",
    Desc = "无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1KPJuHE6"))()
    end
})

local Button = Tab:Button({
    Title = "偷走脑红AVOnTop",
    Desc = "无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ayvathion/AV-On-Top/refs/heads/main/Loader.lua"))()
    end
})

local Button = Tab:Button({
    Title = "偷走脑红",
    Desc = "无卡密不知道什么名字",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/egor2078f/lurkhackv4/refs/heads/main/main.lua", true))()
    end
})

local Button = Tab:Button({
    Title = "偷走骑行Ride",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/XDeZnv9t"))()
    end
})

local Tab = Window:Tab({
    Title = "压力",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "XA压力",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet(('https://github.com/DevSloPo/Main/raw/main/pressure')))()
    end
})

local Tab = Window:Tab({
    Title = "被遗弃",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "XA被遗弃",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet(('https://github.com/DevSloPo/Main/raw/main/Forsaken')))()
    end
})

local Button = Tab:Button({
    Title = "老歪制作",
    Desc = "比较好用无卡密",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notzanocoddz4/BobHub/main/main.lua"))()
    end
})

local Button = Tab:Button({
    Title = "BETATEST中文",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ElonMusk136/Forsaken/refs/heads/main/beta_test.luau"))({  PID = 1});
    end
})

local Button = Tab:Button({
    Title = "Httadmin",
    Desc = "中文",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua")()
    end
})

local Tab = Window:Tab({
    Title = "99天生存",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "OP",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/99-nights-in-the-forest/refs/heads/main/Main"))()
    end
})

local Tab = Window:Tab({
    Title = "死铁轨",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "红叶",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
    end
})

local Button = Tab:Button({
    Title = "自动胜利",
    Desc = "所有服务器通用",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-Auto-Win-Script-for-Dead-Rails-Instant-win-AFK-farm-KEYLESS-39867"))()
    end
})

local Button = Tab:Button({
    Title = "刷债券",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Anoonymouss69/ScriptHUB/refs/heads/main/AutoBonds"))()
    end
})

local Button = Tab:Button({
    Title = "无拉回飞行",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-FLY-in-Dead-Rails-One-Click-Script-KEYLESS-by-Moondiety-39179"))()
    end
})

local Button = Tab:Button({
    Title = "近战武器攻速",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/DeadRails/refs/heads/main/V4SWING"))()
    end
})

local Button = Tab:Button({
    Title = "焊接",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hbjrev/airweld.github.io/refs/heads/main/RINGTA.lua'))()
    end
})

local Button = Tab:Button({
    Title = "肘击",
    Desc = "可以肘飞狼人",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()
    end
})

local Tab = Window:Tab({
    Title = "最强战场",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "美化防御",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IdkRandomUsernameok/PublicAssets/refs/heads/main/Releases/MUI.lua"))()
    end
})

local Button = Tab:Button({
    Title = "琦玉闪电美化",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt"))()
    end
})

local Button = Tab:Button({
    Title = "琦玉黑手党美化",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso'))()end
})

local Button = Tab:Button({
    Title = "垃圾桶",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man"))()
    end
})

local Button = Tab:Button({
    Title = "琦玉变五条悟",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kamyk-player/FinalSuperSenior/refs/heads/main/SaitamaToSuperSeniorGojo"))()
    end
})

local Button = Tab:Button({
    Title = "自动防御",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
    end
})

local Tab = Window:Tab({
    Title = "种植花园",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain"))()
    end
})

local Tab = Window:Tab({
    Title = "DOORS",
    Icon = "warehouse",
    Locked = false,
})

local Button = Tab:Button({
    Title = "最强汉化",
    Desc = "",
    Locked = false,
    Callback = function()
   loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
   end
})

local Section = Tab:Section({ 
    Title = "Section",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})