loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 70
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

mouse.Button1Down:connect(
    function()
        local A_1 = 1565818333.2472
        local toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")
        if toolPlayer then
            if toolPlayer.Name == "Launcher" then
                local A_2 = toolPlayer.Stats
                local A_3 = Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
                local A_4 = toolPlayer.Assets.Rocket.Boom
                local Event = rs.Remotes.explodeRocket
                Event:FireServer(A_1, A_2, A_3, A_4)
            else
                local A_2 = toolPlayer.Stats
                local A_3 = Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
                local Event = rs.Remotes.explodeBomb
                Event:FireServer(A_1, A_2, A_3)
            end
        end
    end
)

spawn(
    function()
        while wait(0.1) do
            local Event = rs.Remotes.sellBricks
            Event:FireServer()
        end
    end
)