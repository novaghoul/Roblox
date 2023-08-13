loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if gi == 4540494160 then
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

    ws_g = 70

    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
    function aDame(parent)
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
        rs.CurRemotes.MonsterEvent:FireServer(unpack(parent))
    end
    
    spawn(function()
        -- while wait() do
        --     for _,v in pairs(wp.ForScript.Monster:GetChildren()) do
        --         for _,l in pairs(v:GetChildren()) do
        --             for _,n in pairs(l.Monster_:GetChildren()) do
        --                 if n:FindFirstChild("HumanoidRootPart") then
        --                     if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
        --                         local args = {
        --                             [1] = "DamToMonster",
        --                             [2] = n,
        --                             [3] = {
        --                                 ["damtype"] = "normal"
        --                             }
        --                         }
                                
        --                         rs.CurRemotes.MonsterEvent:FireServer(unpack(args))
        --                     end
        --                 end
        --             end
        --         end
        --     end
        -- end
    end)
    spawn(function()
        for _,v in pairs(wp.ForScript.Monster:GetChildren()) do
            for _,l in pairs(v:GetChildren()) do
                for _,n in pairs(l.Monster_:GetChildren()) do
                    spawn(function()
                        while n do
                            wait()
                            if n:FindFirstChild("HumanoidRootPart") then
                                if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                    local args = {
                                        [1] = "DamToMonster",
                                        [2] = n,
                                        [3] = {
                                            ["damtype"] = "normal"
                                        }
                                    }
                                    
                                    aDame(args)
                                end
                            end
                        end
                    end)
                end
                l.Monster_.ChildAdded:connect(
                    function(m)
                        wait(.1)
                        spawn(function()
                            while m do
                                wait()
                                if m:FindFirstChild("HumanoidRootPart") then
                                    if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                        local args = {
                                            [1] = "DamToMonster",
                                            [2] = m,
                                            [3] = {
                                                ["damtype"] = "normal"
                                            }
                                        }
                                        
                                        aDame(args)
                                    end
                                end
                            end
                        end)
                    end
                )
            end
        end
    end)
    
    spawn(function()
        -- while wait() do
        --     for _,v in pairs(wp.ForScript.Monster_:GetChildren()) do
        --         if v:FindFirstChild("HumanoidRootPart") then
        --             if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
        --                 local args = {
        --                     [1] = "DamToMonster",
        --                     [2] = v,
        --                     [3] = {
        --                         ["damtype"] = "normal"
        --                     }
        --                 }
                        
        --                 rs.CurRemotes.MonsterEvent:FireServer(unpack(args))
        --             end
        --         end
        --     end
        -- end
    end)
    spawn(function()
        for _,n in pairs(wp.ForScript.Monster_:GetChildren()) do
            spawn(function()
                while n do
                    wait()
                    if n:FindFirstChild("HumanoidRootPart") then
                        if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                            local args = {
                                [1] = "DamToMonster",
                                [2] = n,
                                [3] = {
                                    ["damtype"] = "normal"
                                }
                            }
                            
                            aDame(args)
                        end
                    end
                end
            end)
        end
        wp.ForScript.Monster_.ChildAdded:connect(
            function(m)
                wait(.1)
                spawn(function()
                    while m do
                        wait()
                        if m:FindFirstChild("HumanoidRootPart") then
                            if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                local args = {
                                    [1] = "DamToMonster",
                                    [2] = m,
                                    [3] = {
                                        ["damtype"] = "normal"
                                    }
                                }
                                
                                aDame(args)
                            end
                        end
                    end
                end)
            end
        )
    end)
    
    spawn(function()
        -- while wait() do
        --     for _,v in pairs(wp.ForScript.SkibiMap.Monster_:GetChildren()) do
        --         if v:FindFirstChild("HumanoidRootPart") then
        --             if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
        --                 local args = {
        --                     [1] = "DamToMonster",
        --                     [2] = v,
        --                     [3] = {
        --                         ["damtype"] = "normal"
        --                     }
        --                 }
                        
        --                 rs.CurRemotes.MonsterEvent:FireServer(unpack(args))
        --             end
        --         end
        --     end
        -- end
    end)
    spawn(function()
        for _,n in pairs(wp.ForScript.SkibiMap.Monster_:GetChildren()) do
            spawn(function()
                while n do
                    wait()
                    if n:FindFirstChild("HumanoidRootPart") then
                        if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                            local args = {
                                [1] = "DamToMonster",
                                [2] = n,
                                [3] = {
                                    ["damtype"] = "normal"
                                }
                            }
                            
                            aDame(args)
                        end
                    end
                end
            end)
        end
        wp.ForScript.SkibiMap.Monster_.ChildAdded:connect(
            function(m)
                wait(.1)
                spawn(function()
                    while m do
                        wait()
                        if m:FindFirstChild("HumanoidRootPart") then
                            if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                local args = {
                                    [1] = "DamToMonster",
                                    [2] = m,
                                    [3] = {
                                        ["damtype"] = "normal"
                                    }
                                }
                                
                                aDame(args)
                            end
                        end
                    end
                end)
            end
        )
    end)
    
    spawn(function()
        -- while wait() do
        --     for _,v in pairs(wp.ForScript.DrilRaid:GetChildren()) do
        --         for _,n in pairs(v.Monster_:GetChildren()) do
        --             if n:FindFirstChild("HumanoidRootPart") then
        --                 if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
        --                     local args = {
        --                         [1] = "DamToMonster",
        --                         [2] = n,
        --                         [3] = {
        --                             ["damtype"] = "normal"
        --                         }
        --                     }
                            
        --                     rs.CurRemotes.MonsterEvent:FireServer(unpack(args))
        --                 end
        --             end
        --         end
        --     end
        -- end
    end)
    spawn(function()
        for _,v in pairs(wp.ForScript.DrilRaid:GetChildren()) do
            for _,n in pairs(v.Monster_:GetChildren()) do
                spawn(function()
                    while n do
                        wait()
                        if n:FindFirstChild("HumanoidRootPart") then
                            if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                local args = {
                                    [1] = "DamToMonster",
                                    [2] = n,
                                    [3] = {
                                        ["damtype"] = "normal"
                                    }
                                }
                                
                                aDame(args)
                            end
                        end
                    end
                end)
            end
            v.Monster_.ChildAdded:connect(
                function(m)
                    wait(.1)
                    spawn(function()
                        while m do
                            wait()
                            if m:FindFirstChild("HumanoidRootPart") then
                                if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                    local args = {
                                        [1] = "DamToMonster",
                                        [2] = m,
                                        [3] = {
                                            ["damtype"] = "normal"
                                        }
                                    }
                                    
                                    aDame(args)
                                end
                            end
                        end
                    end)
                end
            )
        end
    end)
    
    spawn(function()
        while wait(.5) do
            local args = {
                [1] = "rebirth"
            }
            
            rs:WaitForChild("CurRemotes"):WaitForChild("DataChange_Rebirth"):FireServer(unpack(args))
        end
    end)
    
    spawn(function()
        -- while wait() do
        --     for _,v in pairs(wp.ForScript.InfiniteMap:GetChildren()) do
        --         for _,n in pairs(v.Monster_:GetChildren()) do
        --             if n:FindFirstChild("HumanoidRootPart") then
        --                 if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
        --                     local args = {
        --                         [1] = "DamToMonster",
        --                         [2] = n,
        --                         [3] = {
        --                             ["damtype"] = "normal"
        --                         }
        --                     }
                            
        --                     rs.CurRemotes.MonsterEvent:FireServer(unpack(args))
        --                 end
        --             end
        --         end
        --     end
        -- end
    end)
    spawn(function()
        for _,v in pairs(wp.ForScript.InfiniteMap:GetChildren()) do
            for _,n in pairs(v.Monster_:GetChildren()) do
                spawn(function()
                    while n do
                        wait()
                        if n:FindFirstChild("HumanoidRootPart") then
                            if (n.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                local args = {
                                    [1] = "DamToMonster",
                                    [2] = n,
                                    [3] = {
                                        ["damtype"] = "normal"
                                    }
                                }
                                
                                aDame(args)
                            end
                        end
                    end
                end)
            end
            v.Monster_.ChildAdded:connect(
                function(m)
                    wait(.1)
                    spawn(function()
                        while m do
                            wait()
                            if m:FindFirstChild("HumanoidRootPart") then
                                if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                                    local args = {
                                        [1] = "DamToMonster",
                                        [2] = m,
                                        [3] = {
                                            ["damtype"] = "normal"
                                        }
                                    }
                                    
                                    aDame(args)
                                end
                            end
                        end
                    end)
                end
            )
        end
    end)

    local PartMap = nil
    local aPlayer = "false"
    mouse.KeyDown:connect(
        function(keyDown)
            if keyDown == "x" then
                if tostring(aPlayer) == "false" then
                    aPlayer = "true"
                    lplr.Character.HumanoidRootPart.Anchored = true
                else
                    aPlayer = "false"
                    lplr.Character.HumanoidRootPart.Anchored = false
                end
            end
            if keyDown == "v" then
                if PartMap then
                    PartMap:Destroy()
                end
                local Part = Instance.new("Part")
                Part.Name = "PartKillBoss"
                Part.Parent = wp
                Part.Size = Vector3.new(0.5, 100, 100)
                Part.Transparency = 0.7
                Part.Shape = "Cylinder"
                Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)  * CFrame.Angles(math.rad(90),math.rad(90), 0)
                Part.Anchored = true
                PartMap = Part
            end
        end
    )
    
    getgenv().pD = true
    while wait(1) do
        if pD then
            local args = {
                [1] = "ClickPoints",
                [2] = {
                    ["Obj"] = "GDamage",
                    ["Points"] = 100
                }
            }
            
            rs:WaitForChild("CurRemotes"):WaitForChild("DataChange_Points"):FireServer(unpack(args))
        end
    end
    -- getgenv().pD = true
    -- getgenv().eNum = 11
    -- getgenv().cD = false
    -- getgenv().lD = false
    -- getgenv().eD = false
    -- getgenv().rD = false
    -- mouse.KeyDown:connect(
    --     function(keyDown)
    --         if keyDown == "z" then
    --             for i=1,75 do
    --                 local args = {
    --                     [1] = "Egg",
    --                     [2] = eNum,
    --                     [3] = false,
    --                     [4] = {
    --                         ["Eternity"] = false,
    --                         ["Common"] = cD,
    --                         ["Mysterious"] = false,
    --                         ["Legend"] = lD,
    --                         ["Epic"] = eD,
    --                         ["Rare"] = rD
    --                     }
    --                 }
                    
    --                 rs:WaitForChild("CurrentModule"):WaitForChild("RangeCheck"):WaitForChild("RangeEvent"):FireServer(unpack(args))
    --             end
    --         end
    --     end
    -- )
end