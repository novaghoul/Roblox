loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.distance = 300
_G.FarmGhoulsEN = false
_G.FarmInvestigatorsEN = false
_G.yBossRange = 11.5
_G.folderBoss = {}
_G.isBoss = false
_G.InfoEN = false
_G.speedDash = 44
_G.rangeon = 400
_G.ws_en = false

velocity = nil
gyro = nil
down = false

if cg:FindFirstChild("RoGhoulGUI") then
    cg["RoGhoulGUI"]:Destroy()
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local RoGhoulGUI = Instance.new("ScreenGui")
local OCB = Instance.new("TextButton")
local MainGUI = Instance.new("Frame")
local Speed = Instance.new("TextButton")
local LB = Instance.new("TextLabel")
local InfoPlayers = Instance.new("TextButton")
local FarmInvestigators = Instance.new("TextButton")
local InfoGUI = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local FarmGhouls = Instance.new("TextButton")

-- Properties:

RoGhoulGUI.Name = "RoGhoulGUI"
RoGhoulGUI.Parent = cg
RoGhoulGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OCB.Name = "OCB"
OCB.Parent = RoGhoulGUI
OCB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OCB.BorderSizePixel = 0
OCB.Position = UDim2.new(0, 0, 0.800000012, 0)
OCB.Size = UDim2.new(0, 50, 0, 25)
OCB.Font = Enum.Font.SourceSans
OCB.Text = "Open"
OCB.TextColor3 = Color3.fromRGB(255, 255, 255)
OCB.TextSize = 14.000

MainGUI.Name = "MainGUI"
MainGUI.Parent = RoGhoulGUI
MainGUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainGUI.BackgroundTransparency = 0.500
MainGUI.BorderSizePixel = 0
MainGUI.Position = UDim2.new(0.0789636001, 0, 0.285012275, 0)
MainGUI.Size = UDim2.new(0, 260, 0, 105)
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true

Speed.Name = "Speed"
Speed.Parent = MainGUI
Speed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0, 135, 0, 35)
Speed.Size = UDim2.new(0, 100, 0, 25)
Speed.Font = Enum.Font.SourceSans
Speed.Text = "Speed"
Speed.TextColor3 = Color3.fromRGB(0, 0, 0)
Speed.TextSize = 14.000

LB.Name = "LB"
LB.Parent = MainGUI
LB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LB.BackgroundTransparency = 0.500
LB.Size = UDim2.new(0, 260, 0, 25)
LB.Font = Enum.Font.SourceSans
LB.Text = "Ro Ghoul"
LB.TextColor3 = Color3.fromRGB(255, 255, 255)
LB.TextSize = 14.000

InfoPlayers.Name = "InfoPlayers"
InfoPlayers.Parent = MainGUI
InfoPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoPlayers.BorderSizePixel = 0
InfoPlayers.Position = UDim2.new(0, 135, 0, 70)
InfoPlayers.Size = UDim2.new(0, 100, 0, 25)
InfoPlayers.Font = Enum.Font.SourceSans
InfoPlayers.Text = "Click Info Players"
InfoPlayers.TextColor3 = Color3.fromRGB(0, 0, 0)
InfoPlayers.TextSize = 14.000

FarmInvestigators.Name = "FarmInvestigators"
FarmInvestigators.Parent = MainGUI
FarmInvestigators.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FarmInvestigators.BorderSizePixel = 0
FarmInvestigators.Position = UDim2.new(0, 25, 0, 70)
FarmInvestigators.Size = UDim2.new(0, 100, 0, 25)
FarmInvestigators.Font = Enum.Font.SourceSans
FarmInvestigators.Text = "Farm Investigators"
FarmInvestigators.TextColor3 = Color3.fromRGB(0, 0, 0)
FarmInvestigators.TextSize = 14.000

InfoGUI.Name = "InfoGUI"
InfoGUI.Parent = MainGUI
InfoGUI.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InfoGUI.BackgroundTransparency = 0.500
InfoGUI.BorderSizePixel = 0
InfoGUI.Position = UDim2.new(0, 0, 0, 106)
InfoGUI.Size = UDim2.new(0, 260, 0, 200)
InfoGUI.CanvasSize = UDim2.new(0, 0, 2.5, 0)

UIListLayout.Parent = InfoGUI

FarmGhouls.Name = "FarmGhouls"
FarmGhouls.Parent = MainGUI
FarmGhouls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FarmGhouls.BorderSizePixel = 0
FarmGhouls.Position = UDim2.new(0, 25, 0, 35)
FarmGhouls.Size = UDim2.new(0, 100, 0, 25)
FarmGhouls.Font = Enum.Font.SourceSans
FarmGhouls.Text = "Farm Ghouls"
FarmGhouls.TextColor3 = Color3.fromRGB(0, 0, 0)
FarmGhouls.TextSize = 14.000

local TextInfo = Instance.new("TextLabel")

TextInfo.Name = "TextInfo"
TextInfo.Parent = UIListLayout
TextInfo.BackgroundColor3 = Color3.new(1, 1, 1)
TextInfo.BackgroundTransparency = 1
TextInfo.BorderSizePixel = 0
TextInfo.Size = UDim2.new(0, 330, 0, 20)
TextInfo.Font = Enum.Font.SourceSans
TextInfo.TextColor3 = Color3.new(1, 1, 1)
TextInfo.TextScaled = true
TextInfo.TextSize = 14
TextInfo.TextWrapped = true
TextInfo.TextXAlignment = Enum.TextXAlignment.Left

if cg:FindFirstChild("Notify") then
    cg["Notify"]:Destroy()
end

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
MainNotify.Visible = false

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

OCB.MouseButton1Down:connect(function()
    if On == false then
        MainGUI.Visible = true
        OCB.Text = "Close"
        On = true
    else
        MainGUI.Visible = false
        OCB.Text = "Open"
        On = false
    end
end)

function createInfoPlayer(string)
    local copy = TextInfo:Clone()
    copy.Parent = InfoGUI
    copy.Text = tostring(string)
end

InfoPlayers.MouseButton1Down:connect(function()
    if tostring(_G.InfoEN) == "false" then
        _G.InfoEN = true
        mouse.Button1Down:connect(function()
            if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
                return
            end
            if not mouse.Target then
                return
            end
            if mouse.Target.Locked == true then
                mouse.Target.Locked = false
            end

            local tp = mouse.Target

            while not tp:FindFirstChild("Humanoid") and tostring(tp.Parent) ~= "Workspace" do
                tp = tp.Parent
            end

            if tp:FindFirstChild("Humanoid") and plrs:FindFirstChild(tp.Name) then
                for _, instance in pairs(InfoGUI:GetChildren()) do
                    if instance:IsA("TextLabel") then
                        instance:Destroy()
                    end
                end
                local plrr = plrs:FindFirstChild(tp.Name)
                createInfoPlayer("--------------Start----------------")
                createInfoPlayer("" .. plrr.Name)
                createInfoPlayer("------->")
                createInfoPlayer(" Weapon's name = " .. tostring(plrr.PlayerFolder.Customization.Weapon.Value))
                for _, v in pairs(plrr.PlayerFolder.Stats:GetChildren()) do
                    createInfoPlayer(" " .. v.Name .. " = " .. v.Value)
                end
                createInfoPlayer("---------------END-----------------")
            end
        end)
    end
end)

_G.enemy = nil
_G.poson = lplr.Character.HumanoidRootPart.Position
_G.pfs = game:GetService("PathfindingService")
_G.closest = math.huge

function attack(entity)
    if entity then
        if (lplr.Character:FindFirstChild("HumanoidRootPart") and _G.enemy:FindFirstChild("Case")) then
            wait()
            local ehrp = _G.enemy:FindFirstChild("HumanoidRootPart")
            if ehrp ~= nil and (ehrp.Position - lplr.Character.HumanoidRootPart.Position).magnitude > _G.distance then
                local path = _G.pfs:FindPathAsync(lplr.Character.HumanoidRootPart.Position, _G.enemy:FindFirstChild("HumanoidRootPart").Position)
                local points = path:GetWaypoints()
                for _, v in pairs(points) do
                    wait()
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position) * CFrame.new(0, 5, 0)
                end
            elseif lplr.Character:FindFirstChild("HumanoidRootPart") then
                wait()
                if _G.enemy:FindFirstChild("HumanoidRootPart") ~= nil then
                    lplr.Character.HumanoidRootPart.CFrame = _G.enemy:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 5, 0)
                end
            end
        end
    end
end

FarmGhouls.MouseButton1Down:connect(function()
    _G.FarmGhoulsEN = not _G.FarmGhoulsEN

    if _G.FarmInvestigatorsEN then
        _G.FarmInvestigatorsEN = false
    end

    wait(0.1)
    if tostring(_G.FarmGhoulsEN) == "true" then
        FarmGhouls.Text = "Stop"
    else
        FarmGhouls.Text = "Farm Ghouls"
    end

    if tostring(_G.FarmGhoulsEN) == "true" then
        while wait(1) do
            for _, v in pairs(wp.NPCSpawns:GetChildren()) do
                local npc = v:GetChildren()[1]
                if (npc and npc:FindFirstChild("Hood") and npc:FindFirstChild("Mask")) then
                    local mag = (npc:FindFirstChild("HumanoidRootPart").Position -
                                    lplr.Character.HumanoidRootPart.Position).magnitude
                    if mag <= _G.rangeon then
                        _G.closest = mag
                        _G.enemy = npc

                        if tostring(lplr.PlayerFolder.Customization.Team.Value) == "CCG" then
                            _G.enemy.ChildAdded:connect(function(p)
                                if string.find(string.lower(p.Name), string.lower("Corpse")) then
                                    wait(0.2)
                                    for _, v in pairs(p:GetChildren()) do
                                        if v.Name ~= "ClickPart" then
                                            v:Destroy()
                                        end
                                    end
                                end
                            end)
                        end
                        while _G.enemy and _G.enemy:FindFirstChild("Mask") do
                            wait(0.1)
                            if tostring(_G.FarmGhoulsEN) == "false" then
                                break
                            end
                            attack(_G.enemy)
                        end
                        if _G.enemy[_G.enemy.Name .. " " .. "Corpse"]:FindFirstChild("ClickPart") then
                            lplr.Character.HumanoidRootPart.CFrame =
                                _G.enemy[_G.enemy.Name .. " " .. "Corpse"].ClickPart.CFrame * CFrame.new(0, dis, 0)
                        end
                        wait(1)
                        if (_G.poson - lplr.Character.HumanoidRootPart.Position).magnitude > _G.distance then
                            local path = _G.pfs:FindPathAsync(lplr.Character.HumanoidRootPart.Position, _G.poson)
                            local points = path:GetWaypoints()

                            for _, v in pairs(points) do
                                wait()
                                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                            end
                        elseif lplr.Character:FindFirstChild("HumanoidRootPart") then
                            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(_G.poson)
                        end
                    end
                end
            end
            if tostring(_G.FarmGhoulsEN) == "false" then
                break
            end
        end
    end
end)

FarmInvestigators.MouseButton1Down:connect(function()
    _G.FarmInvestigatorsEN = not _G.FarmInvestigatorsEN

    if _G.FarmGhoulsEN then
        _G.FarmGhoulsEN = false
    end

    wait(0.1)

    if tostring(_G.FarmInvestigatorsEN) == "true" then
        FarmInvestigators.Text = "Stop"
    else
        FarmInvestigators.Text = "Farm Investigators"
    end

    if tostring(_G.FarmInvestigatorsEN) == "true" then
        while wait() do
            wait(1)
            for _, v in pairs(wp.NPCSpawns:GetChildren()) do
                local npc = v:GetChildren()[1]
                if (npc and npc:FindFirstChild("Case") and npc:FindFirstChild("HumanoidRootPart")) then
                    local mag = (npc:FindFirstChild("HumanoidRootPart").Position -
                                    lplr.Character.HumanoidRootPart.Position).magnitude
                    if mag <= _G.rangeon then
                        _G.closest = mag
                        _G.enemy = npc
                        while _G.enemy and _G.enemy:FindFirstChild("Case") do
                            wait(0.1)
                            if tostring(_G.FarmInvestigatorsEN) == "false" then
                                break
                            end
                            attack(_G.enemy)
                        end
                        if _G.enemy[_G.enemy.Name .. " " .. "Corpse"]:FindFirstChild("ClickPart") then
                            lplr.Character.HumanoidRootPart.CFrame =
                                _G.enemy[_G.enemy.Name .. " " .. "Corpse"].ClickPart.CFrame * CFrame.new(0, dis, 0)
                        end
                        wait(1)
                        if (posoff - lplr.Character.HumanoidRootPart.Position).magnitude > _G.distance then
                            local path = _G.pfs:FindPathAsync(lplr.Character.HumanoidRootPart.Position, posoff)
                            local points = path:GetWaypoints()

                            for _, v in pairs(points) do
                                wait()
                                lplr.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                            end
                        elseif lplr.Character:FindFirstChild("HumanoidRootPart") then
                            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(posoff)
                        end
                    end
                end
            end
            if tostring(_G.FarmInvestigatorsEN) == "false" then
                break
            end
        end
    end
end)

local speedEN = false
Speed.MouseButton1Down:connect(function()
    down = false
    if not lplr.Character.UpperTorso:FindFirstChild("velocity") then
        velocity = Instance.new("BodyVelocity")
        velocity.maxForce = Vector3.new(100000, 0, 100000)
        ---vv Use that to change the speed v
        gyro = Instance.new("BodyGyro")
        gyro.maxTorque = Vector3.new(100000, 0, 100000)
    end

    function onButton1Down(v, g, d)
        d = true
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
            v.velocity = (lplr.Character.Humanoid.MoveDirection) * _G.speedDash
            local refpos = g.Parent.Position + (g.Parent.Position - wp.CurrentCamera.CoordinateFrame.p).unit * 5
            g.cframe = CFrame.new(g.Parent.Position, Vector3.new(refpos.x, g.Parent.Position.y, refpos.z))
            wait(0.1)
        end
    end

    function onButton1Up(v, g, d)
        v.Parent = nil
        g.Parent = nil
        d = false
    end

    lplr.CharacterAdded:Connect(function(characterModel)
        down = false
        wait(0.1)
        velocity = Instance.new("BodyVelocity")
        velocity.maxForce = Vector3.new(100000, 0, 100000)
        ---vv Use that to change the speed v
        gyro = Instance.new("BodyGyro")
        gyro.maxTorque = Vector3.new(100000, 0, 100000)

        onButton1Down(velocity, gyro, down)
    end)

    
    onButton1Down(velocity, gyro, down)
end)

--------------------------------- Other -----------------------------------
---------------------------------------------------------------------------
function firstScript()
    bossIs = false
    -- ChildRemoved:connect
    for _, v in pairs(wp.NPCSpawns:GetChildren()) do
        if tostring(v.Name) == "BossSpawns" then
            table.insert(_G.folderBoss, v)
        end
    end

    function bossEvent(parent)
        if parent then
            -- MainNotify.Visible = true
            wait(1)
            
            local bgui = Instance.new("BillboardGui", parent.Head)
            bgui.Name = ("EGUI")
            bgui.AlwaysOnTop = true
            bgui.ExtentsOffset = Vector3.new(0, 3, 0)
            bgui.Size = UDim2.new(0, 200, 0, 50)
            local namBoss = Instance.new("TextLabel", bgui)
            namBoss.Text = tostring(parent.Name .. " : " .. parent.Humanoid.Health)
            namBoss.BackgroundTransparency = 1
            namBoss.TextSize = 14
            namBoss.Font = ("Arial")
            namBoss.TextColor3 = Color3.fromRGB(241, 196, 15)
            namBoss.Size = UDim2.new(0, 200, 0, 50)
            while parent.Parent ~= nil and parent and parent:FindFirstChild("Humanoid") and parent:FindFirstChild("Kagune") do
                wait(0.1)
                namBoss.Text = tostring(parent.Name .. " : " .. parent.Humanoid.Health)
                -- lblbossmes.Text = tostring("Eto : " .. tostring(parent.Humanoid.Health))
            end
            -- MainNotify.Visible = false
        end
    end

    for index = 1, #_G.folderBoss do
        _G.folderBoss[index].ChildAdded:connect(function(m)
            bossEvent(m)
        end)
        local npc = _G.folderBoss[index]:GetChildren()[1]
        bossEvent(npc)
    end

    print("Scan Boss Done")
end

--------------------------------- ESP -------------------------------------
---------------------------------------------------------------------------

function checkESP(parent)
    local numEGUI = 0
    for _, v in pairs(parent.Character.Head:GetChildren()) do
        if v.Name == "EGUI" then
            numEGUI = numEGUI + 1
        end
    end

    if numEGUI < 7 then
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
                pcall(function()
                    if tostring(parent.PlayerFolder.Customization.Team.Value) == "Ghoul" then
                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                    elseif tostring(parent.PlayerFolder.Customization.Team.Value) == "CCG" then
                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end)
            end
        end
    end
    pcall(function()
        if tostring(parent.PlayerFolder.Customization.Team.Value) == "Ghoul" then
            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        elseif tostring(parent.PlayerFolder.Customization.Team.Value) == "CCG" then
            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                repeat
                    wait()
                until characterModel:FindFirstChild("Head")
                wait(0.1)
                createESP(o)
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        if newPlayer.Name ~= lplr.Name then
            newPlayer.CharacterAdded:Connect(function(characterModel)
                repeat
                    wait()
                until characterModel:FindFirstChild("Head")
                wait(0.1)
                checkESP(newPlayer)
            end)
        end
    end)
end
enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(function()
                repeat
                    wait()
                until o.Character:FindFirstChild("Head")
                wait(0.1)
                createESP(o)
            end)
        end
    end
end
espFirst()

function infJump()
    uis.JumpRequest:connect(function()
        if lplr.Character ~= nil then
            -- lplr.Character.Humanoid.JumpPower = jump
            lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end
infJump()

local PartBoss = nil
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "x" then
        if _G.ws_en then
            _G.ws_en = false
            _G.speedDash = 50
        else
            _G.ws_en = true
            _G.speedDash = 150
        end
    end

    if keyDown == "k" then
        for _, o in pairs(plrs:GetPlayers()) do
            if o.Name ~= lplr.Name then
                if o.Character ~= nil then
                    checkESP(o)
                end
            end
        end
    end

    if keyDown == "l" then
        _G.isBoss = not _G.isBoss
        if _G.isBoss == true then
            local Part = Instance.new("Part")
            Part.Name = "PartKillBoss"
            Part.Parent = wp
            Part.Size = Vector3.new(10, _G.yBossRange, 10)
            Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -20)
            PartBoss = Part
        else
            PartBoss:Destroy()
        end
    end
end)
spawn(firstScript())
