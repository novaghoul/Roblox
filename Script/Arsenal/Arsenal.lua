loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

hitBoxSize = {3, 3, 3}
hitBoxBody = "Head"
-- HumanoidRootPart

_G.team = lplr.Team

function createESP(parent)
	if tostring(parent.Team) ~= tostring(lplr.Team) then
		createESPItem(parent.Character.Head, 196, 40, 28, 14, parent.Name)
		for _, p in pairs(parent.Character:GetChildren()) do
			if p.Name == ("Head") then
				for _, f in pairs(faces) do
					createESPCharm(p, f, 196, 40, 28)
				end
			end
		end
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		o.CharacterAdded:Connect(
			function(characterModel)
				if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
					if characterModel:WaitForChild("Head") then
						wait(0.5)
						createESP(o)
					end
				end
			end
		)
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					if newPlayer.Team ~= lplr.Team then
						if characterModel:WaitForChild("Head") then
							wait(0.5)
							createESP(newPlayer)
						end
					end
				end
			)
		end
	)
end
enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
			spawn(
				function()
					if o.Character:WaitForChild("Head") then
						wait(0.1)
						createESP(o)
					end
				end
			)
		end
	end
end
espFirst()

function hitBox()
	for _, o in pairs(plrs:GetPlayers()) do
		o.CharacterAdded:Connect(
			function(characterModel)
				if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
					if characterModel:WaitForChild(hitBoxBody) then
						wait(0.5)
						createHitBox(characterModel)
					end
				end
			end
		)
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					if newPlayer.Team ~= lplr.Team then
						if characterModel:WaitForChild(hitBoxBody) then
							wait(0.5)
							createHitBox(characterModel)
						end
					end
				end
			)
		end
	)

	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			if o.Team ~= lplr.Team then
				spawn(
					function()
						if o.Character:WaitForChild(hitBoxBody) then
							wait(0.1)
							createHitBox(o.Character)
						end
					end
				)
			end
		end
	end
end
hitBox()