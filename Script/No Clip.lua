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
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        else
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = true
            end
            lplr.Character.HumanoidRootPart.CanCollide = true
        end
    end
)