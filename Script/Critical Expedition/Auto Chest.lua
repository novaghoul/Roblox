local r = game.Players.LocalPlayer.Character.HumanoidRootPart
local old = r.CFrame
for i, v in pairs(workspace.Chests:GetChildren()) do
    if v:FindFirstChild("Giver") and v.Giver:FindFirstChild("TouchInterest") and not v:FindFirstChild("Open") then
        repeat
            r.CFrame = v.Giver.CFrame + Vector3.new(0, 3, 0)
            wait()
            firetouchinterest(r, v.Giver, 0)
            firetouchinterest(r, v.Giver, 1)
        until v:FindFirstChild("Open")
    end
end
r.CFrame = old
