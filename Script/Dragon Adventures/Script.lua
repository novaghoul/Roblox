loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

getgenv().aBreath = true
toggleWS = false
toggleJP = false
ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS_Other.lua"), true))() -- WS_Other Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

spawn(function()
	while wait() do
		if lplr.Character then
			if lplr.Character:FindFirstChild("Dragons") then
				for _,v in pairs(lplr.Character.Dragons:GetChildren()) do
					if v then
						if v:FindFirstChild("Data") then
							if v.Data:FindFirstChild("MovementStats") then
								if v.Data.MovementStats:FindFirstChild("Dash3TimeUseCooldown") then
									v.Data.MovementStats.Dash3TimeUseCooldown.Value = 0.1
								end
								if v.Data.MovementStats:FindFirstChild("Dash3TimeUseReset") then
									v.Data.MovementStats.Dash3TimeUseReset.Value = 0.1
								end
								if v.Data.MovementStats:FindFirstChild("DashCooldown") then
									v.Data.MovementStats.DashCooldown.Value = 0.1
								end
								if v.Data.MovementStats:FindFirstChild("DashForce") then
									v.Data.MovementStats.DashForce.Value = 20
								end
								if v.Data.MovementStats:FindFirstChild("FlyDashCooldown") then
									v.Data.MovementStats.FlyDashCooldown.Value = 0.1
								end
								if v.Data.MovementStats:FindFirstChild("FlySpeed") then
									v.Data.MovementStats.FlySpeed.Value = 50
								end
								if v.Data.MovementStats:FindFirstChild("FlyTurnSpeed") then
									v.Data.MovementStats.FlyTurnSpeed.Value = 0.1
								end
							end
						end
					end
				end
			end
		end
	end
end)
spawn(function()
	while wait() do
		for _,v in pairs(wp.Interactions.Nodes.Mobs.ActiveMobs.Global:GetChildren()) do
			if (v.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 150 then
				if lplr.Character.Dragons:GetChildren()[1] then
					-- local args = {
					-- 	[1] = "Breath",
					-- 	[2] = "Mobs",
					-- 	[3] = v
					-- }
					local args1 = {
						[1] = "Bite",
						[2] = "Mobs",
						[3] = v
					}
					
					-- lplr.Character.Dragons:GetChildren()[1].Remotes.PlaySoundRemote:FireServer(unpack(args))
					lplr.Character.Dragons:GetChildren()[1].Remotes.PlaySoundRemote:FireServer(unpack(args1))
				end
			end
		end
	end
end)

wp.Interactions.Boss.ActiveModels.ChildAdded:connect(
    function(m)
		wait(1)
		if m:WaitForChild("Head") then
			createESPItem(m.Head, 196, 40, 28, 14, "Boss")
			spawn(function()
				while m.HumanoidRootPart do
					wait()
					if not lplr.Character.Dragons:GetChildren()[1] then
						return
					end
					if (m.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 150 then
						local aDragon = lplr.Character.Dragons:GetChildren()[1]
						if aDragon:WaitForChild("Remotes") then
							local args = {
								[1] = "Breath",
								[2] = "Bosses",
								[3] = m.HumanoidRootPart
							}
							-- local args1 = {
							-- 	[1] = "Bite",
							-- 	[2] = "Bosses",
							-- 	[3] = m.HumanoidRootPart
							-- }
							
							aDragon.Remotes.PlaySoundRemote:FireServer(unpack(args))
							-- aDragon.Remotes.PlaySoundRemote:FireServer(unpack(args1))
						end
					end
				end
			end)
		end
    end
)

for _,v in pairs(wp.Interactions.Nodes.Harvest:GetChildren()) do
	for _,l in pairs(v.ActiveNodes:GetChildren()) do
		if tostring(v.Name) == "Eggs" then
			createESPItem(l.EggModel.Egg, 245, 205, 48, 14, "Egg", 0)
		else
			createESPItem(l:FindFirstChildOfClass("MeshPart"), 245, 205, 48, 14, v.Name, 0)
			spawn(function()
				while l.BoostRemote do
					wait()
					local args = {
						[1] = true,
						[2] = "Magic0"
					}
					local args1 = {
						[1] = true,
						[2] = "Resources0"
					}
					local args2 = {
						[1] = true,
						[2] = "Food0"
					}
					l.BoostRemote:InvokeServer(unpack(args))
					l.BoostRemote:InvokeServer(unpack(args1))
					l.BoostRemote:InvokeServer(unpack(args2))
				end
			end)
		end
	end
	v.ActiveNodes.ChildAdded:connect(
		function(m)
			wait(1)
			if tostring(v.Name) == "Eggs" then
				createESPItem(m.EggModel.Egg, 245, 205, 48, 14, "Egg", 0)
			else
				createESPItem(m:FindFirstChildOfClass("MeshPart"), 245, 205, 48, 14, v.Name, 0)
				spawn(function()
					while m.BoostRemote do
						wait()
						local args = {
							[1] = true,
							[2] = "Magic0"
						}
						local args1 = {
							[1] = true,
							[2] = "Resources0"
						}
						local args2 = {
							[1] = true,
							[2] = "Food0"
						}
						m.BoostRemote:InvokeServer(unpack(args))
						m.BoostRemote:InvokeServer(unpack(args1))
						m.BoostRemote:InvokeServer(unpack(args2))
					end
				end)
			end
		end
	)
end
-- spawn(function()
-- 	while wait() do
-- 		if wp.Camera:FindFirstChild("RaceRing") then
-- 			firetouchinterest(wp.Camera:FindFirstChild("RaceRing"),  lplr.Character.HumanoidRootPart, 0)
-- 			wait(.1)
-- 			firetouchinterest(wp.Camera:FindFirstChild("RaceRing"),  lplr.Character.HumanoidRootPart, 1)
-- 		end
-- 	end
-- end)
-- for _,v in pairs(wp.Interactions.SolsticeEvent:GetChildren()) do
-- 	if v:IsA("Model") then
-- 		if v:FindFirstChild("BasePart") then
-- 			createESPItem(v.BasePart, 245, 205, 48, 14, v.Name, 0)
-- 		end
-- 	end
-- end

-- for _,v in pairs(wp.Terrain:GetChildren()) do
-- 	if tostring(v.Name) == "EarthItemSpawnAttachment" then
-- 		local args = {
-- 			[1] = v
-- 		}
		
-- 		rs.Remotes.GrabItemRemote:FireServer(unpack(args))
-- 	end
-- end

-- for _,v in pairs(wp.Interactions.Nodes.Flowers:GetChildren()) do
-- 	if v:IsA("Model") then
-- 		if v:FindFirstChild("InteractPart") then
-- 			createESPItem(v.InteractPart, 245, 205, 48, 14, v.Name, 0)
-- 		end
-- 	end
-- end