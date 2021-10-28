uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

pcall(function()
	if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild("TP Tool") then
        bp:FindFirstChild("TP Tool"):Destroy()
    end
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "TP Tool"
	tool.CanBeDropped = false
	tool.Parent = bp
	tool.Equipped:connect(function(mouse)
		function tpAction()
			if not mouse.Target then return end
			if mouse.Target.Locked == true then mouse.Target.Locked = false end
			local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
			-- local camLv = cmr.CFrame.lookVector
			-- local camRotation = math.atan2(-camLv.X, -camLv.Z)
			local camLv = lplr.Character.HumanoidRootPart.CFrame.lookVector
			local camRotation = math.atan2(-camLv.X, -camLv.Z)
			pos = CFrame.new(pos.x,pos.y,pos.z)
			lplr.Character.HumanoidRootPart.CFrame = pos * CFrame.Angles(0, camRotation, 0)
		end
	end)
	tool.Activated:connect(function()
		tpAction()
	end)
end)