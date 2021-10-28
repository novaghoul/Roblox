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

_G.punchmodeactive = false
_G.farmxp = {"+FS1", "+BT1", "+MS1", "+JF1", "+PP1"}

spawn(
	function()
		local Event = rs.RemoteEvent
		while wait() do
			for _, v in pairs(_G.farmxp) do
				Event:FireServer({[1] = v})
				wait(0.05)
			end
		end
	end
)

function punchActive()
	while _G.punchmodeactive do
		rs.RemoteEvent:FireServer("Skill_Punch", "Left")
		rs.RemoteEvent:FireServer("Skill_Punch", "Right")
		wait(0.05)
	end
end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "p" then
			_G.punchmodeactive = not _G.punchmodeactive
			punchActive()
		end
	end
)

lplr.Idled:connect(
	function()
		virtualUser:CaptureController()
		virtualUser:ClickButton2(Vector2.new())
	end
)
