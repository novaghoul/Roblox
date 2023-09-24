loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == noclipAllKey then
            noclipAll = not noclipAll
            NotifyG("Noclip", noclipAll)
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if lplr.Character then
            if noclipAll then
                for i = 1, #checkRigType() do
                    if lplr.Character[checkRigType()[i]] then
                        lplr.Character[checkRigType()[i]].CanCollide = false
                    end
                end
                if lplr.Character.HumanoidRootPart then
                    lplr.Character.HumanoidRootPart.CanCollide = false
                end
            else
                for i = 1, #checkRigType() do
                    if lplr.Character[checkRigType()[i]] then
                        lplr.Character[checkRigType()[i]].CanCollide = true
                    end
                end
                if lplr.Character.HumanoidRootPart then
                    lplr.Character.HumanoidRootPart.CanCollide = true
                end
            end
        end
    end
)