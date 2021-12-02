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
        if keyDown == " " then
            infJump()
        end

        if keyDown == "k" then
			changeJP(0)
			checkReturn("Jump Power", humanoidP.JumpPower)
		end
		
		if keyDown == "l" then
			changeJP(1)
			checkReturn("Jump Power", humanoidP.JumpPower)
		end
    end
)