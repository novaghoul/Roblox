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

_G.speedEN = false
_G.speedDash = 100

_G.autoFarmEN = false
_G.mouseClick = false
_G.jp_g = 50

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

wp.Gravity = 40

_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

local multiplier = 1
-- Set this to your multiplier
-- 1 = no ninjutsu boost
-- 2 = 2x ninjutsu boost
-- 4 = 4x ninjutsu boost
--You must have it purchased for this to work that being said if you don't have 2x activated and you set multiplier to 2 this won't work due to anti-exploit

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Ninja Assassin",
            Text = msg,
            Duration = 3
        }
    )
end

ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
TRANSPARENCY = 0.5 --//Transparency of the ESP
HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

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
function createESP(c) --//Checks and calls the proper function
    local bgui = Instance.new("BillboardGui", c.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = c.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, v in pairs(c:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        createESP(characterModel)
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
                        createESP(characterModel)
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
                        createESP(o.Character)
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
    lplr.Character:WaitForChild("Humanoid").Died:Connect(
        function()
            wait(0.5)
            local A_1 = "RandomSpawn"
            local Event = rs.RemoteEvent.SpawnCharacterEvent
            Event:FireServer(A_1)
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            characterModel:WaitForChild("Humanoid").Died:Connect(
                function()
                    wait(0.5)
                    local A_1 = "RandomSpawn"
                    local Event = rs.RemoteEvent.SpawnCharacterEvent
                    Event:FireServer(A_1)
                end
            )
        end
    )
end
firstScript()

-------------------------------------------------------------
--------------------------CMDS-------------------------------
function etool(tool)
    local nameTool = {""}
    if tool == "s" then
        table.insert(nameTool, "Sword")
        table.insert(nameTool, "Shuriken")
    elseif tool == "t" then
        table.insert(nameTool, "Train")
    elseif tool == nil then
        table.insert(nameTool, "Train")
        table.insert(nameTool, "Sword")
        table.insert(nameTool, "Shuriken")
    end
    for _, v in pairs(lplr.Backpack:GetChildren()) do
        for i = 1, #nameTool do
            if tostring(v.Name) == nameTool[i] then
                v.Parent = lplr.Character
            end
        end
    end
end

function eventTool(type)
    if type == "save" then
        for _, v in pairs(lplr.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = lplr
            end
        end
    elseif type == "load" then
        for _, v in pairs(lplr:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = lplr.Backpack
            end
        end
    end
end

local function executeChat(code)
    if string.lower(string.sub(code, 1, 2)) == "/e" then
        local split = {}

        for part in code:gmatch("%S+") do
            table.insert(split, part)
        end

        table.remove(split, 1)

        local command = string.lower(string.sub(split[1], 1))

        local first = split[2]

        if string.find("etool", command) then
            etool(first)
        elseif string.find("etoolall", command) then
            etool(nil)
        elseif string.find("stool", command) then
            eventTool("save")
        elseif string.find("ltool", command) then
            eventTool("load")
        end
    end
end
lplr.Chatted:Connect(executeChat)

-------------------------------------------------------------
--------------------------Auto Farm--------------------------
function autoFarm()
    while _G.autoFarmEN do
        wait()
        etool(nil)
        if lplr.Character:FindFirstChild("Train") then
            lplr.Character.Torso:Remove()
        end
        -- rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 9)
        -- wait(0.1)
        -- rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 10)
        -- wait(0.1)
    end
end

-------------------------------------------------------------
--------------------------Other------------------------------

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

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/TTZxVeAu"), true))() --Humanoid Teleport
    end
)

function statsPlayerJp()
    if wp:FindFirstChild(lplr.Name) then
        lplr.Character.Humanoid.JumpPower = _G.jp_g
        lplr.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(
            function()
                if lplr.Character.Humanoid.JumpPower ~= _G.jp_g then
                    lplr.Character.Humanoid.JumpPower = _G.jp_g
                end
            end
        )
    end

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            lplr.Character.Humanoid.JumpPower = _G.jp_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(
                function()
                    if lplr.Character.Humanoid.JumpPower ~= _G.jp_g then
                        lplr.Character.Humanoid.JumpPower = _G.jp_g
                    end
                end
            )
        end
    )
end
statsPlayerJp()

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

function changeJP(typeJP)
    if typeJP == 0 then
        _G.jp_g = _G.jp_g + 5
        lplr.Character.Humanoid.JumpPower = _G.jp_g
    elseif typeJP == 1 then
        if _G.jp_g >= 50 then
            _G.jp_g = _G.jp_g - 5
            lplr.Character.Humanoid.JumpPower = _G.jp_g
        end
        if _G.jp_g < 50 then
            _G.jp_g = 50
            lplr.Character.Humanoid.JumpPower = _G.jp_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "p" then
            _G.autoFarmEN = not _G.autoFarmEN

            if _G.autoFarmEN then
                notify("Auto Farm : Enable")
            else
                notify("Auto Farm : Disable")
            end

            autoFarm()
        end

        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
        end
    end
)

mouse.Button1Down:connect(
    function()
        _G.mouseClick = true
        while _G.mouseClick do
            if _G.autoFarmEN then
                local eventSword = lplr.Character.Sword.HitEvent
                eventSword:FireServer()

                local A_1 = Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
                local eventShuriken = lplr.Character.Shuriken.HitEvent
                eventShuriken:FireServer(A_1)
            end
            wait(0.1)
        end
    end
)

mouse.Button1Up:connect(
    function()
        _G.mouseClick = false
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new(mouse.X, mouse.y))
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