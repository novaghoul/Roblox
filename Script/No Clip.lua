uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

if _G.noclipAll == nil then
	_G.noclipAll = false
end

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        else
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = true
            end
            lplr.Character.HumanoidRootPart.CanCollide = true
        end
    end
)