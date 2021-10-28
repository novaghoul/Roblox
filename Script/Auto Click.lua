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

_G.onClick = false
_G.keyClick = "p"
_G.delay = 0.1

function autoClick()
    while _G.onClick do
        wait(_G.delay)
        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
    end
end

mouse.KeyDown:connect(
	function(keyDown)
        if keyDown == _G.keyClick then
            _G.onClick = not _G.onClick
            wait(0.1)
			autoClick()
		end
	end
)