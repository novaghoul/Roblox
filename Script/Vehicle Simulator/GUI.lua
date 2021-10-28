-- VEIHCLE SIMULATOR SPEED HACK

local VehicleSimulatorGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MaxSpeedLabel = Instance.new("TextLabel")
local TorqueLabel = Instance.new("TextLabel")
local NitroSpeedLabel = Instance.new("TextLabel")
local NitroForceLabel = Instance.new("TextLabel")
local JumpHeightLabel = Instance.new("TextLabel")
local MaxSpeedTextBox = Instance.new("TextBox")
local TorqueTextBox = Instance.new("TextBox")
local NitroSpeedTextBox = Instance.new("TextBox")
local NitroForceTextBox = Instance.new("TextBox")
local JumpHeightTextBox = Instance.new("TextBox")
local MaxSpeedButton = Instance.new("TextButton")
local TorqueButton = Instance.new("TextButton")
local NitroSpeedButton = Instance.new("TextButton")
local NitroForceButton = Instance.new("TextButton")
local JumpHeightButton = Instance.new("TextButton")
local SuperCarButton = Instance.new("TextButton")
local TPCarToTunnelButton = Instance.new("TextButton")
local TPPlayerToCarButton = Instance.new("TextButton")
local ESPCratesButton = Instance.new("TextButton")
local TPCratesButton = Instance.new("TextButton")

VehicleSimulatorGui.Name = "VehicleSimulatorGui"
VehicleSimulatorGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = VehicleSimulatorGui
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0.150000006, 0, 0.200000003, 0)
MainFrame.Active = true
MainFrame.Draggable = true

MaxSpeedLabel.Name = "MaxSpeedLabel"
MaxSpeedLabel.Parent = MainFrame
MaxSpeedLabel.BackgroundColor3 = Color3.new(1, 1, 1)
MaxSpeedLabel.BorderSizePixel = 2
MaxSpeedLabel.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
MaxSpeedLabel.Font = Enum.Font.SourceSans
MaxSpeedLabel.FontSize = Enum.FontSize.Size14
MaxSpeedLabel.Text = "Max Speed = 250"
MaxSpeedLabel.TextSize = 14

TorqueLabel.Name = "TorqueLabel"
TorqueLabel.Parent = MainFrame
TorqueLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TorqueLabel.BorderSizePixel = 2
TorqueLabel.Position = UDim2.new(0, 0, 0.100000001, 0)
TorqueLabel.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
TorqueLabel.Font = Enum.Font.SourceSans
TorqueLabel.FontSize = Enum.FontSize.Size14
TorqueLabel.Text = "Torque  = 250"
TorqueLabel.TextSize = 14

NitroSpeedLabel.Name = "NitroSpeedLabel"
NitroSpeedLabel.Parent = MainFrame
NitroSpeedLabel.BackgroundColor3 = Color3.new(1, 1, 1)
NitroSpeedLabel.BorderSizePixel = 2
NitroSpeedLabel.Position = UDim2.new(0, 0, 0.200000003, 0)
NitroSpeedLabel.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
NitroSpeedLabel.Font = Enum.Font.SourceSans
NitroSpeedLabel.FontSize = Enum.FontSize.Size14
NitroSpeedLabel.Text = "Nitro Speed = 250"
NitroSpeedLabel.TextSize = 14

NitroForceLabel.Name = "NitroForceLabel"
NitroForceLabel.Parent = MainFrame
NitroForceLabel.BackgroundColor3 = Color3.new(1, 1, 1)
NitroForceLabel.BorderSizePixel = 2
NitroForceLabel.Position = UDim2.new(0, 0, 0.300000012, 0)
NitroForceLabel.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
NitroForceLabel.Font = Enum.Font.SourceSans
NitroForceLabel.FontSize = Enum.FontSize.Size14
NitroForceLabel.Text = "Nitro Force = 500"
NitroForceLabel.TextSize = 14

JumpHeightLabel.Name = "JumpHeightLabel"
JumpHeightLabel.Parent = MainFrame
JumpHeightLabel.BackgroundColor3 = Color3.new(1, 1, 1)
JumpHeightLabel.BorderSizePixel = 2
JumpHeightLabel.Position = UDim2.new(0, 0, 0.400000006, 0)
JumpHeightLabel.Size = UDim2.new(0.600000024, 0, 0.100000001, 0)
JumpHeightLabel.Font = Enum.Font.SourceSans
JumpHeightLabel.FontSize = Enum.FontSize.Size14
JumpHeightLabel.Text = "Jump Height = 50"
JumpHeightLabel.TextSize = 14

MaxSpeedTextBox.Name = "MaxSpeedTextBox"
MaxSpeedTextBox.Parent = MainFrame
MaxSpeedTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
MaxSpeedTextBox.BorderSizePixel = 2
MaxSpeedTextBox.Position = UDim2.new(0.600000024, 0, 0, 0)
MaxSpeedTextBox.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
MaxSpeedTextBox.Font = Enum.Font.SourceSansBold
MaxSpeedTextBox.FontSize = Enum.FontSize.Size14
MaxSpeedTextBox.Text = "10000"
MaxSpeedTextBox.TextColor3 = Color3.new(0, 0.0470588, 1)
MaxSpeedTextBox.TextSize = 14

TorqueTextBox.Name = "TorqueTextBox"
TorqueTextBox.Parent = MainFrame
TorqueTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TorqueTextBox.BorderSizePixel = 2
TorqueTextBox.Position = UDim2.new(0.600000024, 0, 0.100000001, 0)
TorqueTextBox.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
TorqueTextBox.Font = Enum.Font.SourceSansBold
TorqueTextBox.FontSize = Enum.FontSize.Size14
TorqueTextBox.Text = "40000"
TorqueTextBox.TextColor3 = Color3.new(0, 0.0470588, 1)
TorqueTextBox.TextSize = 14

NitroSpeedTextBox.Name = "NitroSpeedTextBox"
NitroSpeedTextBox.Parent = MainFrame
NitroSpeedTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
NitroSpeedTextBox.BorderSizePixel = 2
NitroSpeedTextBox.Position = UDim2.new(0.600000024, 0, 0.200000003, 0)
NitroSpeedTextBox.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
NitroSpeedTextBox.Font = Enum.Font.SourceSansBold
NitroSpeedTextBox.FontSize = Enum.FontSize.Size14
NitroSpeedTextBox.Text = "500"
NitroSpeedTextBox.TextColor3 = Color3.new(0, 0.0470588, 1)
NitroSpeedTextBox.TextSize = 14

NitroForceTextBox.Name = "NitroForceTextBox"
NitroForceTextBox.Parent = MainFrame
NitroForceTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
NitroForceTextBox.BorderSizePixel = 2
NitroForceTextBox.Position = UDim2.new(0.600000024, 0, 0.300000012, 0)
NitroForceTextBox.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
NitroForceTextBox.Font = Enum.Font.SourceSansBold
NitroForceTextBox.FontSize = Enum.FontSize.Size14
NitroForceTextBox.Text = "5000"
NitroForceTextBox.TextColor3 = Color3.new(0, 0.0470588, 1)
NitroForceTextBox.TextSize = 14

JumpHeightTextBox.Name = "JumpHeightTextBox"
JumpHeightTextBox.Parent = MainFrame
JumpHeightTextBox.BackgroundColor3 = Color3.new(1, 1, 1)
JumpHeightTextBox.BorderSizePixel = 2
JumpHeightTextBox.Position = UDim2.new(0.600000024, 0, 0.400000006, 0)
JumpHeightTextBox.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
JumpHeightTextBox.Font = Enum.Font.SourceSansBold
JumpHeightTextBox.FontSize = Enum.FontSize.Size14
JumpHeightTextBox.Text = "250"
JumpHeightTextBox.TextColor3 = Color3.new(0, 0.0470588, 1)
JumpHeightTextBox.TextSize = 14

MaxSpeedButton.Name = "MaxSpeedButton"
MaxSpeedButton.Parent = MainFrame
MaxSpeedButton.BackgroundColor3 = Color3.new(1, 1, 1)
MaxSpeedButton.BorderSizePixel = 2
MaxSpeedButton.Position = UDim2.new(0.800000012, 0, 0, 0)
MaxSpeedButton.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
MaxSpeedButton.Font = Enum.Font.SourceSans
MaxSpeedButton.FontSize = Enum.FontSize.Size14
MaxSpeedButton.Text = "Set"
MaxSpeedButton.TextSize = 14

TorqueButton.Name = "TorqueButton"
TorqueButton.Parent = MainFrame
TorqueButton.BackgroundColor3 = Color3.new(1, 1, 1)
TorqueButton.BorderSizePixel = 2
TorqueButton.Position = UDim2.new(0.800000012, 0, 0.100000001, 0)
TorqueButton.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
TorqueButton.Font = Enum.Font.SourceSans
TorqueButton.FontSize = Enum.FontSize.Size14
TorqueButton.Text = "Set"
TorqueButton.TextSize = 14

NitroSpeedButton.Name = "NitroSpeedButton"
NitroSpeedButton.Parent = MainFrame
NitroSpeedButton.BackgroundColor3 = Color3.new(1, 1, 1)
NitroSpeedButton.BorderSizePixel = 2
NitroSpeedButton.Position = UDim2.new(0.800000012, 0, 0.200000003, 0)
NitroSpeedButton.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
NitroSpeedButton.Font = Enum.Font.SourceSans
NitroSpeedButton.FontSize = Enum.FontSize.Size14
NitroSpeedButton.Text = "Set"
NitroSpeedButton.TextSize = 14

NitroForceButton.Name = "NitroForceButton"
NitroForceButton.Parent = MainFrame
NitroForceButton.BackgroundColor3 = Color3.new(1, 1, 1)
NitroForceButton.BorderSizePixel = 2
NitroForceButton.Position = UDim2.new(0.800000012, 0, 0.300000012, 0)
NitroForceButton.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
NitroForceButton.Font = Enum.Font.SourceSans
NitroForceButton.FontSize = Enum.FontSize.Size14
NitroForceButton.Text = "Set"
NitroForceButton.TextSize = 14

JumpHeightButton.Name = "JumpHeightButton"
JumpHeightButton.Parent = MainFrame
JumpHeightButton.BackgroundColor3 = Color3.new(1, 1, 1)
JumpHeightButton.BorderSizePixel = 2
JumpHeightButton.Position = UDim2.new(0.800000012, 0, 0.400000006, 0)
JumpHeightButton.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
JumpHeightButton.Font = Enum.Font.SourceSans
JumpHeightButton.FontSize = Enum.FontSize.Size14
JumpHeightButton.Text = "Set"
JumpHeightButton.TextSize = 14

SuperCarButton.Name = "SuperCarButton"
SuperCarButton.Parent = MainFrame
SuperCarButton.BackgroundColor3 = Color3.new(1, 1, 1)
SuperCarButton.BorderSizePixel = 2
SuperCarButton.Position = UDim2.new(0, 0, 0.600000024, 0)
SuperCarButton.Size = UDim2.new(1, 0, 0.100000001, 0)
SuperCarButton.Font = Enum.Font.SourceSans
SuperCarButton.FontSize = Enum.FontSize.Size14
SuperCarButton.Text = "Super Car Preset"
SuperCarButton.TextSize = 14

TPCarToTunnelButton.Name = "TPCarToTunnelButton"
TPCarToTunnelButton.Parent = MainFrame
TPCarToTunnelButton.BackgroundColor3 = Color3.new(1, 1, 1)
TPCarToTunnelButton.BorderSizePixel = 2
TPCarToTunnelButton.Position = UDim2.new(0, 0, 0.699999988, 0)
TPCarToTunnelButton.Size = UDim2.new(1, 0, 0.100000001, 0)
TPCarToTunnelButton.Font = Enum.Font.SourceSans
TPCarToTunnelButton.FontSize = Enum.FontSize.Size14
TPCarToTunnelButton.Text = "TP car to long tunnel"
TPCarToTunnelButton.TextSize = 14

TPPlayerToCarButton.Name = "TPPlayerToCarButton"
TPPlayerToCarButton.Parent = MainFrame
TPPlayerToCarButton.BackgroundColor3 = Color3.new(1, 1, 1)
TPPlayerToCarButton.BorderSizePixel = 2
TPPlayerToCarButton.Position = UDim2.new(0, 0, 0.800000012, 0)
TPPlayerToCarButton.Size = UDim2.new(1, 0, 0.100000001, 0)
TPPlayerToCarButton.Font = Enum.Font.SourceSans
TPPlayerToCarButton.FontSize = Enum.FontSize.Size14
TPPlayerToCarButton.Text = "TP player to car"
TPPlayerToCarButton.TextSize = 14

ESPCratesButton.Name = "ESPCratesButton"
ESPCratesButton.Parent = MainFrame
ESPCratesButton.BackgroundColor3 = Color3.new(1, 1, 1)
ESPCratesButton.BorderSizePixel = 2
ESPCratesButton.Position = UDim2.new(0, 0, 0.899999976, 0)
ESPCratesButton.Size = UDim2.new(0.5, 0, 0.100000001, 0)
ESPCratesButton.Font = Enum.Font.SourceSans
ESPCratesButton.FontSize = Enum.FontSize.Size14
ESPCratesButton.Text = "ESP all crates"
ESPCratesButton.TextSize = 14

TPCratesButton.Name = "TPCratesButton"
TPCratesButton.Parent = MainFrame
TPCratesButton.BackgroundColor3 = Color3.new(1, 1, 1)
TPCratesButton.BorderSizePixel = 2
TPCratesButton.Position = UDim2.new(0.5, 0, 0.899999976, 0)
TPCratesButton.Size = UDim2.new(0.5, 0, 0.100000001, 0)
TPCratesButton.Font = Enum.Font.SourceSans
TPCratesButton.FontSize = Enum.FontSize.Size14
TPCratesButton.Text = "TP to all crates"
TPCratesButton.TextSize = 14

function findCar()
    local vehicle = workspace.Vehicles:getChildren()
    for i = 1, #vehicle do
        if vehicle[i]:findFirstChild("owner") then
            if vehicle[i].owner.Value == game.Players.LocalPlayer.Name then
                myCar = vehicle[i]
            end
        end
    end
end

TPCratesButton.MouseButton1Down:connect(
    function()
        local crates = workspace:getChildren()
        for i = 1, #crates do
            if crates[i].ClassName == "Model" then
                local crates2 = crates[i]:getChildren()
                for i = 1, #crates2 do
                    if crates2[i].ClassName == "Model" then
                        local crates3 = crates2[i]:getChildren()
                        for i = 1, #crates3 do
                            if crates3[i].ClassName == "MeshPart" then
                                if crates3[i]:findFirstChild("Smoke") then
                                    game.Players.LocalPlayer.Character:MoveTo(
                                        Vector3.new(
                                            crates3[i].Position.X,
                                            crates3[i].Position.Y + 5,
                                            crates3[i].Position.Z
                                        )
                                    )
                                    wait()
                                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(
                                        Vector3.new(crates3[i].Position.X, crates3[i].Position.Y, crates3[i].Position.Z)
                                    )
                                    wait(4)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)

ESPCratesButton.MouseButton1Down:connect(
    function()
        local crates = workspace:getChildren()
        for i = 1, #crates do
            if crates[i].ClassName == "Model" then
                local crates2 = crates[i]:getChildren()
                for i = 1, #crates2 do
                    if crates2[i].ClassName == "Model" then
                        local crates3 = crates2[i]:getChildren()
                        for i = 1, #crates3 do
                            if crates3[i].ClassName == "MeshPart" then
                                if crates3[i]:findFirstChild("Smoke") then
                                    if crates3[i]:findFirstChild("BoxHandleAdornment") then
                                    else
                                        local a = Instance.new("BoxHandleAdornment", crates3[i])
                                        a.Size = Vector3.new(10, 500, 6)
                                        a.SizeRelativeOffset = Vector3.new(0, 135, 0)
                                        a.Color3 = Color3.fromRGB(0, 255, 0)
                                        a.Transparency = 0.5
                                        a.AlwaysOnTop = true
                                        a.Adornee = crates3[i]
                                        a.ZIndex = 1
                                        local b = Instance.new("BoxHandleAdornment", crates3[i])
                                        b.Size = Vector3.new(10, 4, 6)
                                        b.Color3 = Color3.fromRGB(0, 0, 255)
                                        b.Transparency = 0.3
                                        b.AlwaysOnTop = true
                                        b.Adornee = crates3[i]
                                        b.ZIndex = 1
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)

TPPlayerToCarButton.MouseButton1Down:connect(
    function()
        findCar()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(myCar.Chassis.VehicleSeat.Position + myCar.Chassis.VehicleSeat.SeatOffset.Value)
    end
)

TPCarToTunnelButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar:MoveTo(Vector3.new(-2180, 45, -3650))
    end
)

SuperCarButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.MaxSpeed.Value = 10000
        myCar.Handling.Torque.Value = 40000
        myCar.Handling.SteeringRadiusConstant.Value = 15000
        myCar.Handling.FrictionRoad.Value = 250
        myCar.Handling.Nitro.NitroSpeed.Value = 500
        myCar.Handling.Nitro.NitroForce.Value = 5000
        myCar.Handling.TurboJump.TurboJumpHeight.Value = 250
    end
)

MaxSpeedButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.MaxSpeed.Value = MaxSpeedTextBox.Text
        myCar.Handling.SteeringRadiusConstant.Value = 15000
    end
)

TorqueButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.Torque.Value = TorqueTextBox.Text
    end
)

NitroSpeedButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.Nitro.NitroSpeed.Value = NitroSpeedTextBox.Text
    end
)

NitroForceButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.Nitro.NitroForce.Value = NitroForceTextBox.Text
    end
)

JumpHeightButton.MouseButton1Down:connect(
    function()
        findCar()
        myCar.Handling.TurboJump.TurboJumpHeight.Value = JumpHeightTextBox.Text
    end
)

spawn(
    function()
        while true do
            wait(0.2)
            findCar()
            if myCar:findFirstChild("Handling") then
                if myCar.Handling:findFirstChild("MaxSpeed") then
                    MaxSpeedLabel.Text = "Max Speed = " .. myCar.Handling.MaxSpeed.Value
                end
                if myCar.Handling:findFirstChild("Torque") then
                    TorqueLabel.Text = "Torque = " .. myCar.Handling.Torque.Value
                end
                if myCar.Handling:findFirstChild("Nitro") then
                    if myCar.Handling.Nitro:findFirstChild("NitroSpeed") then
                        NitroSpeedLabel.Text = "Nitro Speed = " .. myCar.Handling.Nitro.NitroSpeed.Value
                    end
                    if myCar.Handling.Nitro:findFirstChild("NitroForce") then
                        NitroForceLabel.Text = "Nitro Force = " .. myCar.Handling.Nitro.NitroForce.Value
                    end
                end
                if myCar.Handling:findFirstChild("TurboJump") then
                    if myCar.Handling.TurboJump:findFirstChild("TurboJumpHeight") then
                        JumpHeightLabel.Text = "Jump Height = " .. myCar.Handling.TurboJump.TurboJumpHeight.Value
                    end
                end
            end
        end
    end
)
