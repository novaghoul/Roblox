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
virtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {3, 3, 3}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.team = lplr.Team

function createESP(parent)
	if tostring(parent.Team) ~= tostring(lplr.Team) then
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
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		o.CharacterAdded:Connect(
			function(characterModel)
				if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
					if characterModel:WaitForChild("Head") then
						wait(0.5)
						createESP(o)
					end
				end
			end
		)
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					if newPlayer.Team ~= lplr.Team then
						if characterModel:WaitForChild("Head") then
							wait(0.5)
							createESP(newPlayer)
						end
					end
				end
			)
		end
	)
end
enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
			spawn(
				function()
					if o.Character:WaitForChild("Head") then
						wait(0.1)
						createESP(o)
					end
				end
			)
		end
	end
end
espFirst()

function createHitBox(parent)
	local sizeBody = parent[_G.hitBoxBody].Size.x
	parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
	parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
	parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
	parent[_G.hitBoxBody].Material = "Neon"
	parent[_G.hitBoxBody].CanCollide = false

	parent[_G.hitBoxBody].Changed:connect(
		function(property)
			wait(0.1)
			if property == "Size" or property == "CanCollide" then
				parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
				parent[_G.hitBoxBody].CanCollide = false
			end
		end
	)
end

function hitBox()
	for _, o in pairs(plrs:GetPlayers()) do
		o.CharacterAdded:Connect(
			function(characterModel)
				if o.Name ~= lplr.Name and o.Team ~= lplr.Team then
					if characterModel:WaitForChild(_G.hitBoxBody) then
						wait(0.5)
						createHitBox(characterModel)
					end
				end
			end
		)
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					if newPlayer.Team ~= lplr.Team then
						if characterModel:WaitForChild(_G.hitBoxBody) then
							wait(0.5)
							createHitBox(characterModel)
						end
					end
				end
			)
		end
	)

	for _, o in pairs(plrs:GetPlayers()) do
		if o.Name ~= lplr.Name then
			if o.Team ~= lplr.Team then
				spawn(
					function()
						if o.Character:WaitForChild(_G.hitBoxBody) then
							wait(0.1)
							createHitBox(o.Character)
						end
					end
				)
			end
		end
	end
end
hitBox()

lplr.Idled:connect(
	function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end
)
