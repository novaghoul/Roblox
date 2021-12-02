loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

spawn(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() -- ESP ALL Players
end)

spawn(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() -- Hit Box
end)


print(game:GetService("Teams").Police.TeamColor)
-- HideWhenZoomed

-- Decompiled with the Synapse X Luau decompiler.
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

local namePet = "Zues"
for _, v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
    if tostring(v["__BILLBOARD"].Nickname.Text) == namePet then
        local table_1 = {
            [1] = tostring(v.Name)
        };
        local Target = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["enchant pet"];
        Target:InvokeServer(table_1);
    end
end
