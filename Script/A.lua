
while wait() do
    game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
    game:GetService("ReplicatedStorage"):WaitForChild("events-shared/network@GlobalEvents"):WaitForChild("placeBlock"):FireServer()
end

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Aimbot.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTestTeam.lua"), true))()
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'HeadDamage') then
        print(v)
    end
end
v = {Damage = 200, HeadDamage = 200, Description = "Sniper Rifle", MaxAmmo = 6, CurrentAmmo = 6, StoredAmmo = 600, FireRate = 1.5, AutoFire = false, Range = 1000, ShieldDamage = 60, Spread = 50, ReloadTime = 4, Bullets = 1, ReloadAnim = "ReloadShells", ShootAnim = "ShootShell", HoldAnim = "Hold", FireSoundId = "http://www.roblox.com/asset/?id=3742310026", SecondarySoundId = nil, ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229", Scope = true}
v.Damage = 200
v.HeadDamage = 200
v.StoredAmmo = 1000
v.FireRate = 0.1
v.Range = 10000