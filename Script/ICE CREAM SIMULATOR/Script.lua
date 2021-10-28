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

for _, v in pairs(wp["Main Area"].Coins:GetChildren()) do
    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

for _, v in pairs(wp["Main Area"].Tokens:GetChildren()) do
    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

for _, v in pairs(wp["Main Area"].Gems:GetChildren()) do
    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

for _, v in pairs(wp.Skyland.AirTokens:GetChildren()) do
    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

sellEn = false

while sellEn do
    wait(0.1)
    wp["Choco Castle"].Sell.Sell.CFrame = lplr.Character.HumanoidRootPart.CFrame
end