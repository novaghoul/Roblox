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
VirtualUser = game:GetService("VirtualUser")

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

_G.jp_g = 50

function checkReturn(String)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(String)
	else
		return SendChat(String)
	end
end

function statsPlayerJp()
	humanoidP.JumpPower = _G.jp_g
	humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
		if humanoidP.JumpPower ~= _G.jp_g then
			humanoidP.JumpPower = _G.jp_g
		end
	end)

	lplr.CharacterAdded:Connect(function(characterModel)
		wait(1)
		humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
		humanoidP.JumpPower = _G.jp_g
        humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
            if humanoidP.JumpPower ~= _G.jp_g then
                humanoidP.JumpPower = _G.jp_g
            end
        end)
    end)
end

statsPlayerJp()

function changeJP(typeJP)
	if typeJP == 0 then
		_G.jp_g = _G.jp_g + 5
		humanoidP.JumpPower = _G.jp_g
	elseif typeJP == 1 then
		if _G.jp_g >= 50 then
			_G.jp_g = _G.jp_g - 5
			humanoidP.JumpPower = _G.jp_g
		end
		if _G.jp_g < 50 then
			_G.jp_g = 50
			humanoidP.JumpPower = _G.jp_g
		end
	end
end

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "k" then
			changeJP(0)
			checkReturn("Jump Power :" .. humanoidP.JumpPower)
		end
		
		if keyDown == "l" then
			changeJP(1)
			checkReturn("Jump Power :" .. humanoidP.JumpPower)
		end
    end
)