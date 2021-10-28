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

if _G.faces == nil then
    _G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
end
_G.ws_g = 20
_G.jp_g = 50
_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
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

function dropBox(parent, parentName)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parentName
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(245, 205, 48)
    nam.Size = UDim2.new(1, 0, 1, 0)
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
                if parent:FindFirstChild("Tasks") then
                    if not parent.Character:FindFirstChild("isGhostValue") then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        for _, v in pairs(parent.Tasks:GetChildren()) do
                            if v.partsCompleted.Value == 1 then
                                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                            end
                        end
                    else
                        mf.BackgroundColor3 = Color3.fromRGB(242, 243, 243)
                    end
                end

                parent.ChildAdded:connect(
                    function(m)
                        if m.Name == "Tasks" then
                            wait(2)
                            if not parent.Character:FindFirstChild("isGhostValue") then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                                for _, v in pairs(m:GetChildren()) do
                                    v.partsCompleted:GetPropertyChangedSignal("Value"):connect(
                                        function()
                                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                                        end
                                    )
                                end
                            else
                                mf.BackgroundColor3 = Color3.fromRGB(242, 243, 243)
                            end
                        end
                    end
                )
            end
        end
    end

    if parent:FindFirstChild("Tasks") then
        if not parent.Character:FindFirstChild("isGhostValue") then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            for _, v in pairs(parent.Tasks:GetChildren()) do
                if v.partsCompleted.Value == 1 then
                    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                end
            end
        else
            nam.TextColor3 = Color3.fromRGB(242, 243, 243)
        end
    end

    parent.ChildAdded:connect(
        function(m)
            if m.Name == "Tasks" then
                wait(2)
                if not parent.Character:FindFirstChild("isGhostValue") then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                    for _, v in pairs(m:GetChildren()) do
                        v.partsCompleted:GetPropertyChangedSignal("Value"):connect(
                            function()
                                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                            end
                        )
                    end
                else
                    nam.TextColor3 = Color3.fromRGB(242, 243, 243)
                end
            end
        end
    )
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
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
                    if o.Character:FindFirstChild("Head") then
                        wait(0.1)
                        createESP(o)
                    end
                end
            )
        end
    end
end
espFirst()

function firstScript()
end
firstScript()

-------------------------------------------------------------
--------------------------Other------------------------------
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
            wait(0.5)
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
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

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
