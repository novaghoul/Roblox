uis = game:GetService("UserInputService")
cg = game:GetService("CoreGui")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

_G.hitBoxSize = {3, 3, 3}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.ws_g = 20
_G.jp_g = 50

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

function dropBox(parent)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(245, 205, 48)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function createHitBox(parent)
    for _, v in pairs(parent:GetChildren()) do
        v.Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
        v.Transparency = _G.hitBoxTransparency
        v.BrickColor = BrickColor.new(_G.hitBoxColor)
        v.Material = "Neon"
        v.CanCollide = false

        v.Changed:connect(
            function(property)
                wait(0.1)
                if property == "Size" or property == "CanCollide" then
                    v.Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                    v.CanCollide = false
                end
            end
        )
    end
end

function hitBox()
    for _, o in pairs(wp.Entities.Infected:GetChildren()) do
        if o:WaitForChild("Head Model") then
            createHitBox(o["Head Model"])
        end
    end

    wp.Entities.Infected.ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head Model") then
                wait(0.1)
                createHitBox(m["Head Model"])
            end
        end
    )
end
hitBox()

function firstScript()
    for _, v in pairs(wp.Entities.Objectives:GetChildren()) do
        dropBox(v)
    end

    wp.Entities.Objectives.ChildAdded:connect(
        function(m)
            wait(0.1)
            dropBox(m)
        end
    )

    for _, v in pairs(wp.World.Objectives:GetChildren()) do
        dropBox(v)
    end

    wp.World.Objectives.ChildAdded:connect(
        function(m)
            wait(0.1)
            dropBox(m)
        end
    )
end
firstScript()
-------------------------------------------------------------
--------------------------Other------------------------------
function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = _G.ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            end
        end
    )
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 16 then
            _G.ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "[" then
            changeWS(0)
            notify("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            notify("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
