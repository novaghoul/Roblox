loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
toggleJP = false
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

hitBoxSize = {7, 7, 7}

_G.arrayNameButton = {
    "infJump",
    "killAllZom",
    "noclipToggle"
}

_G.arrayTextButton = {
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
        v.FireRate = 0.1
        v.Range = 500
    end
end

local killZom = false

mouse.KeyDown:connect(
    function(keyDown)
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
        if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
        end

        if keyDown == " " then
            infJump()
        end
    end
)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- WS Lua