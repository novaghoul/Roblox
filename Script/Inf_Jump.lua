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

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = '[OUTPUT]: ' .. String
})
end

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

local jump = 50

function checkReturn(String)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(String)
	else
		return SendChat(String)
	end
end

function statsPlayerJp()
	humanoidP.JumpPower = jump
	humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
		if humanoidP.JumpPower ~= jump then
			humanoidP.JumpPower = jump
		end
	end)

	lplr.CharacterAdded:Connect(function(characterModel)
		wait(1)
		humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
		humanoidP.JumpPower = jump
        humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
            if humanoidP.JumpPower ~= jump then
                humanoidP.JumpPower = jump
            end
        end)
    end)
end

statsPlayerJp()

function infJump()
	uis.JumpRequest:connect(
		function()
			if lplr.Character ~= nil then
				lplr.Character.Humanoid.JumpPower = jump
				lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end
	)
end
infJump()

function changeJP(typeJP)
	if typeJP == 0 then
		jump = jump + 5
		humanoidP.JumpPower = jump
	elseif typeJP == 1 then
		if jump >= 50 then
			jump = jump - 5
			humanoidP.JumpPower = jump
		end
		if jump < 50 then
			jump = 50
			humanoidP.JumpPower = jump
		end
	end
end

uis.InputBegan:Connect(function(input, gameProcessed)
	if input.UserInputType.Value == 8 then

		-- if input.KeyCode.Value == 32 then
		-- 	infJump()
		-- end

		if input.KeyCode.Value == 91 then
			changeJP(0)
			checkReturn("Jump Power :" .. humanoidP.JumpPower)
		end
		
		if input.KeyCode.Value == 93 then
			changeJP(1)
			checkReturn("Jump Power :" .. humanoidP.JumpPower)
		end
	end
end)