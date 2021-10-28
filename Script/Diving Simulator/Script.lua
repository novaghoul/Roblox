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

_G = {
    currentLocation = CFrame.new(165, 250, 74),
    sellLocation = CFrame.new(165, 250, 74)
}

function infJump()
    lplr.Character.Humanoid.JumpPower = 50
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end
        
        if keyDown == "l" then
            lplr.Character.HumanoidRootPart.CFrame = _G.currentLocation
        end

        if keyDown == "k" then
            _G.currentLocation = lplr.Character.HumanoidRootPart.CFrame
            wait(0.1)
            lplr.Character.HumanoidRootPart.CFrame = _G.sellLocation
        end
    end
)