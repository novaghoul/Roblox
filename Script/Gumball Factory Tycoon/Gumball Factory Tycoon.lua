
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

-- game:GetService("Workspace").Tycoons["Lemon Gum"].Upgraders.PlacementGB3["Flavor Booster"].Upgrader.Upgrader.TouchInterest
-- game:GetService("Workspace").Tycoons["Lemon Gum"].Interact.Furnace.Income.TouchInterest
-- game:GetService("Workspace").Tycoons["Lemon Gum"].Gumballs.FinalGum
-- game:GetService("Workspace").Tycoons["Lemon Gum"].Owner
-- game:GetService("Workspace").Tycoons["Lemon Gum"].Upgraders.PlacementGS3["Chance Upgrader"].ChanceUpgrader.Upgrader

for _,v in pairs(game:GetService("Workspace").Tycoons["Lemon Gum"].Gumballs:GetChildren()) do
    if tostring(v.Name) == "FinalGum" then
        for i=1,10 do
            firetouchinterest(v,  game:GetService("Workspace").Tycoons["Lemon Gum"].Upgraders.PlacementGS3["Chance Upgrader"].ChanceUpgrader.Upgrader, 0)
            wait(.1)
            firetouchinterest(v,  game:GetService("Workspace").Tycoons["Lemon Gum"].Upgraders.PlacementGS3["Chance Upgrader"].ChanceUpgrader.Upgrader, 1)
        end
    end
end

for _,v in pairs(game:GetService("Workspace").Tycoons["Lemon Gum"].Gumballs:GetChildren()) do
    if tostring(v.Name) == "FinalGum" then
        firetouchinterest(v,  game:GetService("Workspace").Tycoons["Lemon Gum"].Interact.Furnace.Income, 0)
        wait(.1)
        firetouchinterest(v,  game:GetService("Workspace").Tycoons["Lemon Gum"].Interact.Furnace.Income, 1)
    end
end
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local fCha = false
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "e" then
        fCha = not fCha
        if fCha then
            NotifyG("Obbies", "True")
        else
            NotifyG("Obbies", "False    ")
        end
        while fCha do
            firetouchinterest(lplr.Character.LowerTorso,  wp.Obbies.HardObby.Win, 0)
            wait(.1)
            firetouchinterest(lplr.Character.LowerTorso,  wp.Obbies.HardObby.Win, 1)
            wait(.3)
            firetouchinterest(lplr.Character.LowerTorso,  wp.Obbies.EasyObby.Win, 0)
            wait(.1)
            firetouchinterest(lplr.Character.LowerTorso,  wp.Obbies.EasyObby.Win, 1)
        end
    end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Amphvptere/Novice/main/MainLoader", true))()