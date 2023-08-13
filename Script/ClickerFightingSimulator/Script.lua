loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if gi == 4540070253 then
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

ws_g = 100

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua

spawn(function()
    while wait(.05) do
        rs.Remotes.RE_ClickPower:FireServer()
        -- rs.Remotes.Re_TaskClaimed:FireServer()
        -- rs.Remotes.RF_Spin:InvokeServer()
        -- rs.Remotes.RF_Winner:InvokeServer(tostring(lplr.CurWorld.Value))
    end
end)
spawn(function()
    while wait() do
        for _,v in pairs(wp.Maps:GetChildren()) do
            for _,l in pairs(v.Enemies:GetChildren()) do
                if (l.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 7 and tostring(l.NPCTag.Enabled) == "true" then
                    rs.Remotes.RE_TakeDamage:FireServer(tostring(l.Name))
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        rs.Remotes.RE_SummonDamage:FireServer()
    end
end)
spawn(function()
    while wait(.5) do
        local A_1 = "Wins"
        local Event = rs.Remotes["Re_ClaimDragonTreasure"]
        Event:FireServer(A_1)
        
        local A_1 = "Wins"
        local Event = rs.Remotes["Re_StartDragonTreasure"]
        Event:FireServer(A_1)
        
        local A_1 = "Power"
        local Event = rs.Remotes["Re_ClaimDragonTreasure"]
        Event:FireServer(A_1)
        
        local A_1 = "Power"
        local Event = rs.Remotes["Re_StartDragonTreasure"]
        Event:FireServer(A_1)
        
        local A_1 = "Item"
        local Event = rs.Remotes["Re_ClaimDragonTreasure"]
        Event:FireServer(A_1)
        
        local A_1 = "Item"
        local Event = rs.Remotes["Re_StartDragonTreasure"]
        Event:FireServer(A_1)
    end
end)
spawn(function()
    while wait(.01) do
        for _,v in pairs(wp.WorldMain.Wing.Spawn:GetChildren()) do
            if v:FindFirstChild("Phoenix Marco") then
                local A_1 = tostring("WingsBoss003")
                local A_2 = tostring("WingsBoss004")
                local A_3 = tostring("WingsBoss005")
                local A_4 = tostring("WingsBoss006")
                local Event = rs.Remotes["RE_WingSDamage"]
                Event:FireServer(A_1)
                Event:FireServer(A_2)
                Event:FireServer(A_3)
                Event:FireServer(A_4)
            end
        end
    end
end)

spawn(function()
    while wait(.1) do
        for _,v in pairs(lplr.PlayerGui.MainUI.CenterMenu.Heroes.PetsContainer.Right.List:GetChildren()) do
            if v:FindFirstChild("Info") then
                if v.Info.BG.UIStroke:FindFirstChild("UIGradient-BG-Rare") 
                or v.Info.BG.UIStroke:FindFirstChild("UIGradient-BG-Epic") 
                -- or v.Info.BG.UIStroke:FindFirstChild("UIGradient-BG-Legendary") 
                then
                    local A_1 = { [1] = tostring(v.Name) }
                    local Event = rs.Remotes["RE_PetDelete"]
                    Event:FireServer(A_1)
                end
            end
        end
    end
end)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "n" then
            lplr.PlayerGui.MainUI.CenterMenu.Teleport.Position = UDim2.new(0.5, 0, 0.5, 0)
            lplr.PlayerGui.MainUI.CenterMenu.Teleport.AnchorPoint = Vector2.new(0.5, 0.5)
            lplr.PlayerGui.MainUI.CenterMenu.Teleport.Active = true
            lplr.PlayerGui.MainUI.CenterMenu.Teleport.Visible = true
        end
    end
)
getgenv().aPet = true
while aPet do
    local args = {
        [1] = "World036"
    }
    
    rs.Remotes.RE_Enter:FireServer(unpack(args))
    local args = {
        [1] = "Hatch",
        [2] = "Draw038",
        [3] = {}
    }

    rs.Remotes.RE_Draw:FireServer(unpack(args))
    wait()
end
end