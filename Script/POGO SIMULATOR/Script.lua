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

spawn(
    function()
        while wait() do
            local Event = lplr.Backpack.Training.E
            Event:FireServer()
        end
    end
)

spawn(
    function()
        while wait() do
            local Event = lplr.Backpack.Pogo.E
            Event:FireServer()
        end
    end
)

spawn(
    function()
        while wait(0.1) do
            for _,v in pairs(wp.Blockers:GetChildren()) do
                v.Border.CFrame = lplr.Character.HumanoidRootPart.CFrame
                v.Border.CanCollide = false
            end
        end
    end
)

