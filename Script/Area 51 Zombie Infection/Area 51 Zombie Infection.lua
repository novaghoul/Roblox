loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

hitBoxSize = {7, 7, 7}

local arrayNameButton = {
    "addSpeed",
    "subSpeed",
    "infJump",
    "killAllZom",
    "noclipToggle"
}

local arrayTextButton = {
    "Press C to + Speed",
    "Press V to - Speed",
    "Press Space to Inf Jump",
    "Press E to Kill All Zombie",
    "Press F to Noclip"
}

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/TutorialMod.lua"), true))() -- Tutorial Lua

function createESP(parent)
    createESPItem(parent.Character.Head, 196, 40, 28, 14, parent.Name)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 196, 40, 28)
            end
        end
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

function hitBox()
    for _, v in pairs(wp:GetChildren()) do
        if v:FindFirstChild("Zombie") and v:FindFirstChild("Head") then
            createHitBox(v)
        end
    end

    wp.ChildAdded:connect(
        function(m)
            wait(2)
            if m:FindFirstChild("Zombie") then
                createHitBox(m)
            end
        end
    )
end
hitBox()

for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'Damage') then
        v.Damage = 500
        v.FireRate = 0.01
        v.Range = 500
    end
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
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        ws_g = ws_g + 2
        lplr.Character.Humanoid.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 2
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end
end

local killZom = false

mouse.KeyDown:connect(
    function(keyDown)
		
        if keyDown == "c" then
            changeWS(0)
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "f" then
            noclipAll = not noclipAll
            NotifyG("Noclip", noclipAll)
        end

        if keyDown == "e" then
            killZom = not killZom
            NotifyG("Kill Zombie", killZom)
            while killZom do
                wait(.5)
                for _, v in pairs(wp.Zombies:GetChildren()) do
                    if v:FindFirstChild("Head") then
                        for i=1,10 do
                            local number_1 = 500
                            local userdata_1 = v:FindFirstChild("Head")
                            local Target = rs.Damage
                            Target:FireServer(number_1, userdata_1)
                        end
                    end
                end
            end
        end

        if keyDown == " " then
            infJump()
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