
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if tostring(game.GameId) == "985731078" then

    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/FPS%20Faster.lua"), true))()
	loadstring(game:HttpGet(("https://pastebinp.com/raw/eccv9pgu"), true))()

	-- -----------------------------------------------------------------------------------
	function createESP(c) --//Checks and calls the proper function
		local bgui = Instance.new("BillboardGui", c.HumanoidRootPart)
		bgui.Name = ("EGUI")
		bgui.AlwaysOnTop = true
		bgui.ExtentsOffset = Vector3.new(0, 3, 0)
		bgui.Size = UDim2.new(0, 200, 0, 50)
		local nam = Instance.new("TextLabel", bgui)
		nam.Text = c.Name
		nam.BackgroundTransparency = 1
		nam.TextSize = 14
		nam.Font = ("Arial")
		nam.TextColor3 = Color3.fromRGB(196, 40, 28)
		nam.Size = UDim2.new(0, 200, 0, 50)
		for _, v in pairs(c:GetChildren()) do
			if checkPart(v) then
				actualESP(v)
			end
		end
		if HEALTHBAR_ACTIVATED then --//If the user decided to
			createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
		end
	end

	function enableESPCode()
		for _, o in pairs(plrs:GetPlayers()) do
			if o.Name ~= lplr.Name then
				o.CharacterAdded:Connect(
					function(characterModel)
						if characterModel:WaitForChild("HumanoidRootPart") then
							wait(0.5)
							createESP(characterModel)
						end
					end
				)
			end
		end

		plrs.PlayerAdded:Connect(
			function(newPlayer)
				newPlayer.CharacterAdded:Connect(
					function(characterModel)
						if characterModel:WaitForChild("HumanoidRootPart") then
							wait(0.5)
							createESP(characterModel)
						end
					end
				)
			end
		)
	end

	enableESPCode()

	function espFirst()
		for _, o in pairs(plrs:GetPlayers()) do
			if o.Name ~= lplr.Name then
				spawn(
					function()
						if o.Character:FindFirstChild("HumanoidRootPart") then
							wait(0.1)
							createESP(o.Character)
						end
					end
				)
			end
		end
	end
	espFirst()
	-- local positionLocal = nil
	local teleT = false
	local PartBoss = nil
	mouse.KeyDown:connect(function(keyDown)
	    -- if keyDown == "e" then
		-- 	if teleT then
		-- 		teleT = false
		-- 		lplr.Character.HumanoidRootPart.Anchored = false
		-- 		lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 50)
		-- 	else
		-- 		teleT = true
		-- 		-- positionLocal = lplr.Character.HumanoidRootPart.CFrame
		-- 		lplr.Character.HumanoidRootPart.Anchored = true
		-- 	end
	    -- end
		if keyDown == "f" then
			if teleT then
				teleT = false
				if PartBoss ~= nil then
					PartBoss:Destroy()
				end
			else
				teleT = true
				while teleT do
					local Part = Instance.new("Part")
					Part.Name = "PartKill"
					Part.Parent = wp
					Part.Size = Vector3.new(100, 1, 100)
					Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4.1, 0)
					Part.Anchored = true
					PartBoss = Part
					-- lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 15, 0)
					wait(.5)
					if PartBoss ~= nil then
						PartBoss:Destroy()
					end
				end
			end
		end
	end)
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))()
	noclipAll = false
end

-- local namePet = "Gavin"
-- for _, v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
--     if tostring(v["__BILLBOARD"].Nickname.Text) == namePet then
--         local table_1 = {
--             [1] = tostring(v.Name)
--         };
--         local Target = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["enchant pet"];
--         Target:InvokeServer(table_1);
--     end
-- end