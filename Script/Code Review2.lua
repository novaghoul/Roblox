local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MainB = Instance.new("TextButton")
local ScriptsB = Instance.new("TextButton")
local CreditsB = Instance.new("TextButton")
local Main = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local TextButton_5 = Instance.new("TextButton")
local TextButton_6 = Instance.new("TextButton")
local TextButton_7 = Instance.new("TextButton")
local Scripts = Instance.new("Frame")
local TextButton_8 = Instance.new("TextButton")
local TextButton_9 = Instance.new("TextButton")
local TextButton_10 = Instance.new("TextButton")
local TextButton_11 = Instance.new("TextButton")
local TextButton_12 = Instance.new("TextButton")
local Credits = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextButton_13 = Instance.new("TextButton")
local TextButton_14 = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local TextButton_15 = Instance.new("TextButton")
local ExecutorB = Instance.new("TextButton")
local Executor = Instance.new("Frame")
Frame.Draggable = true
Frame.Active = true
Frame.Selectible = true
Frame.Visible = true
Credits.Visible = false
Main.Visible = true
Scripts.Visible = false
Executor.Visible = false

--Properties:
ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(0.0235294, 0.0235294, 0.0235294)
Frame.Position = UDim2.new(0.313, 0, 0.42, 0)
Frame.Size = UDim2.new(0, 443, 0, 37)

MainB.Name = "MainB"
MainB.Parent = Frame
MainB.BackgroundColor3 = Color3.new(1, 1, 1)
MainB.Position = UDim2.new(0, 0, 0.297297299, 0)
MainB.Size = UDim2.new(0, 115, 0, 26)
MainB.Font = Enum.Font.SourceSans
MainB.Text = "Main"
MainB.TextColor3 = Color3.new(0, 0, 0)
MainB.TextSize = 14
MainB.MouseButton1Down:connect(
    function()
        Main.Visible = true
        Credits.Visible = false
        Scripts.Visible = false
        Executor.Visible = false
    end
)

ScriptsB.Name = "ScriptsB"
ScriptsB.Parent = Frame
ScriptsB.BackgroundColor3 = Color3.new(1, 1, 1)
ScriptsB.Position = UDim2.new(0.259593666, 0, 0.297297299, 0)
ScriptsB.Size = UDim2.new(0, 115, 0, 25)
ScriptsB.Font = Enum.Font.SourceSans
ScriptsB.Text = "Scripts"
ScriptsB.TextColor3 = Color3.new(0, 0, 0)
ScriptsB.TextSize = 14
ScriptsB.MouseButton1Down:connect(
    function()
        Main.Visible = false
        Credits.Visible = false
        Scripts.Visible = true
        Executor.Visible = false
    end
)

CreditsB.Name = "CreditsB"
CreditsB.Parent = Frame
CreditsB.BackgroundColor3 = Color3.new(1, 1, 1)
CreditsB.Position = UDim2.new(0.519187331, 0, 0.297297299, 0)
CreditsB.Size = UDim2.new(0, 115, 0, 25)
CreditsB.Font = Enum.Font.SourceSans
CreditsB.Text = "Credits"
CreditsB.TextColor3 = Color3.new(0, 0, 0)
CreditsB.TextSize = 14
CreditsB.MouseButton1Down:connect(
    function()
        Main.Visible = false
        Credits.Visible = true
        Scripts.Visible = false
        Executor.Visible = false
    end
)

Main.Name = "Main"
Main.Parent = Frame
Main.BackgroundColor3 = Color3.new(0.631373, 0.447059, 1)
Main.Position = UDim2.new(-0.000277638435, 0, 1.00986481, 0)
Main.Size = UDim2.new(0, 443, 0, 195)

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.Position = UDim2.new(0.227542147, 0, 0.668550551, 0)
TextButton.Size = UDim2.new(0, 89, 0, 27)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "JumpPower +5"
TextButton.TextColor3 = Color3.new(0, 0, 0)
TextButton.TextSize = 14
TextButton.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.JumpPower = lplr.Character.Humanoid.JumpPower + 5
    end
)

TextButton_2.Parent = Main
TextButton_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_2.Position = UDim2.new(-0.000330885872, 0, 0.863108337, 0)
TextButton_2.Size = UDim2.new(0, 89, 0, 27)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "WalkSpeed -5"
TextButton_2.TextColor3 = Color3.new(0, 0, 0)
TextButton_2.TextSize = 14
TextButton_2.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.WalkSpeed = lplr.Character.Humanoid.WalkSpeed - 5
    end
)

TextButton_3.Parent = Main
TextButton_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_3.Position = UDim2.new(-0.000330885872, 0, 0.668550551, 0)
TextButton_3.Size = UDim2.new(0, 89, 0, 27)
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "WalkSpeed +5"
TextButton_3.TextColor3 = Color3.new(0, 0, 0)
TextButton_3.TextSize = 14
TextButton_3.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.WalkSpeed = lplr.Character.Humanoid.WalkSpeed + 5
    end
)

TextButton_4.Parent = Main
TextButton_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_4.Position = UDim2.new(0.227542147, 0, 0.863108397, 0)
TextButton_4.Size = UDim2.new(0, 89, 0, 27)
TextButton_4.Font = Enum.Font.SourceSans
TextButton_4.Text = "JumpPower -5"
TextButton_4.TextColor3 = Color3.new(0, 0, 0)
TextButton_4.TextSize = 14
TextButton_4.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.JumpPower = lplr.Character.Humanoid.JumpPower - 5
    end
)

TextButton_5.Parent = Main
TextButton_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_5.Position = UDim2.new(0.798648238, 0, 0.863422334, 0)
TextButton_5.Size = UDim2.new(0, 89, 0, 27)
TextButton_5.Font = Enum.Font.SourceSans
TextButton_5.Text = "Fe Btools"
TextButton_5.TextColor3 = Color3.new(0, 0, 0)
TextButton_5.TextSize = 14
TextButton_5.MouseButton1Down:connect(
    function()
        local tool1 = Instance.new("HopperBin", lplr.Backpack)
        local tool2 = Instance.new("HopperBin", lplr.Backpack)
        local tool3 = Instance.new("HopperBin", lplr.Backpack)
        local tool4 = Instance.new("HopperBin", lplr.Backpack)
        local tool5 = Instance.new("HopperBin", lplr.Backpack)
        tool1.BinType = "Clone"
        tool2.BinType = "GameTool"
        tool3.BinType = "Hammer"
        tool4.BinType = "Script"
        tool5.BinType = "Grab"
    end
)

TextButton_6.Parent = Main
TextButton_6.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_6.Position = UDim2.new(0.460165739, 0, 0.863422394, 0)
TextButton_6.Size = UDim2.new(0, 89, 0, 27)
TextButton_6.Font = Enum.Font.SourceSans
TextButton_6.Text = "HipHeight +5"
TextButton_6.TextColor3 = Color3.new(0, 0, 0)
TextButton_6.TextSize = 14
TextButton_6.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.HipHeight = lplr.Character.Humanoid.HipHeight + 5
    end
)

TextButton_7.Parent = Main
TextButton_7.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_7.Position = UDim2.new(0.460165739, 0, 0.668550611, 0)
TextButton_7.Size = UDim2.new(0, 89, 0, 27)
TextButton_7.Font = Enum.Font.SourceSans
TextButton_7.Text = "HipHeight -5"
TextButton_7.TextColor3 = Color3.new(0, 0, 0)
TextButton_7.TextSize = 14
TextButton_7.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.HipHeight = lplr.Character.Humanoid.HipHeight - 5
    end
)

Scripts.Name = "Scripts"
Scripts.Parent = Frame
Scripts.BackgroundColor3 = Color3.new(0.631373, 0.447059, 1)
Scripts.Position = UDim2.new(4.47034836e-08, 0, 1, 0)
Scripts.Size = UDim2.new(0, 443, 0, 195)
Scripts.Visible = false

TextButton_8.Parent = Scripts
TextButton_8.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_8.Position = UDim2.new(-0.000330885872, 0, 0.863422334, 0)
TextButton_8.Size = UDim2.new(0, 89, 0, 27)
TextButton_8.Font = Enum.Font.SourceSans
TextButton_8.Text = "ClickTPTool"
TextButton_8.TextColor3 = Color3.new(0, 0, 0)
TextButton_8.TextSize = 14
TextButton_8.MouseButton1Down:connect(
    function()
        mouse = lplr:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Click Teleport"
        tool.Activated:connect(
            function()
                local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
                pos = CFrame.new(pos.X, pos.Y, pos.Z)
                lplr.Character.HumanoidRootPart.CFrame = pos
            end
        )
        tool.Parent = lplr.Backpack
    end
)

TextButton_9.Parent = Scripts
TextButton_9.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_9.Position = UDim2.new(-0.000330885872, 0, 0.668550551, 0)
TextButton_9.Size = UDim2.new(0, 89, 0, 27)
TextButton_9.Font = Enum.Font.SourceSans
TextButton_9.Text = "EnableInventory"
TextButton_9.TextColor3 = Color3.new(0, 0, 0)
TextButton_9.TextSize = 14
TextButton_9.MouseButton1Down:connect(
    function()
        game.StarterGui:SetCoreGuiEnabled(2, true)
    end
)

TextButton_10.Parent = Scripts
TextButton_10.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_10.Position = UDim2.new(-0.000330885872, 0, 0.478806973, 0)
TextButton_10.Size = UDim2.new(0, 89, 0, 27)
TextButton_10.Font = Enum.Font.SourceSans
TextButton_10.Text = "Fe God"
TextButton_10.TextColor3 = Color3.new(0, 0, 0)
TextButton_10.TextSize = 14
TextButton_10.MouseButton1Down:connect(
    function()
        lplr.Character.Humanoid.Name = 1
        local l = lplr.Character["1"]:Clone()
        l.Parent = lplr.Character
        l.Name = "Humanoid"
        wait(0.1)
        lplr.Character["1"]:Destroy()
        game.Workspace.CurrentCamera.CameraSubject = lplr.Character
        lplr.Character.Animate.Disabled = true
        wait(0.1)
        lplr.Character.Animate.Disabled = false
        lplr.Character.Humanoid.DisplayDistanceType = "None"
    end
)

TextButton_11.Parent = Scripts
TextButton_11.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_11.Position = UDim2.new(-0.000330885872, 0, 0.294191599, 0)
TextButton_11.Size = UDim2.new(0, 89, 0, 27)
TextButton_11.Font = Enum.Font.SourceSans
TextButton_11.Text = "Respawn"
TextButton_11.TextColor3 = Color3.new(0, 0, 0)
TextButton_11.TextSize = 14
TextButton_11.MouseButton1Down:connect(
    function()
        local prt = Instance.new("Model", workspace)
        Instance.new("Part", prt).Name = "Torso"
        Instance.new("Part", prt).Name = "Head"
        Instance.new("Humanoid", prt).Name = "Humanoid"
        lplr.Character = prt
    end
)

TextButton_12.Parent = Scripts
TextButton_12.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_12.Position = UDim2.new(0.22766009, 0, 0.863422394, 0)
TextButton_12.Size = UDim2.new(0, 89, 0, 27)
TextButton_12.Font = Enum.Font.SourceSans
TextButton_12.Text = "Invisible"
TextButton_12.TextColor3 = Color3.new(0, 0, 0)
TextButton_12.TextSize = 14
TextButton_12.MouseButton1Down:connect(
    function()
        Local = lplr
        Char = Local.Character
        touched, tpdback = false, false
        Local.CharacterAdded:connect(
            function(char)
                if script.Disabled ~= true then
                    wait(.25)
                    loc = Char.HumanoidRootPart.Position
                    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
                end
            end
        )
        game:GetService("UserInputService").InputBegan:connect(
            function(key)
                if key.KeyCode == Enum.KeyCode.Equals then
                    if script.Disabled ~= true then
                        script.Disabled = true
                        print "you may re-execute"
                    end
                end
            end
        )
        box = Instance.new("Part", workspace)
        box.Anchored = true
        box.CanCollide = true
        box.Size = Vector3.new(10, 1, 10)
        box.Position = Vector3.new(0, 10000, 0)
        box.Touched:connect(
            function(part)
                if (part.Parent.Name == Local.Name) then
                    if touched == false then
                        touched = true
                        function apply()
                            if script.Disabled ~= true then
                                no = Char.HumanoidRootPart:Clone()
                                wait(.25)
                                Char.HumanoidRootPart:Destroy()
                                no.Parent = Char
                                Char:MoveTo(loc)
                                touched = false
                            end
                        end
                        if Char then
                            apply()
                        end
                    end
                end
            end
        )
        repeat
            wait()
        until Char
        loc = Char.HumanoidRootPart.Position
        Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
    end
)

Credits.Name = "Credits"
Credits.Parent = Frame
Credits.BackgroundColor3 = Color3.new(0.631373, 0.447059, 1)
Credits.Position = UDim2.new(0, 0, 1, 0)
Credits.Size = UDim2.new(0, 443, 0, 195)
Credits.Visible = false

TextLabel.Parent = Credits
TextLabel.BackgroundColor3 = Color3.new(0.396078, 0.658824, 1)
TextLabel.Position = UDim2.new(0, 0, 0.158163264, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Scripted By Gogo1000"
TextLabel.TextColor3 = Color3.new(0, 0, 0)
TextLabel.TextSize = 14

TextLabel_2.Parent = Credits
TextLabel_2.BackgroundColor3 = Color3.new(0.396078, 0.658824, 1)
TextLabel_2.Position = UDim2.new(0, 0, 0.413265288, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Designed By RockeDev"
TextLabel_2.TextColor3 = Color3.new(0, 0, 0)
TextLabel_2.TextSize = 14

TextButton_13.Parent = Frame
TextButton_13.BackgroundColor3 = Color3.new(1, 0, 0)
TextButton_13.Position = UDim2.new(0.966139972, 0, 0, 0)
TextButton_13.Size = UDim2.new(0, 15, 0, 36)
TextButton_13.Font = Enum.Font.SourceSans
TextButton_13.Text = "X"
TextButton_13.TextColor3 = Color3.new(0, 0, 0)
TextButton_13.TextSize = 14
TextButton_13.MouseButton1Down:connect(
    function()
        Frame.Visible = false
        Credits.Visible = false
        Main.Visible = false
        Scripts.Visible = false
        Executor.Visible = false
    end
)

TextButton_14.Parent = ScreenGui
TextButton_14.BackgroundColor3 = Color3.new(0.764706, 0.764706, 0.764706)
TextButton_14.Position = UDim2.new(0.441048026, 0, 0.959183633, 0)
TextButton_14.Size = UDim2.new(0, 132, 0, 24)
TextButton_14.Font = Enum.Font.SourceSans
TextButton_14.Text = "Open GUI"
TextButton_14.TextColor3 = Color3.new(0, 0, 0)
TextButton_14.TextSize = 14
TextButton_14.MouseButton1Down:connect(
    function()
        Frame.Visible = true
        Credits.Visible = false
        Main.Visible = true
        Scripts.Visible = false
        Executor.Visible = false
    end
)

ExecutorB.Name = "ExecutorB"
ExecutorB.Parent = Frame
ExecutorB.BackgroundColor3 = Color3.new(1, 1, 1)
ExecutorB.Position = UDim2.new(0.778781056, 0, 0.297297299, 0)
ExecutorB.Size = UDim2.new(0, 83, 0, 25)
ExecutorB.Font = Enum.Font.SourceSans
ExecutorB.Text = "Executor"
ExecutorB.TextColor3 = Color3.new(0, 0, 0)
ExecutorB.TextSize = 14
ExecutorB.MouseButton1Down:connect(
    function()
        Credits.Visible = false
        Main.Visible = false
        Scripts.Visible = false
        Executor.Visible = true
    end
)

Executor.Name = "Executor"
Executor.Parent = Frame
Executor.BackgroundColor3 = Color3.new(0.631373, 0.447059, 1)
Executor.Position = UDim2.new(0, 0, 0.972972989, 0)
Executor.Size = UDim2.new(0, 443, 0, 195)

TextButton_15.Parent = Executor
TextButton_15.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_15.Position = UDim2.new(0.38374716, 0, 0.728205144, 0)
TextButton_15.Size = UDim2.new(0, 89, 0, 27)
TextButton_15.Font = Enum.Font.SourceSans
TextButton_15.Text = "Execute"
TextButton_15.TextColor3 = Color3.new(0, 0, 0)
TextButton_15.TextSize = 14
TextButton_15.MouseButton1Down:connect(
    function()
        loadstring(TextBox.Text)()
    end
)

TextBox.Parent = Executor
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.Position = UDim2.new(0.128668174, 0, 0.0820512846, 0)
TextBox.Size = UDim2.new(0, 328, 0, 114)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = "Script here"
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.TextSize = 14
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
-- Scripts:
