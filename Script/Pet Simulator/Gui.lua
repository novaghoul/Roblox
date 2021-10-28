local PetSimGUI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local PetIDnotif = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local TextBox_2 = Instance.new("TextBox")
local CopyCheck = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
local ImageButton_2 = Instance.new("ImageButton")
local ReDoCheck = Instance.new("Frame")
local TextButton_5 = Instance.new("TextButton")
--Properties:
PetSimGUI.Name = "Pet Sim GUI"
PetSimGUI.Parent = game.CoreGui
petID = workspace["__DEBRIS"].Pets[game.Players.LocalPlayer.Name]:GetChildren()
for i = 1, #petID do
    print(petID[i].Name)
s = Main

TextButton_2.Parent = Frame_3
TextButton_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(-1.125, 0, 0.650306761, 0)
TextButton_2.Size = UDim2.new(0, 96, 0, 56)
TextButton_2.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton_2.Font = Enum.Font.Code
TextButton_2.Text = "Agility"
TextButton_2.TextColor3 = Color3.new(0, 0, 0)
TextButton_2.TextSize = 16
TextButton_2.MouseButton1Click:connect(function()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "c1" --Change the "1" to 2, 3 if your higher lvl. c2 = lvl 110, c3 = lvl 300
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
wait()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "a1" --Change the "1" to 2, 3 if your higher lvl. a2 = lvl 60, a3 = lvl 250
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
wait()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "c1" --Change the "1" to 2 or 3 if your higher lvl. c2 = lvl 110, c3 = lvl 300
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
end)

TextButton_3.Parent = Frame_3
TextButton_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(-1.125, 0, 0.0061349906, 0)
TextButton_3.Size = UDim2.new(0, 96, 0, 56)
TextButton_3.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton_3.Font = Enum.Font.Code
TextButton_3.Text = "Coin"
TextButton_3.TextColor3 = Color3.new(0, 0, 0)
TextButton_3.TextSize = 16
TextButton_3.MouseButton1Click:connect(function()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "a1" --Change the "1" to 2, 3 if your higher lvl. a2 = lvl 60, a3 = lvl 250
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
wait()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "c1" --Change the "1" to 2, 3 if your higher lvl. c2 = lvl 110, c3 = lvl 300
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
wait()
local U = "Upgrade"
local Pet = 82387638 --------Enter your pet ID
local Stats = "a1" --Change the "1" to 2, 3 if your higher lvl. a2 = lvl 60, a3 = lvl 250
local Number = "9e100"
local Event = game:GetService("Workspace")["__REMOTES"].Upgrades
Event:FireServer(U, Pet, Stats, Number)
end)

Main.Name = "Main"
Main.Parent = PetSimGUI
Main.BackgroundColor3 = Color3.new(0.705882, 0.701961, 0.705882)
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.BorderSizePixel = 5
Main.Position = UDim2.new(0.7, 0, 0.371638149, 0)
Main.Size = UDim2.new(0, 385, 0, 209)
Main.Visible = false
Main.Style = Enum.FrameStyle.DropShadow

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.new(0.258824, 0.254902, 0.258824)
Frame.Position = UDim2.new(0.0392857119, 0, 0.0291323904, 0)
Frame.Size = UDim2.new(0, 244, 0, 180)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.new(0.258824, 0.254902, 0.258824)
Frame_2.BorderColor3 = Color3.new(0.666667, 0, 0)
Frame_2.Position = UDim2.new(0.0819672123, 0, 0.0500000007, 0)
Frame_2.Size = UDim2.new(0, 96, 0, 163)

Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.new(0.258824, 0.254902, 0.258824)
Frame_3.BorderColor3 = Color3.new(0.666667, 0, 0)
Frame_3.Position = UDim2.new(0.524590135, 0, 0.0444444455, 0)
Frame_3.Size = UDim2.new(0, 96, 0, 163)

TextButton.Parent = Frame_3
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.650306761, 0)
TextButton.Size = UDim2.new(0, 96, 0, 56)
TextButton.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton.Font = Enum.Font.Code
TextButton.Text = "Close GUI"
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 16
TextButton.TextSize = 16
TextButton.MouseButton1Click:connect(function()
Main.Visible = false
TextButton_4.Visible = true
end)


TextLabel.Parent = Frame_3
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0.208588958, 0)
TextLabel.Size = UDim2.new(0, 96, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Made by Lagx"
TextLabel.TextColor3 = Color3.new(1, 0, 0)
TextLabel.TextSize = 17
TextLabel.TextStrokeColor3 = Color3.new(0.666667, 0, 0)

TextButton_4.Parent = PetSimGUI
TextButton_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_4.Position = UDim2.new(0, 0, 0.694376588, 0)
TextButton_4.Size = UDim2.new(0, 99, 0, 50)
TextButton_4.Visible = false
TextButton_4.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton_4.Font = Enum.Font.SourceSans
TextButton_4.Text = "Open GUI"
TextButton_4.TextColor3 = Color3.new(0, 0, 0)
TextButton_4.TextSize = 14
TextButton_4.TextSize = 14
TextButton_4.MouseButton1Click:connect(function()
Main.Visible = true
TextButton_4.Visible = false
end)

PetIDnotif.Name = "PetIDnotif"
PetIDnotif.Parent = PetSimGUI
PetIDnotif.BackgroundColor3 = Color3.new(1, 1, 1)
PetIDnotif.Position = UDim2.new(0.444242418, 0, 0.920537889, 0)
PetIDnotif.Size = UDim2.new(0, 271, 0, 65)
PetIDnotif.Visible = false
PetIDnotif.Style = Enum.FrameStyle.DropShadow

TextLabel_2.Parent = PetIDnotif
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0.177121773, 0, 0.13846153, 0)
TextLabel_2.Size = UDim2.new(0, 109, 0, 38)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "COPY DOWN: "
TextLabel_2.TextColor3 = Color3.new(1, 0, 0)
TextLabel_2.TextSize = 20

TextBox_2.Parent = PetIDnotif
TextBox_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox_2.BackgroundTransparency = 1
TextBox_2.BorderSizePixel = 0
TextBox_2.Position = UDim2.new(0.586715817, 0, 0.153846145, 0)
TextBox_2.Size = UDim2.new(0, 82, 0, 34)
TextBox_2.Font = Enum.Font.SourceSans
TextBox_2.Text = (petID[i].Name)
TextBox_2.TextColor3 = Color3.new(0, 0, 0)
TextBox_2.TextSize = 20

CopyCheck.Name = "CopyCheck"
CopyCheck.Visible = true
CopyCheck.Parent = PetSimGUI
CopyCheck.BackgroundColor3 = Color3.new(1, 1, 1)
CopyCheck.Position = UDim2.new(0.398787856, 0, 0.437652826, 0)
CopyCheck.Size = UDim2.new(0, 333, 0, 100)
CopyCheck.Style = Enum.FrameStyle.DropShadow

TextLabel_3.Parent = CopyCheck
TextLabel_3.BackgroundColor3 = Color3.new(0.258824, 0.254902, 0.258824)
TextLabel_3.Position = UDim2.new(0.183183178, 0, 0.0500000007, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 41)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Do you know your Pet ID?"
TextLabel_3.TextColor3 = Color3.new(1, 0, 0)
TextLabel_3.TextSize = 14

ImageButton.Parent = CopyCheck--No
ImageButton.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton.BackgroundTransparency = 1
ImageButton.Position = UDim2.new(0.0180180129, 0, 0.530000031, 0)
ImageButton.Size = UDim2.new(0, 42, 0, 41)
ImageButton.Image = "rbxassetid://149260272"
ImageButton.MouseButton1Click:connect(function()
	CopyCheck.Visible = false
	PetIDnotif.Visible = true
	wait(15)
	PetIDnotif.Visible = false
	s:Destroy()
end)
	

ImageButton_2.Parent = CopyCheck--Yes
ImageButton_2.BackgroundColor3 = Color3.new(1, 1, 1)
ImageButton_2.BackgroundTransparency = 1
ImageButton_2.Position = UDim2.new(0.84984982, 0, 0.520000041, 0)
ImageButton_2.Size = UDim2.new(0, 42, 0, 41)
ImageButton_2.Image = "rbxassetid://126824163"
ImageButton_2.MouseButton1Click:connect(function()
	CopyCheck.Visible = false
	Main.Visible = true
	ReDoCheck.Visible = true
end)
end

ReDoCheck.Name = "ReDoCheck"
ReDoCheck.Parent = Frame
ReDoCheck.BackgroundColor3 = Color3.new(0.258824, 0.254902, 0.258824)
ReDoCheck.BorderColor3 = Color3.new(0.666667, 0, 0)
ReDoCheck.Position = UDim2.new(1.04508197, 0, 0.0500000007, 0)
ReDoCheck.Size = UDim2.new(0, 96, 0, 163)

TextButton_5.Parent = ReDoCheck
TextButton_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_5.BorderSizePixel = 0
TextButton_5.Size = UDim2.new(0, 96, 0, 161)
TextButton_5.Style = Enum.ButtonStyle.RobloxRoundButton
TextButton_5.Font = Enum.Font.Code
TextButton_5.Text = "New Pet"
TextButton_5.TextColor3 = Color3.new(0, 0, 0)
TextButton_5.TextSize = 16
TextButton_5.TextWrapped = true
TextButton_5.MouseButton1Click:connect(function()
	TextButton_5.Text = "Re-Execute"
	wait(2)
	TextButton_5.Text = "The script."
	wait (1.5)
	s:Destroy()
end)