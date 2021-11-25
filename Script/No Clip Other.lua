loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == _G.noclipAllKey then
            _G.noclipAll = not _G.noclipAll
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            lplr.Character.Humanoid:ChangeState(11)
        end
    end
)