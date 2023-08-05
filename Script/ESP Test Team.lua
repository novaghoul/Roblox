loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

--------------------------------------------------------------------------------------
function createESP(c) --//Checks and calls the proper function
    createESPItem(c.Head, 196, 40, 28, 14, c.Name)
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
                    if o.Team ~= lplr.Team then
                        if characterModel:WaitForChild("Head") then
                            wait(1)
                            createESP(characterModel)
                        end
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if newPlayer.Team ~= lplr.Team then
                        if characterModel:WaitForChild("Head") then
                            wait(1)
                            createESP(characterModel)
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
            if o.Team ~= lplr.Team then
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
end
espFirst()