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
_G.dis = 4
_G.hitBoxSize = {7, 7, 7}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

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
				parent.role:GetPropertyChangedSignal("Value"):connect(
					function()
						if tostring(parent.role.Value) == "assassin" then
							mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
						elseif tostring(parent.role.Value) == "target" then
							mf.BackgroundColor3 = Color3.fromRGB(249, 214, 46)
						elseif tostring(parent.role.Value) == "guard" then
							mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
						end
					end
				)
				if tostring(parent.role.Value) == "assassin" then
					mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
				elseif tostring(parent.role.Value) == "target" then
					mf.BackgroundColor3 = Color3.fromRGB(249, 214, 46)
				elseif tostring(parent.role.Value) == "guard" then
					mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
				end
			end
		end
	end

	parent.role:GetPropertyChangedSignal("Value"):connect(
		function()
			if tostring(parent.role.Value) == "assassin" then
				nam.TextColor3 = Color3.fromRGB(196, 40, 28)
			elseif tostring(parent.role.Value) == "target" then
				nam.TextColor3 = Color3.fromRGB(249, 214, 46)
			elseif tostring(parent.role.Value) == "guard" then
				nam.TextColor3 = Color3.fromRGB(13, 105, 172)
			end
		end
	)
	if tostring(parent.role.Value) == "assassin" then
		nam.TextColor3 = Color3.fromRGB(196, 40, 28)
	elseif tostring(parent.role.Value) == "target" then
		nam.TextColor3 = Color3.fromRGB(249, 214, 46)
	elseif tostring(parent.role.Value) == "guard" then
		nam.TextColor3 = Color3.fromRGB(13, 105, 172)
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if tostring(o.Name) ~= tostring(lplr.Name) then
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
		if tostring(o.Name) ~= tostring(lplr.Name) then
			if o.Character ~= nil then
				wait(0.1)
				createESP(o)
			end
		end
	end
end
espFirst()

function createHitBox(parent)
    local sizeBody = parent.Character[_G.hitBoxBody].Size.x
    parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    parent.Character[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    parent.Character[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    parent.Character[_G.hitBoxBody].Material = "Neon"
    parent.Character[_G.hitBoxBody].CanCollide = false

    parent.Character[_G.hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                parent.Character[_G.hitBoxBody].CanCollide = false
            end
        end
    )
end

function hitBox()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(newPlayer)
                    end
                end
            )
        end
    )

    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:WaitForChild(_G.hitBoxBody) then
                        wait(0.1)
                        createHitBox(o)
                    end
                end
            )
        end
    end
end
hitBox()

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "q" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -_G.dis)
		end
	end
)
