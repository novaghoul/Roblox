local DinosaurSimulator = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ClickTP = Instance.new("TextButton")
local Fog = Instance.new("TextButton")
local Hunger = Instance.new("TextButton")
local Thirst = Instance.new("TextButton")
local InfT = Instance.new("TextButton")
local InfH = Instance.new("TextButton")
local Swim = Instance.new("TextButton")
local Sprint = Instance.new("TextButton")
local Disable = Instance.new("TextButton")
local Grav = Instance.new("TextButton")
local FullBright = Instance.new("TextButton")
local Middle = Instance.new("TextButton")
local Mountain = Instance.new("TextButton")
local SubHung = Instance.new("TextButton")
local DNA = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
--Properties:
DinosaurSimulator.Name = "DinosaurSimulator"
DinosaurSimulator.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = DinosaurSimulator
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BorderColor3 = Color3.new(0.666667, 0.333333, 1)
MainFrame.BorderSizePixel = 3
MainFrame.Position = UDim2.new(0.305660397, 0, 0.213438734, 0)
MainFrame.Size = UDim2.new(0, 375, 0, 20)

Frame.Parent = MainFrame
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BackgroundTransparency = 0.5
Frame.BorderColor3 = Color3.new(0.666667, 0, 1)
Frame.Position = UDim2.new(0.0320000015, 0, 1, 0)
Frame.Size = UDim2.new(0, 350, 0, 196)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0.666667, 0.333333, 1)
TextLabel.BorderSizePixel = 3
TextLabel.Position = UDim2.new(-0.034285713, 0, 1, 0)
TextLabel.Size = UDim2.new(0, 375, 0, 20)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Made By xDinosaur.  His Discord - https://discord.gg/2g9K5cs"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14

ClickTP.Name = "ClickTP"
ClickTP.Parent = Frame
ClickTP.BackgroundColor3 = Color3.new(0, 0, 0)
ClickTP.BorderColor3 = Color3.new(0.666667, 0, 1)
ClickTP.Position = UDim2.new(0.0657142848, 0, 0.0867346823, 0)
ClickTP.Size = UDim2.new(0, 80, 0, 20)
ClickTP.Font = Enum.Font.SciFi
ClickTP.Text = "ClickTP"
ClickTP.TextColor3 = Color3.new(1, 1, 1)
ClickTP.TextScaled = true
ClickTP.TextSize = 14
ClickTP.TextWrapped = true

Fog.Name = "Fog"
Fog.Parent = Frame
Fog.BackgroundColor3 = Color3.new(0, 0, 0)
Fog.BorderColor3 = Color3.new(0.666667, 0, 1)
Fog.Position = UDim2.new(0.0657142848, 0, 0.275510192, 0)
Fog.Size = UDim2.new(0, 80, 0, 20)
Fog.Font = Enum.Font.SciFi
Fog.Text = "NoFog"
Fog.TextColor3 = Color3.new(1, 1, 1)
Fog.TextScaled = true
Fog.TextSize = 14
Fog.TextWrapped = true

Hunger.Name = "Hunger"
Hunger.Parent = Frame
Hunger.BackgroundColor3 = Color3.new(0, 0, 0)
Hunger.BorderColor3 = Color3.new(0.666667, 0, 1)
Hunger.Position = UDim2.new(0.411428571, 0, 0.0867346823, 0)
Hunger.Size = UDim2.new(0, 80, 0, 20)
Hunger.Font = Enum.Font.SciFi
Hunger.Text = "Hunger"
Hunger.TextColor3 = Color3.new(1, 1, 1)
Hunger.TextScaled = true
Hunger.TextSize = 14
Hunger.TextWrapped = true

Thirst.Name = "Thirst"
Thirst.Parent = Frame
Thirst.BackgroundColor3 = Color3.new(0, 0, 0)
Thirst.BorderColor3 = Color3.new(0.666667, 0, 1)
Thirst.Position = UDim2.new(0.411428571, 0, 0.275510192, 0)
Thirst.Size = UDim2.new(0, 80, 0, 20)
Thirst.Font = Enum.Font.SciFi
Thirst.Text = "Thirst"
Thirst.TextColor3 = Color3.new(1, 1, 1)
Thirst.TextScaled = true
Thirst.TextSize = 14
Thirst.TextWrapped = true

InfT.Name = "InfT"
InfT.Parent = Frame
InfT.BackgroundColor3 = Color3.new(0, 0, 0)
InfT.BorderColor3 = Color3.new(0.666667, 0, 1)
InfT.Position = UDim2.new(0.411428571, 0, 0.448979616, 0)
InfT.Size = UDim2.new(0, 80, 0, 20)
InfT.Font = Enum.Font.SciFi
InfT.Text = "Inf Thirst"
InfT.TextColor3 = Color3.new(1, 1, 1)
InfT.TextScaled = true
InfT.TextSize = 14
InfT.TextWrapped = true

InfH.Name = "InfH"
InfH.Parent = Frame
InfH.BackgroundColor3 = Color3.new(0, 0, 0)
InfH.BorderColor3 = Color3.new(0.666667, 0, 1)
InfH.Position = UDim2.new(0.411428571, 0, 0.642857075, 0)
InfH.Size = UDim2.new(0, 80, 0, 20)
InfH.Font = Enum.Font.SciFi
InfH.Text = "Inf Hunger"
InfH.TextColor3 = Color3.new(1, 1, 1)
InfH.TextScaled = true
InfH.TextSize = 14
InfH.TextWrapped = true

Swim.Name = "Swim"
Swim.Parent = Frame
Swim.BackgroundColor3 = Color3.new(0, 0, 0)
Swim.BorderColor3 = Color3.new(0.666667, 0, 1)
Swim.Position = UDim2.new(0.0657142699, 0, 0.448979616, 0)
Swim.Size = UDim2.new(0, 80, 0, 20)
Swim.Font = Enum.Font.SciFi
Swim.Text = "Auto Swim"
Swim.TextColor3 = Color3.new(1, 1, 1)
Swim.TextScaled = true
Swim.TextSize = 14
Swim.TextWrapped = true

Sprint.Name = "Sprint"
Sprint.Parent = Frame
Sprint.BackgroundColor3 = Color3.new(0, 0, 0)
Sprint.BorderColor3 = Color3.new(0.666667, 0, 1)
Sprint.Position = UDim2.new(0.0657142997, 0, 0.642857134, 0)
Sprint.Size = UDim2.new(0, 80, 0, 20)
Sprint.Font = Enum.Font.SciFi
Sprint.Text = "Auto Sprint"
Sprint.TextColor3 = Color3.new(1, 1, 1)
Sprint.TextScaled = true
Sprint.TextSize = 14
Sprint.TextWrapped = true

Disable.Name = "Disable"
Disable.Parent = Frame
Disable.BackgroundColor3 = Color3.new(0, 0, 0)
Disable.BorderColor3 = Color3.new(0.666667, 0, 1)
Disable.Position = UDim2.new(0.0657142848, 0, 0.841836751, 0)
Disable.Size = UDim2.new(0, 80, 0, 20)
Disable.Font = Enum.Font.SciFi
Disable.Text = "^Disable^"
Disable.TextColor3 = Color3.new(1, 1, 1)
Disable.TextScaled = true
Disable.TextSize = 14
Disable.TextWrapped = true

Grav.Name = "Grav"
Grav.Parent = Frame
Grav.BackgroundColor3 = Color3.new(0, 0, 0)
Grav.BorderColor3 = Color3.new(0.666667, 0, 1)
Grav.Position = UDim2.new(0.722857118, 0, 0.0867346823, 0)
Grav.Size = UDim2.new(0, 80, 0, 20)
Grav.Font = Enum.Font.SciFi
Grav.Text = "Low Grav"
Grav.TextColor3 = Color3.new(1, 1, 1)
Grav.TextScaled = true
Grav.TextSize = 14
Grav.TextWrapped = true

FullBright.Name = "FullBright"
FullBright.Parent = Frame
FullBright.BackgroundColor3 = Color3.new(0, 0, 0)
FullBright.BorderColor3 = Color3.new(0.666667, 0, 1)
FullBright.Position = UDim2.new(0.722857118, 0, 0.275510192, 0)
FullBright.Size = UDim2.new(0, 80, 0, 20)
FullBright.Font = Enum.Font.SciFi
FullBright.Text = "FullBright"
FullBright.TextColor3 = Color3.new(1, 1, 1)
FullBright.TextScaled = true
FullBright.TextSize = 14
FullBright.TextWrapped = true

Middle.Name = "Middle"
Middle.Parent = Frame
Middle.BackgroundColor3 = Color3.new(0, 0, 0)
Middle.BorderColor3 = Color3.new(0.666667, 0, 1)
Middle.Position = UDim2.new(0.722857118, 0, 0.448979616, 0)
Middle.Size = UDim2.new(0, 80, 0, 20)
Middle.Font = Enum.Font.SciFi
Middle.Text = "Tp Middle"
Middle.TextColor3 = Color3.new(1, 1, 1)
Middle.TextScaled = true
Middle.TextSize = 14
Middle.TextWrapped = true

Mountain.Name = "Mountain"
Mountain.Parent = Frame
Mountain.BackgroundColor3 = Color3.new(0, 0, 0)
Mountain.BorderColor3 = Color3.new(0.666667, 0, 1)
Mountain.Position = UDim2.new(0.722857118, 0, 0.642857134, 0)
Mountain.Size = UDim2.new(0, 80, 0, 20)
Mountain.Font = Enum.Font.SciFi
Mountain.Text = "Tp Mountain"
Mountain.TextColor3 = Color3.new(1, 1, 1)
Mountain.TextScaled = true
Mountain.TextSize = 14
Mountain.TextWrapped = true

SubHung.Name = "SubHung"
SubHung.Parent = Frame
SubHung.BackgroundColor3 = Color3.new(0, 0, 0)
SubHung.BorderColor3 = Color3.new(0.666667, 0, 1)
SubHung.Position = UDim2.new(0.411428571, 0, 0.841836751, 0)
SubHung.Size = UDim2.new(0, 80, 0, 20)
SubHung.Font = Enum.Font.SciFi
SubHung.Text = "Subtract Hunger"
SubHung.TextColor3 = Color3.new(1, 1, 1)
SubHung.TextScaled = true
SubHung.TextSize = 14
SubHung.TextWrapped = true

DNA.Name = "DNA"
DNA.Parent = Frame
DNA.BackgroundColor3 = Color3.new(0, 0, 0)
DNA.BorderColor3 = Color3.new(0.666667, 0, 1)
DNA.Position = UDim2.new(0.722857118, 0, 0.841836751, 0)
DNA.Size = UDim2.new(0, 80, 0, 20)
DNA.Font = Enum.Font.SciFi
DNA.Text = "ClaimDailyDNA"
DNA.TextColor3 = Color3.new(1, 1, 1)
DNA.TextScaled = true
DNA.TextSize = 14
DNA.TextWrapped = true

TextLabel_2.Parent = MainFrame
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0.231999993, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 20)
TextLabel_2.Font = Enum.Font.Code
TextLabel_2.Text = "Dinosaur Simulator"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.920000017, 0, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 20)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 0, 0)
Close.TextSize = 30

Minimize.Name = "Minimize"
Minimize.Parent = MainFrame
Minimize.BackgroundColor3 = Color3.new(1, 1, 1)
Minimize.BackgroundTransparency = 1
Minimize.Position = UDim2.new(0.839999974, 0, 0, 0)
Minimize.Size = UDim2.new(0, 30, 0, 20)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.new(1, 1, 1)
Minimize.TextSize = 30

MainFrame.Active = true
MainFrame.Draggable = true

Close.MouseButton1Click:connect(function()
	MainFrame.Visible = false
end)

Minimize.MouseButton1Click:connect(function()
	Frame.Visible = false
end)



Mountain.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(632.143555, 216.694427, 331.41507)
end)


FullBright.MouseButton1Click:connect(function()
	game.Lighting.GlobalShadows = false
	game.Lighting.Brightness = 100
end)


Middle.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-59.9023514, 25.4109745, -19.6906698)
end)

Disable.MouseButton1Click:connect(function()
	local Robo = "Stop"
local Exploit = false
local Event = game:GetService("Workspace").GameEvents.Swimming
Event:FireServer(SHIT, OK)
end)


Disable.MouseButton1Click:connect(function()
	local Robo = false
local Event = game:GetService("Workspace").GameEvents.Sprint
Event:FireServer(Robo)
end)





Swim.MouseButton1Click:connect(function()
	local Robo = "Up"
local Exploit = true
local Event = game:GetService("Workspace").GameEvents.Swimming
Event:FireServer(Robo, Exploit)
end)



Sprint.MouseButton1Click:connect(function()
	local RoboExploit = true
local Event = game:GetService("Workspace").GameEvents.Sprint
Event:FireServer(RoboExploit)
end)


Thirst.MouseButton1Click:connect(function()
	local Robo = game:GetService("Workspace").Water
local Exploit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p
local Event = game:GetService("Workspace").GameEvents.addThirst
Event:FireServer(Robo, Exploit)
end)




Fog.MouseButton1Click:connect(function()
	game.Lighting.FogEnd = 999999999
end)

InfT.MouseButton1Click:connect(function()
	while true do
		wait(0.1)
		local Robo = game:GetService("Workspace").Water
local Exploit = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p
local Event = game:GetService("Workspace").GameEvents.addThirst
Event:FireServer(Robo, Exploit)
	end
end)



Hunger.MouseButton1Click:connect(function()
	game.Workspace.GameEvents.EatPlant:FireServer(Workspace.GameMap.Ferns.Fern,2)
end)



InfH.MouseButton1Click:connect(function()
	while true do
		wait(0.1)
	game.Workspace.GameEvents.EatPlant:FireServer(Workspace.GameMap.Ferns.Fern,2)
end
end)



Grav.MouseButton1Click:connect(function()
	game.Workspace.Gravity = 20
end)


ClickTP.MouseButton1Click:connect(function()
	game.Players.LocalPlayer.Character.CharacterScripts.ControlWalkSpeed:remove()
	local UIS = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()


function GetCharacter()
   return game.Players.LocalPlayer.Character
end

function Teleport(pos)
   local Char = GetCharacter()
   if Char then
       Char:MoveTo(pos)
   end
end


UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.F2) then
       Teleport(Mouse.Hit.p)
   end
end)
end)


DNA.MouseButton1Click:connect(function()
	local Event = game:GetService("Workspace").GameEvents.ClaimDailyLogin
Event:FireServer()
end)


SubHung.MouseButton1Click:connect(function()
	game.Workspace.GameEvents.EatPlant:FireServer(Workspace.GameMap.Ferns.Fern,-10)
end)