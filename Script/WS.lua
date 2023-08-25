loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function statsPlayerWs()
	if lplr.Character then
		lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
	
		lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
			function()
				if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= ws_g then
					lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
				end
			end
		)
	end

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			characterModel:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
			characterModel:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if characterModel:FindFirstChildOfClass("Humanoid").WalkSpeed ~= ws_g then
						characterModel:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
					end
				end
			)
		end
	)
end
statsPlayerWs()

function changeWS(typeWS)
	if lplr.Character then
		if typeWS == 0 then
			ws_g = ws_g + 5
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
		elseif typeWS == 1 then
			if ws_g >= 0 then
				ws_g = ws_g - 5
				lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
			end
			if ws_g < 16 then
				ws_g = 16
				lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
			end
		end
	end
end

uis.InputBegan:Connect(
	function(input, gameProcessed)
		if lplr.Character then
			if toggleWS then
				if input.UserInputType.Value == 8 then
					if input.KeyCode.Value == 107 then
						changeWS(0)
						checkReturn("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
					end
		
					if input.KeyCode.Value == 108 then
						changeWS(1)
						checkReturn("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
					end
				end
			end
		end
	end
)