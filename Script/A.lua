loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua


for _,v in pairs(wp) do
    print(k,v)
end
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

-- Decompiled with the Synapse X Luau decompiler.


createESPItem(game:GetService("Workspace").monster, 196, 40, 28, 14, "Monster")
createESPItem(game:GetService("Workspace").monster2, 196, 40, 28, 14, "Monster")
game:GetService("Workspace").Floor.CoinContainer.Coin
wp.ChildAdded:connect(
    function(m)
        if m.Name == "Floor" then
            m.ChildAdded:connect(
                function(l)
                    if l.Name == "CoinContainer" then
                        l.ChildAdded:connect(
                            function(n)
                                wait(.1)
                                n.CFrame = lplr.Character.HumanoidRootPart.CFrame
                            end
                        )
                    end
                end
            )
        end
    end
)