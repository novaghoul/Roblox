loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/NocturneMoDz/Giant-Simulator/main/METAB", true))()

function funtFisrt()
    while wait() do
        local Target = rs.Aero.AeroRemoteServices.GameService.WeaponAttackStart
        Target:FireServer()
    
        local Target = rs.Aero.AeroRemoteServices.GameService.WeaponAnimComplete
        Target:FireServer()
    end
end


lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)
