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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {10, 10, 10}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

wait(0.5)
spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
    end
)