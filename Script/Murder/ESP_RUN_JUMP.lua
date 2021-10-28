local uis = game:GetService("UserInputService")
local wp = game:GetService("Workspace")
local rs =  game:GetService("ReplicatedStorage")
local lgt = game:GetService("Lighting")
local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer
local mouse = lplr:GetMouse()

function esp()
	if lgt.Brightness ~= 1 or lgt.GlobalShadows ~= false or lgt.TimeOfDay ~= "13:00:00" or lgt.FogEnd ~= 100000 then
		lgt.Brightness = 1
		lgt.GlobalShadows = false
		lgt.TimeOfDay = "13:00:00"
		lgt.FogEnd = 100000
	end
	
	for _, o in pairs(plrs:GetPlayers()) do
		for _, l in pairs(o.Character.Head:GetChildren()) do
			if l.Name == ("EGUI") then
				l:Destroy()
			end
		end
	end
	
	local faces = {"Back","Bottom","Front","Left","Right","Top"}
	for _, v in pairs(plrs:GetPlayers()) do 
		if v.Name ~= lplr.Name then
			if v.Backpack:FindFirstChild("Gun_Skin_1") or v.Backpack:FindFirstChild("Gun_Skin_2") or v.Backpack:FindFirstChild("Gun_Skin_3") or v.Backpack:FindFirstChild("Gun_Skin_4") or v.Backpack:FindFirstChild("Gun_Skin_5") or v.Backpack:FindFirstChild("Gun_Skin_6") or v.Backpack:FindFirstChild("Gun_Skin_7") or v.Backpack:FindFirstChild("Gun_Skin_8") or v.Character:FindFirstChild("Gun_Skin_1") or v.Character:FindFirstChild("Gun_Skin_2") or v.Character:FindFirstChild("Gun_Skin_3") or v.Character:FindFirstChild("Gun_Skin_4") or v.Character:FindFirstChild("Gun_Skin_5") or v.Character:FindFirstChild("Gun_Skin_6") or v.Character:FindFirstChild("Gun_Skin_7") or v.Character:FindFirstChild("Gun_Skin_8") then
				local bgui = Instance.new("BillboardGui",v.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,3,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = (v.Character.CharName.Value .. " : " .. v.Name)
				nam.BackgroundTransparency = 1
				nam.TextSize = 14
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(13, 105, 172)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(v.Character:GetChildren()) do
					if p.Name == ("Head") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.Active      = true
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
						end
					end
				end
				if not v.Character.Head:FindFirstChild("PLADD") then
					local plg      = Instance.new("PointLight",v.Character.Head)
					plg.Name       = ("PLADD")
					plg.Range      = 15
					plg.Shadows    = false
					plg.Enabled    = true
					plg.Color      = Color3.fromRGB(13, 105, 172)
					plg.Brightness = 2
				end
			elseif v.Backpack:FindFirstChild("Knife_Skin_1") or v.Backpack:FindFirstChild("Knife_Skin_2") or v.Backpack:FindFirstChild("Knife_Skin_3") or v.Backpack:FindFirstChild("Knife_Skin_4") or v.Backpack:FindFirstChild("Knife_Skin_5") or v.Backpack:FindFirstChild("Knife_Skin_6") or v.Backpack:FindFirstChild("Knife_Skin_7") or v.Backpack:FindFirstChild("Knife_Skin_8") or v.Character:FindFirstChild("Knife_Skin_1") or v.Character:FindFirstChild("Knife_Skin_2") or v.Character:FindFirstChild("Knife_Skin_3") or v.Character:FindFirstChild("Knife_Skin_4") or v.Character:FindFirstChild("Knife_Skin_5") or v.Character:FindFirstChild("Knife_Skin_6") or v.Character:FindFirstChild("Knife_Skin_7") or v.Character:FindFirstChild("Knife_Skin_8") then
				local bgui = Instance.new("BillboardGui",v.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,3,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = (v.Character.CharName.Value .. " : " .. v.Name)
				nam.BackgroundTransparency = 1
				nam.TextSize = 14
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(196, 40, 28)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(v.Character:GetChildren()) do
					if p.Name == ("Head") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.Active      = true
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
						end
					end
				end
				if not v.Character.Head:FindFirstChild("PLADD") then
					local plg      = Instance.new("PointLight",v.Character.Head)
					plg.Name       = ("PLADD")
					plg.Range      = 15
					plg.Shadows    = false
					plg.Enabled    = true
					plg.Color      = Color3.fromRGB(196, 40, 28)
					plg.Brightness = 2
				end
			else
				local bgui = Instance.new("BillboardGui",v.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,3,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = (v.Character.CharName.Value .. " : " .. v.Name)
				nam.BackgroundTransparency = 1
				nam.TextSize = 14
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(75, 151, 75)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(v.Character:GetChildren()) do
					if p.Name == ("Head") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.Active      = true
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
						end
					end
				end
				if not v.Character.Head:FindFirstChild("PLADD") then
					local plg      = Instance.new("PointLight",v.Character.Head)
					plg.Name       = ("PLADD")
					plg.Range      = 200
					plg.Shadows    = false
					plg.Enabled    = true
					plg.Color      = Color3.fromRGB(255, 255, 255) 
					plg.Brightness = 2
				end
			end
		else
			if not lplr.Character.Head:FindFirstChild("PLADD") then
				local plg      = Instance.new("PointLight",lplr.Character.Head)
				plg.Name       = ("PLADD")
				plg.Range      = 200
				plg.Shadows    = false
				plg.Enabled    = true
				plg.Color      = Color3.fromRGB(255, 255, 255) 
				plg.Brightness = 1
			end
		end 
	end
end

function takeClue()
	if wp.MapStorage:FindFirstChild("CurrentMap") then
		for _, v in pairs(wp.MapStorage.CurrentMap.Props:GetChildren()) do
			if v.Name == "Clue" then
				v.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
			end
		end
	end
end

function bringGun()
	if wp.MapStorage:FindFirstChild("CurrentMap") then
		if wp.MapStorage.CurrentMap:FindFirstChild("GunGiver") then
			wp.MapStorage.CurrentMap.GunGiver.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
		else
			esp()
		end
	end
end

function changeWS(typeWS)
	if typeWS == 0 then
		lplr.Character.Humanoid.WalkSpeed = lplr.Character.Humanoid.WalkSpeed + 10
	elseif typeWS == 1 then
		lplr.Character.Humanoid.WalkSpeed = lplr.Character.Humanoid.WalkSpeed - 10
	end
end

function infJump()
	if lplr.Character.Humanoid ~= nil then
		lplr.Character.Humanoid.JumpPower = 50
		lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end

mouse.KeyDown:connect(function(keyDown)
	if keyDown == "p" then
		esp()
	end
	
	if keyDown == " " then
		infJump()
	end
	
	if keyDown == "k" then
		bringGun()
	end
	
	if keyDown == "l" then
		takeClue()
	end
	
	if keyDown == "c" then
		changeWS(0)
	end
	
	if keyDown == "v" then
		changeWS(1)
	end
end)