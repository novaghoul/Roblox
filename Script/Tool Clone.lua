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
    if bp:FindFirstChild("Clone Tool") then
        bp:FindFirstChild("Clone Tool"):Destroy()
    end
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "Clone Tool"
	tool.CanBeDropped = false
	tool.Parent = bp
    tool.Activated:connect(function()
        if not mouse.Target then return end
		local tp = mouse.Target.Parent
		if tp:FindFirstChild("Humanoid") then
			local plrr = plrs:FindFirstChild(tp.Name)
			for _,v in pairs(plrr.Backpack:GetChildren()) do
				v:Clone().Parent = lplr.Backpack
			end
		elseif tp.Parent:FindFirstChild("Humanoid") then
			local plrr = plrs:FindFirstChild(tp.Parent.Name)
			for _,v in pairs(plrr.Backpack:GetChildren()) do
				v:Clone().Parent = lplr.Backpack
			end
		end
	end)
end)