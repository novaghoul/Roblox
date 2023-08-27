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
virtualUser = game:GetService("VirtualUser")

_G.ws_g = 30
_G.AutoFarm = false

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

function autoFarm()
    if _G.AutoFarm == true then
        _G.AutoFarm = false
    else
        _G.AutoFarm = true
    end
end

function pickupItems()
    for _, v in pairs(wp.Pickups:GetChildren()) do
        if v:IsA("Part") then
            wait(1)
            lplr.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end

function unlockWorld()
    for _, v in pairs(wp.FloatingIslands:GetChildren()) do
        for _, l in pairs(v:GetChildren()) do
            lplr.Character.HumanoidRootPart.CFrame = l.TeleportPoint.CFrame
            wait(0.2)
        end
    end
end

function firstScript()
    lplr.PlayerGui.ScreenGui.BubbleFull.Active = true
    lplr.PlayerGui.ScreenGui.BubbleFull.Draggable = true
end

function infJump()
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
            wait(1)
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
        _G.ws_g = _G.ws_g + 2
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 2
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
        if keyDown == "q" then
            autoFarm()
        end

        if keyDown == "k" then
            -- pickupItems()
        end

        if keyDown == "l" then
            unlockWorld()
        end

        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
        end

        if keyDown == " " then
            infJump()
        end

        if keyDown == "c" then
            changeWS(0)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

firstScript()

game:GetService("RunService").Stepped:connect(
    function()
        if _G.AutoFarm then
            wait(0.1)
            local pos = lplr.Character.HumanoidRootPart.CFrame
            rs.NetworkRemoteEvent:FireServer("BlowBubble")
            local bubblestats = string.split(lplr.PlayerGui.ScreenGui.StatsFrame.Bubble.Amount.Text, "/")
            local CurrentBubbles = tonumber(bubblestats[1])
            local MaxBubbles = tonumber(bubblestats[2])

            if CurrentBubbles >= MaxBubbles then
                pos = lplr.Character.HumanoidRootPart.CFrame
                rs.NetworkRemoteEvent:FireServer("Teleport", "Sell")
                rs.NetworkRemoteEvent:FireServer("SellBubble", "Sell")
                wait(2)
                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(pos.x, pos.y, pos.z)
            end
        end

        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
