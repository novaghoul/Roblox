loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function createESP(parent, r, g, b)
    createESPItem(parent, r, g, b, 14, parent.Name)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(parent, f, r, g, b)
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        o.CharacterAdded:Connect(
            function(characterModel)
                if o.Name ~= lplr.Name then
                    if characterModel:WaitForChild("Head") then
                        if tostring(o.Team) == "Humans" then
                            wait(0.5)
                            createESP(o, 196, 40, 28)
                        elseif tostring(o.Team) == "Zombies" then
                            wait(0.5)
                            createESP(o, 75, 151, 75)
                        end
                    end
                end
            end
        )
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        if tostring(newPlayer.Team) == "Humans" then
                            wait(0.5)
                            createESP(newPlayer, 196, 40, 28)
                        elseif tostring(newPlayer.Team) == "Zombies" then
                            wait(0.5)
                            createESP(newPlayer, 75, 151, 75)
                        end
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
                    if o.Character:WaitForChild("Head") then
                        if tostring(o.Team) == "Humans" then
                            wait(0.1)
                            createESP(o, 196, 40, 28)
                        elseif tostring(o.Team) == "Zombies" then
                            wait(0.1)
                            createESP(o, 75, 151, 75)
                        end
                    end
                end
            )
        end
    end
end
espFirst()

-------------------------------------------------------------
--------------------------Other------------------------------

function statsPlayerWs()
    if tostring(lplr.Team) == "Zombies" then
        ws_g = 25
    else
        ws_g = 16
    end

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
            wait(0.5)
            if tostring(lplr.Team) == "Zombies" then
                ws_g = 25
            else
                ws_g = 16
            end
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

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
