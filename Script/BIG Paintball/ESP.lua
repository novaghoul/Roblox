loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

hitBoxSize = {5, 5, 5}

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
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(o.Team) ~= tostring(lplr.Team) then
                                createESP(o)
                            end
                        else
                            createESP(o)
                        end
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
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(newPlayer.Team) ~= tostring(lplr.Team) then
                                createESP(newPlayer)
                            end
                        else
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
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:FindFirstChild("Head") then
                        wait(0.1)
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(o.Team) ~= tostring(lplr.Team) then
                                createESP(o)
                            end
                        else
                            createESP(o)
                        end
                    end
                end
            )
        end
    end
end
espFirst()


function hitBox()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(characterModel)
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
                        createHitBox(characterModel)
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
                        createHitBox(characterModel)
                    end
                end
            )
        end
    end
end
hitBox()

function statsPlayerWs()
	humanoidP.WalkSpeed = ws_g

	humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if humanoidP.WalkSpeed ~= ws_g then
				humanoidP.WalkSpeed = ws_g
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
			humanoidP.WalkSpeed = ws_g
			humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if humanoidP.WalkSpeed ~= ws_g then
						humanoidP.WalkSpeed = ws_g
					end
				end
			)
		end
	)
end
statsPlayerWs()

function changeWS(typeWS)
	if typeWS == 0 then
		ws_g = ws_g + 5
		humanoidP.WalkSpeed = ws_g
	elseif typeWS == 1 then
		if ws_g >= 0 then
			ws_g = ws_g - 5
			humanoidP.WalkSpeed = ws_g
		end
		if ws_g < 16 then
			ws_g = 16
			humanoidP.WalkSpeed = ws_g
		end
	end
end

uis.InputBegan:Connect(
	function(input, gameProcessed)
		if input.UserInputType.Value == 8 then
			if input.KeyCode.Value == 107 then
				changeWS(0)
				checkReturn("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
			end

			if input.KeyCode.Value == 108 then
				changeWS(1)
				checkReturn("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
			end
		end
	end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
