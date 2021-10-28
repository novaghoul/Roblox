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
_G.WS = 20
_G.JP = 45
_G.map = nil
_G.children = nil
_G.noclipAll = false

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Name = "TN"
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
                m.Name = ("BS")
                m.Face = f
                m.Active = true
                m.AlwaysOnTop = true
                local mf = Instance.new("Frame", m)
                mf.Size = UDim2.new(1, 0, 1, 0)
                mf.BorderSizePixel = 0
                mf.BackgroundTransparency = 0.5
                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                parent.Character.ChildAdded:connect(
                    function(m)
                        if m.Name == "BeastPowers" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        end
                    end
                )
                parent.Character.ChildRemoved:connect(
                    function(m)
                        if m.Name == "BeastPowers" then
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )

                if parent.Character:FindFirstChild("BeastPowers") then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    end
    parent.Character.ChildAdded:connect(
        function(m)
            if m.Name == "BeastPowers" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    )
    parent.Character.ChildRemoved:connect(
        function(m)
            if m.Name == "BeastPowers" then
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )

    if parent.Character:FindFirstChild("BeastPowers") then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    createESP(o)
                end
            )
        end
    end
    plrs.PlayerAdded:Connect(
        function(newPlayer)
            if newPlayer.Name ~= lplr.Name then
                newPlayer.CharacterAdded:Connect(
                    function(characterModel)
                        wait(1)
                        createESP(newPlayer)
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
            createESP(o)
        end
    end
end
espFirst()

function createMap()
    _G.map = wp:findFirstChild(tostring(rs.CurrentMap.Value))
    _G.children = _G.map:GetChildren()
    for i = 1, #_G.children do
        if _G.children[i].Name == "ComputerTable" then
            local bgui = Instance.new("BillboardGui", _G.children[i].Screen)
            bgui.Name = ("EGUI")
            bgui.AlwaysOnTop = true
            bgui.ExtentsOffset = Vector3.new(0, 0, 0)
            bgui.Size = UDim2.new(1, 0, 1, 0)
            local nam = Instance.new("TextLabel", bgui)
            nam.Text = "COMPUTER"
            nam.BackgroundTransparency = 1
            nam.TextSize = 14
            nam.Font = ("Arial")
            nam.TextColor3 = _G.children[i].Screen.Color
            nam.Size = UDim2.new(1, 0, 1, 0)
            _G.children[i].Screen:GetPropertyChangedSignal("Color"):connect(
                function()
                    nam.TextColor3 = _G.children[i].Screen.Color
                end
            )end
        -- if _G.children[i].Name == "FreezePod" then
        --     local bgui = Instance.new("BillboardGui", _G.children[i].BasePart)
        --     bgui.Name = ("EGUI")
        --     bgui.AlwaysOnTop = true
        --     bgui.ExtentsOffset = Vector3.new(0, 0, 0)
        --     bgui.Size = UDim2.new(1, 0, 1, 0)
        --     local nam = Instance.new("TextLabel", bgui)
        --     nam.Text = "FP"
        --     nam.BackgroundTransparency = 1
        --     nam.TextSize = 14
        --     nam.Font = ("Arial")
        --     nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        --     nam.Size = UDim2.new(1, 0, 1, 0)
        -- end
    end
end

function espMapItem()
    if rs.GameTimer.Value > 0 then
        createMap()
    end

    rs.GameStatus:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(rs.GameStatus.Value) == "15 SEC HEAD START" then
                createMap()
            end
        end
    )
end
espMapItem()

function changeLight()
    lgt.FogStart = 0
    lgt.FogEnd = 100000
    local li = require(lgt.LightingValuesList)
    li.Brightness = 1
    li.GlobalShadows = false
    li.Ambient = Color3.new(0, 0, 0)
    li.GeographicLatitude = 41
    li.ColorShift_Top = Color3.new(0, 0, 0)
    li.ColorShift_Bottom = Color3.new(0, 0, 0)
	li.OutdoorAmbient = Color3.fromRGB(191, 191, 191)
	li.ShadowSoftness = 0
	li.EnvironmentDiffuseScale = 0
	li.EnvironmentSpecularScale = 0
	li.TimeOfDay = "12:00:00"
	li.ExposureCompensation = 0
end
changeLight()

function firstScript()
    lplr.PlayerGui.ScreenGui.TimingCircle:GetPropertyChangedSignal("Visible"):connect(
        function()
            if lplr.PlayerGui.ScreenGui.TimingCircle.Visible then
                wait(0.01)
                local args = {
                    [1] = "Input",
                    [2] = "Action",
                    [3] = true
                }
                rs.RemoteEvent:FireServer(unpack(args))
            end
        end
    )
end
firstScript()

function changeSpeed()
    lplr.Character.Humanoid.WalkSpeed = _G.WS
    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.WS then
                lplr.Character.Humanoid.WalkSpeed = _G.WS
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            characterModel.Humanoid.WalkSpeed = _G.WS
            characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if characterModel.Humanoid.WalkSpeed ~= _G.WS then
                        characterModel.Humanoid.WalkSpeed = _G.WS
                    end
                end
            )
        end
    )
end

function changeWS(typeWS)
    if typeWS == 0 then
        _G.WS = _G.WS + 2
        lplr.Character.Humanoid.WalkSpeed = _G.WS
    elseif typeWS == 1 then
        if _G.WS >= 0 then
            _G.WS = _G.WS - 2
            lplr.Character.Humanoid.WalkSpeed = _G.WS
        end
        if _G.WS < 16 then
            _G.WS = 16
            lplr.Character.Humanoid.WalkSpeed = _G.WS
        end
    end
end
changeSpeed()

function infJump()
    if lplr.Character.Humanoid ~= nil then
        lplr.Character.Humanoid.JumpPower = _G.JP
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "c" then
            changeWS(0)
            notify("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            notify("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
            notify("No Clip :" .. tostring(_G.noclipAll))
        end
    end
)

spawn(
    function()
        while true do
            wait()
            rs.RemoteEvent:FireServer("SetPlayerMinigameResult", true)
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            lplr.Character.Humanoid:ChangeState(11)
        end
    end
)
