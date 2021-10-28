uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.speed = 20
_G.nameMap = nil
_G.shef = {"Gun", "Revolver"}
_G.ass = {"Knife", "Blade", "Battleaxe"}

function SendChat(String) -- Send a chat to the game chat
	game.StarterGui:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

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
			for _, f in pairs(_G.faces) do
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
						for i = 1, #_G.shef do
							if b.Name == _G.shef[i] then
								mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
							end
						end

						for i = 1, #_G.ass do
							if b.Name == _G.ass[i] then
								mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
							end
						end
					end
				)

				parent.Character.ChildAdded:connect(
					function(c)
						for i = 1, #_G.shef do
							if c.Name == _G.shef[i] then
								mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
							end
						end

						for i = 1, #_G.ass do
							if c.Name == _G.ass[i] then
								mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
							end
						end
					end
				)

				for i = 1, #_G.shef do
					if parent.Backpack:FindFirstChild(_G.shef[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
					end
				end

				for i = 1, #_G.ass do
					if parent.Backpack:FindFirstChild(_G.ass[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
					end
				end

				for i = 1, #_G.shef do
					if parent.Character:FindFirstChild(_G.shef[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
					end
				end

				for i = 1, #_G.ass do
					if parent.Character:FindFirstChild(_G.ass[i]) then
						mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
					end
				end
			end
		end
	end

	parent.Backpack.ChildAdded:connect(
		function(b)
			for i = 1, #_G.shef do
				if b.Name == _G.shef[i] then
					nam.TextColor3 = Color3.fromRGB(13, 105, 172)
				end
			end

			for i = 1, #_G.ass do
				if b.Name == _G.ass[i] then
					nam.TextColor3 = Color3.fromRGB(196, 40, 28)
				end
			end
		end
	)

	parent.Character.ChildAdded:connect(
		function(c)
			for i = 1, #_G.shef do
				if c.Name == _G.shef[i] then
					nam.TextColor3 = Color3.fromRGB(13, 105, 172)
				end
			end

			for i = 1, #_G.ass do
				if c.Name == _G.ass[i] then
					nam.TextColor3 = Color3.fromRGB(196, 40, 28)
				end
			end
		end
	)

	for i = 1, #_G.shef do
		if parent.Backpack:FindFirstChild(_G.shef[i]) then
			nam.TextColor3 = Color3.fromRGB(13, 105, 172)
		end
	end

	for i = 1, #_G.ass do
		if parent.Backpack:FindFirstChild(_G.ass[i]) then
			nam.TextColor3 = Color3.fromRGB(196, 40, 28)
		end
	end

	for i = 1, #_G.shef do
		if parent.Character:FindFirstChild(_G.shef[i]) then
			nam.TextColor3 = Color3.fromRGB(13, 105, 172)
		end
	end

	for i = 1, #_G.ass do
		if parent.Character:FindFirstChild(_G.ass[i]) then
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
					if characterModel:WaitForChild("Head") then
						createESP(o)
					end
				end
			)
		end
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					wait(2)
					if characterModel:WaitForChild("Head") then
						createESP(newPlayer)
					end
				end
			)
		end
	)
end
enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			if wp:FindFirstChild(o.Name) then
				wait(0.1)
				createESP(o)
			end
		end
	end
end
espFirst()

function createESPMap(parent)
	parent.ChildAdded:connect(
		function(l)
			if l.Name == "CoinContainer" then
				_G.nameMap = parent
			end
		end
	)

	if parent:FindFirstChild("CoinContainer") then
		_G.nameMap = parent
	end

	if tostring(parent.Name) == "GunDrop" then
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

function bringGun()
	if wp:FindFirstChild("GunDrop") then
		wp.GunDrop.CFrame = lplr.Character.HumanoidRootPart.CFrame
	end
end

function bringCoin()
	if _G.nameMap:FindFirstChild("GunDrop") and not _G.nameMap == nil then
		for _, v in pairs(_G.nameMap.CoinContainer:GetChildren()) do
			if tostring(v.Name) == "Coin_Server" then
				v.CFrame = lplr.Character.HumanoidRootPart.CFrame
			end
		end
	end
end

function Wspeed()
	lplr.Character.Humanoid.WalkSpeed = _G.speed

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character.Humanoid.WalkSpeed ~= _G.speed then
				lplr.Character.Humanoid.WalkSpeed = _G.speed
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(0.5)
			characterModel.Humanoid.WalkSpeed = _G.speed
			characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if characterModel.Humanoid.WalkSpeed ~= _G.speed then
						characterModel.Humanoid.WalkSpeed = _G.speed
					end
				end
			)
			while not characterModel.Humanoid.WalkSpeed == _G.speed do
				wait()
				characterModel.Humanoid.WalkSpeed = _G.speed
			end
		end
	)
end
Wspeed()

function changeWS(typeWS)
	if typeWS == 0 then
		_G.speed = _G.speed + 5
		lplr.Character.Humanoid.WalkSpeed = _G.speed
	elseif typeWS == 1 then
		if _G.speed >= 0 then
			_G.speed = _G.speed - 5
			lplr.Character.Humanoid.WalkSpeed = _G.speed
		end
		if _G.speed < 16 then
			_G.speed = 16
			lplr.Character.Humanoid.WalkSpeed = _G.speed
		end
	end
end

function infJump()
	--lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
	function(keyDown)
		-- if keyDown == "k" then
		-- 	bringGun()
		-- end

		-- if keyDown == "l" then
		-- 	bringCoin()
		-- end

		if keyDown == " " then
			infJump()
		end

		if keyDown == "c" then
			changeWS(0)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "v" then
			changeWS(1)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end
	end
)
