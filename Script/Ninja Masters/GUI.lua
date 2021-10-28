-- use CTRL+F : Replace lIIIlIIIlIIIIIIIlIII by ur name

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Zone = Instance.new("TextButton")
local Gamepass = Instance.new("TextButton")
local Stats = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Sell = Instance.new("TextButton")
--Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.0941177, 0.0941177, 0.0941177)
Frame.BackgroundTransparency = 0.15000000596046
Frame.BorderColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.73079735, 0, 0.302287579, 0)
Frame.Size = UDim2.new(0, 304, 0, 242)

Zone.Name = "Zone"
Zone.Parent = Frame
Zone.BackgroundColor3 = Color3.new(0.729412, 0.223529, 0.231373)
Zone.BorderSizePixel = 0
Zone.Position = UDim2.new(0.029605262, 0, 0.34710744, 0)
Zone.Size = UDim2.new(0, 285, 0, 31)
Zone.Font = Enum.Font.Gotham
Zone.Text = "Unlock All Zone"
Zone.TextColor3 = Color3.new(1, 1, 1)
Zone.TextScaled = true
Zone.TextSize = 14
Zone.TextWrapped = true

Zone.MouseButton1Click:Connect(
    function()
        -- First tp
        game.Workspace.ZoneBuy:Destroy()
    end
)

Gamepass.Name = "Gamepass"
Gamepass.Parent = Frame
Gamepass.BackgroundColor3 = Color3.new(0.729412, 0.223529, 0.231373)
Gamepass.BorderSizePixel = 0
Gamepass.Position = UDim2.new(0.029605262, 0, 0.5, 0)
Gamepass.Size = UDim2.new(0, 285, 0, 31)
Gamepass.Font = Enum.Font.Gotham
Gamepass.Text = "Gamepass unlock"
Gamepass.TextColor3 = Color3.new(1, 1, 1)
Gamepass.TextScaled = true
Gamepass.TextSize = 14
Gamepass.TextWrapped = true

Gamepass.MouseButton1Click:Connect(
    function()
        for i, v in pairs(game.Players.LocalPlayer.Purchases:GetChildren()) do
            v.Value = true
        end
    end
)

Stats.Name = "Stats"
Stats.Parent = Frame
Stats.BackgroundColor3 = Color3.new(0.729412, 0.223529, 0.231373)
Stats.BorderSizePixel = 0
Stats.Position = UDim2.new(0.029605262, 0, 0.65289259, 0)
Stats.Size = UDim2.new(0, 285, 0, 31)
Stats.Font = Enum.Font.Gotham
Stats.Text = "Insane Stats"
Stats.TextColor3 = Color3.new(1, 1, 1)
Stats.TextScaled = true
Stats.TextSize = 14
Stats.TextWrapped = true

Stats.MouseButton1Click:Connect(
    function()
        game.Players.lIIIlIIIlIIIIIIIlIII.leaderstats.Money.Value = 999999999
        game.Players.lIIIlIIIlIIIIIIIlIII.leaderstats.Rebirths.Value = 999999999
    end
)

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.new(1, 0.258824, 0.270588)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 304, 0, 58)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0.068965517, 0)
TextLabel.Size = UDim2.new(0, 304, 0, 50)
TextLabel.Font = Enum.Font.Cartoon
TextLabel.Text = "Ninja Masters  Fucker"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.588815808, 0, 0.741379321, 0)
TextLabel_2.Size = UDim2.new(0, 154, 0, 11)
TextLabel_2.Font = Enum.Font.Cartoon
TextLabel_2.Text = "By WhiteSatanic"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true

Sell.Name = "Sell"
Sell.Parent = Frame
Sell.BackgroundColor3 = Color3.new(0.729412, 0.223529, 0.231373)
Sell.BorderSizePixel = 0
Sell.Position = UDim2.new(0.029605262, 0, 0.805785179, 0)
Sell.Size = UDim2.new(0, 285, 0, 31)
Sell.Font = Enum.Font.Gotham
Sell.Text = "AutoSell"
Sell.TextColor3 = Color3.new(1, 1, 1)
Sell.TextScaled = true
Sell.TextSize = 14
Sell.TextWrapped = true

Sell.MouseButton1Click:Connect(
    function()
        _G.sell = true

        while _G.sell do
            wait()
            game.Workspace.Rings.Sell.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
)

Frame.Active = true
Frame.Draggable = true
