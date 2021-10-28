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

                wp.Status.HasBomb:GetPropertyChangedSignal("Value"):connect(
                    function()
                        if tostring(parent.Name) == tostring(wp.Status.HasBomb.Value) then
                            mf.BackgroundColor3 = Color3.fromRGB(245, 205, 48)
                        elseif tostring(parent.Team) == "Terrorists" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        elseif tostring(parent.Team) == "Counter-Terrorists" then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        end
                    end
                )
                if tostring(parent.Name) == tostring(wp.Status.HasBomb.Value) then
                    mf.BackgroundColor3 = Color3.fromRGB(245, 205, 48)
                elseif tostring(parent.Team) == "Terrorists" then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(parent.Team) == "Counter-Terrorists" then
                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                end
            end
        end
    end

    wp.Status.HasBomb:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(parent.Name) == tostring(wp.Status.HasBomb.Value) then
                nam.TextColor3 = Color3.fromRGB(245, 205, 48)
            elseif tostring(parent.Team) == "Terrorists" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            elseif tostring(parent.Team) == "Counter-Terrorists" then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            end
        end
    )

    if tostring(parent.Name) == tostring(wp.Status.HasBomb.Value) then
        nam.TextColor3 = Color3.fromRGB(245, 205, 48)
    elseif tostring(parent.Team) == "Terrorists" then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    elseif tostring(parent.Team) == "Counter-Terrorists" then
        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
    end
end

function createESPItem(parent, r, g, b)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 20
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(2)
                    if characterModel:WaitForChild("Head") then
                        createESP(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            if tostring(newPlayer.Name) ~= tostring(lplr.Name) then
                newPlayer.CharacterAdded:Connect(
                    function(characterModel)
                        wait(2)
                        if characterModel:WaitForChild("Head") then
                            createESP(newPlayer)
                        end
                    end
                )
            end
        end
    )
    wp.ChildAdded:connect(
        function(p)
            if p.Name == "C4" then
                createESPItem(p, 75, 151, 75)
            end
        end
    )
    wp.Debris.ChildAdded:connect(
        function(p)
            if p.Name == "C4" then
                createESPItem(p, 245, 205, 48)
            end
        end
    )
    wp["Ray_Ignore"].ChildAdded:connect(
        function(p)
            for _, v in pairs(wp["Ray_Ignore"]:GetChildren()) do
                if tostring(v) == "Smokes" then
                    v:Destroy()
                end
            end
        end
    )
    for _, v in pairs(wp["Ray_Ignore"]:GetChildren()) do
        if tostring(v) == "Smokes" then
            v:Destroy()
        end
    end
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
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

function infJump()
    --lplr.Character.Humanoid.JumpPower = 50
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end
    end
)
espFirst()
