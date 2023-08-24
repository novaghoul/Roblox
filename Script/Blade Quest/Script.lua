loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

ws_g = 35
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua

spawn(function()
    while wait() do
        for _,v in pairs(wp.Enemies:GetChildren()) do
            if v:WaitForChild("HumanoidRootPart") then
                if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                    local args = {
                        [1] = "Hit",
                        [2] = v,
                        [3] = Vector3.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z),
                        [4] = 0.1
                    }
                    
                    rs.RE:FireServer(unpack(args))
                end
            end
        end
    end
end)