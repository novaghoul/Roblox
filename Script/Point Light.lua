loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

for _, v in pairs(plrs:GetPlayers()) do
    if not v.Character.Head:FindFirstChild("PLADD") then
        local plg      = Instance.new("PointLight",v.Character.Head)
        plg.Name       = ("PLADD")
        plg.Range      = 200
        plg.Shadows    = false
        plg.Enabled    = true
        plg.Color      = Color3.fromRGB(255, 255, 255)
        plg.Brightness = 1
    end
end

if not lplr.Character.Head:FindFirstChild("PLADD") then
    local plg      = Instance.new("PointLight",lplr.Character.Head)
    plg.Name       = ("PLADD")
    plg.Range      = 200
    plg.Shadows    = false
    plg.Enabled    = true
    plg.Color      = Color3.fromRGB(255, 255, 255) 
    plg.Brightness = 1
end