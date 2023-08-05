loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
lplr.Idled:connect(function()
    virtualUser:Button2Down(Vector2.new(0,0),wp.CurrentCamera.CFrame)
    wait(1)
    virtualUser:Button2Up(Vector2.new(0,0),wp.CurrentCamera.CFrame)
end)