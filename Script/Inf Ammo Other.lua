local nameWeapon = "Weapon1"
local m = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(nameWeapon))
m.StoredAmmo = math.huge
m.MagSize = math.huge
m.Semi = false
m.Damage = {
    Max = 1500000,
    Min = 10000
}
m.Spread = {
    Min = 0,
    Max = 0
}
m.ViewKick = {
    Pitch = {
        Min = 0,
        Max = 0
    },
    Yaw = {
        Min = 0,
        Max = 0
    }
}
m.BulletPenetration = 1500
m.FireTime = 0
