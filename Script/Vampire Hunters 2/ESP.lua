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
    ws_g = 20,
    jp_g = 50
}

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
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

    if parent.Pstats.Curr.Mode.Value == 1 then
        nam.Text = parent.Name .. ": Survitor"
    elseif parent.Pstats.Curr.Mode.Value == 2 then
        nam.Text = parent.Name .. ": Detective"
    elseif parent.Pstats.Curr.Mode.Value == 3 then
        nam.Text = parent.Name .. ": Vampire"
    elseif parent.Pstats.Curr.Mode.Value == 4 then
        nam.Text = parent.Name .. ": Medic"
    elseif parent.Pstats.Curr.Mode.Value == 5 then
        nam.Text = parent.Name .. ": Werewolf"
    end

    for _, v in pairs(parent.Backpack:GetChildren()) do
        if tostring(v.Name) == "Gun" then
            nam.Text = parent.Name .. ": Detective"
        end
    end

    parent.Pstats.Curr.Mode:GetPropertyChangedSignal("Value"):connect(
        function()
            if parent.Pstats.Curr.Mode.Value == 1 then
                nam.Text = parent.Name .. ": Survitor"
            elseif parent.Pstats.Curr.Mode.Value == 2 then
                nam.Text = parent.Name .. ": Detective"
            elseif parent.Pstats.Curr.Mode.Value == 3 then
                nam.Text = parent.Name .. ": Vampire"
            elseif parent.Pstats.Curr.Mode.Value == 4 then
                nam.Text = parent.Name .. ": Medic"
            elseif parent.Pstats.Curr.Mode.Value == 5 then
                nam.Text = parent.Name .. ": Werewolf"
            end
        end
    )

    parent.Backpack.ChildAdded:connect(
        function(m)
            if tostring(m.Name) == "Gun" then
                nam.Text = parent.Name .. ": Detective"
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
        if tostring(o.Name) ~= tostring(lplr.Name) then
            if o.Character:FindFirstChild("Head") then
                wait(0.1)
                createESP(o)
            end
        end
    end
end

function createESPMap(parent)
    if string.lower(tostring(parent.Name)) == "pistoldrop" then
        local bgui = Instance.new("BillboardGui", parent)
        bgui.Name = ("EGUI")
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 0, 0)
        bgui.Size = UDim2.new(1, 0, 1, 0)
        local nam = Instance.new("TextLabel", bgui)
        nam.Text = "Gun Drop"
        nam.BackgroundTransparency = 1
        nam.TextSize = 10
        nam.Font = ("Arial")
        nam.TextColor3 = Color3.fromRGB(245, 205, 48)
        nam.Size = UDim2.new(1, 0, 1, 0)
    end
end

function espMAP()
    wp.Rubble.ChildAdded:connect(
        function(m)
            createESPMap(m)
        end
    )

    for _, v in pairs(wp.Rubble:GetChildren()) do
        createESPMap(v)
    end
end
espMAP()

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

function infJump()
    --lplr.Character.Humanoid.JumpPower = _G.jp_g
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
            if sg:GetCoreGuiEnabled(2) == false then
                sg:SetCoreGuiEnabled(2, true)
            end
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
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

        if keyDown == "[" then
            changeWS(0)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

espFirst()

--1 Survitor
--2 Detective
--3 Vampire
--4 Medic
--5 Werewolf
