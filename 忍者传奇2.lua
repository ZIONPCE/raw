getgenv().S = false
getgenv().B = false
getgenv().O = false
getgenv().Sh = false
getgenv().Se = false
getgenv().Gc = false
getgenv().Cr = false
getgenv().Gr = false
getgenv().Bo = false
-- 等级
function doGr()
    spawn(function()
        while Gr == true do
        if not getgenv() then break end
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Spirit Warrior")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dragon Enforcer")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Elite Soul Hunter")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Awoken Samurai")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Mystic Horizons Master")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dark Galaxy Assassin")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))                                                                           
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Relentless Gladiator")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Unleashed Cyberninja")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Ancient Millenium Beast")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Infinity Overlord")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Starstrike Megalith")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Underworld Golem")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))   
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dark Universe Hunter")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dual Eternity Legends")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))                                                                                                                           
        wait(5)
        end
    end)
end
-- 出售
function doSe()
    spawn(function()
        while Se == true do 
            if not getgenv() then break end
            local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
            local location = CFrame.new(-86, 8631, 36)
            pl.CFrame = location
            wait(0.5)
            local location = CFrame.new(-90, 8647, 36)
            pl.CFrame = location
            wait(0.5)
        end
    end)
end
--  Boss
function doBo()
    spawn(function()
        while Bo == true do
        if not getgenv() then break end
        teleportTo(game:GetService("Workspace").spawnedBosses["Elemental Cyborg"].UpperTorso.CFrame)
        local args = {[1] = "swingBlade"}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        wait()
        end
    end)
end
-- 水晶
function doCr()
    spawn(function()
        while Cr == true do 
            if not getgenv() then break end
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Crystals",
                    ["whichPlanet"] = "Planet Chaos"
                }
            }
            
            game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))            
            wait()
        end
    end)
end
-- 刀刃
function doB()
    spawn(function()
        while B == true do 
            if not getgenv() then break end
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Swords",
                    ["whichPlanet"] = "Planet Chaos"
                }
            }
            game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))  
            wait()
        end
    end)
end
-- 挥砍
function doS()
    spawn(function()
    while S == true do
    if not getgenv() then break end
        local args = {
            [1] = "swingBlade"
        }
        
        game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        wait()
    end
end)
end
-- 碎片、硬币
function doSh()
    spawn(function()
        while Sh == true do
            if not getgenv() then break end
            for i, v in pairs(game:GetService("Workspace").spawnedCoins["Shuriken City"]:GetDescendants()) do
                if v.Name == "Shard" and v.Parent then
                    teleportTo(game:GetService("Workspace").randomStuff.gradientCircle.CFrame)
                    wait(0.1)
                end
            end
        end
    end)
end
-- 传送至
function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
  end
-- 图形用户界面
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "忍者传奇 2",
    LoadingTitle = "AOT 是巅峰之作",
    LoadingSubtitle = "作者：diglt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "Digital Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "wk2xtM8H", 
       RememberJoins = true 
    },
    KeySystem = false, 
    KeySettings = {
       Title = "",
       Subtitle = "",
       Note = "",
       FileName = "",
       SaveKey = true,
       GrabKeyFromSite = false, 
       Key = ""
    }
 })
 local Tab = Window:CreateTab("主界面")
 local Tab1 = Window:CreateTab("其他") 
 local Button = Tab1:CreateButton({
    Name = "兑换所有代码",
    Callback = function()
        local args = {[1] = "powers500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "shurikencity500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "epicturrets450"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "waterfall500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "newgame500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "bossbattle300"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "Firstplanet250"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "epictower350"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "treeninja400"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
    end,
 })
 local Button = Tab1:CreateButton({
    Name = "销毁图形用户界面",
    Callback = function()
        Rayfield:Destroy()
    end,
 })
 local Section = Tab:CreateSection("出售")
local Toggle = Tab:CreateToggle({
    Name = "自动出售",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Se = bool
     if bool then
         doSe()
     end
    end,
 })
 
 local Section = Tab:CreateSection("自动功能")
local Toggle = Tab:CreateToggle({
   Name = "自动挥砍",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().S = bool
    if bool then
        doS()
    end
   end,
}) 
 local Toggle = Tab:CreateToggle({
    Name = "自动水晶（更多元素存储）",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Cr = bool
     if bool then
         doCr()
     end
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "自动刀刃（更多硬币）",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().B = bool
     if bool then
         doB()
     end
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "自动等级",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Gr = bool
     if bool then
         doGr()
     end
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "自动 Boss",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Bo = bool
     if bool then
         doBo()
     end
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "自动碎片/硬币（开发中/目前使用火山大师）",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Sh = bool
     if bool then
         doSh()
     end
    end,
 })
 local Section = Tab:CreateSection("宝珠")
 local selectedOrb
 local Dropdown = Tab:CreateDropdown({
    Name = "选择宝珠",
    Options = {"电子宝珠","星体宝珠","天空风暴宝珠","神秘融合宝珠","黑暗超新星宝珠","欧米茄起源宝珠","秘密阴影宝珠","遗忘传说宝珠","闪电风暴宝珠"},
    CurrentOption = "--",
    Callback = function(value)
        selectedOrb = value[1]
    end,
})
 
 function doO()
     spawn(function()
         while O == true do
         if not getgenv() then break end
            local args = {
                [1] = "openOrb",
                [2] = workspace:WaitForChild("petOrbs"):WaitForChild(selectedOrb)
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openOrbRemote"):InvokeServer(unpack(args))
            local args = {[1] = "autoEvolvePets"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("autoEvolveRemote"):InvokeServer(unpack(args))                                         
            wait()
         end
     end)
 end
 
 
 local Toggle = Tab:CreateToggle({
     Name = "自动选中宝珠（自动进化）",
     CurrentValue = false,
     Callback = function(bool)
      getgenv().O = bool
      if bool then
          doO()
      end
     end,
  })
 
  local Button = Tab:CreateButton({
    Name = "宝珠价格（按F9查看）",
    Callback = function()
        print("（电子=2k）（星体=5k）（天空=30k）（神秘=75k）（超新星=200k）（欧米茄起源=500k）（秘密阴影=2M）（闪电=5M）（遗忘=10个绿色碎片/代币）")
    end,
 })
 local Section = Tab:CreateSection("其他功能")
 local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
 local Button = Tab:CreateButton({
    Name = "成为火山大师",
    Callback = function()
        local location = CFrame.new(-352, 171, 8)
        pl.CFrame = location
    end,
 })
 local Button = Tab:CreateButton({
    Name = "获取所有宝箱",
    Callback = function()
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local location = CFrame.new(86, 8642, 126)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 6321, 16)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(86, 4691, 128)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 3067, 128)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 1477, 127)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(-335, 123, 217)
        pl.CFrame = location
        wait(1)
    end,
 })
 
 local Button = Tab:CreateButton({
    Name = "购买所有技能",
    Callback = function()
        local args = {
            [1] = "buyAllItems",
            [2] = {
                ["whichItems"] = "Skills",
                ["whichPlanet"] = "Planet Chaos"
            }
        }
        
        game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
    end,
 })
 local Button = Tab:CreateButton({
    Name = "购买所有能力",
    Callback = function()
        local args = {
            [1] = "buyAllItems",
            [2] = {
                ["whichItems"] = "Powers",
                ["whichPlanet"] = "Planet Chaos"
            }
        }
        
        game.Players.LocalPlayer:Wait
