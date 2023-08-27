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

_G.namePhone = lplr.Backpack:GetChildren()[1].Name

lplr.Backpack.ChildAdded:connect(
    function(m)
        _G.namePhone = m.Name
	end
)

while wait(0.1) do
    local A_1 = _G.namePhone
    local Event = game:GetService("ReplicatedStorage").Events.Add
    Event:FireServer(A_1)
end
