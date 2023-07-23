loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

ws_g = 50

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
    while wait(.01) do
        for _,v in pairs(wp.Maps:GetChildren()) do
            for _,l in pairs(v.Enemies:GetChildren()) do
                if (l.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 7 and tostring(l.NPCTag.Enabled) == "true" then
                    rs.Remotes.RE_TakeDamage:FireServer(tostring(l.Name))
                end
            end
        end
    end
end)
-- 7 NPCTag.Enabled
-- print((wp.Maps.World003.Enemies.Npc031.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude)