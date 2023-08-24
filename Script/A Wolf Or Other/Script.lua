loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

getgenv().toggleWS = false
hitBoxBody = "HumanoidRootPart"

function createHeadCharm(parent, r, g, b)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, r, g, b)
            end
        end
    end
end

function createESP(parent, r, g, b)
    createESPItem(parent.Character.Head, r, g, b, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
    createHeadCharm(parent, r, g, b)
    
    if parent.Backpack:FindFirstChild("Ammo") then
        deleteAray(parent.Character.Head, "BS")
        deleteAray(parent.Character.Head, "nameEGUI")
        createESPItem(parent.Character.Head, 13, 105, 172, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
        createHeadCharm(parent, 13, 105, 172)
    elseif parent.Backpack:FindFirstChild("ClawScript") then
        deleteAray(parent.Character.Head, "BS")
        deleteAray(parent.Character.Head, "nameEGUI")
        createESPItem(parent.Character.Head, 196, 40, 28, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
        createHeadCharm(parent, 196, 40, 28)
    end

    parent.Backpack.ChildAdded:connect(
        function(m)
            wait(0.1)
            if m:FindFirstChild("Ammo") then
                deleteAray(parent.Character.Head, "BS")
                deleteAray(parent.Character.Head, "nameEGUI")
                createESPItem(parent.Character.Head, 13, 105, 172, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
                createHeadCharm(parent, 13, 105, 172)
            elseif m:FindFirstChild("ClawScript") then
                deleteAray(parent.Character.Head, "BS")
                deleteAray(parent.Character.Head, "nameEGUI")
                createESPItem(parent.Character.Head, 196, 40, 28, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
                createHeadCharm(parent, 196, 40, 28)
            end
        end
    )
    
    parent.Character.ChildRemoved:connect(
        function(m)
            wait(0.1)
            if m:IsA("Tool") and m:FindFirstChild("Ammo") then
                deleteAray(parent.Character.Head, "BS")
                deleteAray(parent.Character.Head, "nameEGUI")
                createESPItem(parent.Character.Head, 75, 151, 75, 14, parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")")
                createHeadCharm(parent, 75, 151, 75)
            end
        end
    )

end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        local wolve = rs.Wolves:GetChildren()[1]
                        local hunter = rs.Hunters:GetChildren()[1]
                        if tostring(o.Name) == tostring(wolve.Name) then
                            createESP(o, 196, 40, 28)
                        elseif tostring(o.Name) == tostring(hunter.Name) then
                            createESP(o, 13, 105, 172)
                        else
                            createESP(o, 75, 151, 75)
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
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        local wolve = rs.Wolves:GetChildren()[1]
                        local hunter = rs.Hunters:GetChildren()[1]
                        if tostring(newPlayer.Name) == tostring(wolve.Name) then
                            createESP(newPlayer, 196, 40, 28)
                        elseif tostring(newPlayer.Name) == tostring(hunter.Name) then
                            createESP(newPlayer, 13, 105, 172)
                        else
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
            wait(0.1)
            spawn(
                function()
                    if o.Character:WaitForChild("Head") then
                        local wolve = rs.Wolves:GetChildren()[1]
                        local hunter = rs.Hunters:GetChildren()[1]
                        if tostring(o.Name) == tostring(wolve.Name) then
                            createESP(o, 196, 40, 28)
                        elseif tostring(o.Name) == tostring(hunter.Name) then
                            createESP(o, 13, 105, 172)
                        else
                            createESP(o, 75, 151, 75)
                        end
                    end
                end
            )
        end
    end
end
espFirst()

function funcEffect(parent)
    if tostring(parent.Name) == "Handle" then
        createESPItem(parent, 242, 243, 243, 10, "Weapon Here", 0)
    elseif parent:FindFirstChild("Head") then
        for _, l in pairs(parent.Head:GetChildren()) do
            if tostring(l.Name) == "nameEGUI" or tostring(l.Name) == "BS" then
                l:Destroy()
            end
        end
    else
        parent:Destroy()
    end
end

function firstScript()
    wp.Gravity = 50

    for _, v in pairs(wp.EffectsBin:GetChildren()) do
        funcEffect(v)
    end
    wp.EffectsBin.ChildAdded:connect(
        function(m)
            wait(0.1)
            funcEffect(m)
        end
    )
end
firstScript()

function takeWeapon()
    local weapon = wp.EffectsBin:FindFirstChild("Handle")
    if weapon then
        weapon.CFrame = lplr.Character.HumanoidRootPart.CFrame
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "f" then
            takeWeapon()
        end
    end
)
function function_name()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Aimbot.lua"), true))()
        getgenv().Aimbot.Settings.WallCheck = true
        getgenv().Aimbot.FOVSettings.Enabled = true
        getgenv().Aimbot.FOVSettings.Visible = false
end
function function_name2()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
end
function_name()
function_name2()