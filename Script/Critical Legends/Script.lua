loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleWS = false
toggleJP = false
jp_g = 100
ws_g = 100
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESPTest Lua

-- game:GetService("Workspace").Stalls["Black Market"].Grani.ScriptsandParts.Grani
-- game:GetService("Workspace").Stalls["Black Market"].Grani.Shop["Crimson Heart"]
-- game:GetService("Workspace").Stalls["Black Market"].Grani.Shop["Crimson Heart"].Cost.Value
-- spawn(function()
--     for _,v in pairs(wp.Stalls["Black Market"]:GetChildren()) do
--         if v:FindFirstChild("ScriptsandParts") then
--             createESPItem(v.ScriptsandParts.Grani, 196, 40, 28, 12, "🛍️", 1)
--             NotifyG(tle, msg)
--             NotifyG(tle, msg)
--             NotifyG(tle, msg)
--         end
--         v.ChildAdded:connect(
--             function(m)
--                 if tostring(m.Name) == "HumanoidRootPart" then
--                     createESPItem(m, 196, 40, 28, 12, v.Name, 1)
--                 end
--             end
--         )
--     end
--     wp.Attackable.ChildAdded:connect(
--         function(m)
--             spawn(function()
--                 if m:WaitForChild("HumanoidRootPart") then
--                     createESPItem(m.HumanoidRootPart, 196, 40, 28, 12, m.Name, 1)
--                 end
--             end)
--         end
--     )
-- end)

spawn(function()
    while wait() do
        local args = {
            [1] = "RequestLevelUp"
        }
        
        rs.Server:FireServer(unpack(args))
        rs.Server:FireServer(unpack(args))
    end
end)
loadstring(game:HttpGet(('https://septex.xyz/ProjectSeptex.txt'),true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua