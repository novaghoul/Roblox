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

function autoFarm()
    for _, v in pairs(wp.GameComponents.ClientCoins:GetChildren()) do
        if tostring(v.Name) == "Marwen - 16" or tostring(v.Name) == "Shippy Place - 17" or tostring(v.Name) == "Sandcastles - 18" then
            for _, k in pairs(v:GetChildren()) do
                local pos = k.CFrame
                local A_1 = Vector3.new(pos.x, pos.y, pos.z)
                local Event = rs.Events.VacuumObject
                Event:FireServer(A_1)
                wait(0.1)
            end
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            autoFarm()
        end
    end
)

-- local A_1 = game:GetService("Workspace").GameComponents.Chests.Trigger
-- local Event = game:GetService("ReplicatedStorage").Events.BuyPet
-- Event:FireServer(A_1)
