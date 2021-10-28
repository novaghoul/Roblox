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

--Script by Kohltastrophe / Toggle made by Kujo ; )
lplr.DevCameraOcclusionMode = "Invisicam" --INVISCAM!!!
local torso = lplr.Character:FindFirstChild("Torso") or lplr.Character:FindFirstChild("UpperTorso")
local dir = {w = 0, s = 0, a = 0, d = 0}
local spd = 2
mouse.KeyDown:connect(
    function(key)
        if key:lower() == "w" then
            dir.w = 1
        elseif key:lower() == "s" then
            dir.s = 1
        elseif key:lower() == "a" then
            dir.a = 1
        elseif key:lower() == "d" then
            dir.d = 1
        elseif key:lower() == "q" then
            spd = spd + 1
        elseif key:lower() == "e" then
            spd = spd - 1
        end
    end
)
mouse.KeyUp:connect(
    function(key)
        if key:lower() == "w" then
            dir.w = 0
        elseif key:lower() == "s" then
            dir.s = 0
        elseif key:lower() == "a" then
            dir.a = 0
        elseif key:lower() == "d" then
            dir.d = 0
        end
    end
)

function checkBody()
    if lplr.Character:FindFirstChild("Torso") then
        torso = lplr.Character.Torso
    else
        torso = lplr.Character.UpperTorso
    end

    return torso
end

enabled = false
mouse.keyDown:connect(
    function(key)
        if (key) == "f" and enabled == false then
            enabled = true
            repeat
                wait(1 / 44)
                checkBody().Anchored = true
                lplr.Character.Humanoid.PlatformStand = true
                torso.CFrame =
                    CFrame.new(torso.Position, wp.CurrentCamera.CoordinateFrame.p) * CFrame.Angles(0, math.rad(180), 0) *
                    CFrame.new((dir.d - dir.a) * spd, 0, (dir.s - dir.w) * spd)
            until enabled == false
        elseif enabled == false then
            lplr.Character.Humanoid.PlatformStand = false
            checkBody().Anchored = false
        end
        if (key) == "f" and enabled == true then
            enabled = false
            lplr.Character.Humanoid.PlatformStand = false
            checkBody().Anchored = false
        end
    end
)
