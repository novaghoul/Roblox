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

-- for i=1, 214 do
-- for i=215, 363 do
-- for i=364, 489 do
-- for i=490, 632 do
-- for i=633, 860 do
-- for i=861, 999 do
for i=1000, 1910 do
	local stage = wp.stages[tostring(i)]
	lplr.Character.HumanoidRootPart.CFrame = stage.CFrame
	wait(0.1)
	stage:Destroy()
end