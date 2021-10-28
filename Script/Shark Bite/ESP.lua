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
VirtualUser = game:GetService("VirtualUser")


_G = {
	faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"},
	speed = 20,
}

function SendChat(String) -- Send a chat to the game chat
	game.StarterGui:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function checkESP(parent)
    local numEGUI = 0
    for _, v in pairs(parent.Character.Head:GetChildren()) do
        if v.Name == "EGUI" then
            numEGUI = numEGUI + 1
        end
    end

    if numEGUI ~= 7 then
        for _, v in pairs(parent.Character.Head:GetChildren()) do
            if v.Name == "EGUI" then
                v:Destroy()
            end
        end
        createESP(parent, 75, 151, 75)
    end
end

function createESP(parent, r, g, b)
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
    nam.TextColor3 = Color3.fromRGB(r, g, b)
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
                mf.BackgroundColor3 = Color3.fromRGB(r, g, b)
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(0.5)
                    createESP(o, 75, 151, 75)
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            if newPlayer.Name ~= lplr.Name then
                newPlayer.CharacterAdded:Connect(
                    function(characterModel)
                        wait(0.5)
                        createESP(newPlayer, 75, 151, 75)
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
            if o.Character ~= nil then
                createESP(o, 75, 151, 75)
            end
        end
    end
end

function createESPItem(parent, r, g, b, fontSize)
	local bgui = Instance.new("BillboardGui", parent)
	bgui.Name = ("EGUI")
	bgui.AlwaysOnTop = true
	bgui.ExtentsOffset = Vector3.new(0, 0, 0)
	bgui.Size = UDim2.new(1, 0, 1, 0)
	local nam = Instance.new("TextLabel", bgui)
	nam.Text = tostring(parent.Parent.OwnerName.Value)
	nam.BackgroundTransparency = 1
	nam.TextSize = fontSize
	nam.Font = ("Arial")
	nam.TextColor3 = Color3.fromRGB(r, g, b)
	nam.Size = UDim2.new(1, 0, 1, 0)
end

function firstScript()
    wp.Sharks.ChildAdded:connect(
        function(m)
            wait(1)
            createESPItem(m.Body, 196, 40, 28, 14)
        end
    )

    for _, v in pairs(wp.Sharks:GetChildren()) do
        createESPItem(v.Body, 196, 40, 28, 14)
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
	if lplr.Character ~= nil then
		-- lplr.Character.Humanoid.JumpPower = jump
		lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end
end
infJump()

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "p" then
            for _, o in pairs(plrs:GetPlayers()) do
                if o.Name ~= lplr.Name then
                    if o.Character.Head ~= nil then
                        checkESP(o)
                    end
                end
            end
        end

        if keyDown == "c" then
			changeWS(0)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "v" then
			changeWS(1)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end
		
		if keyDown == " " then
			infJump()
		end
    end
)


lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
espFirst()
firstScript()