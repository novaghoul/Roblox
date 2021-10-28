uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

-- if wp:FindFirstChild("Doors") then
-- 	wp["Doors"]:Destroy()
-- end
-- if wp:FindFirstChild("Boundaries_Rocks") then
-- 	wp["Boundaries_Rocks"]:Destroy()
-- end

-- for _, v in pairs(wp:GetChildren()) do
--     if v.Name == "Part" then
--         v:Destroy()
--     end
-- end

-- for _, v in pairs(wp["DestructableObjects"]:GetChildren()) do
--     for _, l in pairs(v:GetChildren()) do
--         if l.Name == "Part" then
--             l.CFrame = lplr.Character.HumanoidRootPart.CFrame
--             l.CanCollide = false
--         -- l.Anchored = true
--         end
--     end
-- end

-- for i = 1, 5 do
--     local npc = wp["DestructableObjects"]:GetChildren()[i]
--     for _, l in pairs(npc:GetChildren()) do
--         if l.Name == "Part" then
--             l.CFrame = lplr.Character.HumanoidRootPart.CFrame
--             l.CanCollide = false
--         -- l.Anchored = true
--         end
--     end
-- end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "f" then
            local pos = lplr.Character.HumanoidRootPart.CFrame
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-82, 54, 33)
            wait(0.3)
            lplr.Character.HumanoidRootPart.CFrame = pos
        end
    end
)

-- local A_1 = "PDS"
-- local A_2 = "cdCheck"
-- local A_3 = "Tormented Souls"
-- local A_4 = 0
-- local Event = game:GetService("ReplicatedStorage")["đŸ‘Œ"]
-- Event:InvokeServer(A_1, A_2, A_3, A_4)
 
-- local A_1 = "UseAbility"
-- local A_2 = "Hades"
-- local A_3 = "Tormented Souls"
-- local A_4 = CFrame.new(-251.335663, 58.269722, -14.9773407, -0.451837182, -0.0047643194, 0.892087698, -0, 0.999985814, 0.0053405636, -0.892100453, 0.00241306517, -0.451830745)
-- local A_5 = game:GetService("Workspace").DestructableObjects.Model.BoundingBox
-- local Event = game:GetService("ReplicatedStorage")["đŸ”¥"]
-- Event:FireServer(A_1, A_2, A_3, A_4, A_5)