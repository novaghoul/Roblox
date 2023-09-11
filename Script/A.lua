loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS_Other.lua"), true))() -- WS_Other Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua


loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
spawn(function()
    while wait() do
        rs.common.packages._Index["sleitnick_knit@1.5.1"].knit.Services.ClickService.RE.Click:FireServer()
    end
end)
spawn(function()
    while wait() do
        rs.common.packages._Index["sleitnick_knit@1.5.1"].knit.Services.RebirthService.RE.Rebirth:FireServer()
    end
end)
spawn(function()
    while wait() do
        for _,v in pairs(wp.Tycoons:GetChildren()) do
            if v:FindFirstChild("Collect") then
                v.Collect:FireServer()
            end
        end
        -- workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon4"):WaitForChild("Collect"):FireServer()
    end
end)
spawn(function()
    while wait() do
        workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon4"):WaitForChild("Rebirth"):FireServer()
    end
end)

spawn(function()
    while wait() do
        local args = {
            [1] = "Golden",
            [2] = {}
        }
        local args1 = {}
        for _,v in pairs(lplr.PlayerGui.Frames.Frames.Pets.Pets:GetChildren()) do
            if v:IsA("TextButton") then
                table.insert(args1, v.Mob)
            end
        end
        args[2] = args1
        rs.common.packages._Index["sleitnick_knit@1.5.1"].knit.Services.MachineService.RF.Make:InvokeServer(unpack(args))
    end
end)

getgenv().aEgg = true
getgenv().nEgg = "Void 2"
while wait() do
    if tostring(aEgg) == "true" then
        local args = {
            [1] = nEgg,
            [2] = "Single",
            [3] = {}
        }
        
        rs.common.packages._Index["sleitnick_knit@1.5.1"].knit.Services.EggService.RF.Hatch:InvokeServer(unpack(args))
    end
end


