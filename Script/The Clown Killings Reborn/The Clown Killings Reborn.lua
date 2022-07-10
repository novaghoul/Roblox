loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.dis = 4

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

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == " " then
			infJump()
		end
        if keyDown == "f" then
            noclipAll = not noclipAll
            NotifyG("Noclip", noclipAll)
        end
		if keyDown == "q" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -_G.dis)
		end
	end
)

mouse.Button1Down:connect(
	function()
		if not mouse.Target then
			return
		end
		if lplr.Backpack:FindFirstChild("Rifle") then
			local l__RemoteEvent__6 = lplr.Backpack.Rifle:WaitForChild("RemoteEvent")
			l__RemoteEvent__6:FireServer(mouse.Hit.p)
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

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        else
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = true
            end
            lplr.Character.HumanoidRootPart.CanCollide = true
        end
    end
)