loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

ws_g = 50

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua

spawn(function()
    while wait() do
        rs.Remotes.PowerGain:FireServer()
    end
end)

spawn(function()
    while wait() do
        rs.Remotes.PushGain:FireServer()
    end
end)

spawn(function()
    while wait(1) do
        rs.Remotes.Rebirth:FireServer()
    end
end)

getgenv().aPet = true
while aPet do
    local args = {
        [1] = "Hatch1",
        [2] = "Lava",
        [3] = {}
    }
    
    rs.Remotes.Hatch:FireServer(unpack(args))
    wait()
end