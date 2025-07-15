local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local languages = {
	ar = {
		money = "مال 5k",
		auto = "اوتو 5k",
		close = "X",
		discord = "دسكورد: 1w69",
		lang = "English"
	},
	en = {
		money = "5k Money",
		auto = "Auto 5k",
		close = "X",
		discord = "Discord: 1w69",
		lang = "عربي"
	}
}
local currentLang = "ar"
local dailyRemote = ReplicatedStorage.Remotes:FindFirstChild("daily")

local function makeWobble(button)
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {Rotation = 6}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {Rotation = 0}):Play()
	end)
end

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MoneyHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 180)
frame.Position = UDim2.new(0.5, -120, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true

local discord = Instance.new("TextLabel", frame)
discord.Size = UDim2.new(0, 160, 0, 20)
discord.Position = UDim2.new(0, 5, 0, 5)
discord.BackgroundTransparency = 1
discord.Text = languages[currentLang].discord
discord.TextColor3 = Color3.new(1, 1, 1)
discord.Font = Enum.Font.Gotham
discord.TextSize = 13
discord.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
closeBtn.Text = languages[currentLang].close
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
makeWobble(closeBtn)
closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

local moneyBtn = Instance.new("TextButton", frame)
moneyBtn.Size = UDim2.new(0.8, 0, 0, 40)
moneyBtn.Position = UDim2.new(0.1, 0, 0.20, 0)
moneyBtn.TextColor3 = Color3.new(1, 1, 1)
moneyBtn.Font = Enum.Font.GothamBold
moneyBtn.TextSize = 16
moneyBtn.Text = languages[currentLang].money
makeWobble(moneyBtn)
moneyBtn.MouseButton1Click:Connect(function()
	if dailyRemote then
		dailyRemote:FireServer(5000)
	end
end)

local autoBtn = Instance.new("TextButton", frame)
autoBtn.Size = UDim2.new(0.8, 0, 0, 40)
autoBtn.Position = UDim2.new(0.1, 0, 0.43, 0)
autoBtn.TextColor3 = Color3.new(1, 1, 1)
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextSize = 16
autoBtn.Text = languages[currentLang].auto
makeWobble(autoBtn)

local isAuto = false
autoBtn.MouseButton1Click:Connect(function()
	isAuto = not isAuto
	autoBtn.Text = isAuto and (languages[currentLang].auto .. " 🔁") or languages[currentLang].auto
end)

task.spawn(function()
	while true do
		if isAuto and dailyRemote then
			dailyRemote:FireServer(5000)
		end
		task.wait(0.05)
	end
end)

local function rainbow(button)
	local hue = 0
	while true do
		hue = (hue + 0.01) % 1
		button.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
		task.wait(0.05)
	end
end

task.spawn(function() rainbow(moneyBtn) end)
task.spawn(function() rainbow(autoBtn) end)

local langBtn = Instance.new("TextButton", frame)
langBtn.Size = UDim2.new(0.8, 0, 0, 30)
langBtn.Position = UDim2.new(0.1, 0, 0.67, 0)
langBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
langBtn.TextColor3 = Color3.new(1, 1, 1)
langBtn.Font = Enum.Font.GothamBold
langBtn.TextSize = 14
langBtn.Text = languages[currentLang].lang
makeWobble(langBtn)

langBtn.MouseButton1Click:Connect(function()
	currentLang = currentLang == "ar" and "en" or "ar"
	moneyBtn.Text = languages[currentLang].money
	autoBtn.Text = isAuto and (languages[currentLang].auto .. " 🔁") or languages[currentLang].auto
	closeBtn.Text = languages[currentLang].close
	discord.Text = languages[currentLang].discord
	langBtn.Text = languages[currentLang].lang
end)

local dragging, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		update(input)
	end
end)