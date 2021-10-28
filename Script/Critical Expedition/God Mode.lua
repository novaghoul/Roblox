local player = game.Players.LocalPlayer
function HeyDevs(c)
    c:WaitForChild("Stats"):WaitForChild("DefenseBuff"):Destroy()
end
HeyDevs(player.Character)
player.CharacterAdded:Connect(HeyDevs)
