-- AHHHHHHHHHHHHH Kravering aka newmetatable in riplox was here hehe scream4mepls

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Open = Instance.new("TextButton")
local main = Instance.new("Frame")
local DESPACITO = Instance.new("TextButton")
local SALAM = Instance.new("TextBox")
local BURGUNDI = Instance.new("TextButton")
local LULLABY = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderColor3 = Color3.new(0.207843, 0, 0)
Frame.Position = UDim2.new(0, 0, 0.515810251, 0)
Frame.Size = UDim2.new(0, 99, 0, 42)
Frame.Style = Enum.FrameStyle.DropShadow

Open.Name = "Open"
Open.Parent = Frame
Open.BackgroundColor3 = Color3.new(0.294118, 0.666667, 0.00784314)
Open.BackgroundTransparency = 15
Open.Position = UDim2.new(0.111111104, 0, 0.214285731, 0)
Open.Size = UDim2.new(0, 63, 0, 15)
Open.Font = Enum.Font.Fantasy
Open.Text = "OPEN"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextSize = 24
Open.MouseButton1Down:connect(function()
    main.Visible = true
    Frame.Visible = false
end)

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.Position = UDim2.new(0, 903, 0, 0)
main.Size = UDim2.new(0, 193, 0, 202)
main.Visible = false
main.Style = Enum.FrameStyle.DropShadow
main.Active = true
main.Draggable = true

DESPACITO.Name = "DESPACITO"
DESPACITO.Parent = main
DESPACITO.BackgroundColor3 = Color3.new(0.596078, 0, 0.00784314)
DESPACITO.BorderColor3 = Color3.new(0.443137, 0, 0.0666667)
DESPACITO.Position = UDim2.new(0, -4, 0, 121)
DESPACITO.Size = UDim2.new(0, 185, 0, 39)
DESPACITO.Style = Enum.ButtonStyle.RobloxRoundButton
DESPACITO.Font = Enum.Font.Fantasy
DESPACITO.Text = "SPAM VOTE"
DESPACITO.TextColor3 = Color3.new(0, 0, 0)
DESPACITO.TextSize = 24
DESPACITO.MouseButton1Click:connect(function()
   game:GetService("ReplicatedStorage").RemoteEvents.VotingStuff.VotedUp:FireServer(SALAM.Text)
end)

SALAM.Name = "SALAM"
SALAM.Parent = main
SALAM.BackgroundColor3 = Color3.new(1, 1, 1)
SALAM.Position = UDim2.new(0.00518134609, 0, 0.00990098715, 0)
SALAM.Size = UDim2.new(0, 175, 0, 32)
SALAM.Font = Enum.Font.Fantasy
SALAM.Text = "SALEM NAME"
SALAM.TextColor3 = Color3.new(0, 0, 0)
SALAM.TextSize = 24

BURGUNDI.Name = "BURGUNDI"
BURGUNDI.Parent = main
BURGUNDI.BackgroundColor3 = Color3.new(0.596078, 0, 0.00784314)
BURGUNDI.BorderColor3 = Color3.new(0.443137, 0, 0.0666667)
BURGUNDI.Position = UDim2.new(0, -5, 0, 42)
BURGUNDI.Size = UDim2.new(0, 185, 0, 39)
BURGUNDI.Style = Enum.ButtonStyle.RobloxRoundButton
BURGUNDI.Font = Enum.Font.Fantasy
BURGUNDI.Text = "GUILTY"
BURGUNDI.TextColor3 = Color3.new(0, 0, 0)
BURGUNDI.TextSize = 24
BURGUNDI.MouseButton1Click:connect(function()
   game:GetService("ReplicatedStorage").RemoteEvents.Innocence.VoteGuilty:FireServer()
end)

LULLABY.Name = "LULLABY"
LULLABY.Parent = main
LULLABY.BackgroundColor3 = Color3.new(0.596078, 0, 0.00784314)
LULLABY.BorderColor3 = Color3.new(0.443137, 0, 0.0666667)
LULLABY.Position = UDim2.new(0, -5, 0, 81)
LULLABY.Size = UDim2.new(0, 185, 0, 39)
LULLABY.Style = Enum.ButtonStyle.RobloxRoundButton
LULLABY.Font = Enum.Font.Fantasy
LULLABY.Text = "INNOCENT"
LULLABY.TextColor3 = Color3.new(0, 0, 0)
LULLABY.TextSize = 24
LULLABY.MouseButton1Click:connect(function()
   game:GetService("ReplicatedStorage").RemoteEvents.Innocence.VoteInnocent:FireServer()
end)

TextButton.Parent = main
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.Position = UDim2.new(0.367875665, 0, 0.905940592, 0)
TextButton.Size = UDim2.new(0, 110, 0, 19)
TextButton.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton.Font = Enum.Font.Fantasy
TextButton.Text = "CLOSE"
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 14
TextButton.MouseButton1Down:connect(function()
    Frame.Visible = true
    main.Visible = false
end)

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 15
TextLabel.Position = UDim2.new(0.0103626922, 0, 0.891089082, 0)
TextLabel.Size = UDim2.new(0, 41, 0, 25)
TextLabel.Font = Enum.Font.Fantasy
TextLabel.Text = "DRAG"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 14