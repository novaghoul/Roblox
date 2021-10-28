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

for _, v in pairs(plrs:GetPlayers()) do
    if not v.Character.Head:FindFirstChild("PLADD") then
        local plg      = Instance.new("PointLight",v.Character.Head)
        plg.Name       = ("PLADD")
        plg.Range      = 200
        plg.Shadows    = false
        plg.Enabled    = true
        plg.Color      = Color3.fromRGB(255, 255, 255)
        plg.Brightness = 1
    end
end

if not lplr.Character.Head:FindFirstChild("PLADD") then
    local plg      = Instance.new("PointLight",lplr.Character.Head)
    plg.Name       = ("PLADD")
    plg.Range      = 200
    plg.Shadows    = false
    plg.Enabled    = true
    plg.Color      = Color3.fromRGB(255, 255, 255) 
    plg.Brightness = 1
end