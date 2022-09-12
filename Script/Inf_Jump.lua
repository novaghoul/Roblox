loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

function statsPlayerJp()
	humanoidP.JumpPower = jp_g
	humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
		if humanoidP.JumpPower ~= jp_g then
			humanoidP.JumpPower = jp_g
		end
	end)

	lplr.CharacterAdded:Connect(function(characterModel)
		wait(1)
		humanoidP = characterModel:FindFirstChildOfClass("Humanoid")
		humanoidP.JumpPower = jp_g
        humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
            if humanoidP.JumpPower ~= jp_g then
                humanoidP.JumpPower = jp_g
            end
        end)
    end)
end

statsPlayerJp()

function infJump()
	uis.JumpRequest:connect(
		function()
			if lplr.Character ~= nil then
				lplr.Character.Humanoid.JumpPower = jp_g
				lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end
	)
end
infJump()

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

if toggleJP then
	uis.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType.Value == 8 then
			if input.KeyCode.Value == 91 then
				changeJP(0)
				checkReturn("Jump Power", humanoidP.JumpPower)
			end
			
			if input.KeyCode.Value == 93 then
				changeJP(1)
				checkReturn("Jump Power", humanoidP.JumpPower)
			end
		end
	end)
end