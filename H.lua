local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./refs/heads/main/rayfield.ui.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "ZiO",
    Icon = "zap",
    LoadingTitle = "UI作者:ZiO",
    LoadingSubtitle = "由ZiO创建",
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
    Title = "Z脚本正式版",
    Content = "正式 v1.0\n一款高级的Roblox游戏脚本。\n由ZiO开发。"
})

InfoTab:CreateButton({
    Name = "🔗 复制QQ群链接",
    Callback = function()
        setclipboard("ZiO(感谢老铁支持)QQ2群：https://qun.qq.com/universal-share/share?ac=1&authKey=n7PF4dcio39qb3WPzVPxeddJWe%2FNH0z17B5hOPiGwEx1OKl2H9kiKdaAOhctoEv4&busi_data=eyJncm91cENvZGUiOiIxMDQ1MDYxNzc1IiwidG9rZW4iOiI3aENHdHdRL293OXdEY28rcDR0ZzdRRCtzaTNSb0hDTm8wTFc4ZW11RjNRVDdWMmk3d21IOGFET3ZwRFlUcFN4IiwidWluIjoiMzg5MTcyMjQ0MCJ9&data=aEAzVBkOlu2xCz9HrANlsAQEAAxOuOqSDUYGVDeyBHzJFtRD1fFD1yxUrwb6zRclrqY8Dbdnt-qj3w8NsBFGbA&svctype=4&tempid=h5_group_info
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

local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "xa",
  Callback = function()
  loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
  end
})
  