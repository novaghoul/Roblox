loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "z" then
            firetouchinterest(wp.Obby.Quidz,  lplr.Character.HumanoidRootPart, 0)
            firetouchinterest(wp.Obby.Quidz,  lplr.Character.HumanoidRootPart, 1)
        end
    end
)