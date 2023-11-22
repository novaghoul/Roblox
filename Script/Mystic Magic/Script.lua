loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESPTest Lua

getgenv().aMon = nil
getgenv().atOn = false

-- local args = {
--     [1] = CFrame.new(22.950939178466797, 62.11347579956055, -22.292926788330078, 0.963467538356781, 0.09252648055553436, -0.25133490562438965, -7.4505797087454084e-09, 0.9384286999702454, 0.3454732596874237, 0.26782527565956116, -0.3328522741794586, 0.9041455388069153),
--     [2] = Vector3.new(9.842406272888184, 75.61966705322266, 22.29692840576172),
--     [3] = "Stupefy"
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("f80afe0b-defd-49c7-82f3-8d08f65ff4e6"):FireServer(unpack(args))

spawn(function()
    while wait(.1) do
        for _,v in pairs(rs.Remotes:GetChildren()) do
            for _,l in pairs(wp.Debris:GetChildren()) do
                if tostring(l) == "Clash" then
                    if l:FindFirstChild("Left") then
                        local args = {
                            [1] = l.Left,
                            [2] = "bac"
                        }
                        
                        v:FireServer(unpack(args))
                        local args = {
                            [1] = l.Left,
                            [2] = "for"
                        }
                        
                        v:FireServer(unpack(args))
                    end
                end
            end
        end
    end
end)

-- spawn(function()
--     while wait(.1) do
--         if tostring(atOn) == "true" then
--             for _,v in pairs(rs.Remotes:GetChildren()) do
--                 local args = {
--                     [1] = "Stupefy"
--                 }
                
--                 v:FireServer(unpack(args))
--             end
--             for _,v in pairs(rs.Remotes:GetChildren()) do
--                 local args = {
--                     [1] = aMon.Parent.Humanoid,
--                     [2] = Vector3.new(0, 0, 0),
--                     [3] = "Stupefy"
--                 }
                
--                 v:FireServer(unpack(args))
--             end

--         end
--     end
-- end)
-- mouse.Button1Down:connect(
-- 	function()
-- 		if not mouse.Target then
-- 			return
-- 		end
-- 		aMon = mouse.Target
-- 	end
-- )

-- mouse.KeyDown:connect(
--     function(keyDown)
--         if keyDown == "z" then
--             if tostring(atOn) == "false" then
--                 atOn = "true"
--                 NotifyG("Attack", tostring(atOn))
--             else
--                 atOn = "false"
--                 NotifyG("Attack", tostring(atOn))
--             end
--         end
--     end
-- )

hitBoxSize = {5, 5, 5}
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/HitBox.lua"), true))() -- HitBox Lua