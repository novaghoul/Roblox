loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.hitBoxBody = "HumanoidRootPart"

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
                if parent.Backpack:FindFirstChild("0") then
                    if parent.Backpack["0"]:FindFirstChild("ClientGun") then
                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                    elseif parent.Backpack["0"]:FindFirstChild("ClientKnife") then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end

                if parent.Character:FindFirstChild("0") then
                    if parent.Character["0"]:FindFirstChild("ClientGun") then
                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                    elseif parent.Character["0"]:FindFirstChild("ClientKnife") then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end

                parent.Backpack.ChildAdded:connect(
                    function(m)
                        if m:IsA("Tool") then
                            wait(0.1)
                            if m:FindFirstChild("ClientGun") then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            elseif m:FindFirstChild("ClientKnife") then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end
                    end
                )

                parent.Character.ChildAdded:connect(
                    function(m)
                        if m:IsA("Tool") then
                            wait(0.1)
                            if m:FindFirstChild("ClientGun") then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            elseif m:FindFirstChild("ClientKnife") then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end
                    end
                )

                wp.Time:GetPropertyChangedSignal("Value"):connect(
                    function()
                        if wp.Time.Value == 0 then
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )
            end
        end
    end

    if parent.Backpack:FindFirstChild("0") then
        if parent.Backpack["0"]:FindFirstChild("ClientGun") then
            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        elseif parent.Backpack["0"]:FindFirstChild("ClientKnife") then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end

    if parent.Character:FindFirstChild("0") then
        if parent.Character["0"]:FindFirstChild("ClientGun") then
            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        elseif parent.Character["0"]:FindFirstChild("ClientKnife") then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end

    parent.Backpack.ChildAdded:connect(
        function(m)
            if m:IsA("Tool") then
                wait(0.1)
                if m:FindFirstChild("ClientGun") then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                elseif m:FindFirstChild("ClientKnife") then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    )

    parent.Character.ChildAdded:connect(
        function(m)
            if m:IsA("Tool") then
                wait(0.1)
                if m:FindFirstChild("ClientGun") then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                elseif m:FindFirstChild("ClientKnife") then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    )

    wp.Time:GetPropertyChangedSignal("Value"):connect(
        function()
            if wp.Time.Value == 0 then
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )
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
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if wp:WaitForChild(o.Name) then
                        wait(1)
                        if o.Character:WaitForChild("Head") then
                            createESP(o)
                        end
                    end
                end
            )
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

function tpGem()
    for _, v in pairs(wp.Gems:GetChildren()) do
        v.Base.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
    end
end

function tpGun()
    for _, v in pairs(wp.Debris:GetChildren()) do
        if v.Name == "ItemPickup" then
            v.Base.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
        end
    end
end

function infJump()
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
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 2
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 2
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
        if keyDown == " " then
            infJump()
        end

        if keyDown == "l" then
            tpGem()
        end

        if keyDown == "k" then
            tpGun()
        end

        if keyDown == "c" then
            changeWS(0)
            notify("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            notify("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
