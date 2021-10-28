local pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame


for _, v in pairs(game:GetService("Workspace").Areas["3"].Mobs:GetChildren()) do
    -- v:MoveTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position)
    v.HumanoidRootPart.Anchored = false
    v.UpperTorso.Anchored = false
    v.LowerTorso.Anchored = false
    v.HumanoidRootPart.CFrame = pos + pos.lookVector * 3
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Anchored = true
    v.UpperTorso.CanCollide = false
    v.UpperTorso.Anchored = true
    v.LowerTorso.CanCollide = false
    v.LowerTorso.Anchored = true
    -- for _, l in pairs(v:GetChildren()) do
    --     if l:IsA("Part") or l:IsA("MeshPart") then
    --         l.CanCollide = false
    --         l.Anchored   = true
    --     end
    -- end
end


for _, l in pairs(game:GetService("Workspace").Camera:GetChildren()) do
    l.Anchored = false
    l.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
end

game:GetService("Workspace").Lobby.Sell.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame