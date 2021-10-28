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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
if _G.wsSpeed == nil then
    _G.wsSpeed = 20
end
local tpCoin = false

function checkESP(parent)
    local numEGUI = 0
    for _, v in pairs(parent.Character.Head:GetChildren()) do
        if v.Name == "EGUI" then
            numEGUI = numEGUI + 1
        end
    end

    if numEGUI < 7 then
        for _, v in pairs(parent.Character.Head:GetChildren()) do
            if v.Name == "EGUI" then
                v:Destroy()
            end
        end
        createESP(parent)
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

                parent.Character.Role:GetPropertyChangedSignal("Value"):connect(
                    function()
                        if tostring(parent.Character.Role.Value) == "Hider" then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        elseif tostring(parent.Character.Role.Value) == "Seeker" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        else
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )
                if tostring(parent.Character.Role.Value) == "Hider" then
                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                elseif tostring(parent.Character.Role.Value) == "Seeker" then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                else
                    mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                end
            end
        end
    end

    parent.Character.Role:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(parent.Character.Role.Value) == "Hider" then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(parent.Character.Role.Value) == "Seeker" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            else
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )
    if tostring(parent.Character.Role.Value) == "Hider" then
        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
    elseif tostring(parent.Character.Role.Value) == "Seeker" then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    else
        nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(3)
                    o.Character.Role:GetPropertyChangedSignal("Value"):connect(
                        function()
                            checkESP(o)
                        end
                    )
                    createESP(o)
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(3)
                    newPlayer.Character.Role:GetPropertyChangedSignal("Value"):connect(
                        function()
                            checkESP(newPlayer)
                        end
                    )
                    createESP(newPlayer)
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
                o.Character.Role:GetPropertyChangedSignal("Value"):connect(
                    function()
                        checkESP(o)
                    end
                )
            end
            if o.Character.Head ~= nil then
                createESP(o)
            end
        end
    end
end

function statsPlayerWs()
    humanoidP.WalkSpeed = _G.wsSpeed

    humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if humanoidP.WalkSpeed ~= _G.wsSpeed then
                humanoidP.WalkSpeed = _G.wsSpeed
            end
        end
    )
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            humanoidP.WalkSpeed = _G.wsSpeed
            humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if humanoidP.WalkSpeed ~= _G.wsSpeed then
                        humanoidP.WalkSpeed = _G.wsSpeed
                    end
                end
            )
        end
    )
end

statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.wsSpeed = _G.wsSpeed + 5
        humanoidP.WalkSpeed = _G.wsSpeed
    elseif typeWS == 1 then
        if _G.wsSpeed >= 0 then
            _G.wsSpeed = _G.wsSpeed - 5
            humanoidP.WalkSpeed = _G.wsSpeed
        end
        if _G.wsSpeed < 16 then
            _G.wsSpeed = 16
            humanoidP.WalkSpeed = _G.wsSpeed
        end
    end
end

function infJump()
    lplr.Character.Humanoid.JumpPower = 50
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

        if keyDown == "l" then
            tpCoin = not tpCoin
            while tpCoin do
                wait()
                wp.Lobby.LobbyObby.Token.CFrame = lplr.Character.HumanoidRootPart.CFrame
            end
        end
        if keyDown == "k" then
            for _, o in pairs(plrs:GetPlayers()) do
                if o.Name ~= lplr.Name then
                    if o.Character ~= nil then
                        checkESP(o)
                    end
                end
            end
        end
    end
)
espFirst()
