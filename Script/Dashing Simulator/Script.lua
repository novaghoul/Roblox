uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

spawn(
	function()
		for _, v in pairs(wp.Flowers:GetChildren()) do
			if v:FindFirstChild("Flower") then
				v.Flower.CFrame = lplr.Character.HumanoidRootPart.CFrame
			end
			if v:FindFirstChild("Main") then
				v.Main:GetPropertyChangedSignal("Transparency"):connect(
					function()
						if v.Main.Transparency == 0 or v.Flower.Transparency == 0 then
							v.Flower.CFrame = lplr.Character.HumanoidRootPart.CFrame
						end
					end
				)
			end
		end
	end
)

spawn(
	function()
		for _, v in pairs(wp.Map:GetChildren()) do
			if tonumber(v.Name) ~= nil then
				v.CFrame = lplr.Character.HumanoidRootPart.CFrame
			end
		end
		wp.Map.ChildAdded:connect(
			function(m)
				if tonumber(m.Name) ~= nil then
					m.CFrame = lplr.Character.HumanoidRootPart.CFrame
				end
			end
		)
	end
)

-- wait(1)

-- spawn(
-- 	function()
-- 		while true do
-- 			wait()
-- 			for _, v in pairs(wp.CollectableOrbs:GetChildren()) do
-- 				if v:IsA("Model") then
-- 					if v:FindFirstChild("Small") then
-- 						v.Small.CFrame = lplr.Character.HumanoidRootPart.CFrame
-- 					elseif v:FindFirstChild("Big") then
-- 						v.Big.CFrame = lplr.Character.HumanoidRootPart.CFrame
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- )

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)

local Path = game:GetService("ReplicatedStorage").Events.Rebirth
Path:FireServer()