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
    Title = "Z脚本测试版",
    Content = "测试 v1.0\n一款高级的Roblox游戏脚本。\n由ZiO开发。"
})

InfoTab:CreateButton({
    Name = "🔗 复制QQ群链接",
    Callback = function()
        setclipboard("ZiO(感谢老铁支持)QQ主群：https://qun.qq.com/universal-share/share?ac=1&authKey=ImuUDuLPq6Kspd53xlyN7NNNo7Q1pLxZ%2FtIt0P0IApeyTZVKxjR4ZZxVBiDTqgzO&busi_data=eyJncm91cENvZGUiOiIxMDA3NTgwNjQzIiwidG9rZW4iOiJKK25pbFN3ZDNkTFpsSENTb21UNmRUVC9rVHhOa0k4QTlaeVFzSFFHWlUxanJyc3orbzBMWTBRbFpMM3RSZHVlIiwidWluIjoiMzg5MTcyMjQ0MCJ9&data=C8Siwr6kM8ke-IWiAkCWptUq5QLxwDT-60X_4tpdMzQkQSdJhyEAAbrvg1uySkdlcK6VrfxIX7GzDTDcPEXjuQ&svctype=4&tempid=h5_group_info
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