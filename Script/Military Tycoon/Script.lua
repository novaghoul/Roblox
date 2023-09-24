loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local sEnemy = 5
hitBoxBody = "Head"
toggleJP = false
ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Ctrl_Click_TP.lua"), true))() -- Ctrl_Click_TP Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/HitBox.lua"), true))() -- HitBox Lua

function createESP(c) --//Checks and calls the proper function
    createESPItem(c:WaitForChild("Head"), 196, 40, 28, 14, plrs:WaitForChild(c.Name).DisplayName)
    for _, v in pairs(c:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end
function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    spawn(function()
                        if characterModel:WaitForChild("Head") then
                            wait(1)
                            createESP(characterModel)
                        end
                    end)
                end
            )
        end
    end
    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    spawn(function()
                        if characterModel:WaitForChild("Head") then
                            wait(1)
                            createESP(characterModel)
                        end
                    end)
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
                        wait(1)
                        createESP(o.Character)
                    end
                end
            )
        end
    end
end
espFirst()
spawn(function()
    while wait(1) do
        for _,v in pairs(wp:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                v.MaxActivationDistance = 20
            end
        end
    end
end)
spawn(function() 
-- game:GetService("Workspace").Characters.Sanford.Head
    for _,v in pairs(wp.Characters:GetChildren()) do
        if v:FindFirstChild("Head") then
            createHitBox(v, sEnemy)
        end
        v.ChildAdded:connect(
            function(m)
                wait(.5)
                if tostring(m.Name) == "Head" then
                    createHitBox(v, sEnemy)
                end
            end
        )
    end
    wp.Characters.ChildAdded:connect(
        function(m)
            wait(.5)
            if m:FindFirstChild("Head") then
                createHitBox(m, sEnemy)
            end
            m.ChildAdded:connect(
                function(n)
                    wait(.5)
                    if tostring(n.Name) == "Head" then
                        createHitBox(m, sEnemy)
                    end
                end
            )
        end
    )
end)

wp.WaterEffect.WaterMesh:Destroy()
wp.WaterEffect.FloorMesh:Destroy()

local aPlayer = "false"
uis.InputBegan:Connect(function(keyDown, processed)
    if keyDown.KeyCode == Enum.KeyCode.X then
        if ws_g == 50 then
            ws_g = 150
            lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        else
            ws_g = 50
            lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end
    end
    if keyDown.KeyCode == Enum.KeyCode.Z then
        if tostring(aPlayer) == "false" then
            aPlayer = "true"
            lplr.Character.HumanoidRootPart.Anchored = true
            NotifyG("Freeze", aPlayer)
        else
            aPlayer = "false"
            lplr.Character.HumanoidRootPart.Anchored = false
            NotifyG("Freeze", aPlayer)
        end
    end
    if keyDown.KeyCode == Enum.KeyCode.V then
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -disTeleport, 0)
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -disTeleport, 0)
    end
end)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua
-- local args = {
--     [1] = CFrame.new(2048.63159, 133.153137, 430.331787, 0.998681009, -0, -0.0513446592, 0, 1, -0, 0.0513446592, 0, 0.998681009)
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RPG"):FireServer(unpack(args))

-- local args = {
--     [1] = {
--         [1] = Vector3.new(-715.3710327148438, -159.18975830078125, -7409.02978515625),
--         [2] = Vector3.new(-715.5645141601562, -159.62152099609375, -7408.798828125),
--         [3] = Vector3.new(-715.7233276367188, -159.18881225585938, -7408.619140625),
--         [4] = Vector3.new(-715.3353271484375, -159.32945251464844, -7409.06982421875),
--         [5] = Vector3.new(-715.4629516601562, -159.52610778808594, -7408.91845703125),
--         [6] = Vector3.new(-715.52294921875, -159.6178436279297, -7408.84765625),
--         [7] = Vector3.new(-715.4183959960938, -159.15550231933594, -7408.97509765625)
--     },
--     [2] = {
--         [1] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [2] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [3] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [4] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [5] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [6] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375),
--         [7] = Vector3.new(-721.2486572265625, -164.64981079101562, -7424.2568359375)
--     },
--     [3] = {
--         [1] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [2] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [3] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [4] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [5] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [6] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head"),
--         [7] = workspace:WaitForChild("Characters"):WaitForChild("Guard"):WaitForChild("Head")
--     },
--     [4] = {
--         [1] = Vector3.new(-715.3710327148438, -159.18975830078125, -7409.02978515625),
--         [2] = Vector3.new(-715.5645141601562, -159.62152099609375, -7408.798828125),
--         [3] = Vector3.new(-715.7233276367188, -159.18881225585938, -7408.619140625),
--         [4] = Vector3.new(-715.3353271484375, -159.32945251464844, -7409.06982421875),
--         [5] = Vector3.new(-715.4629516601562, -159.52610778808594, -7408.91845703125),
--         [6] = Vector3.new(-715.52294921875, -159.6178436279297, -7408.84765625),
--         [7] = Vector3.new(-715.4183959960938, -159.15550231933594, -7408.97509765625)
--     },
--     [5] = {
--         [1] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [2] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [3] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [4] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [5] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [6] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317),
--         [7] = Vector3.new(-0.7590566277503967, -0.008219650015234947, -0.6509726643562317)
--     },
--     [6] = {
--         [1] = Enum.Material.Neon,
--         [2] = Enum.Material.Neon,
--         [3] = Enum.Material.Neon,
--         [4] = Enum.Material.Neon,
--         [5] = Enum.Material.Neon,
--         [6] = Enum.Material.Neon,
--         [7] = Enum.Material.Neon
--     }
-- }

-- game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ShootEvent"):FireServer(unpack(args))
