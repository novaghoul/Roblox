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

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.ws_g = 20
_G.jp_g = 30
_G.noclipAll = false
_G.speedEN = false
_G.speedDash = 30

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
TRANSPARENCY = 0.5 --//Transparency of the ESP
HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

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

function checkPart(obj)
    if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name ~= "HumanoidRootPart" then
        return true
    end
end


function actualESP(obj)
    for i = 0, 5 do
        surface = Instance.new("SurfaceGui", obj) --//Creates the SurfaceGui
        surface.Face = Enum.NormalId[_G.faces[i + 1]] --//Adjusts the Face and chooses from the face table
        surface.AlwaysOnTop = true

        frame = Instance.new("Frame", surface) --//Creates the viewable Frame
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 0
        frame.BackgroundTransparency = TRANSPARENCY
        frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1], ENEMYCOLOR[2], ENEMYCOLOR[3]) --//If in another Team
    end
end

function createHealthbar(hrp)
    board = Instance.new("BillboardGui", hrp) --//Creates the BillboardGui with HumanoidRootPart as the Parent
    board.Name = "total"
    board.Size = UDim2.new(1, 0, 1, 0)
    board.StudsOffset = Vector3.new(3, 1, 0)
    board.AlwaysOnTop = true

    bar = Instance.new("Frame", board) --//Creates the red background
    bar.BackgroundColor3 = Color3.new(255, 0, 0)
    bar.BorderSizePixel = 0
    bar.Size = UDim2.new(0.2, 0, 4, 0)
    bar.Name = "total2"

    health = Instance.new("Frame", bar) --//Creates the changing green Frame
    health.BackgroundColor3 = Color3.new(0, 255, 0)
    health.BorderSizePixel = 0
    health.Size = UDim2.new(1, 0, hrp.Parent.Humanoid.Health / 100, 0)
    hrp.Parent.Humanoid.Changed:Connect(
        function(property) --//Triggers when any Property changed
            hrp.total.total2.Frame.Size = UDim2.new(1, 0, hrp.Parent.Humanoid.Health / 100, 0) --//Adjusts the size of the green Frame
        end
    )
end
-- -----------------------------------------------------------------------------------
function checkTeams(gui, o)
    if gui:IsA("TextLabel") then
        if tostring(o.Team) == "Cowboys" then
            gui.TextColor3 = Color3.fromRGB(253, 234, 141)
        else
            gui.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
        o:GetPropertyChangedSignal("Team"):connect(
            function()
                if tostring(o.Team) == "Cowboys" then
                    gui.TextColor3 = Color3.fromRGB(253, 234, 141)
                else
                    gui.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        )
    end
end

function createESP(c) --//Checks and calls the proper function
    local honour = c.Stats.Honour.Value
    local bgui = Instance.new("BillboardGui", c.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = c.DisplayName .. " | " .. tostring(honour) .. "$"
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    checkTeams(nam, c)
    for _, v in pairs(c.Character:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c.Character:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
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
            if o.Character and o.Character:FindFirstChild(_G.hitBoxBody) then
                wait(0.1)
                createHitBox(o)
            end
        end
    end
end
hitBox()

-------------------------------------------------------------
--------------------------Other------------------------------

function createESPItem(parent, r, g, b, fontSize, name)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = name
    nam.BackgroundTransparency = 1
    nam.TextSize = fontSize
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function eventESPOther(parent)
    if tostring(parent.Parent.Name) == "Animals" then
        local int = string.find(tostring(parent.Name), "{")
        local nameThing = string.sub(tostring(parent.Name), 1, int - 1)
        if nameThing == "DeerDoe" or nameThing == "DeerFawn" or nameThing == "DeerBuck" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🦌")
        elseif nameThing == "Coyote" or nameThing == "Wolf" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐶")
        elseif nameThing == "BlackBear" or nameThing == "GrizzlyBear" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐻")
        elseif nameThing == "Bison" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐮")
        elseif nameThing == "DireWolf" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐺✨")
        end
    end
    if tostring(parent.Parent.Name) == "ChestFolder" then
        createESPItem(parent.Model.Union, 242, 243, 243, 14, "🎁")
        parent.Opened:GetPropertyChangedSignal("Value"):connect(
            function()
                local var = parent.Model.Union:FindFirstChild("EGUI")
                if var then
                    var:Destroy()
                end
            end
        )
    end
end

function funcAnimals()
    for _, v in pairs(wp.Animals:GetChildren()) do
        eventESPOther(v)
    end
    wp.Animals.ChildAdded:connect(
        function(m)
            wait(0.1)
            eventESPOther(m)
        end
    )
end
funcAnimals()

function funcChests()
    for _, v in pairs(wp.ChestFolder:GetChildren()) do
        eventESPOther(v)
    end
    wp.ChestFolder.ChildAdded:connect(
        function(m)
            wait(0.1)
            eventESPOther(m)
        end
    )
end
funcChests()

function statsGun()
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' then
            if rawget(v, 'Fire Speed') then
                v["Fire Speed"] = 0.1
                v.Accuracy = 1
                v.Capacity = 100
                -- v.Damage = 100
                v.Reload = 0.1
            end
            if rawget(v, 'GunType') then
                -- v.AutoFire = true
                v.ReloadSpeed = 0.1
                -- v.Damage = 100
                v.equipTime = 0.1
                v.ReloadAnimationSpeed = 0.1
                v.MaxShots = 5
                v.BulletSpeed = 300
            end
            if rawget(v, 'Acceleration') then
                v.Acceleration = 10
                v.Accuracy = 2
                v.Reload = 0.1
                v.Health = 1000
                v.Speed = 100
                v.Stamina = 2
                -- v.Damage = 100
                v["Fire Speed"] = 0.1
            end
        end
    end
end

function funcF()
    statsGun()
    lplr.Backpack.ChildAdded:connect(
        function(m)
            statsGun()
        end
    )
end
funcF()

function infJump()
	uis.JumpRequest:connect(
		function()
			if lplr.Character ~= nil then
				lplr.Character.Humanoid.JumpPower = _G.jp_g
				lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end
	)
end
infJump()


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
        v.velocity = (lplr.Character.Humanoid.MoveDirection) * _G.speedDash
        while d do
            if not d then
                break
            end
            if lplr.Character then
                if lplr.Character:FindFirstChild("UpperTorso") then
                    v.velocity = (lplr.Character.Humanoid.MoveDirection) * _G.speedDash
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
        _G.speedDash = _G.speedDash + 5
    elseif typeDA == 1 then
        if _G.speedDash >= 0 then
            _G.speedDash = _G.speedDash - 5
        end
        if _G.speedDash < 0 then
            _G.speedDash = 0
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "[" then
            changeDA(0)
            notify("Dash :" .. _G.speedDash)
        end
        if keyDown == "]" then
            changeDA(1)
            notify("Dash :" .. _G.speedDash)
        end

        if keyDown == "x" then
            _G.noclipAll = not _G.noclipAll
            notify("Noclip :" .. tostring(_G.noclipAll))
        end

        if keyDown == "z" then
            if _G.speedDash == 30 then
                _G.speedDash = 150
                notify("Dash :" .. _G.speedDash)
            else
                _G.speedDash = 30
                notify("Dash :" .. _G.speedDash)
            end
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

spawn(
	function()
        onButton1Down(_G.velocity, _G.gyro, _G.down)
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