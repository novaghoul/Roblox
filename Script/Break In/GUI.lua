localplyer = game.Players.LocalPlayer.Name

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Apple = Instance.new("TextButton")
local Cookie = Instance.new("TextButton")
local Plank = Instance.new("TextButton")
local BloxyCola = Instance.new("TextButton")
local Items = Instance.new("TextLabel")
local Teleports = Instance.new("TextLabel")
local House = Instance.new("TextButton")
local Basement = Instance.new("TextButton")
local Attic = Instance.new("TextButton")
local Store = Instance.new("TextButton")
local SewerDrain = Instance.new("TextButton")
local BossRoom = Instance.new("TextButton")
local VaultCode = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Frame.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.363200009, 0, 0.224999994, 0)
Frame.Size = UDim2.new(0, 284, 0, 376)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.new(0.207843, 0.207843, 0.207843)
Title.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Title.BorderSizePixel = 3
Title.LayoutOrder = 1
Title.Position = UDim2.new(0, 0, -0.000405250699, 0)
Title.Size = UDim2.new(0, 284, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Break-In Gui"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20

Apple.Name = "Apple"
Apple.Parent = Frame
Apple.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Apple.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Apple.BorderSizePixel = 3
Apple.Position = UDim2.new(0.0281690136, 0, 0.186170205, 0)
Apple.Size = UDim2.new(0, 126, 0, 32)
Apple.Font = Enum.Font.GothamBold
Apple.Text = "Apple"
Apple.TextColor3 = Color3.new(1, 1, 1)
Apple.TextSize = 14
Apple.MouseButton1Down:connect(
    function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Apple")
    end
)

Cookie.Name = "Cookie"
Cookie.Parent = Frame
Cookie.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Cookie.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Cookie.BorderSizePixel = 3
Cookie.Position = UDim2.new(0.524647892, 0, 0.186170205, 0)
Cookie.Size = UDim2.new(0, 126, 0, 32)
Cookie.Font = Enum.Font.GothamBold
Cookie.Text = "Cookie"
Cookie.TextColor3 = Color3.new(1, 1, 1)
Cookie.TextSize = 14
Cookie.MouseButton1Down:connect(
    function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Cookie")
    end
)

Plank.Name = "Plank"
Plank.Parent = Frame
Plank.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Plank.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Plank.BorderSizePixel = 3
Plank.Position = UDim2.new(0.524647892, 0, 0.31382978, 0)
Plank.Size = UDim2.new(0, 126, 0, 32)
Plank.Font = Enum.Font.GothamBold
Plank.Text = "Plank"
Plank.TextColor3 = Color3.new(1, 1, 1)
Plank.TextSize = 14
Plank.MouseButton1Down:connect(
    function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("Plank")
    end
)

BloxyCola.Name = "BloxyCola"
BloxyCola.Parent = Frame
BloxyCola.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
BloxyCola.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
BloxyCola.BorderSizePixel = 3
BloxyCola.Position = UDim2.new(0.0281690061, 0, 0.31382978, 0)
BloxyCola.Size = UDim2.new(0, 126, 0, 32)
BloxyCola.Font = Enum.Font.GothamBold
BloxyCola.Text = "Bloxy Cola"
BloxyCola.TextColor3 = Color3.new(1, 1, 1)
BloxyCola.TextSize = 14
BloxyCola.MouseButton1Down:connect(
    function()
        game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("BloxyCola")
    end
)

Items.Name = "Items"
Items.Parent = Frame
Items.BackgroundColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Items.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Items.BorderSizePixel = 0
Items.LayoutOrder = 1
Items.Position = UDim2.new(0, 0, 0.0953394324, 0)
Items.Size = UDim2.new(0, 284, 0, 24)
Items.Font = Enum.Font.GothamBold
Items.Text = "--- Spawnable Items ---"
Items.TextColor3 = Color3.new(1, 1, 1)
Items.TextSize = 20

Teleports.Name = "Teleports"
Teleports.Parent = Frame
Teleports.BackgroundColor3 = Color3.new(0.313726, 0.313726, 0.313726)
Teleports.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Teleports.BorderSizePixel = 0
Teleports.LayoutOrder = 1
Teleports.Position = UDim2.new(0, 0, 0.5235309, 0)
Teleports.Size = UDim2.new(0, 284, 0, 30)
Teleports.Font = Enum.Font.GothamBold
Teleports.Text = "--- Teleport Locations ---"
Teleports.TextColor3 = Color3.new(1, 1, 1)
Teleports.TextSize = 20

House.Name = "House"
House.Parent = Frame
House.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
House.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
House.BorderSizePixel = 3
House.Position = UDim2.new(0.0281690061, 0, 0.630319118, 0)
House.Size = UDim2.new(0, 126, 0, 32)
House.Font = Enum.Font.GothamBold
House.Text = "House"
House.TextColor3 = Color3.new(1, 1, 1)
House.TextSize = 14
House.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(-36, 3, -200) -- House
    end
)

Basement.Name = "Basement"
Basement.Parent = Frame
Basement.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Basement.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Basement.BorderSizePixel = 3
Basement.Position = UDim2.new(0.524647892, 0, 0.630319118, 0)
Basement.Size = UDim2.new(0, 126, 0, 32)
Basement.Font = Enum.Font.GothamBold
Basement.Text = "Basement"
Basement.TextColor3 = Color3.new(1, 1, 1)
Basement.TextSize = 14
Basement.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(71, -15, -163) -- Basement
    end
)

Attic.Name = "Attic"
Attic.Parent = Frame
Attic.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Attic.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Attic.BorderSizePixel = 3
Attic.Position = UDim2.new(0.524647892, 0, 0.760638297, 0)
Attic.Size = UDim2.new(0, 126, 0, 32)
Attic.Font = Enum.Font.GothamBold
Attic.Text = "Attic"
Attic.TextColor3 = Color3.new(1, 1, 1)
Attic.TextSize = 14
Attic.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(-16, 35, -220) -- Attic
    end
)

Store.Name = "Store"
Store.Parent = Frame
Store.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
Store.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
Store.BorderSizePixel = 3
Store.Position = UDim2.new(0.0281690061, 0, 0.760638297, 0)
Store.Size = UDim2.new(0, 126, 0, 32)
Store.Font = Enum.Font.GothamBold
Store.Text = "Store"
Store.TextColor3 = Color3.new(1, 1, 1)
Store.TextSize = 14
Store.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(-422, 3, -121) -- Store
    end
)

SewerDrain.Name = "Sewer Drain"
SewerDrain.Parent = Frame
SewerDrain.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
SewerDrain.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
SewerDrain.BorderSizePixel = 3
SewerDrain.Position = UDim2.new(0.0281690061, 0, 0.885638237, 0)
SewerDrain.Size = UDim2.new(0, 126, 0, 32)
SewerDrain.Font = Enum.Font.GothamBold
SewerDrain.Text = "Sewer Drain"
SewerDrain.TextColor3 = Color3.new(1, 1, 1)
SewerDrain.TextSize = 14
SewerDrain.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(129, 3, -125) -- Sewer Lid
    end
)

BossRoom.Name = "Boss Room"
BossRoom.Parent = Frame
BossRoom.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
BossRoom.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
BossRoom.BorderSizePixel = 3
BossRoom.Position = UDim2.new(0.524647892, 0, 0.885638237, 0)
BossRoom.Size = UDim2.new(0, 126, 0, 32)
BossRoom.Font = Enum.Font.GothamBold
BossRoom.Text = "Boss Room"
BossRoom.TextColor3 = Color3.new(1, 1, 1)
BossRoom.TextSize = 14
BossRoom.MouseButton1Down:connect(
    function()
        game.workspace[localplyer].HumanoidRootPart.CFrame = CFrame.new(-39, -287, -1480) -- Final Boss Room
    end
)

VaultCode.Name = "Vault Code"
VaultCode.Parent = Frame
VaultCode.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
VaultCode.BorderColor3 = Color3.new(0.0392157, 0.0588235, 0.0784314)
VaultCode.BorderSizePixel = 3
VaultCode.Position = UDim2.new(0.278169006, 0, 0.43617022, 0)
VaultCode.Size = UDim2.new(0, 126, 0, 32)
VaultCode.Font = Enum.Font.GothamBold
VaultCode.Text = "Vault Code"
VaultCode.TextColor3 = Color3.new(1, 1, 1)
VaultCode.TextSize = 14
VaultCode.MouseButton1Down:connect(
    function()
        game.workspace.CodeNote.CFrame = game.workspace[localplyer].HumanoidRootPart.CFrame
    end
)

-- Scripts:

local function RMIROO_fake_script() -- Frame.LocalScript
    local script = Instance.new("LocalScript", Frame)

    local UserInputService = game:GetService("UserInputService")

    local gui = script.Parent

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )

    gui.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end
    )
end
coroutine.wrap(RMIROO_fake_script)()
