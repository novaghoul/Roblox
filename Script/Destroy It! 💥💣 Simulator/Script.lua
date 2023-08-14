loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 70
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'TimeBetweenShots') then
        v.TimeBetweenShots = 0.1
        v.ExplosionRadius = 50
        v.ExplosionPower = 100
        v.PlayerDamage = 1000
    end
end
mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "z" then
            for _,v in pairs(wp.Map.Zones:GetChildren()) do
                for _,l in pairs(v:GetChildren()) do
                    if l:FindFirstChild("BlockSell") then
                        local args = {
                            [1] = l.BlockSell,
                            [2] = true
                        }
                        
                        rs.Remotes.Game.Stat.ClientToggleUseBlockSell:FireServer(unpack(args))
                    end
                end
            end
		end
	end
)