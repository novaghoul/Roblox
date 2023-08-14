loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
getgenv().aCash = false
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "z" then
            if aCash == true then
                aCash = false
            else
                aCash = true
            end
            while aCash do
                wait()
                rs:WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
            end
        end
    end
)
firetouchinterest(game:GetService("Workspace").Tycoon.Tycoons.Lima.Essentials.CashCollector.Touchinterest, lplr.Character.HumanoidRootPart, 0)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTestTeam.lua"), true))() -- 1st Lua
for _,v in pairs(wp.Maps.Realm1:GetChildren()) do
    for _,l in pairs(v.Gameplay.SlashableObjects:GetChildren()) do
        if l:IsA("Folder") then
            for _,n in pairs(l:GetChildren()) do
                local args = {
                    [1] = n,
                    [2] = true
                }
                
                rs.Postie.Remotes.PlayerRemotes.WAOHoukaShu.SlashableTrigger:FireServer(unpack(args))
            end
        else

        end
    end
end

local args = {
    [1] = workspace:WaitForChild("Maps"):WaitForChild("Realm1"):WaitForChild("Mushtown"):WaitForChild("Gameplay"):WaitForChild("SlashableObjects"):WaitForChild("Shroom"):WaitForChild("Shroom"),
    [2] = true
}

rs.Postie.Remotes.PlayerRemotes.WAOHoukaShu.SlashableTrigger:FireServer(unpack(args))
