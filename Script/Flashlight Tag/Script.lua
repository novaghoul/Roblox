loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
print("0")
toggleWS = false
toggleJP = false
ws_g = 25
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))() -- Inf_Jump_Other Lua
print("1")
function createESP(c) --//Checks and calls the proper function
    if c.Humanoid.WalkSpeed > 21 then
        createESPItem(c.Head, 196, 40, 28, 14, plrs:FindFirstChild(c.Name).DisplayName)
    else
        createESPItem(c.Head, 75, 151, 75, 14, plrs:FindFirstChild(c.Name).DisplayName)
    end
    -- for _, v in pairs(c:GetChildren()) do
    --     if checkPart(v) then
    --         actualESP(v)
    --     end
    -- end
    -- if HEALTHBAR_ACTIVATED then --//If the user decided to
    --     createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    -- end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    spawn(function()
                        if characterModel:WaitForChild("HumanoidRootPart") then
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
                        if characterModel:WaitForChild("HumanoidRootPart") then
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
            if o.Character then
                if o.Character:FindFirstChild("Head") then
                    wait(0.1)
                    createESP(o.Character)
                end
            end
        end
    end
end
espFirst()


mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        end
    end
)