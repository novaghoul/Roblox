for _,v in pairs(wp:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        v.HoldDuration = 0
        v.MaxActivationDistance = 20
    end
end