loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function statsPlayerJp()
	if lplr.Character then
		lplr.Character.Humanoid.JumpPower = jp_g
		lplr.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(function()
			if lplr.Character.Humanoid.JumpPower ~= jp_g then
				lplr.Character.Humanoid.JumpPower = jp_g
			end
		end)
	end
	lplr.CharacterAdded:Connect(function(characterModel)
		wait(1)
		characterModel.Humanoid.JumpPower = jp_g
        characterModel.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(function()
            if characterModel.Humanoid.JumpPower ~= jp_g then
                characterModel.Humanoid.JumpPower = jp_g
            end
        end)
    end)
end
statsPlayerJp()

function infJump()
	uis.JumpRequest:connect(
		function()
			if lplr.Character then
				lplr.Character.Humanoid.JumpPower = jp_g
				lplr.Character.Humanoid:ChangeState("Jumping")
			end
		end
	)
end
infJump()

function changeJP(typeJP)
	if lplr.Character then
		if typeJP == 0 then
			jp_g = jp_g + 5
			lplr.Character.Humanoid.JumpPower = jp_g
		elseif typeJP == 1 then
			if jp_g >= 50 then
				jp_g = jp_g - 5
				lplr.Character.Humanoid.JumpPower = jp_g
			end
			if jp_g < 50 then
				jp_g = 50
				lplr.Character.Humanoid.JumpPower = jp_g
			end
		end
	end
end

uis.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType.Value == 8 then
		if lplr.Character then
			if toggleJP then
				if input.KeyCode.Value == 91 then
					changeJP(0)
					checkReturn("Jump Power", lplr.Character.Humanoid.JumpPower)
				end
				
				if input.KeyCode.Value == 93 then
					changeJP(1)
					checkReturn("Jump Power", lplr.Character.Humanoid.JumpPower)
				end
			end
		end
	end
end)