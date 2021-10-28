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

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.ws_g = 20
_G.jp_g = 50
_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

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

function createHitBox(parent)
    local sizeBody = parent[_G.hitBoxBody].Size.x
    parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    parent[_G.hitBoxBody].Material = "Neon"
    parent[_G.hitBoxBody].CanCollide = false

    parent[_G.hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                parent[_G.hitBoxBody].CanCollide = false
            end
        end
    )
end

function hitBox()
    for _, o in pairs(wp["Zombie Storage"]:GetChildren()) do
        if o:WaitForChild("Head") then
            wait(0.1)
            createHitBox(o)
        end
    end

    wp["Zombie Storage"].ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head") then
                wait(0.1)
                createHitBox(m)
            end
        end
    )
end
hitBox()

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

        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
