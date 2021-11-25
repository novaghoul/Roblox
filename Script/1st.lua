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

_G.ws_g = 20
_G.jp_g = 50

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function notify(tle, msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = tle,
            Text = msg,
            Duration = 3
        }
    )
end

function checkReturn(tle, msg)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(tle, msg)
	else
		return SendChat(msg)
	end
end