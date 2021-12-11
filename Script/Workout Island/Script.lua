loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()
local teleT = false
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "z" then
    	if teleT then
    		teleT = false
    		-- lplr.Character.HumanoidRootPart.Anchored = false
    		-- lplr.Character.HumanoidRootPart.CFrame = CFrame.new(positionLocal.x, positionLocal.y, positionLocal.z) * CFrame.new(0, 50, 0)
    	else
    		teleT = true
            while teleT do
                for _,v in pairs(wp.RingAreas.Territories:GetChildren()) do
                    -- MCLAWRENCQW3'S TERRITORY
                    if teleT == false then
                        break
                    end
                    local PartBoss = nil
                    if PartBoss ~= nil then
                        PartBoss:Destroy()
                    end
                    local Part = Instance.new("Part")
                    Part.Name = "PartKillBoss"
                    Part.Parent = wp
                    Part.Size = Vector3.new(200, 1, 200)
                    if v.Name == "T5" then
                        Part.CFrame = v.CFrame * CFrame.new(0, 1000, 0)
                    else
                        Part.CFrame = v.CFrame * CFrame.new(0, 20000, 0)
                    end
                    Part.Anchored = true
                    PartBoss = Part
                    lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 100, 0)
                    wait(1)
                end
            end
    		-- positionLocal = lplr.Character.HumanoidRootPart.CFrame
    		-- lplr.Character.HumanoidRootPart.Anchored = true
    	end
    end
    -- local PartBoss = nil
    -- if keyDown == "l" then
        -- if PartBoss ~= nil then
        --     PartBoss:Destroy()
        -- end
    --     wait(0.01)
    --     local Part = Instance.new("Part")
    --     Part.Name = "PartKillBoss"
    --     Part.Parent = wp
    --     Part.Size = Vector3.new(20, 1, 20)
    --     Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
    --     Part.Anchored = true
    --     PartBoss = Part
    --     lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 15, 0)
    -- end
end)
local PartBoss = nil
if PartBoss ~= nil then
    PartBoss:Destroy()
end
local Part = Instance.new("Part")
Part.Name = "PartKillBoss"
Part.Parent = wp
Part.Size = Vector3.new(100, 1, 100)
Part.CFrame = game:GetService("Workspace").Airdrops.Airdrop.Airdrop.Ring.CFrame * CFrame.new(0, 20000, 0)
Part.Anchored = true
PartBoss = Part
lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 200, 0)

local PartBoss = nil
if PartBoss ~= nil then
    PartBoss:Destroy()
end
local Part = Instance.new("Part")
Part.Name = "PartKillBoss"
Part.Parent = wp
Part.Size = Vector3.new(100, 1, 100)
Part.CFrame = game:GetService("Workspace").BossModels.Magma.HumanoidRootPart.CFrame * CFrame.new(0, 20000, 0)
Part.Anchored = true
PartBoss = Part
lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 200, 0)
game:GetService("Workspace").BossModels.Magma.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame
game:GetService("Workspace").BossModels.Magma.HumanoidRootPart.Anchored = true

game:GetService("Workspace").BossModels.Magma.HumanoidRootPart.CFrame
game:GetService("Workspace").BossModels.Arcade.HumanoidRootPart --NOADD
game:GetService("Workspace").BossModels.Ice.Hitbox
game:GetService("Workspace").Airdrops.Airdrop.Airdrop
lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.Territories.T1.Cframe
lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Server.Sell.Ring.CFrame * CFrame.new(0, 20000, 0)
game:GetService("Workspace").RingAreas.RangeSystem.Server.DailyReward.Ring
game:GetService("Workspace").RingAreas.RangeSystem.Server.DailyReward.Ring.Tag.Title.Text = "02:42:41"
lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Server.KOTHArea.Ring.CFrame * CFrame.new(0, 20000, 0)
game:GetService("Workspace").RingAreas.RangeSystem.Server.KOTHArea.Ring.Tag.Title.Text = "King: Contested", "King: BeeSwarmPro8502"
lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Local.Shop.Ring.CFrame * CFrame.new(0, 10000, 0)
lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Local.PowerShop.Ring.CFrame --No add
game:GetService("Workspace").RingAreas.RangeSystem.Local.EggShop.Ring
game:GetService("Workspace").RingAreas.RangeSystem.Local.Portal.Ring
game:GetService("Workspace").RingAreas.RangeSystem.Local.GemShop.Ring
game:GetService("Workspace").RingAreas.RangeSystem.Local.ShrinkArea.Ring.CFrame

local Part = Instance.new("Part")
Part.Name = "PartKillBoss"
Part.Parent = wp
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
Part.Anchored = true
PartBoss = Part
lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 15, 0)
spawn(
	function()
        while wait(0.5) do
            for _,v in pairs(wp.ConsumableSpawns:GetChildren()) do
                v.Position = lplr.Character.HumanoidRootPart.Position
            end
        end
	end
)

spawn(
	function()
        while wait() do
            local Target = game:GetService("ReplicatedStorage").Remotes.LiftWeight;
            Target:FireServer();
            local string_1 = "Punch";
            local number_1 = 1;
            local Target = game:GetService("ReplicatedStorage").Remotes.PVP.AttackAttempt;
            Target:FireServer(string_1, number_1);
            local string_1 = "Stomp";
            local Target = game:GetService("ReplicatedStorage").Remotes.PVP.AttackAttempt;
            Target:FireServer(string_1);
        end
	end
)