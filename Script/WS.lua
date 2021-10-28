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

if _G.ws_g then
	_G.ws_g = 20
end

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
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

function checkReturn(String)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(String)
	else
		return SendChat(String)
	end
end

function statsPlayerWs()
	lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g

	lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
				lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
						lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
					end
				end
			)
		end
	)
end
statsPlayerWs()

function changeWS(typeWS)
	if typeWS == 0 then
		_G.ws_g = _G.ws_g + 5
		lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
	elseif typeWS == 1 then
		if _G.ws_g >= 0 then
			_G.ws_g = _G.ws_g - 5
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
		end
		if _G.ws_g < 16 then
			_G.ws_g = 16
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
		end
	end
end

uis.InputBegan:Connect(
	function(input, gameProcessed)
		if input.UserInputType.Value == 8 then
			if input.KeyCode.Value == 107 then
				changeWS(0)
				checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
			end

			if input.KeyCode.Value == 108 then
				changeWS(1)
				checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
			end
		end
	end
)
