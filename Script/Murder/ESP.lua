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
virtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {7, 7, 7}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.ws_g = 24
_G.jp_g = 60

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function dropBox(parent)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(245, 205, 48)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function createESP(parent)
    local mainMurder = ""
    local fn = parent.Status.FakeName.Value
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name .. "(" .. fn .. ")"
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    nam.Size = UDim2.new(0, 200, 0, 50)
    if tostring(parent.Status.Role.Value) == "Murderer" then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        mainMurder = parent.Name
    end
    parent.Status.FakeName:GetPropertyChangedSignal("Value"):connect(
        function()
            nam.Text = parent.Name .. "(" .. fn .. ")"
        end
    )
    parent.Status.Role:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(parent.Status.Role.Value) == "Murderer" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                mainMurder = parent.Name
            else
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                mainMurder = ""
            end
        end
    )
    parent.Character.ChildAdded:connect(
        function(m)
            if m.Name == "Gun" then
                if parent.Name ~= mainMurder then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end
        end
    )
    parent.Character.ChildRemoved:connect(
        function(m)
            if m.Name == "Gun" then
                if parent.Name ~= mainMurder then
                    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                end
            end
        end
    )
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
                if tostring(parent.Status.Role.Value) == "Murderer" then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
                parent.Status.Role:GetPropertyChangedSignal("Value"):connect(
                    function()
                        if tostring(parent.Status.Role.Value) == "Murderer" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        else
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )
                parent.Character.ChildAdded:connect(
                    function(m)
                        if m.Name == "Gun" then
                            if parent.Name ~= mainMurder then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
                    end
                )
                parent.Character.ChildRemoved:connect(
                    function(m)
                        if m.Name == "Gun" then
                            if parent.Name ~= mainMurder then
                                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                            end
                        end
                    end
                )
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
                        spawn(
                            function()
                                wait(2)
                                createESP(o)
                            end
                        )
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
                        spawn(
                            function()
                                wait(2)
                                createESP(newPlayer)
                            end
                        )
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
                    if o.Character:WaitForChild("Head") then
                        wait(0.1)
                        createESP(o)
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

function firstScript()
    for _, v in pairs(wp.Debris.Props:GetChildren()) do
        if v:FindFirstChild("Green") then
            dropBox(v)
        end
        v.ChildAdded:connect(
            function(n)
                if n.Name == "Green" then
                    dropBox(v)
                end
            end
        )
        v.ChildRemoved:connect(
            function(n)
                if n.Name == "Green" then
                    v.EGUI:Destroy()
                end
            end
        )
    end

    for _, v in pairs(wp.Debris:GetChildren()) do
        if v.Name == "Revolver" then
            dropBox(v)
        end
    end

    wp.Debris.ChildAdded:connect(
        function(m)
            wait(0.1)
            if m.Name == "Revolver" then
                dropBox(m)
            elseif m.Name == "Props" then
                for _, v in pairs(m:GetChildren()) do
                    if v:FindFirstChild("Green") then
                        dropBox(v)
                    end
                    v.ChildAdded:connect(
                        function(n)
                            if n.Name == "Green" then
                                dropBox(v)
                            end
                        end
                    )
                    v.ChildRemoved:connect(
                        function(n)
                            if n.Name == "Green" then
                                v.EGUI:Destroy()
                            end
                        end
                    )
                end
            end
        end
    )
end
firstScript()

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
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

        if keyDown == "c" then
            changeWS(0)
            SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
