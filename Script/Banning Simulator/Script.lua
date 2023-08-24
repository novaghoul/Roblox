loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 100
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

spawn(function()
    while wait() do
        for _, v in pairs(wp.npcs:GetChildren()) do
            if (v.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 100 then
                local args = {
                    [1] = v,
                    [2] = false
                }
                
                rs["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"].damageNPC:FireServer(unpack(args))
            end
        end
    end
end)

spawn(function()
    while wait() do
        rs["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"]["rebirth/rebirth"]:FireServer()
    end
end)

spawn(function()
    while wait() do
        rs["rbxts_include"]["node_modules"]["@rbxts"].net.out["_NetManaged"]["unlockRank"]:FireServer()
    end
end)

