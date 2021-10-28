uis = game:GetService("UserInputService")
cg = game:GetService("CoreGui")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

-- local Remote = game.ReplicatedStorage['EquipAbility']

-- local Arguments = {
--         [1] = "PunchPower"
-- }

-- Remote:FireServer(unpack(Arguments))

_G.listSkill = {"PunchPower", "Endurance", "PsychicForce", "Agility", "Swiftness"}

for i = 1, #_G.listSkill do
    spawn(
        function()
            while wait() do
                local Remote = rs["IncreaseAbilities"]
                local Arguments = {
                    [1] = _G.listSkill[i]
                }
                Remote:FireServer(unpack(Arguments))
            end
        end
    )
end

while wait() do
    for i = 1, 3 do
        local Remote = rs["EquipAbility"]
        local Arguments = {
            [1] = _G.listSkill[i]
        }
        Remote:FireServer(unpack(Arguments))
        wait(0.01)
    end
end

-- local Remote = game.ReplicatedStorage['Quest']

-- local Arguments = {
--         [1] = "MainQuest"
-- }

-- Remote:FireServer(unpack(Arguments))
