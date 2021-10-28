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
    farmEN = false
}

function autoFarm()
    _G.farmEN = not _G.farmEN

    while _G.farmEN do
        wait()
        local A_1 = lplr.Character:FindFirstChildOfClass("Tool") or lplr.Backpack:FindFirstChildOfClass("Tool")
        if A_1 then
            for _, v in pairs(wp.Clickable:GetChildren()) do
                if tostring(v.Name) ~= "Uber" then
                    for _, l in pairs(v:GetChildren()) do
                        local A_2 = l:FindFirstChildOfClass("Part") or l:FindFirstChildOfClass("MeshPart")
                        -- local A_2 = l:FindFirstChildOfClass("MeshPart")
                        if A_2 then
                            local Event = rs.Resources.RemoteEvents.Click
                            Event:FireServer(A_1, A_2)
                        end
                        wait()
                    end
                end
            end
        end
    end
end
spawn(
    function()
        while wait() do
            wp.Interactives.Sell.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            autoFarm()
        end
    end
)

autoFarm()
print("Done")