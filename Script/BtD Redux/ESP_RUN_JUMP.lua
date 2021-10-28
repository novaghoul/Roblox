uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
local speedvalue = {16, 17, 18, 25}
local speed = 16
local page = {"Page1", "Page2", "Page3", "Page4", "Page5", "Page6", "Page7", "Page8"}
local truck = {"Wheels", "Engines", "Keys", "Chests", "GasCans", "SteeringWheels", "RocketFuel"}
local chest = {"PinkChests", "GreenChests", "PurpleChests", "OrangeChests", "CyanChests", "RedChests"}

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

				if parent.Character:FindFirstChild("Hero") then
					mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
				elseif parent.Character:FindFirstChild("Slasher") then
					mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
				end
			end
		end
	end
	if parent.Character:FindFirstChild("Hero") then
		nam.TextColor3 = Color3.fromRGB(13, 105, 172)
	elseif parent.Character:FindFirstChild("Slasher") then
		nam.TextColor3 = Color3.fromRGB(196, 40, 28)
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			o.CharacterAdded:Connect(
				function(characterModel)
					wait(3)
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
						wait(3)
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
			createESP(o)
		end
	end
end

function changeLight()
	lgt.Brightness = 1
	lgt.GlobalShadows = false
	lgt.TimeOfDay = "12:00:00"
	lgt.ClockTime = 12
	lgt.FogStart = 0
	lgt.FogEnd = 100000
	lgt.Ambient = Color3.new(0, 0, 0)
	lgt.OutdoorAmbient = Color3.new(0, 0, 0)
	lgt.GeographicLatitude = 41
	lgt.ColorShift_Top = Color3.new(0, 0, 0)
	lgt.ColorShift_Bottom = Color3.new(0, 0, 0)
	lgt.Outlines = false
end

function lightCode()
	changeLight()
	lgt.Changed:connect(
		function(property)
			if lplr.Character.Name ~= "Ghost" and lplr.Character:FindFirstChild("Survivor") then
				if property == "OutdoorAmbient" or property == "FogEnd" or property == "Ambient" then
					wait(5)
					changeLight()
					wait(5)
					changeLight()
				end
			end
		end
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

function eventESPItem(parent)
	if parent.Name == "Generators" or parent.Name == "PowerRelays" then
		for _, l in pairs(parent:GetChildren()) do
			if l.Activated.Value == false then
				createESPItem(l, 75, 151, 75, 10)
			end
			l.Activated:GetPropertyChangedSignal("Value"):connect(
				function()
					if l:FindFirstChild("EGUI") then
						l.EGUI:Destroy()
					end
				end
			)
		end
	end

	if parent.Name == "CurseHealing" then
		for _, l in pairs(parent:GetChildren()) do
			if l.Immune.glow.Enabled == true then
				createESPItem(l, 242, 243, 243, 10)
			end
			l.Immune.glow:GetPropertyChangedSignal("Enabled"):connect(
				function()
					if l:FindFirstChild("EGUI") then
						l.EGUI:Destroy()
					end
					if l.Immune.glow.Enabled == true then
						createESPItem(l, 242, 243, 243, 10)
					end
				end
			)
		end
	end

	for i = 1, #truck do
		if parent.Name == truck[i] then
			for _, l in pairs(parent:GetChildren()) do
				createESPItem(l, 245, 205, 48, 10)
			end
		end
	end

	for i = 1, #chest do
		if parent.Name == chest[i] then
			for _, l in pairs(parent:GetChildren()) do
				createESPItem(l, 203, 132, 66, 10)
			end
		end
	end

	for i = 1, #page do
		if parent.Name == page[i] then
			createESPItem(parent, 242, 243, 243, 10)
		end
	end
end

function enableESPItemsCode()
	if wp:FindFirstChild("TempMap") then
		for _, v in pairs(wp.TempMap.Main:GetChildren()) do
			eventESPItem(v)
		end
	end

	wp.ChildAdded:connect(
		function(p)
			if p.Name == "TempMap" then
				wait(5)
				for _, v in pairs(p.Main:GetChildren()) do
					eventESPItem(v)
				end
			end
		end
	)
end
enableESPItemsCode()

function eventChangeWS()
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
			speed = speedvalue[1]
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
eventChangeWS()

function changeWS(typeWS)
	if typeWS == 0 then
		if lplr.Character:FindFirstChild("Ghost") then
			speed = speed + 5
			lplr.Character.Humanoid.WalkSpeed = speed
		else
			speed = speedvalue[4]
			lplr.Character.Humanoid.WalkSpeed = speed
		end
	elseif typeWS == 1 then
		if lplr.Character:FindFirstChild("Slasher") then
			speed = speedvalue[3]
			lplr.Character.Humanoid.WalkSpeed = speed
		elseif lplr.Character:FindFirstChild("Hero") then
			speed = speedvalue[2]
			lplr.Character.Humanoid.WalkSpeed = speed
		else
			speed = speedvalue[1]
			lplr.Character.Humanoid.WalkSpeed = speed
		end
	end
end

function infJump()
	--lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == " " then
			infJump()
		end

		if keyDown == "c" then
			changeWS(0)
		end

		if keyDown == "v" then
			changeWS(1)
		end
	end
)
espFirst()
lightCode()
