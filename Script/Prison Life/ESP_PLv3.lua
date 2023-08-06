loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Aimbot.lua"), true))()

_G.killtoolEnable = false
_G.plrCurrent = nil
ws_g = 25
jp_g = 30
disTeleport = 10
hitBoxSize = {3, 3, 3}
hitBoxBody = "Head"
-- HumanoidRootPart

function createESP(parent)
    createESPItem(parent.Character.Head, 205, 205, 205, 14, parent.Name, 1)
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(parent.Character:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
    parent:GetPropertyChangedSignal("Team"):connect(
        function()
            if tostring(parent.Team) == "Criminals" then
                parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
            elseif tostring(parent.Team) == "Guards" then
                parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(parent.Team) == "Inmates" then
                parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(218, 133, 65)
            end
        end
    )
    if tostring(parent.Team) == "Criminals" then
        parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
    elseif tostring(parent.Team) == "Guards" then
        parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(13, 105, 172)
    elseif tostring(parent.Team) == "Inmates" then
        parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(218, 133, 65)
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
                createESP(o)
            end
        end
    end
end
espFirst()

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Hit%20Box.lua"), true))() -- Hit Box
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Create%20GUI/Humanoid%20Teleport.lua"), true))() -- Teleport Players
-------------------------------------------------------------
--------------------------CMDS-------------------------------

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
            for i=1,10 do
                rs.GunRemotes["meleeEvent"]:FireServer(plrs:FindFirstChild(tp.Name))
                wait(.1)
            end
        end
    end
end

function changeWS(team)
    ws_g = tonumber(team)
    lplr.Character.Humanoid.WalkSpeed = ws_g
    NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
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
        elseif string.find("ws", command) then
            changeWS(first)
        end
    end
end
lplr.Chatted:Connect(executeChat)

-------------------------------------------------------------
--------------------------Other------------------------------
function funcGun(m)
-- return {Damage = 70, HeadDamage = 90, Description = "Sniper Rifle", MaxAmmo = 6, CurrentAmmo = 6, StoredAmmo = 600, FireRate = 1.5, AutoFire = false, Range = 1000, ShieldDamage = 60, Spread = 50, ReloadTime = 4, Bullets = 1, ReloadAnim = "ReloadShells", ShootAnim = "ShootShell", HoldAnim = "Hold", FireSoundId = "http://www.roblox.com/asset/?id=3742310026", SecondarySoundId = nil, ReloadSoundId = "http://www.roblox.com/asset/?id=2934887229", Scope = true}

    if m:FindFirstChild("GunStates") then
        local module = require(m.GunStates)
        module.Damage = 200
        module.HeadDamage = 200
        module.StoredAmmo = 1000
        module.FireRate = 0.1
        module.Range = 10000
        module.ShieldDamage = 200
        module.Spread = 100
        module.ReloadTime = 0.5
    end
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'HeadDamage') then
            v.Damage = 200
            v.HeadDamage = 200
            v.StoredAmmo = 1000
            v.FireRate = 0.1
            v.Range = 10000
            v.ShieldDamage = 200
            v.Spread = 100
            v.ReloadTime = 0.5
        end
    end
end


function firstScript()
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            characterModel.ChildAdded:connect(
                function(m)
                    wait(0.1)
                    funcGun(m)
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

end
firstScript()

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

mouse.KeyDown:connect(
    function(keyDown)
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
		end
    end
)