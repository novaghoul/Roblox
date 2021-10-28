uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.speedDash = 20

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore(
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
				mf.BackgroundTransparency = 1
				mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
				if tostring(parent.Team) == "Clown" then
					mf.BackgroundTransparency = 0.5
					mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
				elseif tostring(parent.Team) == "Victims" then
					mf.BackgroundTransparency = 0.5
					mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
				end
				parent:GetPropertyChangedSignal("Team"):connect(
					function()
						if tostring(parent.Team) == "Clown" then
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
						elseif tostring(parent.Team) == "Victims" then
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
						end
					end
				)
			end
		end
	end

	if tostring(parent.Team) == "Clown" then
		nam.TextColor3 = Color3.fromRGB(196, 40, 28)
	elseif tostring(parent.Team) == "Victims" then
		nam.TextColor3 = Color3.fromRGB(13, 105, 172)
	end

	parent:GetPropertyChangedSignal("Team"):connect(
		function()
			if tostring(parent.Team) == "Clown" then
				nam.TextColor3 = Color3.fromRGB(196, 40, 28)
			elseif tostring(parent.Team) == "Victims" then
				nam.TextColor3 = Color3.fromRGB(13, 105, 172)
			end
		end
	)
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if tostring(o.Name) ~= tostring(lplr.Name) then
			o.CharacterAdded:Connect(
				function(characterModel)
					wait(0.5)
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
					wait(0.5)
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
		if tostring(o.Name) ~= tostring(lplr.Name) then
			if o.Character:FindFirstChild("Head") then
				createESP(o)
			end
		end
	end
end
espFirst()

function lightChange()
	lgt:GetPropertyChangedSignal("Brightness"):connect(
		function()
			lgt.Brightness = 1
			lgt.GlobalShadows = true
			lgt.TimeOfDay = "12:00:00"
			lgt.FogEnd = 100000
		end
	)
	lgt.Brightness = 1
	lgt.GlobalShadows = true
	lgt.TimeOfDay = "12:00:00"
	lgt.FogEnd = 100000
end

function firstScript()
	wp.ChildAdded:connect(
		function(m)
			wait(5)
			if m:FindFirstChild("Radio") then
				local bgui = Instance.new("BillboardGui", m.Radio.Radio)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0, 0, 0)
				bgui.Size = UDim2.new(1, 0, 1, 0)
				local nam = Instance.new("TextLabel", bgui)
				nam.Text = tostring(m.Radio.Radio.Name)
				nam.BackgroundTransparency = 1
				nam.TextSize = 10
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(245, 205, 48)
				nam.Size = UDim2.new(1, 0, 1, 0)
			end
		end
	)

	for _, v in pairs(wp:GetChildren()) do
		if v:FindFirstChild("Radio") then
			local bgui = Instance.new("BillboardGui", v.Radio.Radio)
			bgui.Name = ("EGUI")
			bgui.AlwaysOnTop = true
			bgui.ExtentsOffset = Vector3.new(0, 0, 0)
			bgui.Size = UDim2.new(1, 0, 1, 0)
			local nam = Instance.new("TextLabel", bgui)
			nam.Text = tostring(v.Radio.Radio.Name)
			nam.BackgroundTransparency = 1
			nam.TextSize = 10
			nam.Font = ("Arial")
			nam.TextColor3 = Color3.fromRGB(245, 205, 48)
			nam.Size = UDim2.new(1, 0, 1, 0)
		end
	end
end
firstScript()

function infJump()
	--lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

down = false
velocity = Instance.new("BodyVelocity")
velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
gyro = Instance.new("BodyGyro")
gyro.maxTorque = Vector3.new(100000, 0, 100000)

hum = lplr.Character.Humanoid
function onKeyDown()
    down = true
    if lplr.Character:FindFirstChild("Torso") then
        velocity.Parent = lplr.Character.Torso
        gyro.Parent = lplr.Character.Torso
    else
        velocity.Parent = lplr.Character.UpperTorso
        gyro.Parent = lplr.Character.UpperTorso
    end
    velocity.velocity = (hum.MoveDirection) * _G.speedDash
    while down do
        if not down then
            break
        end
        velocity.velocity = (hum.MoveDirection) * _G.speedDash
        local refpos = gyro.Parent.Position + (gyro.Parent.Position - wp.CurrentCamera.CoordinateFrame.p).unit * 5
        gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
        wait(0.1)
    end
end

function onKeyUp()
    velocity.Parent = nil
    gyro.Parent = nil
    down = false
end

lplr.CharacterAdded:Connect(
    function(characterModel)
        wait(1)
        velocity = Instance.new("BodyVelocity")
        velocity.maxForce = Vector3.new(100000, 0, 100000)
        ---vv Use that to change the speed v
        gyro = Instance.new("BodyGyro")
        gyro.maxTorque = Vector3.new(100000, 0, 100000)

        hum = lplr.Character.Humanoid
        onKeyDown()
    end
)

function changeDA(typeDA)
    if typeDA == 0 then
        _G.speedDash = _G.speedDash + 2
    elseif typeDA == 1 then
        if _G.speedDash >= 0 then
            _G.speedDash = _G.speedDash - 2
        end
        if _G.speedDash < 0 then
            _G.speedDash = 0
        end
    end
end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == " " then
			infJump()
		end
		if keyDown == "[" then
            changeDA(0)
            SendChat("Dash :" .. _G.speedDash)
        end
        if keyDown == "]" then
            changeDA(1)
            SendChat("Dash :" .. _G.speedDash)
        end
	end
)

lplr.Idled:connect(
	function()
		virtualUser:CaptureController()
		virtualUser:ClickButton2(Vector2.new())
	end
)

lightChange()
onKeyDown()