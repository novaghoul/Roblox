--[[
EXECUTE IT TO ACTIVATE/DEACTIVATE AUTO OPEN EGGS (and auto money farm)
Made by ZFrogger#6467
]]
function BuyAllitem()
    local plr = game.Players.LocalPlayer
    for _, v in pairs(plr.Inventory:GetChildren()) do
        if v:FindFirstChild("Item") and v.Value == false then
            game.ReplicatedStorage.Events.ShopEvents.requestBuy:FireServer(v.Name, "Magnet")
        end
    end
    for _, v in pairs(plr.BackpackInventory:GetChildren()) do
        if not v.Value then
            game.ReplicatedStorage.Events.ShopEvents.requestBuy:FireServer(v.Name, "Backpack")
        end
    end
    game.ReplicatedStorage.Events.ShopEvents.buyDoor:FireServer(5000)
    game.ReplicatedStorage.Events.ShopEvents.buyDoor:FireServer(50000)
    game.ReplicatedStorage.Events.ShopEvents.buyDoor:FireServer(500000)
    game.ReplicatedStorage.Events.ShopEvents.buyDoor:FireServer(1500000)
    for i = 1, 4 do
        if plr.ChickenStats[i].Bought.Value == false then
            game.ReplicatedStorage.ChickenEvents.buyChicken:FireServer(i)
        end
        if plr.ChickenStats[i].Level.Value < 9 then
            for v = plr.ChickenStats[i].Level.Value, 9 do
                game.ReplicatedStorage.ChickenEvents.requestUpgrade:FireServer(i, v)
            end
        end
    end
    game.Players.LocalPlayer.Character.Island:Destroy()
    Island = Instance.new("LocalScript", game.Players.LocalPlayer.Character)
    Island.Name = "Island"
    Island.Source =
    [[
    local folder = workspace.IslandInfo
    local plr = game.Players.LocalPlayer
    repeat
        wait()
    until plr.Character
    local root = plr.Character:WaitForChild("HumanoidRootPart")
    local d = true
    folder.Island.Touched:connect(
        function(hit)
            local h = hit.Parent:FindFirstChild("Humanoid")
            local torso = h.Parent:FindFirstChild("HumanoidRootPart")
            if h and torso then
                local player = game.Players:GetPlayerFromCharacter(hit.Parent)
                if plr == player and d then
                    d = false
                    root.CFrame = CFrame.new(folder.islandtp.Position)
                    wait(3)
                    d = true
                end
            end
        end
    )
    folder.Main.Touched:connect(
        function(hit)
            local h = hit.Parent:FindFirstChild("Humanoid")
            local torso = h.Parent:FindFirstChild("HumanoidRootPart")
            if h and torso then
                local player = game.Players:GetPlayerFromCharacter(hit.Parent)
                if plr == player and d then
                    d = false
                    root.CFrame = CFrame.new(folder.returntp.Position)
                    wait(3)
                    d = true
                end
            end
        end
    )
    ]]
    _G.eggs = true
    farmeggs()
end
function farmmoney()
    local plr = game.Players.LocalPlayer
    for _, v in pairs(plr.Purchases:GetChildren()) do
        v.Value = true
    end
    if game.ReplicatedStorage.Tools:FindFirstChild("Spirit Magnet") and not plr.Backpack:FindFirstChild("Spirit Magnet") then
        game.ReplicatedStorage.Tools["Spirit Magnet"].Parent = plr.Backpack
    end
    if plr.PlayerGui.GameHUD:FindFirstChild("FullBackpack") then
        plr.PlayerGui.GameHUD:FindFirstChild("FullBackpack"):Destroy()
    end
    while _G.farm do
        wait(.1)
        local plr = game.Players.LocalPlayer
        local char = plr.Character.HumanoidRootPart
        if plr.Backpack:FindFirstChild("Spirit Magnet") then
            game.ReplicatedStorage.Events.MagnetEvents.requestGrab:FireServer("65", plr.Backpack["Spirit Magnet"])
        else
            game.ReplicatedStorage.Events.MagnetEvents.requestGrab:FireServer("65", plr.Character["Spirit Magnet"])
        end
        game.Workspace.Rings.Sell.CanCollide = false
        game.Workspace.Rings.Sell.CFrame = char.CFrame + Vector3.new(0, math.random(-1, 1), 0)
        if _G.maxvalue ~= nil then
            if plr.leaderstats.Money.Value >= _G.maxvalue then
                _G.farm = false
                BuyAllitem()
                break
            end
        elseif plr.leaderstats.Money.Value >= 10000000 then
            _G.farm = false
            BuyAllitem()
            break
        end
    end
end
function farmeggs()
    while _G.eggs do
        wait(.1)
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Mythical Egg")
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Epic Egg")
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Legendary Egg")
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Rare Egg")
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Uncommon Egg")
        game.ReplicatedStorage.PetEvents.requesthatch:FireServer("Common Egg")
    end
end
if _G.farm then
    _G.farm = false
elseif not _G.eggs then
    _G.farm = true
    farmmoney()
end
if _G.eggs then
    _G.eggs = false
end
