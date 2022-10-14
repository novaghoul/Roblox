loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
ws_g = 100

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()

spawn(function()
    while wait() do
        
        local A_1 = 1000000000
        local Event = rs.GTycoonClient.Remotes.GrabDrops
        Event:FireServer(A_1)
        
        local Event = rs.GTycoonClient.Remotes.DepositDrops
        Event:FireServer()
        
        local Event = rs.GTycoonClient.Remotes.MergeDroppers
        Event:FireServer()
         
        local A_1 = 5
        local Event = rs.GTycoonClient.Remotes.BuyDropper
        Event:FireServer(A_1)
        
        -- local A_1 = 1
        -- local Event = rs.GTycoonClient.Remotes.BuySpeed
        -- Event:FireServer(A_1)
    end
end)

-- for _,v in pairs(wp.ObbyCheckpoints:GetChildren()) do
--     if v:IsA("Part") then
--         v.CFrame = lplr.Character.HumanoidRootPart.CFrame
--     end
-- end

local tboost = false

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "f" then
        for i=1,10 do
            local A_1 = 5
            local Event = rs.GTycoonClient.Remotes.BuyDropper
            Event:FireServer(A_1)
        end
    end
    if keyDown == "q" then
        for i=1,10 do
            local A_1 = 1
            local Event = rs.GTycoonClient.Remotes.BuySpeed
            Event:FireServer(A_1)
        end
    end
    if keyDown == "e" then
        tboost = not tboost
        NotifyG("Auto Boost", tboost)
        -- spawn(function()
        --     while tboost do
        --         wait(.1)
        --         lplr.Character.Humanoid.WalkToPoint = Vector3.new(0,0,25000)
        --     end
        -- end)
        while tboost do
            for _,v in pairs(wp.ObbyCheckpoints:GetChildren()) do
                if v:IsA("Part") then
                    -- wait(.5)
                    -- lplr.Character.HumanoidRootPart.CFrame = v.CFrame
                    firetouchinterest(lplr.Character.LowerTorso,  v, 0)
                    wait(.1)
                    firetouchinterest(lplr.Character.LowerTorso,  v, 1)
                end
            end
            local Event = rs.GTycoonClient.Remotes.FinishObby
            Event:FireServer()
            
            -- firetouchinterest(lplr.Character.LowerTorso,  wp.ObbyButton3.Button, 0)
            -- wait(.1)
            -- firetouchinterest(lplr.Character.LowerTorso,  wp.ObbyButton3.Button, 1)
            wait()
        end
    end
end)