--Vampire Hunters 2 GUI Made By SpanishChilean And Edited By HypnoDodo

-- Objects

local VH2GUI = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local COINS = Instance.new("TextButton")
local FLARES = Instance.new("TextButton")
local LOOPHEAL = Instance.new("TextButton")
local MORPHINE = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local xbutton = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")

-- Properties

VH2GUI.Name = "VH2GUI"
VH2GUI.Parent = game.CoreGui

MainGUI.Name = "MainGUI"
MainGUI.Parent = VH2GUI
MainGUI.BackgroundColor3 = Color3.new(0.0509804, 0.0509804, 0.0509804)
MainGUI.BorderColor3 = Color3.new(0.615686, 0.0666667, 0.407843)
MainGUI.BorderSizePixel = 3
MainGUI.Position = UDim2.new(0, 1093, 0, 395)
MainGUI.Size = UDim2.new(0, 412, 0, 263)
MainGUI.Active = true
MainGUI.Draggable = true

TextLabel.Parent = MainGUI
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 106, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.ArialBold
TextLabel.Text = "Vampire Hunters 2 GUI"
TextLabel.TextColor3 = Color3.new(0.0156863, 0.988235, 0)
TextLabel.TextSize = 20

--Scripts

COINS.Name = "COINS"
COINS.Parent = MainGUI
COINS.BackgroundColor3 = Color3.new(0.0666667, 0.0117647, 0.0784314)
COINS.BorderColor3 = Color3.new(0.937255, 0.054902, 1)
COINS.Position = UDim2.new(0, 26, 0, 63)
COINS.Size = UDim2.new(0, 143, 0, 41)
COINS.Font = Enum.Font.ArialBold
COINS.Text = "GOD"
COINS.TextColor3 = Color3.new(1, 1, 1)
COINS.TextSize = 14

FLARES.Name = "FLARES"
FLARES.Parent = MainGUI
FLARES.BackgroundColor3 = Color3.new(0.0666667, 0.0117647, 0.0784314)
FLARES.BorderColor3 = Color3.new(0.937255, 0.054902, 1)
FLARES.Position = UDim2.new(0, 231, 0, 65)
FLARES.Size = UDim2.new(0, 143, 0, 41)
FLARES.Font = Enum.Font.ArialBold
FLARES.Text = "SPAM FLARES"
FLARES.TextColor3 = Color3.new(1, 1, 1)
FLARES.TextSize = 14

LOOPHEAL.Name = "LOOPHEAL"
LOOPHEAL.Parent = MainGUI
LOOPHEAL.BackgroundColor3 = Color3.new(0.0666667, 0.0117647, 0.0784314)
LOOPHEAL.BorderColor3 = Color3.new(0.937255, 0.054902, 1)
LOOPHEAL.Position = UDim2.new(0, 30, 0, 167)
LOOPHEAL.Size = UDim2.new(0, 143, 0, 41)
LOOPHEAL.Font = Enum.Font.ArialBold
LOOPHEAL.Text = "LOOPHEAL AND GOD"
LOOPHEAL.TextColor3 = Color3.new(1, 1, 1)
LOOPHEAL.TextSize = 14

MORPHINE.Name = "MORPHINE"
MORPHINE.Parent = MainGUI
MORPHINE.BackgroundColor3 = Color3.new(0.0666667, 0.0117647, 0.0784314)
MORPHINE.BorderColor3 = Color3.new(0.937255, 0.054902, 1)
MORPHINE.Position = UDim2.new(0, 237, 0, 170)
MORPHINE.Size = UDim2.new(0, 143, 0, 41)
MORPHINE.Font = Enum.Font.ArialBold
MORPHINE.Text = "GUN(Use God Before)"
MORPHINE.TextColor3 = Color3.new(1, 1, 1)
MORPHINE.TextSize = 14

TextLabel_2.Parent = MainGUI
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1.0599999427795
TextLabel_2.Position = UDim2.new(0, 111, 0, 236)
TextLabel_2.Size = UDim2.new(0, 195, 0, 27)
TextLabel_2.Font = Enum.Font.Arial
TextLabel_2.Text = "GUI Made By: SpanishChilean,Edited HypnoDodo(A bad Scripter)"
TextLabel_2.TextColor3 = Color3.new(0.992157, 0, 0)
TextLabel_2.TextSize = 14

xbutton.Name = "xbutton"
xbutton.Parent = MainGUI
xbutton.BackgroundColor3 = Color3.new(1, 1, 1)
xbutton.BackgroundTransparency = 1
xbutton.Position = UDim2.new(0, 375, 0, 0)
xbutton.Size = UDim2.new(0, 37, 0, 32)
xbutton.Font = Enum.Font.ArialBold
xbutton.Text = "X"
xbutton.TextColor3 = Color3.new(1, 1, 1)
xbutton.TextSize = 20

TextButton.Parent = MainGUI
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 1
TextButton.Size = UDim2.new(0, 412, 0, 35)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "  "
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 14
TextButton.Active = true
TextButton.Draggable = true

COINS.MouseButton1Down:connect(function()
   game.Workspace.Events.ChangeHealth:FireServer("100000000")
end)

FLARES.MouseButton1Down:connect(function()
   _G.Enabled = true 
while wait(1) and _G.Enabled do 
for i = 1, 10 do 
for i, v in pairs(game.Players:GetChildren()) do 
workspace.Events.Surv.Flare:FireServer(v.Character:findFirstChild('Torso').CFrame) end end end
end)

LOOPHEAL.MouseButton1Down:connect(function()
   _G.LoopHealToggle = true
while _G.LoopHealToggle and wait() do
workspace.Events.ChangeHealth:FireServer(10000, true)
end
end)

MORPHINE.MouseButton1Down:connect(function()
   --[[ GiveGear just clones the thing you want to give, and parents it to your backpack
so you can give yourself LocalScripts of the Vamp's abilities too. ]]--

local Amount = 3 --Amount of items you want
game.Workspace.Events.GiveGear:FireServer(game.ReplicatedStorage.SC.Dete["Silver Bullet"])
end)

xbutton.MouseButton1Down:connect(function()
MainGUI:TweenPosition(UDim2.new(0.384,0,-1,0), 'Out', 'Elastic', 3)
MainGUI.Visible = false
end)