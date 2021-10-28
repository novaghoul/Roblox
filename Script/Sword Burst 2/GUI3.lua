--[[

Instructions:

Step 1: Start up your exploit.
Step 2: Load the script.
Step 3: Make any edits i.e. monsters or whatever depending on what floor your etc.
Step 4: Change for both scripts I.e. Auto_Dismantle allows you to auto farm crystals by automatically dismantling items.
Step 5: Save the edited version i.e. notepad ++ or whatever you use.
Step 6: Run script.
Step 7: Activate noclip by simply press the noclip and then press '1' to use it. Do not have to click again when dead. (Thankfully)
Step 8: Enjoy the script and farming. 

P.S. Don't come @ me with the UI is trash or simple or whatnot I'm new to making UI's but any positive feedback or critical to improve on future GUI highly appreciated. 

--]]
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

_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}
_G.farm = true

local Rawr = {}
local Api = {}
local Log = {}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

function Rawr:Check(...) --secret sauce
    local args = {...}

    if lplr.Character and lplr.Character.PrimaryPart and args[1]:lower() == "cframe" then
        --player.Character = Api.FakeCharacter
        lplr.Character.RobloxLocked = true
        wait(Api.GetSetting("rawr_bypass_speed"))
        lplr.Character:SetPrimaryPartCFrame(args[2])
        wait(Api.GetSetting("rawr_bypass_speed"))
        --player.Character = character
        lplr.Character.RobloxLocked = false
    end
end
-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local SwordBurst2_GUI = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local MainFrame = Instance.new("Frame")
local SimpleA = Instance.new("Frame")
local NameOfGui = Instance.new("TextLabel")
local SimpleB = Instance.new("Frame")
local CreditOfGui = Instance.new("TextLabel")
local SimpleC = Instance.new("Frame")
local Notice = Instance.new("TextLabel")
local Activate_Noclip = Instance.new("TextButton")
local AutoFarming_Wad = Instance.new("TextButton")
local AutoFarming_WOad = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Noclip_OFF = Instance.new("TextButton")
--Properties:
SwordBurst2_GUI.Name = "SwordBurst2_GUI"
SwordBurst2_GUI.Parent = cg

Open.Name = "Open"
Open.Parent = SwordBurst2_GUI
Open.BackgroundColor3 = Color3.new(0, 0, 0)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(-0.000808395096, 0, 0.694079041, 0)
Open.Size = UDim2.new(0, 96, 0, 34)
Open.Font = Enum.Font.Fantasy
Open.Text = "Open"
Open.TextColor3 = Color3.new(0.666667, 1, 0)
Open.TextSize = 18
Open.MouseButton1Down:connect(
    function()
        if MainFrame.Visible == true then
            MainFrame.Visible = false
            Open.Text = "Open"
        else
            MainFrame.Visible = true
            Open.Text = "Close"
        end
    end
)

MainFrame.Name = "MainFrame"
MainFrame.Parent = SwordBurst2_GUI
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.20000000298023
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.297493935, 0, 0.233552635, 0)
MainFrame.Size = UDim2.new(0, 500, 0, 323)
MainFrame.Visible = false
MainFrame.Draggable = true

SimpleA.Name = "SimpleA"
SimpleA.Parent = MainFrame
SimpleA.BackgroundColor3 = Color3.new(1, 0, 0)
SimpleA.BorderColor3 = Color3.new(1, 0, 0)
SimpleA.BorderSizePixel = 0
SimpleA.Position = UDim2.new(-0.000506042503, 0, 0, 0)
SimpleA.Size = UDim2.new(0, 500, 0, 22)

NameOfGui.Name = "NameOfGui"
NameOfGui.Parent = SimpleA
NameOfGui.BackgroundColor3 = Color3.new(1, 0, 0)
NameOfGui.BorderSizePixel = 0
NameOfGui.Position = UDim2.new(0.300000012, 0, 0, 0)
NameOfGui.Size = UDim2.new(0, 200, 0, 22)
NameOfGui.Font = Enum.Font.Fantasy
NameOfGui.Text = "Sword Burst 2 (SB2)"
NameOfGui.TextColor3 = Color3.new(1, 1, 1)
NameOfGui.TextSize = 25

SimpleB.Name = "SimpleB"
SimpleB.Parent = MainFrame
SimpleB.BackgroundColor3 = Color3.new(1, 0, 0)
SimpleB.BorderColor3 = Color3.new(1, 0, 0)
SimpleB.BorderSizePixel = 0
SimpleB.Position = UDim2.new(-0.000506042503, 0, 0.931888521, 0)
SimpleB.Size = UDim2.new(0, 500, 0, 22)

CreditOfGui.Name = "CreditOfGui"
CreditOfGui.Parent = SimpleB
CreditOfGui.BackgroundColor3 = Color3.new(1, 0, 0)
CreditOfGui.BorderSizePixel = 0
CreditOfGui.Position = UDim2.new(0.000506103504, 0, 0, 0)
CreditOfGui.Size = UDim2.new(0, 493, 0, 22)
CreditOfGui.Font = Enum.Font.Fantasy
CreditOfGui.Text = "UI by: OGDxK | Script By: Methode, Edited By: ZombieRushFan"
CreditOfGui.TextColor3 = Color3.new(1, 1, 1)
CreditOfGui.TextSize = 18

SimpleC.Name = "SimpleC"
SimpleC.Parent = MainFrame
SimpleC.BackgroundColor3 = Color3.new(1, 0, 0)
SimpleC.BorderColor3 = Color3.new(1, 0, 0)
SimpleC.BorderSizePixel = 0
SimpleC.Position = UDim2.new(-0.000506042503, 0, 0.770897806, 0)
SimpleC.Size = UDim2.new(0, 500, 0, 22)

Notice.Name = "Notice"
Notice.Parent = SimpleC
Notice.BackgroundColor3 = Color3.new(1, 0, 0)
Notice.BorderSizePixel = 0
Notice.Position = UDim2.new(0.000506103504, 0, 0, 0)
Notice.Size = UDim2.new(0, 499, 0, 22)
Notice.Font = Enum.Font.Fantasy
Notice.Text = "Notice: Be sure to edit Script to the monsters you want to kill."
Notice.TextColor3 = Color3.new(1, 1, 1)
Notice.TextSize = 16

Activate_Noclip.Name = "Activate_Noclip"
Activate_Noclip.Parent = MainFrame
Activate_Noclip.BackgroundColor3 = Color3.new(1, 0.0666667, 0)
Activate_Noclip.Position = UDim2.new(0.284670949, 0, 0.44475624, 0)
Activate_Noclip.Size = UDim2.new(0, 211, 0, 34)
Activate_Noclip.Font = Enum.Font.Gotham
Activate_Noclip.Text = "Enable_Noclip"
Activate_Noclip.TextColor3 = Color3.new(1, 1, 1)
Activate_Noclip.TextSize = 11
Activate_Noclip.MouseButton1Down:connect(
    function()
        mouse.KeyDown:connect(
            function(keyDown)
                if keyDown == "f" then
                    _G.noclipAll = not _G.noclipAll
                    noclipEvent()
                end
            end
        )
        Activate_Noclip.Enabled = false
    end
)

AutoFarming_Wad.Name = "AutoFarming_W/ad"
AutoFarming_Wad.Parent = MainFrame
AutoFarming_Wad.BackgroundColor3 = Color3.new(1, 0.0666667, 0)
AutoFarming_Wad.BorderSizePixel = 0
AutoFarming_Wad.Position = UDim2.new(0.285274804, 0, 0.150638551, 0)
AutoFarming_Wad.Size = UDim2.new(0, 211, 0, 34)
AutoFarming_Wad.Font = Enum.Font.Gotham
AutoFarming_Wad.Text = "AutoFarming with AutoDismantle"
AutoFarming_Wad.TextColor3 = Color3.new(1, 1, 1)
AutoFarming_Wad.TextSize = 11
AutoFarming_Wad.MouseButton1Down:connect(
    function()
        function Log:Init()
            local Profile = rs.Profiles[Api.GetPlayer().Name]
            local Vel = Profile.Stats.Vel
            local LastVel = Vel.Value
            Log.Earned = {
                Vel = 0,
                Items = {}
            }
            Profile.Inventory.ChildAdded:Connect(
                function(item)
                    table.insert(Log.Earned.Items, item.Name)
                    if (Api.GetSetting("auto_dismantle") == true) then
                        Api.Dismantle(item.Name)
                    end
                end
            )
            Vel.Changed:Connect(
                function()
                    local earn = Vel.Value - LastVel
                    LastVel = Vel.Value
                    Log.Earned.Vel = Log.Earned.Vel + earn
                end
            )
        end

        function Api.GetPlayer()
            return game:GetService("Players").LocalPlayer
        end

        function Api.Dismantle(name)
            game.ReplicatedStorage.Event:FireServer(
                "Equipment",
                {
                    "Dismantle",
                    game:GetService("ReplicatedStorage").Profiles[Api.GetPlayer().Name].Inventory[name]
                }
            )
        end

        function Api.Replicate(object)
            local Model = Instance.new("Model")
            Model.Name = object.Name
            for _, child in pairs(object:GetChildren()) do
                local c = child:Clone()
                c.Parent = Model
            end
            if (object.PrimaryPart) then
                Model.PrimaryPart = Model[object.PrimaryPart.Name]
            end
            return Model
        end

        function Api.GetCharacter()
            return Api.Character or lplr.Character
        end

        function Api.GetEntity(model)
            return model:FindFirstChild("Entity")
        end

        function Api.Settings(...)
            Api.Settings = {}
            for name, value in pairs(...) do
                Api.Settings[name] = value
            end
        end

        function Api.GetSetting(name)
            return Api.Settings[name]
        end

        function Api.IsValid(model)
            if
                (model.PrimaryPart and model:FindFirstChild("Entity") and model.Entity:FindFirstChild("Health") and
                    model.Parent ~= nil and
                    model:FindFirstChild("Nameplate"))
             then
                return true
            end
        end

        function Api.GetPlayerDistances(model)
            local localPlayer = Api.GetPlayer()
            local distances = {}
            for _, player in pairs(lplr:GetPlayers()) do
                if
                    (player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                        model:FindFirstChild("HumanoidRootPart"))
                 then
                    distances[player.Name] =
                        (model.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
                end
            end
            return distances
        end

        function Api.CheckNear(monster)
            if (Api.GetSetting("avoid_players_nearby")["Enabled"] == true) then
                local max_distance = Api.GetSetting("avoid_players_nearby")["Distance"]
                local distances = Api.GetPlayerDistances(monster)
                for player, distance in pairs(distances) do
                    if (distance <= max_distance) then
                        return false
                    end
                end
            end
            return true
        end

        function Api.CheckBlacklist(monster)
            for _, blacklist in pairs(Api.Blacklist) do
                if (monster == blacklist) then
                    return false
                end
            end
            return true
        end

        function Api.GetMonsters()
            local targets = {}
            for _, monster in pairs(wp.Mobs:GetChildren()) do
                local entity = monster:FindFirstChildOfClass("Folder")
                local filterApplied = false
                --local distanceCheck = Api.CheckNear(monster)
                if (monster.PrimaryPart and Api.IsValid(monster) and Api.CheckBlacklist(monster)) then
                    if (Api.GetSetting("monster_filter")["Enabled"] == true) then
                        if
                            (entity.Health.Value >= Api.GetSetting("monster_filter")["max_monster_health"] and
                                entity.Exp.Value >= Api.GetSetting("monster_filter")["min_exp_earned"])
                         then
                            table.insert(targets, monster)
                        end
                        filterApplied = true
                    elseif (Api.GetSetting("target_specific_enemy").Enabled == true) then
                        if
                            (Api.GetSetting("target_specific_enemy").Names[monster.Nameplate.SurfaceGui.TextLabel.Text] ==
                                true)
                         then
                            table.insert(targets, monster)
                        end
                        filterApplied = true
                    end
                    if (filterApplied == false) then
                        table.insert(targets, monster)
                    end
                end
            end
            return targets
        end

        function Api:Connect()
            local player = Api.GetPlayer()
            local character = Api.GetCharacter()
            local setupCharacter = function(character)
                Api.FakeCharacter = Api.Replicate(character)
            end

            setupCharacter(character)
            player.CharacterAdded:Connect(setupCharacter)
        end

        hu = game.Players.LocalPlayer.Character.Humanoid
        local l = Instance.new("Humanoid")
        l.Parent = game.Players.LocalPlayer.Character
        l.RigType = "R15"
        l.Name = "Humanoid"
        wait(0.1)
        hu.Parent = game.Players.LocalPlayer
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        wait(0.5)
        --not Mine, by Mortalkombatman2, modified by ZombieRushFan
        function Api.BigHitbox()
            for i, v in pairs(game.Workspace.Mobs:children()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    local bodyforce = Instance.new("BodyForce")
                    bodyforce.Parent = v.HumanoidRootPart
                    v.HumanoidRootPart.Size =
                        Vector3.new(Api.GetSetting("hbx"), Api.GetSetting("hby"), Api.GetSetting("hbz"))
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.BodyForce.force =
                        Vector3.new(0, game.workspace.Gravity, 0) * v.HumanoidRootPart:GetMass()
                end
            end
        end

        function Api:SetKeys()
            game:GetService("UserInputService").InputBegan:connect(
                function(Key)
                    if (Key.KeyCode == Api.GetSetting("stop_key")) then
                        Api.Enabled = false
                    elseif (Key.KeyCode == Api.GetSetting("pause_key")) then
                        Api.Paused = true
                    elseif (Key.KeyCode == Api.GetSetting("unpause_key")) then
                        Api.Paused = false
                    end
                end
            )
        end
        --[[
CREATED BY Methode @v3rmillion
MODIFIED BY ZombieRushFan @v3rmillion || Styler12#2196 || Sealtiel Dy @FB
]]
        function Api:Init()
            Api.Blacklist = {}
            Api.Start = tick()
            Api.Paused = false
            Api.CanClick = false
            Api.Enabled = true
            local cooldowncounter = 0
            while wait() and Api.Enabled and _G.farm == true do
                if (Api.Paused == false) then
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(116, 960, 23865)) --F10 Boss
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(12400, 540, -3380)) --F9 Boss
                    for _, monster in pairs(Api.GetMonsters()) do
                        if (Api.IsValid(monster) and Api.Enabled and _G.farm == true) then -- recheck
                            local entity = Api.GetEntity(monster)
                            local base = entity.Health.Value
                            entity.Health.Changed:Connect(
                                function()
                                    if (entity.Health.Value == base) then
                                        dontBreak = false
                                    end
                                end
                            )
                            Api.BigHitbox()
                            dontBreak = true
                            local timer = 0
                            while dontBreak and Api.Enabled do
                                if (Api.Paused == false) then
                                    local thisTime = wait()
                                    wait(thisTime)
                                    timer = timer + thisTime
                                    if (timer >= Api.GetSetting("timeout")["time"]) then
                                        warn("Timeout exceeded!")
                                        if (Api.GetSetting("timeout")["blacklist_monster_after_timeout"] == true) then
                                            table.insert(Api.Blacklist, monster)
                                        end
                                        break
                                    end
                                    if (Api.IsValid(monster) and entity.Health.Value > 0 and _G.farm == true) then
                                        local character = Api.GetCharacter()
                                        if (character) then
                                            character:SetPrimaryPartCFrame(
                                                monster:GetPrimaryPartCFrame() *
                                                    CFrame.Angles(
                                                        math.rad(Api.GetSetting("rocX")),
                                                        math.rad(Api.GetSetting("rocY")),
                                                        math.rad(Api.GetSetting("rocZ"))
                                                    ) *
                                                    CFrame.new(
                                                        Api.GetSetting("dfmX"),
                                                        Api.GetSetting("dfmY"),
                                                        Api.GetSetting("dfmZ")
                                                    )
                                            )
                                        end
                                    else
                                        Api.CanClick = true
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        Api.Settings(
            {
                ["start_delay"] = 1,
                ["stop_key"] = Enum.KeyCode.Escape,
                ["pause_key"] = Enum.KeyCode.RightAlt,
                ["unpause_key"] = Enum.KeyCode.RightControl,
                ["rawr_bypass_speed"] = 0.0, -- 0.1
                ["swap_monster_speed"] = 0.0, -- 0.05,
                ["click_break_speed"] = 0.01,
                ["auto_dismantle"] = true,
                ["hbx"] = 15, -- size of hitbox X-Axis
                ["hby"] = 35, -- size of hitbox Y-Axis
                ["hbz"] = 15, -- size of hitbox Z-Axis
                ["rocX"] = 0, -- rotation of character based on X-Axis
                ["rocY"] = 0, -- rotation of character based on Y-Axis
                ["rocZ"] = 0, -- rotation of character based on Z-Axis
                ["dfmX"] = 0, -- distance from the mob in X-Axis based on rotation
                ["dfmY"] = -15, -- distance from the mob in Y-Axis based on rotation
                ["dfmZ"] = 0, -- distance from the mob in Z-Axis based on rotation
                ["timeout"] = {
                    ["time"] = 45,
                    ["blacklist_monster_after_timeout"] = false
                },
                ["monster_filter"] = {
                    ["Enabled"] = false,
                    ["max_monster_health"] = 0,
                    ["min_exp_earned"] = 1
                },
                ["avoid_players_nearby"] = {
                    ["Enabled"] = false,
                    ["Distance"] = 200
                },
                ["target_specific_enemy"] = {
                    ["Enabled"] = true,
                    ["Names"] = {
                        ["Grim the Overseer"] = false,
                        ["Baal"] = false,
                        ["Shady Villager"] = false,
                        ["Winged Minion"] = false,
                        ["Wendigo"] = false,
                        ["Clay Giant"] = false,
                        ["Undead Warrior"] = false,
                        ["Mortis the Flaming Sear"] = false,
                        ["Ent"] = false,
                        ["Patrolman Elite"] = false,
                        ["Centaurian Defender"] = false,
                        ["Sa'jun the Centurian Chieftain"] = false,
                        ["Fire Scorpion"] = false,
                        ["Formaug the Jungle Giant"] = false,
                        ["Hippogriff"] = false,
                        ["Wingless Hippogriff"] = false,
                        ["Petal Knight"] = false,
                        ["Dungeon Crusador"] = false,
                        ["Sky Raven"] = false,
                        ["Reptasaurus"] = true,
                        ["Polyserpant"] = true,
                        ["Gargoyle Reaper"] = true
                    }
                }
            }
        )

        Api:SetKeys()
        Api:Connect()
        Log:Init()
        Api:Init()
    end
)

AutoFarming_WOad.Name = "AutoFarming_WO/ad"
AutoFarming_WOad.Parent = MainFrame
AutoFarming_WOad.BackgroundColor3 = Color3.new(1, 0.0666667, 0)
AutoFarming_WOad.BorderSizePixel = 0
AutoFarming_WOad.Position = UDim2.new(0.285274804, 0, 0.29798761, 0)
AutoFarming_WOad.Size = UDim2.new(0, 211, 0, 34)
AutoFarming_WOad.Font = Enum.Font.Gotham
AutoFarming_WOad.Text = "AutoFarming without AutoDismantle"
AutoFarming_WOad.TextColor3 = Color3.new(1, 1, 1)
AutoFarming_WOad.TextSize = 11
AutoFarming_WOad.MouseButton1Down:connect(
    function()

        function Rawr:Check(...) --secret sauce
            local player = Api.GetPlayer()
            local character = Api.GetCharacter()
            local args = {...}

            if (character and character.PrimaryPart and args[1]:lower() == "cframe") then
                --player.Character = Api.FakeCharacter
                player.Character.RobloxLocked = true
                wait(Api.GetSetting("rawr_bypass_speed"))
                character:SetPrimaryPartCFrame(args[2])
                wait(Api.GetSetting("rawr_bypass_speed"))
                --player.Character = character
                player.Character.RobloxLocked = false
            end
        end

        function Api.GetPlayer()
            return game:GetService("Players").LocalPlayer
        end

        function Api.Replicate(object)
            local Model = Instance.new("Model")
            Model.Name = object.Name
            for _, child in pairs(object:GetChildren()) do
                local c = child:Clone()
                c.Parent = Model
            end
            if (object.PrimaryPart) then
                Model.PrimaryPart = Model[object.PrimaryPart.Name]
            end
            return Model
        end

        function Api.GetCharacter()
            return Api.Character or Api.GetPlayer().Character
        end

        function Api.GetEntity(model)
            return model:FindFirstChild("Entity")
        end

        function Api.Settings(...)
            Api.Settings = {}
            for name, value in pairs(...) do
                Api.Settings[name] = value
            end
        end

        function Api.GetSetting(name)
            return Api.Settings[name]
        end

        function Api.IsValid(model)
            if
                (model.PrimaryPart and model:FindFirstChild("Entity") and model.Entity:FindFirstChild("Health") and
                    model.Parent ~= nil and
                    model:FindFirstChild("Nameplate"))
             then
                return true
            end
        end

        function Api.GetPlayerDistances(model)
            local localPlayer = Api.GetPlayer()
            local distances = {}
            for _, player in pairs(plrs:GetPlayers()) do
                if
                    (player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and
                        model:FindFirstChild("HumanoidRootPart"))
                 then
                    distances[player.Name] =
                        (model.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
                end
            end
            return distances
        end

        function Api.CheckNear(monster)
            if (Api.GetSetting("avoid_players_nearby")["Enabled"] == true) then
                local max_distance = Api.GetSetting("avoid_players_nearby")["Distance"]
                local distances = Api.GetPlayerDistances(monster)
                for player, distance in pairs(distances) do
                    if (distance <= max_distance) then
                        return false
                    end
                end
            end
            return true
        end

        function Api.CheckBlacklist(monster)
            for _, blacklist in pairs(Api.Blacklist) do
                if (monster == blacklist) then
                    return false
                end
            end
            return true
        end

        function Api.GetMonsters()
            local targets = {}
            for _, monster in pairs(wp.Mobs:GetChildren()) do
                local entity = monster:FindFirstChildOfClass("Folder")
                local filterApplied = false
                --local distanceCheck = Api.CheckNear(monster)
                if (monster.PrimaryPart and Api.IsValid(monster) and Api.CheckBlacklist(monster)) then
                    if (Api.GetSetting("monster_filter")["Enabled"] == true) then
                        if
                            (entity.Health.Value >= Api.GetSetting("monster_filter")["max_monster_health"] and
                                entity.Exp.Value >= Api.GetSetting("monster_filter")["min_exp_earned"])
                         then
                            table.insert(targets, monster)
                        end
                        filterApplied = true
                    elseif (Api.GetSetting("target_specific_enemy").Enabled == true) then
                        if
                            (Api.GetSetting("target_specific_enemy").Names[monster.Nameplate.SurfaceGui.TextLabel.Text] ==
                                true)
                         then
                            table.insert(targets, monster)
                        end
                        filterApplied = true
                    end
                    if (filterApplied == false) then
                        table.insert(targets, monster)
                    end
                end
            end
            return targets
        end

        function Api:Connect()
            local player = Api.GetPlayer()
            local character = Api.GetCharacter()
            local setupCharacter = function(character)
                Api.FakeCharacter = Api.Replicate(character)
            end

            setupCharacter(character)
            player.CharacterAdded:Connect(setupCharacter)
        end

        hu = game.Players.LocalPlayer.Character.Humanoid
        local l = Instance.new("Humanoid")
        l.Parent = game.Players.LocalPlayer.Character
        l.RigType = "R15"
        l.Name = "Humanoid"
        wait(0.1)
        hu.Parent = game.Players.LocalPlayer
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        wait(0.1)
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        wait(0.5)
        --not Mine, by Mortalkombatman2, modified by ZombieRushFan
        function Api.BigHitbox()
            for i, v in pairs(game.Workspace.Mobs:children()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    local bodyforce = Instance.new("BodyForce")
                    bodyforce.Parent = v.HumanoidRootPart
                    v.HumanoidRootPart.Size =
                        Vector3.new(Api.GetSetting("hbx"), Api.GetSetting("hby"), Api.GetSetting("hbz"))
                    v.HumanoidRootPart.CanCollide = false
                    v.HumanoidRootPart.BodyForce.force =
                        Vector3.new(0, game.workspace.Gravity, 0) * v.HumanoidRootPart:GetMass()
                end
            end
        end

        function Api:SetKeys()
            game:GetService("UserInputService").InputBegan:connect(
                function(Key)
                    if (Key.KeyCode == Api.GetSetting("stop_key")) then
                        Api.Enabled = false
                    elseif (Key.KeyCode == Api.GetSetting("pause_key")) then
                        Api.Paused = true
                    elseif (Key.KeyCode == Api.GetSetting("unpause_key")) then
                        Api.Paused = false
                    end
                end
            )
        end
        --[[
CREATED BY Methode @v3rmillion
MODIFIED BY ZombieRushFan @v3rmillion || Styler12#2196 || Sealtiel Dy @FB
]]
        function Api:Init()
            Api.Blacklist = {}
            Api.Start = tick()
            Api.Paused = false
            Api.CanClick = false
            Api.Enabled = true
            wait(Api.GetSetting("StartDelay"))
            spawn(
                function()
                    while wait(Api.GetSetting("click_break_speed")) and Api.Enabled do
                        if (Api.Paused == false and Api.CanClick == true) then
                            if (mouse1click) then
                                mouse1click()
                            end
                        else
                            wait()
                        end
                    end
                end
            )
            while wait() and Api.Enabled and _G.farm == true do
                if (Api.Paused == false) then
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(116, 900, 23865)) --F10 Boss
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(12400, 540, -3380)) --F9 Boss
                    --game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3650, 2850, -7700)) --F9 Mini Boss
                    for _, monster in pairs(Api.GetMonsters()) do
                        if (Api.IsValid(monster) and Api.Enabled and _G.farm == true) then -- recheck
                            Rawr:Check(
                                "CFrame",
                                monster:GetPrimaryPartCFrame() *
                                    CFrame.Angles(
                                        math.rad(Api.GetSetting("rocX")),
                                        math.rad(Api.GetSetting("rocY")),
                                        math.rad(Api.GetSetting("rocZ"))
                                    ) *
                                    CFrame.new(Api.GetSetting("dfmX"), Api.GetSetting("dfmY"), Api.GetSetting("dfmZ"))
                            ) -- bypass
                            wait(Api.GetSetting("swap_monster_speed"))
                            local entity = Api.GetEntity(monster)
                            local base = entity.Health.Value
                            entity.Health.Changed:Connect(
                                function()
                                    if (entity.Health.Value == base) then
                                        dontBreak = false
                                    end
                                end
                            )
                            Api.BigHitbox()
                            dontBreak = true
                            local timer = 0
                            while dontBreak and Api.Enabled do
                                if (Api.Paused == false) then
                                    local thisTime = wait()
                                    wait(thisTime)
                                    timer = timer + thisTime
                                    if (timer >= Api.GetSetting("timeout")["time"]) then
                                        warn("Timeout exceeded!")
                                        if (Api.GetSetting("timeout")["blacklist_monster_after_timeout"] == true) then
                                            table.insert(Api.Blacklist, monster)
                                        end
                                        break
                                    end
                                    if (Api.IsValid(monster) and entity.Health.Value > 0 and _G.farm == true) then
                                        local character = Api.GetCharacter()
                                        if (character) then
                                            Api.CanClick = false -- true
                                            character:SetPrimaryPartCFrame(
                                                monster:GetPrimaryPartCFrame() *
                                                    CFrame.Angles(
                                                        math.rad(Api.GetSetting("rocX")),
                                                        math.rad(Api.GetSetting("rocY")),
                                                        math.rad(Api.GetSetting("rocZ"))
                                                    ) *
                                                    CFrame.new(
                                                        Api.GetSetting("dfmX"),
                                                        Api.GetSetting("dfmY"),
                                                        Api.GetSetting("dfmZ")
                                                    )
                                            )
                                        else
                                            character = Api.GetCharacter()
                                            if (character) then
                                                Rawr:Check(
                                                    "CFrame",
                                                    monster:GetPrimaryPartCFrame() *
                                                        CFrame.Angles(
                                                            math.rad(Api.GetSetting("rocX")),
                                                            math.rad(Api.GetSetting("rocY")),
                                                            math.rad(Api.GetSetting("rocZ"))
                                                        ) *
                                                        CFrame.new(
                                                            Api.GetSetting("dfmX"),
                                                            Api.GetSetting("dfmY"),
                                                            Api.GetSetting("dfmZ")
                                                        )
                                                ) -- bypass
                                                wait(Api.GetSetting("swap_monster_speed"))
                                            end
                                        end
                                    else
                                        Api.CanClick = false
                                        break
                                    end
                                else
                                    wait()
                                end
                            end
                            wait(Api.GetSetting("swap_monster_speed"))
                        end
                    end
                end
            end
        end

        Api.Settings(
            {
                ["start_delay"] = 1,
                ["stop_key"] = Enum.KeyCode.Escape,
                ["pause_key"] = Enum.KeyCode.LeftControl,
                ["unpause_key"] = Enum.KeyCode.RightControl,
                ["rawr_bypass_speed"] = 0.1, -- 0.1
                ["swap_monster_speed"] = 0, -- 0.05,
                ["click_break_speed"] = 0.01,
                ["hbx"] = 9, -- size of hitbox X-Axis
                ["hby"] = 45, -- size of hitbox Y-Axis
                ["hbz"] = 9, -- size of hitbox Z-Axis
                ["rocX"] = 0, -- rotation of character based on X-Axis
                ["rocY"] = 0, -- rotation of character based on Y-Axis
                ["rocZ"] = 0, -- rotation of character based on Z-Axis
                ["dfmX"] = 0, -- distance from the mob in X-Axis based on rotation
                ["dfmY"] = -17, -- distance from the mob in Y-Axis based on rotation
                ["dfmZ"] = 0, -- distance from the mob in Z-Axis based on rotation
                ["timeout"] = {
                    ["time"] = 45,
                    ["blacklist_monster_after_timeout"] = false
                },
                ["monster_filter"] = {
                    ["Enabled"] = false,
                    ["max_monster_health"] = 0,
                    ["min_exp_earned"] = 1
                },
                ["avoid_players_nearby"] = {
                    ["Enabled"] = false,
                    ["Distance"] = 200
                },
                ["target_specific_enemy"] = {
                    ["Enabled"] = false,
                    ["Names"] = {
                        --just follow the format to add new mobs
                        ["Grim the Overseer"] = true,
                        ["Baal"] = true,
                        ["Shady Villager"] = false,
                        ["Winged Minion"] = false,
                        ["Wendigo"] = false,
                        ["Undead Warrior"] = false,
                        ["Gargoyle Reaper"] = true,
                        ["Mortis the Flaming Sear"] = true,
                        ["Polyserpant"] = false,
                        ["Ent"] = false,
                        ["Patrolman Elite"] = true,
                        ["Rotling"] = true,
                        ["Sa'jun the Centurian Chieftain"] = false,
                        ["Fire Scorpion"] = false,
                        ["Dungeon Dweller"] = true,
                        ["Bamboo Spider"] = true,
                        ["Boneling"] = true,
                        ["Treeray"] = true,
                        ["Birchman"] = true
                    }
                }
            }
        )

        Api:SetKeys()
        Api:Connect()
        Api:Init()
    end
)

Close.Name = "Close"
Close.Parent = MainFrame
Close.Active = false
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 10
Close.Position = UDim2.new(0.908426881, 0, 0.00135448575, 0)
Close.Size = UDim2.new(0, 55, 0, 22)
Close.Font = Enum.Font.Fantasy
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextSize = 20
Close.MouseButton1Down:connect(
    function()
        Open.Text = "Open"
        MainFrame.Visible = false
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
        virtualUser:Button2Down(Vector2.new(0, 0), wp.CurrentCamera.CFrame)
        wait(1)
        virtualUser:Button2Up(Vector2.new(0, 0), wp.CurrentCamera.CFrame)
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
