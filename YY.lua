local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
-- 图形用户界面
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "MusicPlayerGUI"
gui.ResetOnSpawn = false
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0.5, -125, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui
local reopenBtn = Instance.new("TextButton")
reopenBtn.Size = UDim2.new(0, 40, 0, 40)
reopenBtn.Position = UDim2.new(0, 10, 0.5, -20)
reopenBtn.Text = "+"
reopenBtn.Visible = false
reopenBtn.Font = Enum.Font.SourceSansBold
reopenBtn.TextScaled = true
reopenBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
reopenBtn.TextColor3 = Color3.new(1, 1, 1)
reopenBtn.Parent = gui
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -60, 0, 30)
title.Position = UDim2.new(0, 5, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🎵 音乐播放器"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)
title.TextXAlignment = Enum.TextXAlignment.Left
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(1, -60, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextScaled = true
minimizeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
local content = Instance.new("Frame", frame)
content.Position = UDim2.new(0, 0, 0, 35)
content.Size = UDim2.new(1, 0, 1, -35)
content.BackgroundTransparency = 1
content.Name = "Content"
local input = Instance.new("TextBox", content)
input.Size = UDim2.new(0.9, 0, 0, 30)
input.Position = UDim2.new(0.05, 0, 0, 0)
input.PlaceholderText = "输入音乐ID（例如：1847853094）"
input.Text = ""
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
input.Font = Enum.Font.SourceSans
input.TextScaled = true
local playBtn = Instance.new("TextButton", content)
playBtn.Size = UDim2.new(0.9, 0, 0, 30)
playBtn.Position = UDim2.new(0.05, 0, 0, 40)
playBtn.Text = "▶ 播放"
playBtn.Font = Enum.Font.SourceSansBold
playBtn.TextScaled = true
playBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
playBtn.TextColor3 = Color3.new(1, 1, 1)
local stopBtn = Instance.new("TextButton", content)
stopBtn.Size = UDim2.new(0.42, 0, 0, 25)
stopBtn.Position = UDim2.new(0.05, 0, 0, 80)
stopBtn.Text = "■ 停止"
stopBtn.Font = Enum.Font.SourceSansBold
stopBtn.TextScaled = true
stopBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
stopBtn.TextColor3 = Color3.new(1, 1, 1)
local continueBtn = Instance.new("TextButton", content)
continueBtn.Size = UDim2.new(0.42, 0, 0, 25)
continueBtn.Position = UDim2.new(0.53, 0, 0, 80)
continueBtn.Text = "▶ 继续"
continueBtn.Font = Enum.Font.SourceSansBold
continueBtn.TextScaled = true
continueBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
continueBtn.TextColor3 = Color3.new(1, 1, 1)
input.Parent = content
playBtn.Parent = content
stopBtn.Parent = content
continueBtn.Parent = content
content.Parent = frame
local sound = Instance.new("Sound", workspace)
sound.Name = "GlobalMusic"
sound.Volume = 5
sound.Looped = true
-- 函数
local function playMusic(id)
    if tonumber(id) then
        sound:Stop()
        sound.SoundId = "rbxassetid://" .. id
        task.wait(0.2)
        sound:Play()
    end
end
playBtn.MouseButton1Click:Connect(function()
    playMusic(input.Text)
end)
stopBtn.MouseButton1Click:Connect(function()
    sound:Pause()
end)
continueBtn.MouseButton1Click:Connect(function()
    sound:Resume()
end)
closeBtn.MouseButton1Click:Connect(function()
    sound:Stop()
    sound:Destroy()
    gui:Destroy()
end)
minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenBtn.Visible = true
end)
reopenBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenBtn.Visible = false
end)
sound.Ended:Connect(function()
    sound:Play()
end)