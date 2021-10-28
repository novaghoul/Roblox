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
for i = 1, 10 do
    for _, v in pairs(wp.Game.Stages:GetChildren()) do
        if v:FindFirstChild("Zombies") then
            for _, l in pairs(v.Zombies:GetChildren()) do
                local Remote = rs.Networks["UI"]
                local A1 = {
                    [1] = "RemoteEvent"
                }
                local A2 = {
                    [1] = "Damage",
                    [2] = l
                }

                Remote:FireServer(unpack(A1))
                Remote:FireServer(unpack(A2))
            end
        end
    end
    wait()
end