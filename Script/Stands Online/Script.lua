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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.ws_g = 35
_G.jp_g = 50
_G.item = {}
_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function createESPItem(parent, r, g, b, fontSize)
	local bgui = Instance.new("BillboardGui", parent)
	bgui.Name = ("EGUI")
	bgui.AlwaysOnTop = true
	bgui.ExtentsOffset = Vector3.new(0, 0, 0)
	bgui.Size = UDim2.new(1, 0, 1, 0)
	local nam = Instance.new("TextLabel", bgui)
	nam.Text = parent.Name
	nam.BackgroundTransparency = 1
	nam.TextSize = fontSize
	nam.Font = ("Arial")
	nam.TextColor3 = Color3.fromRGB(r, g, b)
	nam.Size = UDim2.new(1, 0, 1, 0)
end

function createHitBox(parent)
	parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize, _G.hitBoxSize, _G.hitBoxSize)
	parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
	parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
	parent[_G.hitBoxBody].Material = "Neon"
	parent[_G.hitBoxBody].CanCollide = false

	parent[_G.hitBoxBody]:GetPropertyChangedSignal("Size"):connect(
		function()
			wait(.1)
			parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize, _G.hitBoxSize, _G.hitBoxSize)
		end
	)

	parent[_G.hitBoxBody]:GetPropertyChangedSignal("CanCollide"):connect(
		function()
			wait(.1)
			parent[_G.hitBoxBody].CanCollide = false
		end
	)
end

function hitBox()
	-- for _, o in pairs(plrs:GetPlayers()) do
	-- 	if tostring(o.Name) ~= tostring(lplr.Name) then
	-- 		o.CharacterAdded:Connect(
	-- 			function(characterModel)
	-- 				if characterModel:WaitForChild(_G.hitBoxBody) then
	-- 					wait(0.5)
	-- 					createHitBox(o.Character)
	-- 				end
	-- 			end
	-- 		)
	-- 	end
	-- end

	-- plrs.PlayerAdded:Connect(
	-- 	function(newPlayer)
	-- 		newPlayer.CharacterAdded:Connect(
	-- 			function(characterModel)
	-- 				if characterModel:WaitForChild(_G.hitBoxBody) then
	-- 					wait(0.5)
	-- 					createHitBox(newPlayer.Character)
	-- 				end
	-- 			end
	-- 		)
	-- 	end
	-- )

	-- spawn(
	-- 	function()
	-- 		for _, o in pairs(plrs:GetPlayers()) do
	-- 			if tostring(o.Name) ~= tostring(lplr.Name) then
	-- 				if o.Character:FindFirstChild(_G.hitBoxBody) then
	-- 					wait(0.1)
	-- 					createHitBox(o.Character)
	-- 				end
	-- 			end
	-- 		end
	-- 	end
	-- )

	-- spawn(
	-- 	function()
	-- 		for _, o in pairs(wp:GetChildren()) do
	-- 			if o:FindFirstChild("Target") then
	-- 				wait(0.1)
	-- 				createHitBox(o)
	-- 			end
	-- 		end
	-- 	end
	-- )
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
	nam.TextColor3 = Color3.fromRGB(196, 40, 28)
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
				mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
			end
		end
	end

	parent.Character.ChildAdded:connect(
		function(m)
			if m.Name == "Stand" then
				nam.Text = parent.Name .. "[Stand]"
			end
		end
	)

	if parent.Character:FindFirstChild("Stand") then
		nam.Text = parent.Name .. "[Stand]"
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			o.CharacterAdded:Connect(
				function(characterModel)
					if characterModel:WaitForChild("Head") then
						wait(0.5)
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
					if characterModel:WaitForChild("Head") then
						wait(0.5)
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
			if o.Character:FindFirstChild("Head") then
				wait(0.1)
				createESP(o)
			end
		end
	end
end

lplr.Idled:connect(
	function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end
)

function bring(part)
	part.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

function firstScript()
	for _, v in pairs(wp:GetChildren()) do
		if v:IsA("Tool") then
			if v:FindFirstChild("Handle") then
				bring(item.Handle)
			end
		end

		if tonumber(v.Name) ~= nil then
			if v:FindFirstChildOfClass("Tool") then
				local item = v:FindFirstChildOfClass("Tool")
				bring(item.Handle)
			end

			if v:FindFirstChild("Ceasers") then
				local item = v:FindFirstChild("Ceasers")
				bring(item.Part)
			end

			if v:FindFirstChild("Mask") then
				local item = v:FindFirstChild("Mask")
				SendChat(item.Name)
				createESPItem(item.Mask, 218, 133, 65, 14)
			end

			if v:GetChildren()[1] == nil then
				v:Destroy()
			end
		end
	end

	for _, v in pairs(wp:GetChildren()) do
		if v.Name == "Fist" or v.Name == "FistBarrage" or v.Name == "Projectile" then
			v:Destroy()
		end
	end
end
firstScript()

function checkItem()
	for i = 1, #_G.item do
		if _G.item[i] == nil then
			table.remove(_G.item, i)
		else
			-- if _G.item[i]:FindFirstChild("Mask") then
			-- 	bring(_G.item[i].Mask)
			-- end
			if _G.item[i]:FindFirstChild("Handle") then
				bring(_G.item[i].Handle)
			end

			if _G.item[i]:FindFirstChild("Part") then
				bring(_G.item[i].Part)
			end
		end
	end
end

wp.ChildAdded:connect(
	function(m)
		wait(0.1)
		if m:IsA("Tool") then
			if m:FindFirstChild("Handle") then
				SendChat(m.Name)
				table.insert(_G.item, m)
			end
		end

		if tonumber(m.Name) ~= nil then
			if m:FindFirstChildOfClass("Tool") then
				local item = m:FindFirstChildOfClass("Tool")
				SendChat(item.Name)
				table.insert(_G.item, item)
			end

			if m:FindFirstChild("Ceasers") then
				local item = m:FindFirstChild("Ceasers")
				SendChat(item.Name)
				table.insert(_G.item, item)
			end

			if m:FindFirstChild("Mask") then
				local item = m:FindFirstChild("Mask")
				SendChat(item.Name)
				wait(0.1)
				createESPItem(item.Mask, 218, 133, 65, 14)
			end
		end

		-- spawn(
		-- 	function()
		-- 		if m:WaitForChild("Target") then
		-- 			wait(0.1)
		-- 			createHitBox(m)
		-- 		end
		-- 	end
		-- )

		if m.Name == "Fist" or m.Name == "FistBarrage" or v.Name == "Projectile" then
			wait(0.1)
			m:Destroy()
		end
	end
)

function infJump()
	lplr.Character.Humanoid.JumpPower = _G.jp_g
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
	lplr.Character.Humanoid.WalkSpeed = _G.ws_g

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
				lplr.Character.Humanoid.WalkSpeed = _G.ws_g
			end
		end
	)
	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character.Humanoid.WalkSpeed = _G.ws_g
			lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
						lplr.Character.Humanoid.WalkSpeed = _G.ws_g
					end
				end
			)
			if sg:GetCoreGuiEnabled(2) == false then
				sg:SetCoreGuiEnabled(2, true)
			end
		end
	)
end
statsPlayerWs()

function changeWS(typeWS)
	if typeWS == 0 then
		_G.ws_g = _G.ws_g + 5
		lplr.Character.Humanoid.WalkSpeed = _G.ws_g
	elseif typeWS == 1 then
		if _G.ws_g >= 0 then
			_G.ws_g = _G.ws_g - 5
			lplr.Character.Humanoid.WalkSpeed = _G.ws_g
		end
		if _G.ws_g < 16 then
			_G.ws_g = 16
			lplr.Character.Humanoid.WalkSpeed = _G.ws_g
		end
	end
end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "v" then
			checkItem()
		end

		if keyDown == " " then
			infJump()
		end

		if keyDown == "k" then
			changeWS(0)
			SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "l" then
			changeWS(1)
			SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
		end
	end
)

espFirst()
hitBox()
