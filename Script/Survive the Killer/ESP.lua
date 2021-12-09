loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.white = {"green_bottle", "gas_can", "rope", "shattered_bottle", "shattered_shades", "rusty_lantern", "broken_bulb", "lighter", "broken_bottle"}
_G.blue = {"pickaxe", "old_slycer", "busted_boombox", "tire", "car_engine", "rusty_pipe", "rusty_cleaver", "gen_1"}
_G.red = {"laptop", "welding_goggles", "smartphone", "binoculars", "trophy", "smartwatch"}
_G.violet = {"apocalypse_helmet", "golden_compass", "golden_pocket_watch"}
_G.yellow = {"gold_bars", "pendant", "soul", "treasure_chest"}

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 10
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
                if parent.Character:FindFirstChild("Knife") then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
                parent.Character.ChildAdded:connect(function(m)
                    if m.Name == "Knife" then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    end
                end)
            end
        end
    end
    if parent.Character:FindFirstChild("Knife") then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
    parent.Character.ChildAdded:connect(function(m)
        if m.Name == "Knife" then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
        if m.Name == "Head" then
            createESP(parent)
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                if characterModel:WaitForChild("Head") then
                    wait(0.5)
                    createESP(o)
                end
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        newPlayer.CharacterAdded:Connect(function(characterModel)
            if characterModel:WaitForChild("Head") then
                wait(0.5)
                createESP(newPlayer)
            end
        end)
    end)
end
enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            if o.Character:FindFirstChild("Head") then
                wait(0.1)
                createESP(o)
            end
        end
    end
end

function lightCode()
    lgt.Brightness = 1
    lgt.GlobalShadows = false
    lgt.TimeOfDay = "12:00:00"
    lgt.ClockTime = 12
    lgt.FogStart = 0
    lgt.FogEnd = 100000
    lgt.Changed:connect(function(property)
        if property == "Brightness" or property == "FogEnd" then
            lgt.Brightness = 1
            lgt.GlobalShadows = false
            lgt.TimeOfDay = "12:00:00"
            lgt.ClockTime = 12
            lgt.FogStart = 0
            lgt.FogEnd = 100000
        end
    end)
end

function eventESPItem(parent)
	for i = 1, #_G.white do
		if parent.Parent.Name == _G.white[i] then
			createESPItem(parent, 242, 243, 243, 10, parent.Parent.Name)
		end
	end
	for i = 1, #_G.blue do
		if parent.Parent.Name == _G.blue[i] then
			createESPItem(parent, 13, 105, 172, 10, parent.Parent.Name)
		end
	end
	for i = 1, #_G.red do
		if parent.Parent.Name == _G.red[i] then
			createESPItem(parent, 196, 40, 28, 10, parent.Parent.Name)
		end
	end
	for i = 1, #_G.violet do
		if parent.Parent.Name == _G.violet[i] then
			createESPItem(parent, 146, 57, 120, 10, parent.Parent.Name)
		end
	end
	for i = 1, #_G.yellow do
		if parent.Parent.Name == _G.yellow[i] then
			createESPItem(parent, 245, 205, 48, 10, parent.Parent.Name)
		end
	end
end

function firstScript()
    if wp:FindFirstChild("CurrentMap") then
        if wp.CurrentMap:FindFirstChild("Loot") then
            for _, v in pairs(wp.CurrentMap.Loot:GetChildren()) do
                eventESPItem(v.Border)
            end
        end
    end
    wp.ChildAdded:connect(function(m)
        if m.Name == "CurrentMap" then
            if m:WaitForChild("Loot") then
                wait(1)
                for _, v in pairs(m.Loot:GetChildren()) do
                    eventESPItem(v.Border)
                end
            end
        end
    end)
end
firstScript()

function tpCoin()
    local e = lplr.Character:FindFirstChild("HumanoidRootPart")
    local s = wp.CurrentMap.Coins
    if e and s then
        for _, v in pairs(s:GetChildren()) do
            v.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
end

down = false
velocity = Instance.new("BodyVelocity")
velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
gyro = Instance.new("BodyGyro")
gyro.maxTorque = Vector3.new(100000, 0, 100000)

hum = lplr.Character.Humanoid
function onKeyDown()
    down = true
    if lplr.Character:FindFirstChild("Torso") then
        velocity.Parent = lplr.Character.Torso
        gyro.Parent = lplr.Character.Torso
    else
        velocity.Parent = lplr.Character.UpperTorso
        gyro.Parent = lplr.Character.UpperTorso
    end
    velocity.velocity = (hum.MoveDirection) * speedDash
    while down do
        if not down then
            break
        end
        velocity.velocity = (hum.MoveDirection) * speedDash
        local refpos = gyro.Parent.Position + (gyro.Parent.Position - wp.CurrentCamera.CoordinateFrame.p).unit * 5
        gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
        wait(0.1)
    end
end

function onKeyUp()
    velocity.Parent = nil
    gyro.Parent = nil
    down = false
end

lplr.CharacterAdded:Connect(function(characterModel)
    wait(1)
    velocity = Instance.new("BodyVelocity")
    velocity.maxForce = Vector3.new(100000, 0, 100000)
    ---vv Use that to change the speed v
    gyro = Instance.new("BodyGyro")
    gyro.maxTorque = Vector3.new(100000, 0, 100000)

    hum = lplr.Character.Humanoid
    onKeyDown()
end)

function changeDA(typeDA)
    if typeDA == 0 then
        speedDash = speedDash + 2
    elseif typeDA == 1 then
        if speedDash >= 0 then
            speedDash = speedDash - 2
        end
        if speedDash < 0 then
            speedDash = 0
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == " " then
        infJump()
    end
    if keyDown == "l" then
        tpCoin()
    end
    if keyDown == "x" then
        if speedDash == 22 then
            speedDash = 20
            NotifyG("Dash", speedDash)
        else
            speedDash = 22
            NotifyG("Dash", speedDash)
        end
    end
    if keyDown == "[" then
        changeDA(0)
        SendChatG("Dash", speedDash)
    end
    if keyDown == "]" then
        changeDA(1)
        SendChatG("Dash", speedDash)
    end
end)

espFirst()
lightCode()
onKeyDown()

-- Loot.pickaxe b
-- Loot["golden_pocket_watch"]" p
-- Loot["gold_bars"] y
-- Loot["old_slycer"] b
-- Loot.pendant y
-- Loot.laptop r
-- Loot["apocalypse_helmet"] p
-- Loot["welding_goggles"] r
-- Loot.smartphone r
-- Loot.soul y
-- Loot["busted_boombox"] b
-- Loot.binoculars r
-- Loot["golden_compass"] p
-- Loot["green_bottle"] w
-- Loot["gas_can"] w
-- Loot.rope w
-- Loot.tire b
-- Loot["shattered_bottle"] w
-- Loot["treasure_chest"] y
-- Loot["shattered_shades"] w
-- Loot["car_engine"] b
-- Loot["rusty_lantern"] w
-- Loot["broken_bulb"] w
-- Loot.lighter w
-- Loot["broken_bottle"] w
-- Loot["rusty_pipe"] b
-- Loot["rusty_cleaver"] b
-- Loot.trophy r
-- Loot.smartwatch r
-- Loot.gen_1 w