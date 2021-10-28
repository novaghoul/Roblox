uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
speed = 20
nameMap = nil
shef = {"Gun", "Revolver"}
ass = {"Knife", "Blade"}

function createESP(parent)
	local bgui = Instance.new("BillboardGui", parent.Character.Head)
	bgui.Name = ("EGUI")
	bgui.AlwaysOnTop = true
	bgui.ExtentsOffset = Vector3.new(0, 3, 0)
	bgui.Size = UDim2.new(0, 200, 0, 50)
	local nam = Instance.new("TextLabel", bgui)
	nam.Text = parent.Name
	nam.BackgroundTransparency = 1
	nam.TextSize = 14
	nam.Font = ("Arial")
	nam.TextColor3 = Color3.fromRGB(75, 151, 75)
	nam.Size = UDim2.new(0, 200, 0, 50)
	for _, p in pairs(parent.Character:GetChildren()) do
		if p.Name == ("Head") then
			for _, f in pairs(faces) do
				local m = Instance.new("SurfaceGui", p)
				m.Name = ("EGUI")
				m.Face = f
				m.Active = true
				m.AlwaysOnTop = true
				local mf = Instance.new("Frame", m)
				mf.Size = UDim2.new(1, 0, 1, 0)
				mf.BorderSizePixel = 0
				mf.BackgroundTransparency = 0.5
				mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)

				parent.Backpack.ChildAdded:connect(
					function(b)
						for i = 1, #shef do
							if b.Name == shef[i] then
								mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
							end
						end

						for i = 1, #ass do
							if b.Name == ass[i] then
								mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
							end
						end
					end
				)

				parent.Character.ChildAdded:connect(
					function(c)
						for i = 1, #shef do
							if c.Name == shef[i] then
								mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
							end
						end

						for i = 1, #ass do
							if c.Name == ass[i] then
								mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
							end
						end
					end
				)

				for i = 1, #shef do
					if parent.Backpack:FindFirstChild(shef[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
					end
				end

				for i = 1, #ass do
					if parent.Backpack:FindFirstChild(ass[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
					end
				end

				for i = 1, #shef do
					if parent.Character:FindFirstChild(shef[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
					end
				end

				for i = 1, #ass do
					if parent.Character:FindFirstChild(ass[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
					end
				end
			end
		end
	end

	parent.Backpack.ChildAdded:connect(
		function(b)
			for i = 1, #shef do
				if b.Name == shef[i] then
					nam.TextColor3 = Color3.fromRGB(13, 105, 172)
				end
			end

			for i = 1, #ass do
				if b.Name == ass[i] then
					nam.TextColor3 = Color3.fromRGB(196, 40, 28)
				end
			end
		end
	)

	parent.Character.ChildAdded:connect(
		function(c)
			for i = 1, #shef do
				if c.Name == shef[i] then
					nam.TextColor3 = Color3.fromRGB(13, 105, 172)
				end
			end

			for i = 1, #ass do
				if c.Name == ass[i] then
					nam.TextColor3 = Color3.fromRGB(196, 40, 28)
				end
			end
		end
	)

	for i = 1, #shef do
		if parent.Backpack:FindFirstChild(shef[i]) then
			nam.TextColor3 = Color3.fromRGB(13, 105, 172)
		end
	end

	for i = 1, #ass do
		if parent.Backpack:FindFirstChild(ass[i]) then
			nam.TextColor3 = Color3.fromRGB(196, 40, 28)
		end
	end

	for i = 1, #shef do
		if parent.Character:FindFirstChild(shef[i]) then
			nam.TextColor3 = Color3.fromRGB(13, 105, 172)
		end
	end

	for i = 1, #ass do
		if parent.Character:FindFirstChild(ass[i]) then
			nam.TextColor3 = Color3.fromRGB(196, 40, 28)
		end
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			o.CharacterAdded:Connect(
				function(characterModel)
					wait(2)
					createESP(o)
				end
			)
		end
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			if newPlayer.Name ~= lplr.Name then
				newPlayer.CharacterAdded:Connect(
					function(characterModel)
						wait(2)
						createESP(newPlayer)
					end
				)
			end
		end
	)
end
enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			if o.Character.Head ~= nil then
				createESP(o)
			end
		end
	end
end
espFirst()

function createESPMap(parent)

	if tostring(parent.Name) == "RevolverPickUp" then
		local bgui = Instance.new("BillboardGui", parent)
		bgui.Name = ("EGUI")
		bgui.AlwaysOnTop = true
		bgui.ExtentsOffset = Vector3.new(0, 0, 0)
		bgui.Size = UDim2.new(1, 0, 1, 0)
		local nam = Instance.new("TextLabel", bgui)
		nam.Text = "Gun Drop"
		nam.BackgroundTransparency = 1
		nam.TextSize = 10
		nam.Font = ("Arial")
		nam.TextColor3 = Color3.fromRGB(245, 205, 48)
		nam.Size = UDim2.new(1, 0, 1, 0)
	end
end

function espMAP()
	wp.ChildAdded:connect(
		function(m)
			createESPMap(m)
		end
	)

	for _, v in pairs(wp:GetChildren()) do
		createESPMap(v)
	end
end
espMAP()

function tpCoin()
	for i = 10, 1, -1 do
		for i,v in pairs(wp:GetChildren()) do
			local e = lplr.Character:FindFirstChild("Torso")
			if e and v.Name == "Coin" then
				v.CFrame = lplr.Character.Torso.CFrame
			end
		end
		wait(0.7)
	end
end

function bringGun()
	if wp:FindFirstChild("RevolverPickUp") then
		for i, v in pairs(wp.RevolverPickUp:GetChildren()) do
			v.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
		end
	end
end

function Wspeed()
	lplr.Character.Humanoid.WalkSpeed = speed

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character.Humanoid.WalkSpeed ~= speed then
				lplr.Character.Humanoid.WalkSpeed = speed
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(0.5)
			characterModel.Humanoid.WalkSpeed = speed
			characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if characterModel.Humanoid.WalkSpeed ~= speed then
						characterModel.Humanoid.WalkSpeed = speed
					end
				end
			)
		end
	)
end
Wspeed()

function changeWS(typeWS)
	if typeWS == 0 then
		speed = speed + 5
		lplr.Character.Humanoid.WalkSpeed = speed
	elseif typeWS == 1 then
		if speed >= 0 then
			speed = speed - 5
			lplr.Character.Humanoid.WalkSpeed = speed
		end
		if speed < 16 then
			speed = 16
			lplr.Character.Humanoid.WalkSpeed = speed
		end
	end
end

function infJump()
	--lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(function(keyDown)
	
	if keyDown == "l" then
		tpCoin()
	end
	
	if keyDown == "k" then
		bringGun()
	end
	
	if keyDown == " " then
		infJump()
	end
	
	if keyDown == "c" then
		changeWS(0)
	end
	
	if keyDown == "v" then
		changeWS(1)
	end
end)