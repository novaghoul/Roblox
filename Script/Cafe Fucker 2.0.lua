local cg = game:GetService("CoreGui")
local sg = game:GetService("StarterGui")
local wp = game:GetService("Workspace")
local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()

if cg:FindFirstChild("CafeFucker 2.0") then
    cg["CafeFucker 2.0"]:Destroy()
end

local r6 = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
local r15 = {"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm"}
local flyUp = false
local flyDown = false

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local CafeFucker20 = Instance.new("ScreenGui")
local Mainframe = Instance.new("Frame")
local LineDetail = Instance.new("Frame")
local OpenBNT = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local FlingFucker = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
--Properties:
CafeFucker20.Name = "CafeFucker 2.0"
CafeFucker20.Parent = cg
CafeFucker20.ResetOnSpawn = false

Mainframe.Name = "Mainframe"
Mainframe.Parent = CafeFucker20
Mainframe.BackgroundColor3 = Color3.new(0.184314, 0.184314, 0.184314)
Mainframe.BorderColor3 = Color3.new(1, 1, 1)
Mainframe.Position = UDim2.new(0.0904836357, 0, 0.132678136, 0)
Mainframe.Size = UDim2.new(0, 291, 0, 149)
Mainframe.Active = true
Mainframe.Draggable = true

LineDetail.Name = "LineDetail"
LineDetail.Parent = Mainframe
LineDetail.BackgroundColor3 = Color3.new(1, 1, 1)
LineDetail.BorderColor3 = Color3.new(1, 1, 1)
LineDetail.Position = UDim2.new(0, 0, 0.181208044, 0)
LineDetail.Size = UDim2.new(0, 291, 0, 1)

OpenBNT.Name = "OpenBNT"
OpenBNT.Parent = CafeFucker20
OpenBNT.BackgroundColor3 = Color3.new(0.631373, 0.647059, 0.635294)
OpenBNT.Position = UDim2.new(0, 0, 0.819410324, 0)
OpenBNT.Size = UDim2.new(0, 50, 0, 25)
OpenBNT.Font = Enum.Font.SourceSans
OpenBNT.Text = "CLOSE"
OpenBNT.TextColor3 = Color3.new(0, 0, 0)
OpenBNT.TextSize = 15

Close.Name = "Close"
Close.Parent = Mainframe
Close.BackgroundColor3 = Color3.new(1, 0, 0)
Close.BackgroundTransparency = 1
Close.BorderColor3 = Color3.new(1, 0, 0)
Close.Position = UDim2.new(0.632302403, 0, -0.107382536, 0)
Close.Size = UDim2.new(0, 200, 0, 50)
Close.Font = Enum.Font.SciFi
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 0, 0)
Close.TextSize = 15
Close.TextStrokeColor3 = Color3.new(1, 0, 0)

TextLabel.Parent = Mainframe
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.216494843, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 184, 0, 27)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "CafeFucker 2.0"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel.TextWrapped = true

TextLabel_2.Parent = Mainframe
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0.216494843, 0, 0.187919453, 0)
TextLabel_2.Size = UDim2.new(0, 184, 0, 18)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "Update: It can be used on both r6 and r15"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextWrapped = true

FlingFucker.Name = "FlingFucker"
FlingFucker.Parent = Mainframe
FlingFucker.BackgroundColor3 = Color3.new(0.184314, 0.184314, 0.184314)
FlingFucker.BorderColor3 = Color3.new(1, 1, 1)
FlingFucker.Position = UDim2.new(0.189003453, 0, 0.395973176, 0)
FlingFucker.Size = UDim2.new(0, 200, 0, 50)
FlingFucker.Text = "FlingFucker"
FlingFucker.TextColor3 = Color3.new(1, 1, 1)
FlingFucker.TextScaled = true
FlingFucker.TextSize = 14
FlingFucker.TextStrokeColor3 = Color3.new(1, 1, 1)
FlingFucker.TextWrapped = true

TextLabel_3.Parent = Mainframe
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(0.216494843, 0, 0.771812081, 0)
TextLabel_3.Size = UDim2.new(0, 184, 0, 18)
TextLabel_3.Font = Enum.Font.GothamBold
TextLabel_3.Text = 'Use "Q", "E", key to go up and down!'
TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextStrokeColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextWrapped = true
-- Scripts:
OpenBNT.MouseButton1Down:connect(
    function()
        if Mainframe.Visible == false then
            OpenBNT.Text = "CLOSE"
            Mainframe.Visible = true
        else
            OpenBNT.Text = "OPEN"
            Mainframe.Visible = false
        end
    end
)

Close.MouseButton1Down:connect(
    function()
        OpenBNT.Text = "OPEN"
        Mainframe.Visible = false
    end
)

-- Change KillerWheelSpeed to whatever you want, negatives count.
-- Change KillerWheelVersion to 1 or 2, the option doesn't really matter though.
-- Use the keys Q & E to adjust the killer wheel height.
-- Credit goes to CyclicaIIy for the FE kill/fling
-- Rest of the script by Uctron

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return r6
    else
        return r15
    end
end

FlingFucker.MouseButton1Down:connect(
    function()
        KillerWheelSpeed = 10
        KillerWheelVersion = 1
        local torsoname = checkRigType()[2]
        sg:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
        lplr.Character.Humanoid.WalkSpeed = 30
        lplr.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(9e99, 9e99, 9e99, 9e99, 9e99)
        wp.CurrentCamera.CameraSubject = lplr.Character[torsoname]
        if KillerWheelVersion == 1 then
        elseif KillerWheelVersion == 2 then
            for i = 2, #checkRigType() do
                lplr.Character[checkRigType()[i]]:Destroy()
            end
        end
        Died = false
        local savepos = lplr.Character:FindFirstChild("HumanoidRootPart").CFrame
        lplr.Character:FindFirstChild(torsoname).Anchored = true
        local tool = Instance.new("Tool", lplr.Backpack)
        local hat = lplr.Character:FindFirstChildOfClass("Accessory")
        local hathandle = hat.Handle
        hathandle.Parent = tool
        hathandle.Massless = true
        tool.CanBeDropped = false
        tool.GripPos = Vector3.new(0, 9e99, 0)
        tool.Parent = lplr.Character
        repeat
            wait()
        until lplr.Character:FindFirstChildOfClass("Tool") ~= nil
        tool.Grip = CFrame.new(Vector3.new(0, 0, 0))
        lplr.Character:FindFirstChild(torsoname).Anchored = false
        mouse.KeyDown:connect(
            function(key)
                if key == "q" and Died == false then
                    flyUp = true
                    while flyUp do
                        wait()
                        lplr.Character.HumanoidRootPart.CFrame =
                            lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0.5, 0)
                    end
                end
            end
        )

        mouse.KeyUp:connect(
            function(key)
                if key == "q" then
                    flyUp = false
                end
            end
        )

        mouse.KeyDown:connect(
            function(key)
                if key == "e" and Died == false then
                    flyDown = true
                    while flyDown do
                        wait()
                        lplr.Character.HumanoidRootPart.CFrame =
                            lplr.Character.HumanoidRootPart.CFrame - Vector3.new(0, 0.5, 0)
                    end
                end
            end
        )

        mouse.KeyUp:connect(
            function(key)
                if key == "e" then
                    flyDown = false
                end
            end
        )
        repeat
            game:GetService("RunService").Stepped:Wait()
            if lplr.Character.Humanoid.Sit == true then
                for _ = 1, 2 do
                    game:GetService("RunService").Stepped:Wait()
                end
                lplr.Character.Humanoid.Sit = false
            end
            lplr.Character.Humanoid:ChangeState(11)
            lplr.Character.HumanoidRootPart.CFrame =
                lplr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, .1 * KillerWheelSpeed)
            if lplr.Backpack:FindFirstChild("Tool") then
                lplr.Backpack:FindFirstChild("Tool").Parent = lplr.Character
            elseif lplr.Character:FindFirstChild("Tool") then
                lplr.Character:FindFirstChild("Tool").Parent = lplr.Character
            end
        until lplr.Character.Humanoid.Health == 0
        Died = true
        repeat
            game:GetService("RunService").Stepped:Wait()
        until lplr.Character.Humanoid.Health == 100
        sg:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    end
)
