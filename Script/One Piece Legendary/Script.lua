uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
cg = game:GetService("CoreGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

folderMobs = wp.Enemies.NPCs

mobs = lplr.Character.HumanoidRootPart.CFrame
for _, l in pairs(folderMobs:GetChildren()) do
    wait(0.05)
    l.HumanoidRootPart.Anchored = false
    l.Torso.Anchored = false
    l["Left Leg"].Anchored = false
    l["Left Arm"].Anchored = false
    l["Right Leg"].Anchored = false
    l["Right Arm"].Anchored = false
    l.Torso.Anchored = false
    l.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 2, -5)
    l.HumanoidRootPart.CanCollide = false
    l.HumanoidRootPart.Anchored = true
    l.Torso.CanCollide = false
    l.Torso.Anchored = true
    l["Left Leg"].Anchored = true
    l["Left Arm"].Anchored = true
    l["Right Leg"].Anchored = true
    l["Right Arm"].Anchored = true
end

for i, v in pairs(lplr.Backpack:GetChildren()) do
    if v.Name == "Melee" then
        v.Parent = lplr
    end
end

wait()
for i, v in pairs(lplr:GetChildren()) do
    if v.Name == "Melee" then
        v.Parent = lplr.Backpack
    end
end
wait()
for i, v in pairs(lplr.Backpack:GetChildren()) do
    if v.Name == "Melee" then
        v.Parent = lplr.Character
    end
end

farm = false
farm = not farm
nameWeapon = "Melee"
while farm do
    wait(0.1)
    for i, v in pairs(lplr.Character:GetChildren()) do
        if v.Name == nameWeapon then
            v:Activate()
        end
    end
end