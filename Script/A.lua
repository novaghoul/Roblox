loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ExecuteChats.lua"), true))()

for i, v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'MaxAmmo') then
        print("-------------------------------------------------------------")
        table.foreach(v, print)
    end
end

for i, v in pairs(getgc()) do
    if type(v) == "function" and getinfo(v).name == "Reload" then
        debug.setupvalue(v, 2, math.huge)
    end
end