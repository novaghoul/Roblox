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
