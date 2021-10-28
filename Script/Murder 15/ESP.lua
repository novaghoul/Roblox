uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

g = {
    faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"},
    speed = 20,
    shef = {"Gun", "Revolver"},
    ass = {"Knife", "Blade", "Battleaxe"}
}

_G = {
    hitBoxSize = 3,
    hitBoxBody = "Head"
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
    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(g.faces) do
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

                parent.Backpack.ChildAdded:connect(
                    function(b)
                        for i = 1, #g.shef do
                            if b.Name == g.shef[i] then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end

                        for i = 1, #g.ass do
                            if b.Name == g.ass[i] then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end
                    end
                )

                parent.Character.ChildAdded:connect(
                    function(c)
                        for i = 1, #g.shef do
                            if c.Name == g.shef[i] then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end

                        for i = 1, #g.ass do
                            if c.Name == g.ass[i] then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end
                    end
                )

                for i = 1, #g.shef do
                    if parent.Backpack:FindFirstChild(g.shef[i]) then
                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end

                for i = 1, #g.ass do
                    if parent.Backpack:FindFirstChild(g.ass[i]) then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end

                for i = 1, #g.shef do
                    if parent.Character:FindFirstChild(g.shef[i]) then
                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end

                for i = 1, #g.ass do
                    if parent.Character:FindFirstChild(g.ass[i]) then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end
            end
        end
    end

    parent.Backpack.ChildAdded:connect(
        function(b)
            for i = 1, #g.shef do
                if b.Name == g.shef[i] then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end

            for i = 1, #g.ass do
                if b.Name == g.ass[i] then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    )

    parent.Character.ChildAdded:connect(
        function(c)
            for i = 1, #g.shef do
                if c.Name == g.shef[i] then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end

            for i = 1, #g.ass do
                if c.Name == g.ass[i] then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    )

    for i = 1, #g.shef do
        if parent.Backpack:FindFirstChild(g.shef[i]) then
            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        end
    end

    for i = 1, #g.ass do
        if parent.Backpack:FindFirstChild(g.ass[i]) then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end

    for i = 1, #g.shef do
        if parent.Character:FindFirstChild(g.shef[i]) then
            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        end
    end

    for i = 1, #g.ass do
        if parent.Character:FindFirstChild(g.ass[i]) then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(2)
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
                        wait(2)
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
            if o.Character.Head ~= nil then
                createESP(o)
            end
        end
    end
end
espFirst()

function createESPMap(parent)
    if tostring(parent.Name) == "Revolver" then
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
    wp.ChildAdded:connect(
        function(m)
            createESPMap(m)
        end
    )

    for _, v in pairs(wp:GetChildren()) do
        createESPMap(v)
    end
end
espMAP()

function tpCoin(number)
        for i = number, 1, -1 do
            local s = wp.Collectables:FindFirstChild("Coin")
            local e = lplr.Character:FindFirstChild("LowerTorso")
            if e and s then
                for _, c in pairs(wp.Collectables:GetChildren()) do
                    c.Main.CFrame = lplr.Character.LowerTorso.CFrame
                end
            end
            wait(0.7)
        end
end

function enableTpCoin()
    tpCoin(10)
end

function bringGun()
    if wp:FindFirstChild("Revolver") then
        wp.Revolver.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
    end
end

function Wspeed()
    lplr.Character.Humanoid.WalkSpeed = g.speed

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= g.speed then
                lplr.Character.Humanoid.WalkSpeed = g.speed
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            characterModel.Humanoid.WalkSpeed = g.speed
            characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if characterModel.Humanoid.WalkSpeed ~= g.speed then
                        characterModel.Humanoid.WalkSpeed = g.speed
                    end
                end
            )
        end
    )
end
Wspeed()

function changeWS(typeWS)
    if typeWS == 0 then
        g.speed = g.speed + 5
        lplr.Character.Humanoid.WalkSpeed = g.speed
    elseif typeWS == 1 then
        if g.speed >= 0 then
            g.speed = g.speed - 5
            lplr.Character.Humanoid.WalkSpeed = g.speed
        end
        if g.speed < 16 then
            g.speed = 16
            lplr.Character.Humanoid.WalkSpeed = g.speed
        end
    end
end

function infJump()
    --lplr.Character.Humanoid.JumpPower = 50
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

spawn(function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/bYWhrnGA'),true))() --Hit Box
end)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            enableTpCoin()
        end

        if keyDown == "k" then
            bringGun()
        end

        if keyDown == " " then
            infJump()
        end

        if keyDown == "c" then
            changeWS(0)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)
