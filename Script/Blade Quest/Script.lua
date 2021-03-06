-- [[ START OF SETTINGS ]]
Distance = -7 -- TP Distance from enemy
BrokenServerTimer = 300 -- Seconds. Will leave the level if a new enemy doesn't spawn within this timeframe
ForceExpert = true -- Force the difficulty to be 'Expert'
AutoMerge = { -- Automatically merge Swords; will not merge your equipped sword
    Common = true,
    Uncommon = true,
    Rare = true,
    Epic = true,
}
AutoSell = { -- Will not sell your equipped gear
    Swords = {
        Common = false,
        Uncommon = false,
        Rare = false,
        Epic = false,
        Legendary = false
    },
    DamageMagic = {
        Common = true,
        Uncommon = true,
        Rare = false,
        Epic = false,
        Legendary = false
    },
    SupportMagic = {
        Common = true,
        Uncommon = true,
        Rare = false,
        Epic = false,
        Legendary = false
    }
}
-- [[ END OF SETTINGS ]]



-- Auto-Start
if game.PlaceId == 6494523288 then
    -- Load
    repeat
        yes,lvl,swords,damageFolder,supportFolder,swordFolder,rf,re,info = pcall(function()return
            game.Players.LocalPlayer.Data.Stats.Level,
            game.Players.LocalPlayer.Data.Swords:FindFirstChildOfClass("Folder"),
            game.Players.LocalPlayer.Data.Damage:FindFirstChildOfClass("Folder"),
            game.Players.LocalPlayer.Data.Support:FindFirstChildOfClass("Folder"),
            game.ReplicatedStorage.Sword,
            game.ReplicatedStorage.RF,
            game.ReplicatedStorage.RE,
            require(game.ReplicatedStorage.Info)
        end)
        wait(1)
    until rf
    -- Variables
    local player = game.Players.LocalPlayer
    local cum = {}
    -- Get Maps
    for map,v in pairs(info.Maps) do
        for i,v in pairs(v) do
            if type(v) == "number" and i ~= "ID" and i ~= "Badge" then
                table.insert(cum,{map,i,v})
            end
        end
    end
    -- Sort Maps
    table.sort(cum,function(sowd,invell)
        return invell[3] < sowd[3]
    end)   
    -- Count Rarities
    local currentRarities = {
        Legendary = {},
        Epic = {},
        Rare = {},
        Uncommon = {},
        Common = {}
    }
    for i,v in pairs(swords.Parent:GetChildren()) do
        if v:FindFirstChild("Tag") and swordFolder:FindFirstChild(v.Tag.Value) and swordFolder[v.Tag.Value]:FindFirstChild("Rarity") and tonumber(v.Name) ~= player.Data.Stats.Sword.Value then
            table.insert(currentRarities[swordFolder[v.Tag.Value].Rarity.Value],v)
        end
    end
    -- Auto-Merge Sword
    for i,v in pairs(currentRarities) do
        -- Check
        if #v >= 5 and AutoMerge[i] == true then
            -- Grab 5 swords
            local merge = {}
            for _ = 1, 5 do
                table.insert(merge,currentRarities[i][_])
            end
            -- Lazy Merge
            for i = 1, 4 do
                spawn(function()
                    rf:InvokeServer("Merge",merge,i)
                end)
            end
        end
    end
    -- Get Best Sword
    local currentBest = {player.Data.Stats.Sword.Value,swords.Parent[player.Data.Stats.Sword.Value].Amnt.Value}
    for i,v in pairs(swords.Parent:GetChildren()) do
        if v:FindFirstChild("Amnt") and v:FindFirstChild("Lvl") and v.Lvl.Value <= player.Data.Stats.Level.Value then
            local newBest = v.Amnt.Value
            if newBest > currentBest[2] then
                currentBest[1] = v.Name
                currentBest[2] = v.Amnt.Value
            end
        end
    end
    -- Equip Best Sword
    if player.Data.Stats.Sword.Value ~= currentBest[1] then
        re:FireServer("Equip",swords.Parent[currentBest[1]])
        wait(0.5)
    end
    -- Auto-Sell Sword
    for i,v in pairs(currentRarities) do
        if AutoSell.Swords[i] == true then
            for i,v in pairs(v) do
                rf:InvokeServer("Sell",v)
            end
        end
    end
    -- Auto-Sell Damage
    for i,v in pairs(damageFolder.Parent:GetChildren()) do
        if AutoSell.DamageMagic[info.Magic[v.Tag.Value].Rarity] and tonumber(v.Name) ~= player.Data.Stats.Damage.Value then
            rf:InvokeServer("Sell",v)
        end
    end
    -- Auto-Sell Support
    for i,v in pairs(supportFolder.Parent:GetChildren()) do
        if AutoSell.SupportMagic[info.Magic[v.Tag.Value].Rarity] and tonumber(v.Name) ~= player.Data.Stats.Support.Value then
            rf:InvokeServer("Sell",v)
        end
    end
    -- Select Best
    for i,v in pairs(cum) do
        if lvl.Value >= v[3] then
            rf:InvokeServer("Create",v[1],v[2],true,true)
            rf:InvokeServer("Start")
            return
        end
    end
end

-- Force Expert
local old;
old = hookfunction(getrawmetatable(game).__namecall,function(...)
    local args = {...}
    if getnamecallmethod() == "FireServer" and tostring(args[2]) == "MapData" and ForceExpert then
        args[3].difficulty = "Expert"
    end
    return old(unpack(args))
end)

-- Load
repeat wait(1) until pcall(function() return game.Players.LocalPlayer.Character.HumanoidRootPart,workspace.Enemies:FindFirstChildOfClass("Model"),game.ReplicatedStorage.RE end)

-- Variable
local player = game.Players.LocalPlayer

-- Invisciam
player.DevCameraOcclusionMode = "Invisicam"

-- NoClip
game:GetService("RunService").RenderStepped:Connect(function()
    player.Character.Humanoid:ChangeState(11)
end)

-- Get Enemies
function getEnemies()
    -- Variable
    local femboys = {}
    -- Get Nearby Enemies
    local shit = workspace.Enemies:GetChildren()
    for i = 1, #shit do local v = shit[i]
        local hum = v:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            table.insert(femboys,v)
        end
    end
    -- Sort
    table.sort(femboys,function(current,mado)
        return current:FindFirstChildOfClass("Humanoid").Health < mado:FindFirstChildOfClass("Humanoid").Health
    end)
    -- Return
    return #femboys > 0 and femboys or false
end

-- Broken Server Check
local lastSpawn = tick()
workspace.Enemies.ChildAdded:Connect(function()
    lastSpawn = tick()
end)

-- Keel
while true do
    -- Get Enemies
    local cum = getEnemies()
    if type(cum) == "table" then
        local cum1 = cum[1]
        repeat
            -- Teleport
            pcall(function()
                player.Character.HumanoidRootPart.CFrame = cum1.HumanoidRootPart.CFrame + Vector3.new(0,Distance,0)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position,cum1.HumanoidRootPart.Position)
            end)
            wait()
            -- Attack
            pcall(function()
                for i,v in pairs(getEnemies()) do
                    if player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= 15 then
                        game.ReplicatedStorage.RE:FireServer("Hit",v)
                    end
                end
            end)
            -- Use Damage Spell
            game.ReplicatedStorage.Magic:FireServer("Damage")
            -- Use Support Spell
            if player.Character.Humanoid.Health < player.Character.Humanoid.MaxHealth then
                game.ReplicatedStorage.Magic:FireServer("Support")
            end
        until not cum1.Parent or not cum1:FindFirstChildOfClass("Humanoid") or cum1:FindFirstChildOfClass("Humanoid").Health <= 0 or not cum1:FindFirstChild("HumanoidRootPart")
    end
    wait()
    -- Broken Server Check
    if tick()-lastSpawn >= BrokenServerTimer then
        game:GetService("TeleportService"):Teleport(6494523288)
    end
end