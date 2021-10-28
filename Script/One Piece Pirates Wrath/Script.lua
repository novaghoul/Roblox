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

for _, v in ipairs(wp:GetChildren()) do
    if tostring(v.ClassName) == "Folder" then
        print(#v:GetChildren())
	end
end

g = {
	folderChests = nil
}

for _, v in ipairs(wp:GetChildren()) do
	if tostring(v.ClassName) == "Folder" and #v:GetChildren() == 57 then
		g.folderChests = v
	end
end

intChest = 1
function tpChests()
	if g.folderChests ~= nil then
		if intChest > 57 then
			intChest = 1
		end
		-- if g.folderChests:GetChildren()[intChest]:FindFirstChild("ClickDetector") then
			lplr.Character.HumanoidRootPart.CFrame = g.folderChests:GetChildren()[intChest].CFrame
			intChest = intChest + 1
		-- else
		-- 	intChest = intChest + 1
		-- 	tpChests()
		-- end
	end
end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "l" then
			tpChests()
		end
	end
)
-- "Hostile NPCs"
-- "Ship Spawner7"