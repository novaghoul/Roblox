loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

_G.killtoolEnable = false
_G.plrCurrent = nil
ws_g = 25
jp_g = 30
disTeleport = 10
hitBoxSize = {5, 5, 5}
hitBoxBody = "Head"
-- HumanoidRootPart

function createESP(parent)
    -- parent.Character.Head.CanCollide = false
    createESPItem(parent.Character.Head, 205, 205, 205, 14, parent.Name, 1)
    -- for _, v in pairs(parent.Character:GetChildren()) do
    --     if checkPart(v) then
    --         actualESP(v)
    --     end
    -- end
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

function arrestPlayer()
    if not mouse.Target then
        return
    end
    local tp = mouse.Target

    while not tp.Parent:FindFirstChild("Humanoid") and tostring(tp.Parent) ~= "Workspace" do
        tp = tp.Parent
    end

    if tp.Parent:FindFirstChild("Humanoid") and plrs:FindFirstChild(tp.Parent.Name) then
        local args = {
            [1] = plrs:FindFirstChild(tp.Parent.Name).Character.Head
        }

        wp.Remote.arrest:InvokeServer(unpack(args))
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
            rs["meleeEvent"]:FireServer(plrs:FindFirstChild(tp.Name))
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
        elseif string.find("atool", command) then
            toolEvent("Arrest")
        elseif string.find("ktool", command) then
            toolEvent("Kill")
        elseif string.find("ws", command) then
            changeWS(first)
        end
    end
end
lplr.Chatted:Connect(executeChat)

-------------------------------------------------------------
--------------------------Other------------------------------
function funcGun(m)
    if m:FindFirstChild("GunStates") then
        local module = require(m.GunStates)
        module.Damage = math.huge
        module.HeadDamage = math.huge
        -- module.MaxAmmo = 99999999
        -- module.CurrentAmmo = 99999999
        -- module.StoredAmmo = math.huge
        module.FireRate = 0.1
        -- module.AutoFire = true
        module.Range = math.huge
        module.Spread = 20
        module.ReloadTime = 0.1
        -- module.Bullets = 5
    end
end


function firstScript()
    wp.Prison_Cellblock.a_front.glass:Destroy()
    wp.Prison_Cellblock.b_front.glass:Destroy()
    wp.Prison_Guard_Outpost.wall:Destroy()
    wp.Prison_Guard_Outpost.furniture_armory["Gun racks"]:Destroy()
    wp.Prison_Administration.front.DOORWAY:Destroy()
    wp.Prison_Fences.Prison_Gate.damagePart:Destroy()
    wp.Prison_Cafeteria.glass:Destroy()
    for _,v in pairs(wp.Prison_Guard_Outpost:GetChildren()) do
        if tostring(v) == "wallsegment" then
            v:Destroy()
        end
    end
    for _,v in pairs(wp.Prison_OuterWall:GetChildren()) do
        if tostring(v) == "Prison_guardtower" then
            for _,l in pairs(v:GetChildren()) do
                if tostring(l) == "Stonewall" and tostring(l.BrickColor) == "Electric blue" then
                    l:Destroy()
                end
            end
        end
    end
    for _,v in pairs(wp.Doors:GetChildren()) do
        if v:FindFirstChild("block") then
            v:Destroy()
        end
        v.ChildAdded:connect(
            function(m)
                wait(.5)
                m:Destroy()
            end
        )
    end
    for _,v in pairs(wp.Prison_Fences:GetChildren()) do
        if tostring(v) == "fence" then
            for _,l in pairs(v:GetChildren()) do
                if tostring(l) == "fence" or tostring(l) == "hitbox" or tostring(l) == "damagePart" then
                    l:Destroy()
                end
            end
        end
    end

    toolEvent("Arrest")
    toolEvent("Kill")

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            toolEvent("Arrest")
            toolEvent("Kill")
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

        if keyDown == "e" then
            noclipAll = not noclipAll
            NotifyG("NoClip", noclipAll)
        end

		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
		end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)