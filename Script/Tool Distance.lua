loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

pcall(function()
	if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild("Distance Tool") then
        bp:FindFirstChild("Distance Tool"):Destroy()
    end
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "Distance Tool"
	tool.CanBeDropped = false 
	tool.Parent = bp
	tool.Activated:connect(function()
		local posLHum = lplr.Character.HumanoidRootPart.CFrame.Position
		local posMouse = mouse.Hit.Position
		print((posMouse - posLHum).magnitude)
	end)
end)

-- local Action = game:GetService("Players").LocalPlayer
-- -- for i = 1,#Action do
-- 	Action.Chatted:connect(function(Message)
-- 		-- rs.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(""", "All")
-- 		print(Message)
-- 	end)
-- -- end