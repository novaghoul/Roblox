-- Variable
local player = game.Players.LocalPlayer
local de = game:GetService("Debris")

-- Function
function InfCombo(c)
    local head = c:WaitForChild("Head")
    head.DescendantAdded:Connect(function(v)
        if v:IsA("Script") then
            de:AddItem(v, 0.5)
        end
    end)
end

-- Connect
player.CharacterAdded:Connect(InfCombo)
InfCombo(player.Character)
