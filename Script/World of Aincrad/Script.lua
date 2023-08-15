loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

spawn(function()
    while wait() do
        local args = {
            [1] = "Attack",
            [2] = {}
        }
        local args1 = {}
        for _,v in pairs(wp.Attackable:GetChildren()) do
            if v:FindFirstChild("Mob") then
                table.insert(args1, v.Mob)
            end
        end
        args[2] = args1
        rs.RemoteEvents.Hit:FireServer(unpack(args))
    end
end)

    local m = require(rs.WeaponMastery)
    m.WeaponMastery = function(a1, a2)
        if a2.Value == "StraightSword" then
            local v1 = a1.Stats.StraightswordExp
            v1.Value = v1.Value + 1000
            return
        elseif v1 == "GreatSword" then
            local v2 = a1.Stats.GreatswordExp
            v2.Value = v2.Value + 1000
            return
        elseif v2 == "Rapier" then
            local v3 = a1.Stats.RapierExp
            v3.Value = v3.Value + 1000
        end
    end
