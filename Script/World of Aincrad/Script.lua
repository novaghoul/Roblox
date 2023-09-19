loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
toggleWS = false
toggleJP = false
ws_g = 30

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS_Other.lua"), true))() -- WS_Other Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
function createESP(c) --//Checks and calls the proper function
    -- createESPItem(c.Head, 196, 40, 28, 14, plrs:FindFirstChild(c.Name).DisplayName)
    -- for _, v in pairs(c:GetChildren()) do
    --     if checkPart(v) then
    --         actualESP(v)
    --     end
    -- end
    c.HealthBar.AlwaysOnTop = true
    c.HealthBar.MaxDistance = inf
    c.NameTag.AlwaysOnTop = true
    c.NameTag.MaxDistance = inf
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end
function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    spawn(function()
                        if characterModel:WaitForChild("HumanoidRootPart") then
                            wait(0.5)
                            createESP(characterModel)
                        end
                    end)
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    spawn(function()
                        if characterModel:WaitForChild("HumanoidRootPart") then
                            wait(0.5)
                            createESP(characterModel)
                        end
                    end)
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:WaitForChild("HumanoidRootPart") then
                        wait(0.1)
                        createESP(o.Character)
                    end
                end
            )
        end
    end
end
espFirst()

spawn(function()
    while wait(.1) do
        local args = {
            [1] = false
        }
        
        rs.RemoteEvents.PVPZone:FireServer(unpack(args))
    end
end)

spawn(function()
    wp.Dungeon.ChildAdded:connect(
        function(m)
            if tostring(m) == "BossDoorModel" then
                m.ChildAdded:connect(
                    function(n)
                        if tostring(n) == "Queue" then
                            wait(1)
                            n.Attach.ProximityPrompt.HoldDuration = 0
                        end
                    end
                )
            end
            if tostring(m) == "NextFloorTeleportPad" then
                m.ChildAdded:connect(
                    function(n)
                        if tostring(n) == "Base" then
                            wait(1)
                            n.Attach.ProximityPrompt.HoldDuration = 0
                        end
                    end
                )
            end
        end
    )
    if wp.Dungeon:FindFirstChild("NextFloorTeleportPad") then
        wp.Dungeon.NextFloorTeleportPad.ChildAdded:connect(
            function(m)
                if tostring(m) == "Base" then
                    wait(1)
                    m.Attachment.ProximityPrompt.HoldDuration = 0
                end
            end
        )
    end
    if wp:FindFirstChild("Hitboxes") then
        for _,v in pairs(wp.Hitboxes:GetChildren()) do
            if tostring(v) == "Hitbox" then
                v:Destroy()
            end
        end
        wp.Hitboxes.ChildAdded:connect(
            function(m)
                wait(.1)
                m:Destroy()
            end
        )
    end
    
    wp.ChildAdded:connect(
        function(m)
            if tostring(m) == "Hitboxes" then
                for _,l in pairs(m:GetChildren()) do
                    if tostring(l) == "Hitbox" then
                        l:Destroy()
                    end
                end
                m.ChildAdded:connect(
                    function(n)
                        wait(.1)
                        n:Destroy()
                    end
                )
            end
        end
    )
    -- wp.Dungeon.BossDoorModel.Queue.Attach.ProximityPrompt.HoldDuration = 0
    -- wp.Buildings.NextFloorTeleportPad.Base.Attachment.ProximityPrompt.HoldDuration = 0
    -- wp.TpTown.TpTown.Attachment.ProximityPrompt.HoldDuration = 0
    -- wp.DungeonDoor.DungeonDoor.Attachment.ProximityPrompt.HoldDuration = 0
end)

function aOn()
    spawn(function()
        while wait() do
            local args = {
                [1] = "Attack",
                [2] = {}
            }
            local args1 = {}
            for _,v in pairs(wp.Attackable:GetChildren()) do
                if v:FindFirstChild("Mob") and lplr.Character then
                    if (v.Mob.WalkToPoint - lplr.Character.HumanoidRootPart.Position).Magnitude < 100 then
                        table.insert(args1, v.Mob)
                    end
                end
            end
            args[2] = args1
            rs.RemoteEvents.Hit:FireServer(unpack(args))
        end
    end)
    spawn(function()
        while wait(.1) do
            local args = {
                [1] = "Attack",
                [2] = {}
            }
            local args1 = {}
            for _,v in pairs(plrs:GetChildren()) do
                if tostring(v.Name) ~= tostring(lplr.Name) then
                    if wp:FindFirstChild(v.Name) then
                        if v.Character:FindFirstChild("Humanoid") then
                            if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 75 then
                                table.insert(args1, v.Character.Humanoid)
                            end
                        end
                    end
                end
            end
            args[2] = args1
            rs.RemoteEvents.Hit:FireServer(unpack(args))
        end
    end)
    
    local nameSki = {"Charging Blade", "Diagonal Strike", "Catastrophic Slam", "Rising Strike", "Rapid Fire", "Pierce"}
    spawn(function()
        while wait() do
            for i=1,#nameSki do
                local args = {
                    [1] = "Attack",
                    [2] = {},
                    [3] = nameSki[i]
                }
                local args1 = {}
                for _,v in pairs(wp.Attackable:GetChildren()) do
                    if v:FindFirstChild("Mob") and lplr.Character then
                        if (v.Mob.WalkToPoint - lplr.Character.HumanoidRootPart.Position).Magnitude < 100 then
                            table.insert(args1, v.Mob)
                        end
                    end
                end
                args[2] = args1
                rs.RemoteEvents.Hit:FireServer(unpack(args))
                -- args = {
                --     [1] = "Attack",
                --     [2] = {},
                --     [3] = nameSki[i]
                -- }
                -- args1 = {}
                -- for _,v in pairs(plrs:GetChildren()) do
                --     if tostring(v.Name) ~= tostring(lplr.Name) then
                --         if v.Character then
                --             if v.Character:FindFirstChild("Humanoid") then
                --                 table.insert(args1, v.Character.Humanoid)
                --             end
                --         end
                --     end
                -- end
                -- args[2] = args1
                -- rs.RemoteEvents.Hit:FireServer(unpack(args))
            end
        end
    end)
end
aOn()
lplr.CharacterAdded:Connect(
    function(characterModel)
        wait(1)
        aOn()
    end
)
spawn(function()
    while wait() do
        -- local args = {
        --     [1] = true
        -- }
        -- lplr.Backpack.WeaponMain.NoClipMobs:FireServer(unpack(args))
        
        local args1 = {
            [1] = true
        }
        rs.RemoteEvents.Sit:FireServer(unpack(args1))
    end
end)
for _,v in pairs(wp.Attackable:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
        createESPItem(v.HumanoidRootPart, 196, 40, 28, 12, v.Name, 1)
    end
    v.ChildAdded:connect(
        function(m)
            if tostring(m.Name) == "HumanoidRootPart" then
                createESPItem(m, 196, 40, 28, 12, v.Name, 1)
            end
        end
    )
end
wp.Attackable.ChildAdded:connect(
    function(m)
        spawn(function()
            if m:WaitForChild("HumanoidRootPart") then
                createESPItem(m.HumanoidRootPart, 196, 40, 28, 12, m.Name, 1)
            end
        end)
    end
)

local aPlayer = "false"
uis.InputBegan:Connect(function(keyDown, processed)
    if keyDown.KeyCode == Enum.KeyCode.Z then
        if tostring(aPlayer) == "false" then
            aPlayer = "true"
            lplr.Character.HumanoidRootPart.Anchored = true
        else
            aPlayer = "false"
            lplr.Character.HumanoidRootPart.Anchored = false
        end
    end
    if keyDown.KeyCode == Enum.KeyCode.V then
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -disTeleport, 0)
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -disTeleport, 0)
    end
    if keyDown.KeyCode == Enum.KeyCode.M then
        if tostring(lplr.PlayerGui.Teleport.Enabled) == "true" then
            lplr.PlayerGui.Teleport.Enabled = false
        else
            lplr.PlayerGui.Teleport.Enabled = true
        end
    end
    if keyDown.KeyCode == Enum.KeyCode.LeftControl then
        if ws_g == 30 then
            ws_g = 100
            NotifyG("Walk Speed", ws_g)
        else
            ws_g = 30
            NotifyG("Walk Speed", ws_g)
        end
    end
end)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Inf_Jump Lua
