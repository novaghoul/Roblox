loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.ws_g = 25

function itemlist(thing)
    if string.find(string.lower(thing), string.lower("CrateDrop")) then
        return true
    end
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
    nam.TextColor3 = BrickColor.new(tostring(parent.TeamColor)).Color
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
                mf.BackgroundColor3 = BrickColor.new(tostring(parent.TeamColor)).Color
                parent:GetPropertyChangedSignal("Team"):connect(
                    function()
                        mf.BackgroundColor3 = BrickColor.new(tostring(parent.TeamColor)).Color
                    end
                )
            end
        end
    end
    parent:GetPropertyChangedSignal("Team"):connect(
        function()
            nam.TextColor3 = BrickColor.new(tostring(parent.TeamColor)).Color
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

function main(v, nClone, lScript)
    if nClone < 2 then
        for i=1, 2 do
            lScript:Clone().Parent = v
        end
    end
    wait(1)
    for _, l in pairs(v:GetChildren()) do
        if l:IsA("LocalScript") then
            if l.Name == "RifleScript" or l.Name == "ShotgunScript" or l.Name == "PistolScript" or l.Name == "TazerScript" or l.Name == "PowerScript" then
                local a = getsenv(l)
                if debug.getupvalues(a.Reload) then
                    debug.setupvalue(a.Reload, 2, math.huge)
                end
            end
        end
    end
end

function firstScript()
    function dropBox(parent, name)
        local bgui = Instance.new("BillboardGui", parent)
        bgui.Name = ("EGUI")
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 0, 0)
        bgui.Size = UDim2.new(1, 0, 1, 0)
        local nam = Instance.new("TextLabel", bgui)
        nam.Text = name.Name
        nam.BackgroundTransparency = 1
        nam.TextSize = 10
        nam.Font = ("Arial")
        nam.TextColor3 = Color3.fromRGB(255, 255, 0)
        nam.Size = UDim2.new(1, 0, 1, 0)
    end

    for _, v in pairs(wp.ObjectSelection:GetChildren()) do
        if itemlist(tostring(v.Name)) then
            dropBox(v, v)
        elseif tostring(v.Name) == "Mech Suit" then
            dropBox(v, v)
        end
    end

    wp.ObjectSelection.ChildAdded:connect(
        function(m)
            if itemlist(tostring(m.Name)) then
                dropBox(m, m)
            elseif tostring(m.Name) == "Mech Suit" then
                dropBox(m, m)
            end
        end
    )

    for _, v in pairs(lplr.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            local numberClone = 0
            local localScript = v:FindFirstChildOfClass("LocalScript")
            for _, l in pairs(v:GetChildren()) do
                if l:IsA("LocalScript") then
                    numberClone = numberClone + 1
                end
            end
            main(v, numberClone, localScript)
        end
    end

    for _, v in pairs(lplr.Character:GetChildren()) do
        if v:IsA("Tool") then
            local numberClone = 0
            local localScript = v:FindFirstChildOfClass("LocalScript")
            for _, l in pairs(v:GetChildren()) do
                if l:IsA("LocalScript") then
                    numberClone = numberClone + 1
                end
            end
            main(v, numberClone, localScript)
        end
    end

    lplr.CharacterAdded:Connect(
        function(characterModel)
            characterModel.ChildAdded:connect(
                function(m)
                    wait(2)
                    local numberClone = 0
                    local localScript = m:FindFirstChildOfClass("LocalScript")
                    for _, l in pairs(m:GetChildren()) do
                        if l:IsA("LocalScript") then
                            numberClone = numberClone + 1
                        end
                    end
                    main(m, numberClone, localScript)
                end
            )
        end
    )

    lplr.Backpack.ChildAdded:connect(
        function(m)
            wait(2)
            local numberClone = 0
            local localScript = m:FindFirstChildOfClass("LocalScript")
            for _, l in pairs(m:GetChildren()) do
                if l:IsA("LocalScript") then
                    numberClone = numberClone + 1
                end
            end
            main(m, numberClone, localScript)
        end
    )

    wp.ObjectSelection.ChildAdded:connect(
        function(m)
            if tostring(m.Name) == tostring(lplr.Name .. "'s Vehicle") then
                wait(1)
                m.CarChassis.Boost.Value = 20
                m.CarChassis.HoverMode.Value = true
                m.CarChassis.Boost:GetPropertyChangedSignal("Value"):connect(
                    function()
                        m.CarChassis.Boost.Value = 20
                    end
                )
                local n = require(m.Settings)
                m.TurnSpeed = 0.01
                m.MaxSpeed = 200
                m.SpeedDecay = 0.01
                m.HideCharacter = true
                m.Height = 5
            end
        end
    )

-- return {
-- 	Price = 100000, 
-- 	Bounce = 120, 
-- 	Height = 3.5, 
-- 	Sway = 18, 
-- 	Suspension = 20, 
-- 	TurnSpeed = 0.5, 
-- 	Torque = 0.4, 
-- 	MaxSpeed = 160, 
-- 	BrakeForce = 1, 
-- 	SpeedDecay = 0.1, 
-- 	Boost = true, 
-- 	BoostParticles = "Middle", 
-- 	Drift = true, 
-- 	VelLerp = 0.1, 
-- 	RotLerp = 0.075, 
-- 	DriftVelLerp = 0.075, 
-- 	DriftRotLerp = 0.2, 
-- 	HideCharacter = true, 
-- 	CameraOffset = 26
-- }
end
firstScript()

function statsPlayerWs()
	lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g

	lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
				lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
						lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
					end
				end
			)
		end
	)
end
statsPlayerWs()

function changeWS(typeWS)
	if typeWS == 0 then
		_G.ws_g = _G.ws_g + 5
		lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
	elseif typeWS == 1 then
		if _G.ws_g >= 0 then
			_G.ws_g = _G.ws_g - 5
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
		end
		if _G.ws_g < 16 then
			_G.ws_g = 16
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
		end
	end
end

function statsPlayerJp()
    lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
    lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("JumpPower"):connect(
        function()
            if lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower ~= _G.jp_g then
                lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
            lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("JumpPower"):connect(
                function()
                    if lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower ~= _G.jp_g then
                        lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
                    end
                end
            )
        end
    )
end
statsPlayerJp()

function changeJP(typeJP)
	if typeJP == 0 then
		_G.jp_g = _G.jp_g + 5
		lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
	elseif typeJP == 1 then
		if _G.jp_g >= 50 then
			_G.jp_g = _G.jp_g - 5
			lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
		end
		if _G.jp_g < 50 then
			_G.jp_g = 50
			lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
		end
	end
end

function infJump()
    lplr.Character:FindFirstChildOfClass("Humanoid").JumpPower = _G.jp_g
    lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end
        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
            notify("Nolip : " .. tostring(_G.noclipAll))
        end
        if keyDown == "[" then
            changeWS(0)
            notify("Walk Speed : " .. _G.ws_g)
        end
        if keyDown == "]" then
            changeWS(1)
            notify("Walk Speed : " .. _G.ws_g)
        end
        if keyDown == "x" then
            if _G.ws_g == 150 then
                _G.ws_g = 25
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
                notify("Walk Speed : " .. _G.ws_g)
            else
                _G.ws_g = 150
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
                notify("Walk Speed : " .. _G.ws_g)
            end
        end
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)
hitBox()

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
