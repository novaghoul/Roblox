loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function statsPlayerJp()
	if lplr.Character then
		lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = jp_g
		lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("JumpPower"):connect(function()
			if lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower ~= jp_g then
				lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = jp_g
			end
		end)
	end
	lplr.CharacterAdded:Connect(function(characterModel)
		wait(1)
		characterModel:FindFirstChildOfClass("Humanoid").JumpPower = jp_g
        characterModel:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("JumpPower"):connect(function()
            if characterModel:FindFirstChildOfClass("Humanoid").JumpPower ~= jp_g then
                characterModel:FindFirstChildOfClass("Humanoid").JumpPower = jp_g
            end
        end)
    end)
end
statsPlayerJp()

function changeJP(typeJP)
	if typeJP == 0 then
		jp_g = jp_g + 5
		humanoidP.JumpPower = jp_g
	elseif typeJP == 1 then
		if jp_g >= 50 then
			jp_g = jp_g - 5
			humanoidP.JumpPower = jp_g
		end
		if jp_g < 50 then
			jp_g = 50
			humanoidP.JumpPower = jp_g
		end
	end
end

function infJump()
    lplr.Character.Humanoid.JumpPower = jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
		if lplr.Character then
			if keyDown == " " then
				infJump()
			end
			if toggleJP then
				if keyDown == "k" then
					changeJP(0)
					checkReturn("Jump Power", humanoidP.JumpPower)
				end
				
				if keyDown == "l" then
					changeJP(1)
					checkReturn("Jump Power", humanoidP.JumpPower)
				end
			end
		end
    end
)