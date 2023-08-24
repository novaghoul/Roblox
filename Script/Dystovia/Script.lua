loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
toggleWS = false
toggleJP = false
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
-- game:GetService("Workspace").NpcFolder.Gondur.Head
for _,v in pairs(wp.NpcFolder:GetChildren()) do
    spawn(function()
        if v:FindFirstChild("Head") then
            createESPItem(v.Head, 245, 205, 48, 12, v.Name, 3)
        end
        v.ChildAdded:connect(
            function(m)
                if tostring(m.Name) == "Head" then
                    wait(.5)
                    createESPItem(m, 245, 205, 48, 12, v.Name, 3)
                end
            end
        )
    end)
end

wp.NpcFolder.ChildAdded:connect(
    function(m)
        wait(.1)
        spawn(function()
            if m:WaitForChild("Head") then
                createESPItem(m.Head, 245, 205, 48, 12, m.Name, 3)
            end
            m.ChildAdded:connect(
                function(n)
                    if tostring(n.Name) == "Head" then
                        wait(.5)
                        createESPItem(n, 245, 205, 48, 12, m.Name, 3)
                    end
                end
            )
        end)
    end
)
spawn(function()
    while wait(.1) do
        for _,v in pairs(wp.MobFolder:GetChildren()) do
            if v:FindFirstChild("MobArea") then
                if (v.MobArea.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 15 then
                    for _,l in pairs(lplr.Character:GetChildren()) do
                        if l:FindFirstChild("DamagePart") or l:FindFirstChild("DamagePart1") or l:FindFirstChild("DamagePart2") then
                            local args1 = {
                                [1] = "HeavyBegan",
                                [2] = "LS",
                                [3] = "Heavy",
                                [4] = 0,
                                [5] = 0,
                                [6] = 0,
                                [7] = Vector3.new(0, 0, 0)
                            }
                            rs.Events.SwordEvents.Attacks.Attack:FireServer(unpack(args1))
                            
                            local args11 = {
                                [1] = "CanDamage",
                                [2] = "Heavy"
                            }
                            
                            rs.Events.DamageEvents.StopAttack:FireServer(unpack(args11))
                            
                            local args22 = {
                                [1] = "Attacking"
                            }
                            
                            rs.Events.DamageEvents.StartAttack:FireServer(unpack(args22))
                            local args33 = {
                                [1] = "CanDamage"
                            }
                            
                            rs.Events.DamageEvents.StartAttack:FireServer(unpack(args33))
                            local args44 = {
                                [1] = true,
                                [2] = "Attack",
                                [3] = v.MobArea,
                                [4] = l:FindFirstChild("DamagePart") or l:FindFirstChild("DamagePart1") or l:FindFirstChild("DamagePart2")
                            }
                            
                            rs.Events.DamageEvents.DamageDetect:FireServer(unpack(args44))
                            
                            local args2 = {
                                [1] = v.MobArea,
                                [2] = l:FindFirstChild("DamagePart") or l:FindFirstChild("DamagePart1") or l:FindFirstChild("DamagePart2")
                            }
                            rs.Events.DamageEvents.DamageDetect:FireServer(unpack(args2))

                            local args3 = {
                                [1] = "HeavyEnded"
                            }
                            rs.Events.SwordEvents.Attacks.Attack:FireServer(unpack(args3))
                        end
                    end
                end
            end
        end
    end
end)
print("...")
for _,v in pairs(wp.LootFolder:GetChildren()) do
    v.LootHitbox.LootPrompt.HoldDuration = 0
    v.LootHitbox.LootPrompt.MaxActivationDistance = 20
end

wp.LootFolder.ChildAdded:connect(
    function(m)
        wait(.1)
        if m.LootHitbox then
            m.LootHitbox.LootPrompt.HoldDuration = 0
            m.LootHitbox.LootPrompt.MaxActivationDistance = 20
        end
    end
)
-- game:GetService("Workspace").LootFolder.Loot.LootHitbox.LootPrompt
-- local args = {
--     [1] = workspace:WaitForChild("Herbs"):WaitForChild("Heartflower")
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemEvents"):WaitForChild("HerbPickup"):FireServer(unpack(args))
-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemEvents"):WaitForChild("FillBottle"):FireServer()
-- local args = {
--     [1] = "Lesser healing potion",
--     [2] = 3
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemEvents"):WaitForChild("BrewPotion"):FireServer(unpack(args))
-- local args = {
--     [1] = "Healing"
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PotionEvents"):WaitForChild("HealingPotion"):FireServer(unpack(args))
-- local args = {
--     [1] = "Began"
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("StaminaEvents"):WaitForChild("Run"):FireServer(unpack(args))
-- function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

-- local args = {
--     [1] = getNil("Loot", "MeshPart"),
--     [2] = "Feather"
-- }
-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ItemEvents"):WaitForChild("ItemPickup"):FireServer(unpack(args))
