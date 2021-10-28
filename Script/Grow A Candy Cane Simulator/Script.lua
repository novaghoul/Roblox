uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

if on == nil then
    on = true
end

on = not on
while on do
    for _, v in pairs(wp.DropsFolder.Drops:GetChildren()) do
        -- if v.Name == "Spawn" then
        for _, l in pairs(v:GetChildren()) do
            if l:IsA("BasePart") then
                lplr.Character.HumanoidRootPart.CFrame = l.CFrame
                wait(0.1)
            end
        end
        -- end
    end
    wait(2)
end
