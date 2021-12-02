loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == noclipAllKey then
            noclipAll = not noclipAll
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            lplr.Character.Humanoid:ChangeState(11)
        end
    end
)