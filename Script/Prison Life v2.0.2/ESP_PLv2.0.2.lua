loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.arresttoolRemote = wp.Remote["arrest"]
_G.meleetoolRemote = rs["meleeEvent"]
_G.plrCurrent = nil
hitBoxSize = {5, 5, 5}
hitBoxBody = "Head"
-- HumanoidRootPart

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
    parent.Character.Head.CanCollide = false
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
    nam.TextColor3 = Color3.fromRGB(205, 205, 205)
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
                mf.BackgroundColor3 = Color3.fromRGB(205, 205, 205)
                parent:GetPropertyChangedSignal("Team"):connect(
                    function()
                        if tostring(parent.Team) == "Criminals" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        elseif tostring(parent.Team) == "Guards" then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        elseif tostring(parent.Team) == "Inmates" then
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )
                if tostring(parent.Team) == "Criminals" then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(parent.Team) == "Guards" then
                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                elseif tostring(parent.Team) == "Inmates" then
                    mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                end
            end
        end
    end
    parent:GetPropertyChangedSignal("Team"):connect(
        function()
            if tostring(parent.Team) == "Criminals" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            elseif tostring(parent.Team) == "Guards" then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(parent.Team) == "Inmates" then
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )
    if tostring(parent.Team) == "Criminals" then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    elseif tostring(parent.Team) == "Guards" then
        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
    elseif tostring(parent.Team) == "Inmates" then
        nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(0.5)
                    if characterModel:WaitForChild("Head") then
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
                    wait(0.5)
                    if characterModel:WaitForChild("Head") then
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
        if tostring(o.Name) ~= tostring(lplr.Name) then
            if o.Character:FindFirstChild("Head") then
                checkESP(o)
            end
        end
    end
end
espFirst()

-------------------------------------------------------------
--------------------------CMDS-------------------------------
function plrlist(thing)
    for _, v in pairs(plrs:GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(thing)) then
            return v
        end
    end
end

function eventTP(parent)
    local pos = lplr.Character.HumanoidRootPart.CFrame
    for _, v in pairs(parent) do
        if tostring(v.Name) ~= tostring(lplr.Name) then
            local charplayer = v.Character
            if charplayer ~= nil then
                charplayer.HumanoidRootPart.Anchored = false
                charplayer.HumanoidRootPart.CanCollide = false
                charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -5)
                charplayer.HumanoidRootPart.Anchored = true
            end
        end
    end
end

function tpPlayer(choose)
    if tostring(choose) == "all" then
        eventTP(plrs:GetPlayers())
    elseif tostring(choose) == "g" then
        local players = game:GetService("Teams")[tostring("Guards")]:GetPlayers()
        eventTP(players)
    elseif tostring(choose) == "i" then
        local players = game:GetService("Teams")[tostring("Inmates")]:GetPlayers()
        eventTP(players)
    elseif tostring(choose) == "c" then
        local players = game:GetService("Teams")[tostring("Criminals")]:GetPlayers()
        eventTP(players)
    else
        local players = {plrlist(tostring(choose))}
        eventTP(players)
    end
end

function resetTP()
    for _, v in pairs(plrs:GetPlayers()) do
        if tostring(v.Name) ~= tostring(lplr.Name) then
            local charplayer = v.Character
            if charplayer ~= nil then
                charplayer.HumanoidRootPart.Anchored = false
                charplayer.HumanoidRootPart.CanCollide = false
            end
        end
    end
end

function takeWeapon()
    for _, v in pairs(wp.Prison_ITEMS.giver:GetChildren()) do
        wp.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
    end
end

function arrestPlayer()
    if not mouse.Target then
        return
    end
    local tp = mouse.Target

    while not tp.Parent:FindFirstChild("Humanoid") and tostring(tp.Parent) ~= "Workspace" do
        tp = tp.Parent
    end

    if tp.Parent:FindFirstChild("Humanoid") and plrs:FindFirstChild(tp.Parent.Name) then
        _G.arresttoolRemote:InvokeServer(tp)
    end
end

function killPlayer()
    if not mouse.Target then
        return
    end
    local tp = mouse.Target

    while not tp:FindFirstChild("Humanoid") and tostring(tp.Parent) ~= "Workspace" do
        tp = tp.Parent
    end

    if _G.plrCurrent == nil and tp:FindFirstChild("Humanoid") then
        _G.plrCurrent = tp
    end

    if _G.plrCurrent ~= tp and tp:FindFirstChild("Humanoid") then
        _G.killtoolEnable = false
        _G.plrCurrent = tp
        wait(0.1)
        _G.killtoolEnable = true
    end

    if tp:FindFirstChild("Humanoid") and plrs:FindFirstChild(tp.Name) then
        while _G.killtoolEnable == true do
            wait()
            if lplr.Character.Humanoid.Health == 0 or tp.Humanoid.Health == 0 then
                _G.killtoolEnable = false
            end
            _G.meleetoolRemote:FireServer(plrs:FindFirstChild(tp.Name))
        end
    end
end

function toolEvent(name)
    bp = lplr:WaitForChild("Backpack")
    if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild(name .. " Tool") then
        bp:FindFirstChild(name .. " Tool"):Destroy()
    end

    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = name .. " Tool"
    tool.CanBeDropped = false
    tool.Parent = bp
    tool.Equipped:connect(
        function(mouse)
            function toolPlayer()
                if string.lower(name) == "arrest" then
                    arrestPlayer()
                elseif string.lower(name) == "kill" then
                    _G.killtoolEnable = true
                    killPlayer()
                end
            end
        end
    )
    tool.Activated:connect(
        function()
            toolPlayer()
        end
    )
end

function changeTeam(team)
    if tostring(team) == "g" then
        wp.Remote.TeamEvent:FireServer("Bright blue")
        takeWeapon()
        toolEvent("Arrest")
        toolEvent("Kill")
    elseif tostring(team) == "i" then
        wp.Remote.TeamEvent:FireServer("Bright orange")
        takeWeapon()
        toolEvent("Arrest")
        toolEvent("Kill")
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(875, 100, 2280)
    elseif tostring(team) == "c" then
        local lplrCurrent = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
        wait(.01)
        lplr.Character.HumanoidRootPart.CFrame = lplrCurrent
        takeWeapon()
        toolEvent("Arrest")
        toolEvent("Kill")
    elseif tostring(team) == "n" then
        wp.Remote.TeamEvent:FireServer("Medium stone grey")
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

        if string.find("tp", command) then
            tpPlayer(first)
        elseif string.find("rstp", command) then
            resetTP()
        elseif string.find("wp", command) then
            takeWeapon()
        elseif string.find("esp", command) then
            checkESP()
        elseif string.find("atool", command) then
            toolEvent("Arrest")
        elseif string.find("ktool", command) then
            toolEvent("Kill")
        elseif string.find("team", command) then
            changeTeam(first)
        end
    end
end
lplr.Chatted:Connect(executeChat)

-------------------------------------------------------------
--------------------------Other------------------------------
function funcGun(m)
    if m:FindFirstChild("GunStates") then
        local module = require(m.GunStates);
        module.Damage = math.huge;
        -- module.MaxAmmo = 99999999;
        -- module.CurrentAmmo = 99999999;
        module.StoredAmmo = math.huge; 
        module.FireRate = 0.08;
        module.AutoFire = true; 
        module.Range = math.huge;
        module.Spread = 20;
        module.ReloadTime = 0; 
        -- module.Bullets = 5
    end
end

function firstScript()
    wp.Prison_Cellblock.a_front.glass:Destroy()
    wp.Prison_Cellblock.b_front.glass:Destroy()

    takeWeapon()
    toolEvent("Arrest")
    toolEvent("Kill")

    lplr.Character:WaitForChild("Humanoid").Died:Connect(
        function()
            wp.Remote["loadchar"]:InvokeServer(lplr.Name)
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            takeWeapon()
            toolEvent("Arrest")
            toolEvent("Kill")
            characterModel.ChildAdded:connect(
                function(m)
                    wait(0.1)
                    funcGun(m)
                end
            )
            characterModel:WaitForChild("Humanoid").Died:Connect(
                function()
                    wp.Remote["loadchar"]:InvokeServer(lplr.Name)
                end
            )
        end
    )

    lplr.Backpack.ChildAdded:connect(
        function(m)
            wait(0.1)
            funcGun(m)
        end
    )
    
    -- local player = game:GetService("Players").LocalPlayer;
    -- for i,v in pairs(player.Character:GetDescendants()) do
    --     if v.Name == "GunStates" then
    --         local module = require(v);
    --         module.Damage = 99999999;
    --         module.MaxAmmo = 99999999;
    --         module.CurrentAmmo = 99999999;
    --         module.StoredAmmo = 99999999; 
    --         module.FireRate = 1;
    --         module.AutoFire = true; 
    --         module.Range = 99999999;
    --         module.Spread = 20;
    --         module.ReloadTime = 1;
    --     end
    -- end

    -- return {
    --     Damage = 15,
    --     MaxAmmo = 6, 
    --     CurrentAmmo = 6, 
    --     StoredAmmo = 600, 
    --     FireRate = 0.8, 
    --     AutoFire = false, 
    --     Range = 400, 
    --     Spread = 3, 
    --     ReloadTime = 4, 
    --     Bullets = 5
    -- };
end
firstScript()

-- spawn(
--     function()
--         loadstring(game:HttpGet(("https://pastebin.com/raw/TTZxVeAu"), true))() --Humanoid Teleport
--     end
-- )

-- spawn(
--     function()
--         loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
--     end
-- )

function infJump()
    lplr.Character.Humanoid.JumpPower = jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                lplr.Character.Humanoid.WalkSpeed = ws_g
            end
        end
    )
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
            if sg:GetCoreGuiEnabled(2) == false then
                sg:SetCoreGuiEnabled(2, true)
            end
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

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "[" then
            changeWS(0)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "e" then
            noclipAll = not noclipAll
            notify(tostring(noclipAll), "NoClip")
        end
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