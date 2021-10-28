local Players = game:GetService("Players")
Players.LocalPlayer.Character.Head.HairAttachment:Destroy()
Players.LocalPlayer.Character.Head.HatAttachment:Destroy()

for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
	if v.ClassName == "Accessory" then
		v.Handle.AccessoryWeld:Destroy()
		
		local tool = Instance.new("Tool", Players.LocalPlayer.Backpack)
		v.Handle.Parent = tool
		tool.Handle.CanCollide = true
		
		tool.Equipped:Connect(function()
			tool.Handle.Anchored = false
			tool.Handle.CanCollide = true
		end)
		tool.Activated:Connect(function()
			local AnimationId = "29517689"
			local Animation = Instance.new("Animation")
			Animation.AnimationId = "rbxassetid://"..AnimationId
			local PlayAnimation = Players.LocalPlayer.Character.Humanoid:LoadAnimation(Animation)
			PlayAnimation:Play()
			PlayAnimation:AdjustSpeed(1)
			Players.LocalPlayer.Character.Head.Died:Play()
		end)
	end
end