loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleWS = false
toggleJP = false
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

local tpCoin = false

-- workspace.WAOHoukaShu.HideOrb
function createESP(parent)
    createESPItem(parent.Head, 75, 151, 75, 14, parent.Name)
    parent.Role:GetPropertyChangedSignal("Value"):connect(
        function()
            wait(.1)
            if tostring(parent.Role.Value) == "Hider" then
                parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(parent.Role.Value) == "Seeker" then
                parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
            else
                parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )
    if tostring(parent.Role.Value) == "Hider" then
        parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(13, 105, 172)
    elseif tostring(parent.Role.Value) == "Seeker" then
        parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
    else
        parent.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(75, 151, 75)
    end

    for _, v in pairs(parent:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") and characterModel:WaitForChild("Role") then
                        wait(1)
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
                    if characterModel:WaitForChild("Head") and characterModel:WaitForChild("Role") then
                        wait(1)
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
        if tostring(o.Name) ~= tostring(lplr.Name) then
            if o.Character then
                spawn(function()
                    if o.Character:FindFirstChild("Head") and o.Character:FindFirstChild("Role") then
                        createESP(o.Character)
                    end
                end)
            end
        end
    end
end
espFirst()

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            tpCoin = not tpCoin
            while tpCoin do
                wait()
                firetouchinterest(wp.LavaObby.Token,  lplr.Character.HumanoidRootPart, 0)
                firetouchinterest(wp.LavaObby.Token,  lplr.Character.HumanoidRootPart, 1)
                firetouchinterest(wp.Lobby.LobbyObby.Token,  lplr.Character.HumanoidRootPart, 0)
                firetouchinterest(wp.Lobby.LobbyObby.Token,  lplr.Character.HumanoidRootPart, 1)
                lplr.Character.HumanoidRootPart.CFrame = wp.Lobby.EasterEgg1.Lobby.Detail.LogoFrame:GetChildren()[1].CFrame
            end
        end
    end
)
