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

local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
local ws_g = 16

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
                if parent.Character:FindFirstChild("IsGranny") then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    end
    if parent.Character:FindFirstChild("IsGranny") then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(2)
                    checkESP(o)
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(2)
                    checkESP(newPlayer)
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            pcall(
                function()
                    checkESP(o)
                end
            )
        end
    end
end

function lightCode()
    lgt.Changed:connect(
        function(property)
            if property == "Brightness" or property == "FogEnd" then
                lgt.Brightness = 1
                lgt.GlobalShadows = false
                lgt.TimeOfDay = "12:00:00"
                lgt.ClockTime = 12
                lgt.FogStart = 0
                lgt.FogEnd = 100000
            end
        end
    )
end

function statsPlayerWs()
    if lplr:FindFirstChild("Character") then
        lplr.Character.Humanoid.WalkSpeed = ws_g

        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                    lplr.Character.Humanoid.WalkSpeed = ws_g
                end
            end
        )
    end
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            lplr.Character.Humanoid.WalkSpeed = ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                        lplr.Character.Humanoid.WalkSpeed = ws_g
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

function infJump()
    uis.JumpRequest:connect(
        function()
            if lplr:FindFirstChild("Character") then
                lplr.Character.Humanoid.JumpPower = 50
                lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end
    )
end
infJump()

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "z" then
            changeWS(0)
        end
        if keyDown == "x" then
            changeWS(1)
        end
        if keyDown == "l" then
            for _, o in pairs(plrs:GetPlayers()) do
                if o.Name ~= lplr.Name then
                    if o:FindFirstChild("Character") then
                        checkESP(o)
                    end
                end
            end
        end
    end
)

espFirst()
lightCode()
