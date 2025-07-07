local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "Z脚本中心测试版",
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
local Window = OrionLib:MakeWindow({Name ="Z脚本中心测试版", HidePremium = false, SaveConfig = true,IntroText = "Z脚本中心测试版", ConfigFolder = "Z脚本中心测试版"})

local Tab = Window:MakeTab({
	Name = "主页",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("Z脚本中心测试版")
Tab:AddParagraph("作者QQ3891722440")
Tab:AddParagraph("QQ主群1007580643")
Tab:AddParagraph("QQ2群1045061775")
Tab:AddParagraph("有问题或想添加脚本游戏可以加我或群")

local Tab = Window:MakeTab({
	Name = "个人信息",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("用户名:"," "..game.Players.LocalPlayer.Name.."")
Tab:AddParagraph("注入器:"," "..identifyexecutor().."")
Tab:AddParagraph("服务器的ID"," "..game.GameId.."")

local Tab = Window:MakeTab({
	Name = "基础功能",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "玩家进出服务器提示",
  Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  end。
})

Tab:AddButton({
  Name = "跳跃",
  Default = "",
  TextDisappear = true
  Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end
})

Tab:AddToggle({

	Name = "穿墙",
	
	Default = false,
	
	Callback = function(Value)
	
		if Value then
		
		    Noclip = true

		    Stepped = game.RunService.Stepped:Connect(function()

			    if Noclip == true then

				    for a, b in pairs(game.Workspace:GetChildren()) do

                        if b.Name == game.Players.LocalPlayer.Name then

                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do

                                if v:IsA("BasePart") then

                                    v.CanCollide = false

                                end

                            end

                        end

                    end

			    else

				    Stepped:Disconnect()

			    end

		    end)

	    else

		    Noclip = true
		    
		end
		
	end
	
})

Tab:AddButton({
  Name = "超广角",
  Default = "",
  TextDisappear = true,
  Callback = function()
      Workspace.CurrentCamera.FieldOfView = Value
  end
})

local Tab = Window:MakeTab({
	Name = "死铁轨",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "刷劵",
  Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
  end
})
