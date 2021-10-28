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

_G.toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")

while wait() do
    _G.toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")
    for _, v in pairs(wp.Zones:GetChildren()) do
        for _, l in pairs(v[v.Name]:GetChildren()) do
            local A_1 = l.UpperTorso
            if _G.toolPlayer then
                local Event = _G.toolPlayer.RemoteEvent
                Event:FireServer(A_1)
            else
                _G.toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")
            end
        end
    end
end
