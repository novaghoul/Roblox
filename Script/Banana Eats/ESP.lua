loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

function createESP(parent)
    createESPItem(parent.Character.Head, 75, 151, 75, 14, parent.Name)
    for _, v in pairs(parent.Character:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if parent.Character:FindFirstChild("BananaPackage") then
        parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
    parent.Character.ChildAdded:connect(function(m)
        if m.Name == "BananaPackage" then
            parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                if characterModel:WaitForChild("Head") then
                    wait(0.5)
                    createESP(o)
                end
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        newPlayer.CharacterAdded:Connect(function(characterModel)
            if characterModel:WaitForChild("Head") then
                wait(0.5)
                createESP(newPlayer)
            end
        end)
    end)
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(function()
                if o.Character:FindFirstChild("Head") then
                    wait(0.1)
                    createESP(o)
                end
            end)
        end
    end
end
espFirst()

function firstScript()
    for _, v in pairs(wp.GameKeeper.Puzzles:GetChildren()) do
        if v:FindFirstChild("PuzzleMarker") then
            if v.Name == "CombinationPuzzle" then
                createESPItem(v.PuzzleMarker, 245, 205, 48, 14, v.Name)
                createESPItem(v.CombinationKey.Frames, 245, 205, 48, 14, v.CombinationKey.Name)
            else
                createESPItem(v.PuzzleMarker, 245, 205, 48, 14, v.Name)
            end
        end
    end
    wp.GameKeeper.Puzzles.ChildAdded:connect(function(m)
        wait(1)
        if m:FindFirstChild("PuzzleMarker") then
            if m.Name == "CombinationPuzzle" then
                createESPItem(m.PuzzleMarker, 245, 205, 48, 14, m.Name)
                createESPItem(m.CombinationKey.Frames, 245, 205, 48, 14, m.CombinationKey.Name)
            else
                createESPItem(m.PuzzleMarker, 245, 205, 48, 14, m.Name)
            end
        end
    end)

    if wp.GameKeeper.Map:FindFirstChild("Items") then
        for _, v in pairs(wp.GameKeeper.Map.Items:GetChildren()) do
            if v.Model:FindFirstChild("CakePlate") then
                createESPItem(v.Model.CakePlate.Model.Cake, 245, 205, 48, 14, "Cake Plate")
            end
        end
        wp.GameKeeper.Map.Items.ChildAdded:connect(function(n)
            wait(0.5)
            if n.Model:WaitForChild("CakePlate") then
                createESPItem(n.Model.CakePlate.Model.Cake, 245, 205, 48, 14, "Cake Plate")
            end
        end)
    end

    if wp.GameKeeper.Map:FindFirstChild("Tokens") then
        for _, v in pairs(wp.GameKeeper.Map.Tokens:GetChildren()) do
            v.CFrame = lplr.Character.UpperTorso.CFrame
        end
        wp.GameKeeper.Map.Tokens.ChildAdded:connect(function(n)
            wait(0.1)
            n.CFrame = lplr.Character.UpperTorso.CFrame
        end)
    end

    wp.GameKeeper.Map.ChildAdded:connect(function(m)
        if m.Name == "Items" then
            m.ChildAdded:connect(
                function(n)
                    wait(0.1)
                    createESPItem(n.Model.CakePlate.Model.Cake, 245, 205, 48, 14, "Cake Plate")
                end
            )
        elseif m.Name == "Tokens" then
            wait(0.1)
            for _, v in pairs(m:GetChildren()) do
                v.CFrame = lplr.Character.UpperTorso.CFrame
            end
            m.ChildAdded:connect(function(n)
                wait(0.5)
                n.CFrame = lplr.Character.UpperTorso.CFrame
            end)
        end
    end)
end
firstScript()

function tpCoin()
    for i = 1, 100000 do
        wait(0.5)
        if wp.GameKeeper.Map:FindFirstChild("Tokens") then
            for _, v in pairs(wp.GameKeeper.Map.Tokens:GetChildren()) do
                v.CFrame = lplr.Character.UpperTorso.CFrame
            end
        end
    end
end

-------------------------------------------------------------
--------------------------Other------------------------------
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "q" then
        tpCoin()
    end

    if keyDown == "e" then
        rs.Events.DropPeel:InvokeServer()
    end
    if keyDown == "z" then
        if wp.GameKeeper.Exits:GetChildren()[1] then
            local eDoor = wp.GameKeeper.Exits:GetChildren()[1]
            firetouchinterest(eDoor.Root,  lplr.Character.UpperTorso, 0)
            firetouchinterest(eDoor.Root,  lplr.Character.UpperTorso, 1)
        end
    end
end)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua