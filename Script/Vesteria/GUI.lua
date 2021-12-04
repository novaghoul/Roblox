repeat wait() until game:IsLoaded()

local player = game.Players.LocalPlayer

local pickupItems = function()
    local itemsFolder = workspace.placeFolders.items:GetChildren()
    for i = 1, #itemsFolder do item = itemsFolder[i]
        if (item:FindFirstChild('owners') and item.owners:FindFirstChild(player.UserId) or item.Name:match('chicken')) and
        (player.Character.hitbox.Position - item.Position).magnitude < 15 then
            game:GetService("ReplicatedStorage").modules.network.pickUpItemRequest:InvokeServer(item)
        end
    end
end

local damage = function()
    local distance, enemiesFolder = 15, workspace.placeFolders.entityManifestCollection:GetChildren()
    for i = 1, #enemiesFolder do
        enemy = enemiesFolder[i]
        if enemy and enemy:IsA('Part') and (player.Character.hitbox.Position - enemy.Position).magnitude < distance then
            game:GetService("ReplicatedStorage").signal:FireServer('swordAnimations', 'strike1', {["attackSpeed"] = 0})
            game:GetService("ReplicatedStorage").signal:FireServer("playerRequest_damageEntity", enemy, Vector3.new(0,0,0), "equipment")
            game:GetService("ReplicatedStorage").signal:FireServer("attackInteractionAttackableAttacked", enemy, Vector3.new(0,0,0))   
        end
    end
end

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/obeseinsect/roblox/main/Ui%20Libraries/Old%20Uwuware%20Purple%20Edit.lua', true))()
local window = lib:CreateWindow('Vesteria')
window:AddLabel({text = "cameron was here"})
local f = window:AddFolder('Farming')
f:AddToggle({text = 'Killaura', state = killaura, callback = function(v) killaura = v end})
f:AddToggle({text = 'Collect Drops', state = autoPickup, callback = function(v) autoPickup = v end})
local p = window:AddFolder('Player')
p:AddToggle({text = 'Godmode', state = god, callback = function(v) god = v end})
p:AddToggle({text = 'Infinite Stamina', state = infStam, callback = function(v) infStam = v end})
p:AddToggle({text = 'Infinite Magic', state = infMagic, callback = function(v) infMagic = v end})
local t = window:AddFolder('Teleports')
for i, v in pairs(workspace:GetChildren()) do
    if v:IsA('Part') and v:FindFirstChild('teleportDestination') then
        t:AddButton({text = game:GetService("MarketplaceService"):GetProductInfo(v.teleportDestination.Value).Name, callback = function()
            game:GetService("ReplicatedStorage").modules.network["playerRequest_useTeleporter"]:InvokeServer(v)
        end})
    end
end
local m = window:AddFolder('Misc')
m:AddButton({text = 'Open Shop', callback = function() game:GetService("ReplicatedStorage").modules.network.openShop:Invoke(game) end})
lib:Init()

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if args[1] == 'playerRequest_damageEntity' and args[2] == 60 then
        if god then
            args[2] = 0
        else
            args[2] = 60
        end
        return old(self, unpack(args))
    end
    return old(self, ...)
end)

while wait() do
    if killaura then
        damage()
    end
    if autoPickup then
        pickupItems()
    end
    if infStam and player.Character:FindFirstChild('hitbox') and player.Character.hitbox:FindFirstChild('stamina') then
        player.Character.hitbox.stamina.Value = player.Character.hitbox.maxStamina.Value
    end
    if infMagic and player.Character:FindFirstChild('hitbox') and player.Character.hitbox:FindFirstChild('mana') then
        player.Character.hitbox.mana.Value = player.Character.hitbox.maxMana.Value
    end
end