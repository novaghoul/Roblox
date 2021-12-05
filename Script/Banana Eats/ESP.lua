loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

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
                if parent.Character:FindFirstChild("BananaPackage") then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
                parent.Character.ChildAdded:connect(function(m)
                    if m.Name == "BananaPackage" then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end)
            end
        end
    end
    if parent.Character:FindFirstChild("BananaPackage") then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
    parent.Character.ChildAdded:connect(function(m)
        if m.Name == "BananaPackage" then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                if characterModel:WaitForChild("Head") then
                    wait(0.5)
                    createESP(o)
                end
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        newPlayer.CharacterAdded:Connect(function(characterModel)
            if characterModel:WaitForChild("Head") then
                wait(0.5)
                createESP(newPlayer)
            end
        end)
    end)
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(function()
                if o.Character:FindFirstChild("Head") then
                    wait(0.1)
                    createESP(o)
                end
            end)
        end
    end
end
espFirst()

function firstScript()
    for _, v in pairs(wp.GameKeeper.Puzzles:GetChildren()) do
        if v:FindFirstChild("PuzzleMarker") then
            if v.Name == "CombinationPuzzle" then
                createESPItem(v.PuzzleMarker, 245, 205, 48, 14, v.Name)
                createESPItem(v.CombinationKey.Frames, 245, 205, 48, 14, v.CombinationKey.Name)
            else
                createESPItem(v.PuzzleMarker, 245, 205, 48, 14, v.Name)
            end
        end
    end
    wp.GameKeeper.Puzzles.ChildAdded:connect(function(m)
        wait(1)
        if m:FindFirstChild("PuzzleMarker") then
            if m.Name == "CombinationPuzzle" then
                createESPItem(m.PuzzleMarker, 245, 205, 48, 14, m.Name)
                createESPItem(m.CombinationKey.Frames, 245, 205, 48, 14, m.CombinationKey.Name)
            else
                createESPItem(m.PuzzleMarker, 245, 205, 48, 14, m.Name)
            end
        end
    end)

    if wp.GameKeeper.Map:FindFirstChild("Items") then
        for _, v in pairs(wp.GameKeeper.Map.Items:GetChildren()) do
            if v.Model:FindFirstChild("CakePlate") then
                createESPItem(v.Model.CakePlate.Model.Cake, 245, 205, 48, 14, "Cake Plate")
            end
        end
    end

    if wp.GameKeeper.Map:FindFirstChild("Tokens") then
        for _, v in pairs(wp.GameKeeper.Map.Tokens:GetChildren()) do
            v.CFrame = lplr.Character.UpperTorso.CFrame
        end
        wp.GameKeeper.Map.Tokens.ChildAdded:connect(function(n)
            wait(0.1)
            n.CFrame = lplr.Character.UpperTorso.CFrame
        end)
    end

    wp.GameKeeper.Map.ChildAdded:connect(function(m)
        if m.Name == "Items" then
            m.ChildAdded:connect(
                function(n)
                    wait(0.1)
                    createESPItem(n.Model.CakePlate.Model.Cake, 245, 205, 48, 14, "Cake Plate")
                end
            )
        elseif m.Name == "Tokens" then
            wait(0.1)
            for _, v in pairs(m:GetChildren()) do
                v.CFrame = lplr.Character.UpperTorso.CFrame
            end
            m.ChildAdded:connect(function(n)
                wait(0.5)
                n.CFrame = lplr.Character.UpperTorso.CFrame
            end)
        end
    end)
end
firstScript()

function tpCoin()
    for i = 1, 100000 do
        wait(0.5)
        if wp.GameKeeper.Map:FindFirstChild("Tokens") then
            for _, v in pairs(wp.GameKeeper.Map.Tokens:GetChildren()) do
                v.CFrame = lplr.Character.UpperTorso.CFrame
            end
        end
    end
end

-------------------------------------------------------------
--------------------------Other------------------------------
function infJump()
    -- lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(function()
        if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end)
    lplr.CharacterAdded:Connect(function(characterModel)
        wait(0.5)
        lplr.Character.Humanoid.WalkSpeed = ws_g
        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(function()
            if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                lplr.Character.Humanoid.WalkSpeed = ws_g
            end
        end)
    end)
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        ws_g = ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "q" then
        tpCoin()
    end

    if keyDown == "e" then
        rs.Events.DropPeel:InvokeServer()
    end

    if keyDown == " " then
        infJump()
    end

    if keyDown == "c" then
        changeWS(0)
        SendChat("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == "v" then
        changeWS(1)
        SendChat("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == "f" then
        noclipAll = not noclipAll
    end
end)

lplr.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

game:GetService("RunService").Stepped:connect(function()
    if noclipAll then
        for i = 1, #checkRigType() do
            lplr.Character[checkRigType()[i]].CanCollide = false
        end
        lplr.Character.HumanoidRootPart.CanCollide = false
    end
end)
