loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

_G.killtoolEnable = false
_G.meleetoolRemote = rs.GunRemotes["meleeEvent"]
_G.plrCurrent = nil
ws_g = 25
jp_g = 30
disTeleport = 10
hitBoxSize = {3, 3, 3}
hitBoxBody = "Head"
-- HumanoidRootPart

function createESP(parent)
    -- parent.Character.Head.CanCollide = false
    createESPItem(parent.Character.Head, 205, 205, 205, 14, parent.Name)
    for _, v in pairs(parent.Character:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
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

-- function takeWeapon()
--     for _, v in pairs(wp.Prison_ITEMS.giver:GetChildren()) do
--         if tostring(v) == "Shovel" then
--         else
--             rs.Events.ItemHandler:InvokeServer(v.ITEMPICKUP)
--         end
--     end
-- end

-- function arrestPlayer()
--     if not mouse.Target then
--         return
--     end
--     local tp = mouse.Target

--     while not tp.Parent:FindFirstChild("Humanoid") and tostring(tp.Parent) ~= "Workspace" do
--         tp = tp.Parent
--     end

--     if tp.Parent:FindFirstChild("Humanoid") and plrs:FindFirstChild(tp.Parent.Name) then
--         for i=1,10 do
--             function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end
            
--             local args = {
--                 [1] = getNil(tostring(tp.Parent.Name), "Model"):WaitForChild("Head")
--             }
            
--             rs:WaitForChild("Events"):WaitForChild("arrest"):InvokeServer(unpack(args))
--             wait(.5)
--         end
--     end
-- end

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
                _G.meleetoolRemote:FireServer(plrs:FindFirstChild(tp.Name))
                wait(.1)
            end
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
                    -- arrestPlayer()
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
        elseif string.find("wp", command) then
            -- takeWeapon()
        elseif string.find("atool", command) then
            -- toolEvent("Arrest")
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
        module.StoredAmmo = math.huge
        module.FireRate = 0.1
        -- module.AutoFire = true
        module.Range = math.huge
        module.Spread = 20
        module.ReloadTime = 0.1
        -- module.Bullets = 5
    end
end


function firstScript()
    wp.Prison.Prison_Cellblock.a_front.glass:Destroy()
    wp.Prison.Prison_Cellblock.b_front.glass:Destroy()
    for _,v in pairs(wp.Prison_Fences:GetChildren()) do
        if tostring(v) == "fence" then
            for _,l in pairs(v:GetChildren()) do
                if tostring(l) == "fence" or tostring(l) == "hitbox" then
                    l:Destroy()
                end
            end
        end
    end
    -- game:GetService("Workspace").Prison_Fences:GetChildren()[2].fence
    -- game:GetService("Workspace").Prison_Fences.fence.hitbox
    -- takeWeapon()
    -- toolEvent("Arrest")
    toolEvent("Kill")

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            -- takeWeapon()
            -- toolEvent("Arrest")
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