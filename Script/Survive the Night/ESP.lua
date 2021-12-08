loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.timeGame = true

local Notify = Instance.new("ScreenGui")
local MainNotify = Instance.new("Frame")
local lbltitle = Instance.new("TextLabel")
local lblbossmes = Instance.new("TextLabel")

Notify.Name = "Notify"
Notify.Parent = cg
Notify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainNotify.Name = "MainNotify"
MainNotify.Parent = Notify
MainNotify.BackgroundColor3 = Color3.new(0, 0, 0)
MainNotify.Position = UDim2.new(0.93599999, 0, 0.800000012, 0)
MainNotify.Size = UDim2.new(0, 100, 0, 50)
MainNotify.Visible = true

lbltitle.Name = "lbltitle"
lbltitle.Parent = MainNotify
lbltitle.BackgroundColor3 = Color3.new(0, 0, 0)
lbltitle.BorderColor3 = Color3.new(1, 1, 1)
lbltitle.Position = UDim2.new(0, 2, 0, 2)
lbltitle.Size = UDim2.new(0, 96, 0, 23)
lbltitle.Font = Enum.Font.SourceSans
lbltitle.Text = "Boss Appears"
lbltitle.TextColor3 = Color3.new(1, 1, 1)
lbltitle.TextSize = 14

lblbossmes.Name = "lblbossmes"
lblbossmes.Parent = MainNotify
lblbossmes.BackgroundColor3 = Color3.new(0, 0, 0)
lblbossmes.BorderColor3 = Color3.new(1, 1, 1)
lblbossmes.Position = UDim2.new(0, 2, 0, 25)
lblbossmes.Size = UDim2.new(0, 96, 0, 23)
lblbossmes.Font = Enum.Font.SourceSans
lblbossmes.Text = "Eto"
lblbossmes.TextColor3 = Color3.new(1, 1, 1)
lblbossmes.TextSize = 14
-- Scripts:

function createESP(parent)
    createESPItem(parent.Character.Head, 75, 151, 75, 14, parent.Name)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 75, 151, 75)
            end
            if parent.Character:FindFirstChild("HideWhenZoomed") then
                for _,v in pairs(parent.Character.Head:GetChildren()) do
                    if v.Name == "BS" then
                        if parent.Character.HideWhenZoomed:FindFirstChild("FakeHead") then
                            v.FR.BackgroundColor3 = Color3.fromRGB(242, 243, 243)
                        else
                            v.FR.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        end
                    end
                end
            end
            parent.Character.ChildAdded:connect(function(m)
                if m.Name == "HideWhenZoomed" then
                    wait(0.1)
                    for _,v in pairs(parent.Character.Head:GetChildren()) do
                        if v.Name == "BS" then
                            if m:FindFirstChild("FakeHead") then
                                v.FR.BackgroundColor3 = Color3.fromRGB(242, 243, 243)
                            else
                                v.FR.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end
                    end
                end
            end)
        end
    end
    if parent.Character:FindFirstChild("HideWhenZoomed") then
        if parent.Character.HideWhenZoomed:FindFirstChild("FakeHead") then
            parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(242, 243, 243)
        else
            parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end
    parent.Character.ChildAdded:connect(function(m)
        if m.Name == "HideWhenZoomed" then
            wait(0.1)
            if m:FindFirstChild("FakeHead") then
                parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(242, 243, 243)
            else
                parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                wait(1)
                createESP(o)
                pointLight()
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        if newPlayer.Name ~= lplr.Name then
            newPlayer.CharacterAdded:Connect(function(characterModel)
                wait(1)
                createESP(newPlayer)
                pointLight()
            end)
        end
    end)
end
enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            createESP(o)
            pointLight()
        end
    end
    if wp.Objects:FindFirstChild("InvisibleWalls") then
        wp.Objects.InvisibleWalls:Destroy()
    end
end
espFirst()

function eventESPItem(parent)
    if tostring(parent.Name) == "Relics" then
        parent.ChildAdded:connect(
            function(m)
                wait(0.1)
                createESPItem(m, 196, 40, 28, 10, tostring(m.Name))
            end
        )
        for _, l in pairs(parent:GetChildren()) do
            if l.Name == "Relic" then
                createESPItem(l, 196, 40, 28, 10, tostring(parent.Name))
            end
        end
    end
    if tostring(parent.Name) == "DeathChest" then
        createESPItem(parent.Main, 196, 40, 28, 10, tostring(parent.Name))
    end
    if tostring(parent.Name) == "BonusItems" then
        for _, l in pairs(parent:GetChildren()) do
            if l.Name == "Panels" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v.Part, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Lasers" then
                for _, v in pairs(l:GetChildren()) do
                    v:Destroy()
                end
            end
            if l.Name == "Generators" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v.Base, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Levers" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v.Lever, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "WaterPipes" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v.Water, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Antennas" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v.Screen, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Beacons" then
                for _, v in pairs(l:GetChildren()) do
                    if v:FindFirstChild("Part") then
                        createESPItem(v.Part, 196, 40, 28, 10, tostring(v.Name))
                    else
                        createESPItem(v.Glow, 196, 40, 28, 10, tostring(v.Name))
                    end
                end
            end
            if l.Name == "Switch" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Breakers" then
                for _, v in pairs(l:GetChildren()) do
                    createESPItem(v, 196, 40, 28, 10, tostring(v.Name))
                end
            end
            if l.Name == "Generator" then
                createESPItem(l.Main, 196, 40, 28, 10, tostring(l.Name))
            end
            if l.Name == "Phone" then
                createESPItem(l.Light, 196, 40, 28, 10, tostring(l.Name))
            end
            if l.Name == "EasterEgg" then
                createESPItem(l, 196, 40, 28, 10, tostring(l.Name))
            end
        end
    end
end

function enableESPItemsCode()
    if wp:FindFirstChild("TempMap") then
        wait(1)
        for _, v in pairs(wp.TempMap.Main:GetChildren()) do
            eventESPItem(v)
        end
        if wp.TempMap:FindFirstChild("InvisibleWalls") then
            wp.TempMap.InvisibleWalls:Destroy()
        end
        if wp.TempMap:FindFirstChild("Kit") then
            if wp.TempMap.Kit:FindFirstChild("InvisibleWalls") then
                wp.TempMap.Kit.InvisibleWalls:Destroy()
            end
        end
    end
    wp.ChildAdded:connect(function(p)
        if p.Name == "TempMap" then
            wait(5)
            for _, v in pairs(p.Main:GetChildren()) do
                eventESPItem(v)
            end
            if p:FindFirstChild("InvisibleWalls") then
                p.InvisibleWalls:Destroy()
            end
            if p:FindFirstChild("Kit") then
                if p.Kit:FindFirstChild("InvisibleWalls") then
                    p.Kit.InvisibleWalls:Destroy()
                end
            end
        end
    end)
    if lgt:FindFirstChild("Skybox") then
        lgt.Skybox:Destroy()
    end
    lgt.ChildAdded:connect(function(p)
        if p.Name == "Skybox" then
            wait(0.1)
            p:Destroy()
        end
    end)
    if wp.Objects:FindFirstChild("Snow") then
        wp.Objects.Snow:Destroy()
    end
    wp.Objects.ChildAdded:connect(function(p)
        if p.Name == "Snow" then
            wait(0.1)
            p:Destroy()
        end
    end)

end
enableESPItemsCode()

_G.down = false
_G.velocity = Instance.new("BodyVelocity")
_G.velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
_G.gyro = Instance.new("BodyGyro")
_G.gyro.maxTorque = Vector3.new(100000, 0, 100000)

function onButton1Down(v, g, d)
    d = false
    wait(1)
    d = true
    if lplr.Character then
        if lplr.Character:FindFirstChild("Torso") then
            v.Parent = lplr.Character.Torso
            g.Parent = lplr.Character.Torso
        else
            v.Parent = lplr.Character.UpperTorso
            g.Parent = lplr.Character.UpperTorso
        end
        v.velocity = (lplr.Character.Humanoid.MoveDirection) * speedDash
        while d do
            if not d then
                break
            end
            if lplr.Character then
                if lplr.Character:FindFirstChild("UpperTorso") then
                    v.velocity = (lplr.Character.Humanoid.MoveDirection) * speedDash
                    local refpos = g.Parent.Position + (g.Parent.Position - wp.CurrentCamera.CoordinateFrame.p).unit * 5
                    g.cframe = CFrame.new(g.Parent.Position, Vector3.new(refpos.x, g.Parent.Position.y, refpos.z))
                end
            end
            wait(0.1)
        end
    end
end

function onButton1Up(v, g, d)
    v.Parent = nil
    g.Parent = nil
    d = false
end

lplr.CharacterAdded:Connect(function(characterModel)
    _G.down = false
    wait(2)
    _G.velocity = Instance.new("BodyVelocity")
    _G.velocity.maxForce = Vector3.new(100000, 0, 100000)
    _G.velocity.Parent = nil
    ---vv Use that to change the speed v
    _G.gyro = Instance.new("BodyGyro")
    _G.gyro.maxTorque = Vector3.new(100000, 0, 100000)
    _G.gyro.Parent = nil
    wait(1)
    onButton1Down(_G.velocity, _G.gyro, _G.down)
end)

function changeDA(typeDA)
    if typeDA == 0 then
        speedDash = speedDash + 5
    elseif typeDA == 1 then
        if speedDash >= 0 then
            speedDash = speedDash - 5
        end
        if speedDash < 0 then
            speedDash = 0
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "c" then
        changeDA(0)
        NotifyG("Dash", speedDash)
    end
    if keyDown == "v" then
        changeDA(1)
        NotifyG("Dash", speedDash)
    end
    if keyDown == "x" then
        if speedDash == 20 then
            speedDash = 17
            NotifyG("Dash", speedDash)
        else
            speedDash = 20
            NotifyG("Dash", speedDash)
        end
    end
    if keyDown == "q" then
    end
end)

spawn(
	function()
        onButton1Down(_G.velocity, _G.gyro, _G.down)
	end
)

while _G.timeGame == true do
    wait(0.1)
    lbltitle.Text = tostring(rs.Values.SurvivedHours.Value + 1) .. " AM"
    lblbossmes.Text = "Time : " .. tostring(rs.Values.Timer.Value)
end