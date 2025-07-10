local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/rayfield.ui.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "霖溺-",
    Icon = "zap",
    LoadingTitle = "UI作者:霖溺",
    LoadingSubtitle = "由霖溺创建",
    Theme = "Serenity",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FlingMasterConfig",
        FileName = "UserSettings"
    },
    Discord = {
        Enabled = true,
        Invite = "SEU_CODIGO",
        RememberJoins = true
    },
    KeySystem = false
})

local InfoTab = Window:CreateTab(" 关于", "info") -- Lucide图标

--  信息
InfoTab:CreateParagraph({
    Title = "霖溺测试版",
    Content = "测试 v1.0\n一款高级的Roblox游戏脚本。\n由霖溺用❤️开发。"
})

InfoTab:CreateButton({
    Name = "🔗 复制QQ群链接",
    Callback = function()
        setclipboard("霖溺(感谢老铁支持)QQ新主群：http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=viOjjgj19-TUiZlamhpxb6uvWwVNGoB7&authKey=ACDi9sCtIis%2F4P%2BtirP046uWaJ54%2F149eBnUvaAsMu%2BWZwSFoEQrzZC9UDGFwmp%2F&noverify=0&group_code=744830231") 
        Rayfield:Notify({
            Title = "✅ 成功",
            Content = "qq群链接已复制!",
            Duration = 5,
            Image = "copy"
        })
    end
})


local MainTab = Window:CreateTab(" 主功能", "sliders") 
local FlingSection = MainTab:CreateSection("设置")

MainTab:CreateInput({
    Name = "文本输入",
    PlaceholderText = "输入",
    CurrentValue = "",
    RemoveTextAfterFocusLost = false,
    Flag = "PlayerName",
    Callback = function(Text)
        
    end
})
 MainTab:CreateSlider({
    Name = "滑块",
    Range = {1, 30},
    Increment = 1,
    Suffix = "值",
    CurrentValue = 14,
    Flag = "",
    Callback = function(Value)
        
    end
})
MainTab:CreateToggle({
    Name = "按钮",
    CurrentValue = false,
    Flag = "FlingToggle",
    Callback = function(Value)
        
    end
})

local MainTab = Window:CreateTab(" 副功能", "sliders") 
local FlingSection = MainTab:CreateSection("设置")

MainTab:CreateInput({
    Name = "文本输入",
    PlaceholderText = "输入",
    CurrentValue = "",
    RemoveTextAfterFocusLost = false,
    Flag = "PlayerName",
    Callback = function(Text)
        
    end
})
 MainTab:CreateSlider({
    Name = "滑块",
    Range = {1, 30},
    Increment = 1,
    Suffix = "值",
    CurrentValue = 14,
    Flag = "",
    Callback = function(Value)
        
    end
})
MainTab:CreateToggle({
    Name = "按钮",
    CurrentValue = false,
    Flag = "FlingToggle",
    Callback = function(Value)
        
    end
})
local SettingsTab = Window:CreateTab(" 设置", "settings") 
local Themes = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"}
local ThemeDropdown = SettingsTab:CreateDropdown({
    Name = "🎨 选择主题",
    Options = Themes,
    CurrentOption = {"Serenity"},
    MultipleOptions = false,
    Flag = "ThemeSelector",
    Callback = function(Option)
        Window.ModifyTheme(Option[1])
        Rayfield:Notify({
            Title = "🎉 主题已更改",
            Content = "应用主题: " .. Option[1],
            Duration = 5,
            Image = "palette"
        })
    end
})
Rayfield:Notify({
    Title = " 欢迎!",
    Content = "测试加载成功!",
    Duration = 5,
    Image = "check"
})