loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
game:GetService("Workspace").Activities.IceSkating.PickupSpots.PickupSpot["Logo_Stadium"]

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

v.DAMAGE_MULTI = {
    TORSO_DAMAGE = 5, 
    LIMB_DAMAGE = 5, 
    HEAD_DAMAGE = 5
}
v.RPM = 700
v.PENETRATION = 10
v.BULLET_SPEED = 5000
v.BULLET_LIFETIME = 1
v.BULLET_MAXRANGE = 10000
v.SPREAD = {
    DEFAULT = 1, 
    MIN = 1, 
    MAX = 1, 
    CROUCH_REDUCTION = 1, 
    AIM_REDUCTION = 1, 
    WALK_ADDITION = 0
}
v.AMMO = {
    MAG_CAPACITY = math.huge,
    AMMO_CAPACITY = math.huge
}
v.CAMERA_RECOIL = {
    IDLE = function()
        return Vector3.new(0, 0, 0);
    end, 
    CROUCH = function()
        return Vector3.new(0, 0, 0);
    end, 
    AIM = function()
        return Vector3.new(0, 0, 0);
    end
}
v.RIG_RECOIL = {
    IDLE = function()
        return Vector3.new(0, 0, 0);
    end, 
    CROUCH = function()
        return Vector3.new(0, 0, 0);
    end, 
    AIM = function()
        return Vector3.new(0, 0, 0);
    end
}
for _, v in pairs(debug.getregistry()) do
    if typeof(v) == "table" then
        if v.GUN_NAME then
            
        end
    end
end