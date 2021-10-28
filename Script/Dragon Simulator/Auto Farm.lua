game:service'RunService'.RenderStepped:Connect(function()
    local A     = "DamageOnServer"
    local B     = Vector3.new(58.4299278, 4.44751024, 1596.92615)
    local Event = game:GetService("Players").LocalPlayer.Backpack["Foe Hammer"].ServerRemote
    Event:FireServer(A, B)
end)