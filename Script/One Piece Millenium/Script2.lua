uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
cg = game:GetService("CoreGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

wp.ChildAdded:connect(
    function(m)
        if string.find(string.lower(m.Name), string.lower("Book")) then
            local bgui = Instance.new("BillboardGui", m.Handle)
            bgui.Name = ("EGUI")
            bgui.AlwaysOnTop = true
            bgui.ExtentsOffset = Vector3.new(0, 0, 0)
            bgui.Size = UDim2.new(1, 0, 1, 0)
            local nam = Instance.new("TextLabel", bgui)
            nam.Text = m.Name
            nam.BackgroundTransparency = 1
            nam.TextSize = 10
            nam.Font = ("Arial")
            nam.TextColor3 = Color3.fromRGB(245, 205, 48)
            nam.Size = UDim2.new(1, 0, 1, 0)
        end

        -- m.ChildAdded:connect(
        --     function(n)
        --         if tostring(n.Name) == "Handle" then
        --             wait()
        --             n.CFrame = lplr.Character.HumanoidRootPart.CFrame
        --         end
        --     end
        -- )
        -- if m:FindFirstChild("Handle") then --MoneyBag or HakiBook or Devil Fruit
        --     wait(1)
        --     m.Handle.CFrame = lplr.Character.HumanoidRootPart.CFrame
        -- end
    end
)

for i, v in pairs(wp:GetChildren()) do
    if string.find(string.lower(v.Name), string.lower("Book")) then
        local bgui = Instance.new("BillboardGui", v.Handle)
        bgui.Name = ("EGUI")
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 0, 0)
        bgui.Size = UDim2.new(1, 0, 1, 0)
        local nam = Instance.new("TextLabel", bgui)
        nam.Text = v.Name
        nam.BackgroundTransparency = 1
        nam.TextSize = 10
        nam.Font = ("Arial")
        nam.TextColor3 = Color3.fromRGB(245, 205, 48)
        nam.Size = UDim2.new(1, 0, 1, 0)
    end
end

for i, v in pairs(wp.Chests:GetChildren()) do
    local bgui = Instance.new("BillboardGui", v)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = v.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 10
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(245, 205, 48)
    nam.Size = UDim2.new(1, 0, 1, 0)
    v:GetPropertyChangedSignal("Transparency"):connect(
        function()
            if v.Transparency == 1 then
                nam.Text = ""
            else
                nam.Text = v.Name
            end
        end
    )
    if v.Transparency == 1 then
        nam.Text = ""
    else
        nam.Text = v.Name
    end
end

-- local Remote = game.ReplicatedStorage.RemoteEvents['ShopPurchaseRemote']

-- local Arguments = {
--         [1] = "SS3"
-- }

-- Remote:FireServer(unpack(Arguments))

spawn(
    function()
        for i = 1, 9999999999 do
            rs.RemoteEvents.CombatBase:FireServer()
            wait()
        end
    end
)

spawn(
    function()
        local Remote = game.ReplicatedStorage.RemoteEvents["LargeWeights"]
        while wait() do
            if lplr.Backpack:FindFirstChild("LargeWeight") then
                local Arguments = {
                    [1] = lplr.Backpack.LargeWeight.Control.HakiType,
                    [2] = lplr.Backpack.LargeWeight,
                    [3] = lplr.Backpack.LargeWeight.Control.Uses
                }
                Remote:FireServer(unpack(Arguments))
            end
            wait()
        end
    end
)

spawn(
    function()
        while wait() do
            if lplr.Backpack:FindFirstChild("Katana") then
                local A_1 = lplr.Backpack["Katana"]
                local Event_1 = rs.RemoteEvents["KatanaBase"]
                Event_1:FireServer(A_1)
            end
            wait()
        end
    end
)

spawn(
    function()
        while wait() do
            if lplr.Backpack:FindFirstChild("3SS") then
                local A_1 = lplr.Backpack["3SS"]
                local Event_1 = rs.RemoteEvents["TSBase"]
                Event_1:FireServer(A_1)
            end
            wait()
        end
    end
)

spawn(
    function()
        --May not work
        while wait() do
            if lplr.Backpack:FindFirstChild("Cannon") then
                local A_1 = lplr.Backpack.Cannon
                local Event = rs.RemoteEvents.CannonBase
                Event:FireServer(A_1)
            end
            wait()
        end
    end
)

for i, v in pairs(wp.Chests:GetChildren()) do
    v.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
end

local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

function createESP(parent)
    if parent.Name ~= lplr.Name then
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
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        o.CharacterAdded:Connect(
            function(characterModel)
                wait(1)
                createESP(o)
            end
        )
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    createESP(newPlayer)
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Character ~= nil then
            createESP(o)
        end
    end
end

espFirst()
