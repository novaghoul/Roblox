loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
getgenv().hitBoxSize = {15, 15, 15}
getgenv().hitBoxBody = "HumanoidRootPart"
toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/HitBox.lua"), true))() -- 1st Lua
function createESP(c) --//Checks and calls the proper function
    -- createESPItem(c.Head, 196, 40, 28, 14, plrs:FindFirstChild(c.Name).DisplayName)
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
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        createESP(characterModel)
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
                        createESP(characterModel)
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
                        createESP(o.Character)
                    end
                end
            )
        end
    end
end
espFirst()

mouse.Button1Down:connect(
    function()
        if tostring(lplr.Team) == "Humans" then
            local toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")
            if toolPlayer then
                for _,v in pairs(wp:GetChildren()) do
                    if v:IsA("Model") then
                        if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                            local args = {
                                [1] = lplr.Character:FindFirstChildOfClass("Tool"),
                                [2] = v,
                                [3] = Vector3.new(v.HumanoidRootPart.CFrame.x, v.HumanoidRootPart.CFrame.y, v.HumanoidRootPart.CFrame.z),
                                [4] = Vector3.new(v.HumanoidRootPart.CFrame.x, v.HumanoidRootPart.CFrame.y, v.HumanoidRootPart.CFrame.z)
                            }
                            
                            rs.Remotes.Weapon.Sword.Damage:FireServer(unpack(args))
                        end
                    end
                end
            end
        end
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "q" then
            if tostring(lplr.Team) == "Robots" then
                rs.Remotes.Robot.Explode:InvokeServer()
            end
        end
        if keyDown == "x" then
            if ws_g == 30 then
                ws_g = 20
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            else
                ws_g = 30
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            end
        end
        if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
        end
    end
)
-- print("---------------------------------------")
-- print("---------------------------------------")
-- print("---------------------------------------")
-- for _,v in pairs(getgc(true)) do
--     if type(v) == 'table' and rawget(v, 'Cooldown') then
--         print("---------------First------------")
--         v.Cooldown = 0
--         table.foreach(v, print)
--         print("---------------Damage------------")
--         if type(v.Damage) == 'table' then
--             v.Damage.IncrementPrice = 1
--             v.Damage.IncrementValue = 100
--             v.Damage.Price = 1
--             table.foreach(v.Damage, print)
--         else
--             v.Damage = 200
--         end
--         print("---------------Accuracy------------")
--         if type(v.Accuracy) == 'table' then
--             v.Accuracy.IncrementPrice = 1
--             v.Accuracy.IncrementValue = 100
--             v.Accuracy.Price = 1
--             table.foreach(v.Accuracy, print)
--         else
--             v.Accuracy = 1
--         end
--         print("---------------Range------------")
--         if type(v.Range) == 'table' then
--             v.Range.IncrementPrice = 1
--             v.Range.IncrementValue = 100
--             v.Range.Price = 1
--             table.foreach(v.Range, print)
--         else
--             v.Range = 100
--         end
--         print("---------------End------------")
--     end
-- end
