-- 沃利·韦斯特风格
如果没有game.Players.LocalPlayer:FindFirstChild("WallyWestScript")，则
    本地WallyWestScript = Instance.new("IntValue", game.Players.LocalPlayer)
    WallyWestScript.Name = "WallyWestScript"
    本地Scren = Instance.new("ScreenGui", game.CoreGui)
    Scren.ResetOnSpawn = false
    本地Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.04, 0.04, 0.04, 4)
    Button.Position = UDim2.new(0.73, 0, 0.5, 0)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.FontFace = Font.new("rbxasset://fonts/families/Merriweather.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Button.Text = "销毁脚本"
    Button.Parent = Scren
    本地RGBColor = Instance.new("UIGradient", Button)
    RGBColor.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0.5, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0), Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1))
    本地Button3 = Button:Clone()
    Button3.Parent = Scren
    Button3.Position = UDim2.new(0.79, 0, 0.5, 0)
    Button3.Text = "传送到道路"
    Button3.UIGradient.Color = ColorSequence.new(Color3.new(0, 1, 0), Color3.new(0, 0.5, 0), Color3.new(0, 0, 0))
    Button3.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10010, 0)
    end)
    本地函数getSPS()
        如果Workspace:FindFirstChild(game.Players.LocalPlayer.Name)且game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")，则
            返回game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Magnitude
        结束
        返回0
    结束
    本地road = Instance.new("Folder", Workspace)
    road.Name = "RoadFolder"
    对于i = 0到200循环
        本地baseplate = Instance.new("Part", road)
        baseplate.Anchored = true
        baseplate.Name = "Path"
        baseplate.Color = Color3.new(0, 0.6, 0)
        baseplate.Material = "Grass"
        baseplate.Size = Vector3.new(2048, 8, 2048) -- 最大零件尺寸为2048
        baseplate.Position = Vector3.new(0, 10000, -(2048 * i))
        
        本地lateral = baseplate:Clone()
        lateral.Size = Vector3.new(10, 125, 2048)
        lateral.CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5, 1, 1)
        lateral.Position = Vector3.new(1024, 10008, -(2048 * i))
        lateral.Name = "Lateral"
        lateral.Parent = road
        
        本地lateral2 = lateral:Clone()
        lateral2.Position = Vector3.new(-1024, 10008, -(2048 * i))
        lateral2.Parent = road
    结束循环
    本地sps = Instance.new("TextLabel", Scren)
    sps.Position = UDim2.new(0.45, 0, 0.8, 0)
    sps.TextScaled = false
    sps.Size = UDim2.new(0.1, 0, 0.05, 0)
    sps.BackgroundTransparency = 1  
    sps.TextColor3 = Color3.new(1, 1, 1)
    sps.TextSize *= 1.75
    sps.Text = "速度：0"
    sps.FontFace = Font.new("rbxasset://fonts/families/Merriweather.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    task.spawn(function() 重复 task.wait()
        sps.Text = "速度：" .. tostring(string.format("%.0f", getSPS()))
    直到没有sps 结束)
    Button.MouseButton1Click:Connect(function()
        WallyWestScript:Destroy()
        Scren:Destroy()
        game.Players.LocalPlayer.Character:BreakJoints()
    end)
    本地函数MakeCameraShake(lifetime, strength, mode)
        task.spawn(function()
    本地past = os.clock()
    本地i = 0
    重复 game:GetService("RunService").PreSimulation:Wait()
    i = i + 1
     本地shakeIntensity = (strength或10) * (1 - (i - 1) / ((mode:lower() == "def"且25)或(mode:lower() == "dim"且25 * (lifetime或1))或25))
      本地shakeOffset = Vector3.new(math.random(-shakeIntensity, shakeIntensity) / 10, math.random(-shakeIntensity, shakeIntensity) / 10, math.random(-shakeIntensity, shakeIntensity) / 10)
     本地originalOffset = game.Players.LocalPlayer.Character.Humanoid.CameraOffset
     本地currentTime = 0
     当currentTime < 0.01时循环
         本地delta = currentTime / 0.01
         game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0) + shakeOffset * (1 - delta)
         currentTime = currentTime + task.wait(0.025)
     结束循环
     game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
    直到os.clock() - past >= (lifetime或1)
        结束)
    结束
    hue = game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        task.spawn(function()
         重复 task.wait()
            对于_, part in next, char:GetDescendants()循环
                如果part:IsA("BasePart")，则
                    part.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0, 0, 0, 0)
                    part.EnableFluidForces = false
                    pcall(function()
                        sethiddenproperty(part, "Friction", -math.huge)
                    end)
                    part.Massless = false
                结束
            结束循环
        直到没有char
    结束)
        
        本地attribute = Instance.new("NumberValue", char)
        attribute.Name = "SelectedSpeed"
        attribute.Value = 2500
        
        本地accel = Instance.new("BoolValue", char)
        accel.Name = "IsAccelerated"
        accel.Value = false
        
        char:WaitForChild("Humanoid").WalkSpeed = attribute.Value或2500
        char.Humanoid.AutoJumpEnabled = false
        
        pcall(function()
        char:WaitForChild("Animate"):WaitForChild("walk").WalkAnim.AnimationId = "rbxassetid://10921244891"
        char.Animate.idle.Animation1.AnimationId = "rbxassetid://10921301576"
        char.Animate.jump.JumpAnim.AnimationId = "rbxassetid://10921263860"
        char.Animate.fall.FallAnim.AnimationId = "rbxassetid://10921262864"
        end)
        
        char.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            char.Humanoid.WalkSpeed = attribute.Value或2500
        end)
        
    对于i = 1到2循环
        本地fireParticles = Instance.new("ParticleEmitter")
        fireParticles.Name = "FireLine"
        fireParticles.Enabled = true
        fireParticles.Lifetime = NumberRange.new(0.5, 1)
        fireParticles.Rate = 50
        fireParticles.Rotation = NumberRange.new(0, 360)
        fireParticles.RotSpeed = NumberRange.new(-180, 180)
        fireParticles.Size = NumberSequence.new(1, 0)
        fireParticles.Speed = NumberRange.new(5, 10)
        fireParticles.SpreadAngle = Vector2.new(-20, 20)
        fireParticles.Texture = "rbxassetid://257173628"
        fireParticles.Parent = (i == 1且char:WaitForChild("RightHand")或char:WaitForChild("LeftHand"))
        
        本地particle = fireParticles:Clone()
        particle.Parent = fireParticles.Parent
        particle.Name = "FireLine2"
        particle.Size = NumberSequence.new(1, 1)
        particle.Speed = NumberRange.new(0, 0)
        particle.Lifetime = NumberRange.new(0.05, 0.05)
    结束循环
        本地eff = Instance.new("ParticleEmitter", char.HumanoidRootPart)
        eff.RotSpeed = NumberRange.new(-90, 90)
        eff.Enabled = false
        eff.Rate = 50
        eff.Rotation = NumberRange.new(-360, 360)
        eff.Lifetime = NumberRange.new(0.15, 0.3)
        eff.Size = NumberSequence.new(4, 8, 0)
        eff.Transparency = NumberSequence.new(0, 1)
        eff.ZOffset -= 1
        eff.Texture = "rbxassetid://257173628"
        eff.SpreadAngle = Vector2.new(-360, 360)
        eff.Speed = NumberRange.new(3, 6)
        eff.LockedToPart = false
        
        本地eld = eff:Clone()
        eld.Name = "FireLine2"
        eld.Enabled = true
        eld.Parent = eff.Parent
        eld.Speed = NumberRange.new(0, 0)
        eld.LockedToPart = true
        eld.Rate = 6
        eld.Lifetime = NumberRange.new(0.075, 0.075)
        
        本地Doo = Instance.new("ParticleEmitter")
        Doo.Name = "FireLine"
        Doo.Enabled = false
        Doo.Lifetime = NumberRange.new(0.5, 1)
        Doo.Rate = 1000
        Doo.Rotation = NumberRange.new(0, 360)
        Doo.RotSpeed = NumberRange.new(-180, 180)
        Doo.Size = NumberSequence.new(3.25, 0.5)
        Doo.Speed = NumberRange.new(75, 75)
        Doo.SpreadAngle = Vector2.new(-15, 15)
        Doo.EmissionDirection = Enum.NormalId.Back
        Doo.Texture = "rbxassetid://257173628"
        Doo.Parent = char.HumanoidRootPart
        
        本地LD1 = Doo:Clone()
        LD1.Parent = char:FindFirstChild("LeftFoot")
        本地LD2 = Doo:Clone()
        LD2.Parent = char:FindFirstChild("RightFoot")
        
        Doo:GetPropertyChangedSignal("Enabled"):Connect(function()
            LD1.Enabled = Doo.Enabled
            LD2.Enabled = Doo.Enabled
        end)
        
        本地Platf = Instance.new("Part", Workspace)
        Platf.Anchored = true
        Platf.CanCollide = false
        Platf.Position = Vector3.new(31, -9, 527)
        Platf.Size = Vector3.new(10, 1, 10)
        Platf.Transparency = 1
        
        本地colo = Instance.new("ColorCorrectionEffect", game.Lighting)
        colo.TintColor = Color3.new(0, 0.8, 0.8)
        colo.Saturation = 0
        colo.Enabled = false
        
        task.spawn(function() 重复 task.wait()
            Doo.Enabled = (char:WaitForChild("HumanoidRootPart").Velocity.Magnitude >= 1000)
            Platf.CanCollide = (char.HumanoidRootPart.Velocity.Magnitude >= 450)
            Platf.Position = Vector3.new(char.HumanoidRootPart.Position.X, -10, char.HumanoidRootPart.Position.Z)
            
            如果char.HumanoidRootPart.Velocity.Y >= 300，则
                char.HumanoidRootPart.Velocity += Vector3.new(0, -200, 0)
            结束
            如果char.HumanoidRootPart.Velocity.Magnitude >= 15000，则
                colo.Enabled = true
            否则
                colo.Enabled = false
            结束
        直到没有Doo 结束)
        本地light = Instance.new("PointLight", char.HumanoidRootPart)
        light.Range = 12
        light.Brightness = 1
        light.Color = Color3.new(0, 1, 1)
        
        本地ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
        ScreenGui.ResetOnSpawn = true
        ScreenGui.Enabled = true
        
        char.Humanoid.Died:Connect(function()
            ScreenGui:Destroy()
            colo:Destroy()
            Platf:Destroy()
        end)
        
        对于_, part in next, char:GetChildren()循环
            如果part:IsA("BasePart")，则
                本地particle = Instance.new("ParticleEmitter", part)
                particle.Rate = 1000
                particle.LockedToPart = true
                particle.Texture = "rbxassetid://11745241946"
                particle.Lifetime = NumberRange.new(0.375, 0.375) -- 0.2 0.2
                particle.Size = NumberSequence.new(0.435, 0.435) -- 0.5 0.5
                particle.ZOffset -= 1
                particle.Speed = NumberRange.new(0, 0)
                particle.LightEmission = 1 
                particle.Color = ColorSequence.new(Color3.new(0.4, 0.4, 1), Color3.new(0.4, 0.4, 1)) -- 0.3
            结束
        结束循环
        
        本地Button = Instance.new("TextButton", ScreenGui)
        Button.Size = UDim2.new(0.04, 0.04, 0.04, 4)
        Button.Position = UDim2.new(0.76, 0, 0.6, 0)
        Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextScaled = true
        Button.FontFace = Font.new("rbxasset://fonts/families/Merriweather.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        Button.Visible = true
        Button.Text = "加速"
        Button.Parent = ScreenGui
        
        本地Button2 = Button:Clone()
        Button2.Parent = ScreenGui
        Button2.Visible = true
        Button2.TextScaled = false
        Button2.Position = UDim2.new(0.7, 0, 0.6, 0)
        Button2.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        Button2.Text = "行走"
        
        本地walki = false
        Button2.MouseButton1Click:Connect(function()
            walki = not walki
            如果walki == true，则
                attribute.Value = 30
                char.Humanoid.WalkSpeed = 30
                
                char.LeftHand.FireLine.Enabled = (accel.Value == false且false或true)
                char.RightHand.FireLine.Enabled = (accel.Value == false且false或true)
            否则
                attribute.Value = (accel.Value == true且25000或2500)
                char.Humanoid.WalkSpeed = attribute.Value
                
                char.LeftHand.FireLine.Enabled = true
                char.RightHand.FireLine.Enabled = true
                
                本地sound = Instance.new("Sound", char.HumanoidRootPart)
                sound.SoundId = "rbxassetid://379557765"
                sound.Volume = 1
                sound.PlaybackSpeed = 1
