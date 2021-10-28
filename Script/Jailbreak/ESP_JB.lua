uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

_G.wsSpeed = 20
_G.jump = 50
_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Info",
            Text = msg,
            Duration = 3
        }
    )
end

function dropBox(parent)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(255, 255, 0)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(_G.faces) do
                local m = Instance.new("SurfaceGui", p)
                m.Name = ("EGUI")
                m.Face = f
                m.Active = true
                m.AlwaysOnTop = true
                local mf = Instance.new("Frame", m)
                mf.Size = UDim2.new(1, 0, 1, 0)
                mf.BorderSizePixel = 0
                mf.BackgroundTransparency = 0.5
                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                parent:GetPropertyChangedSignal("Team"):connect(
                    function()
                        if tostring(parent.Team) == "Criminal" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        elseif tostring(parent.Team) == "Police" then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        elseif tostring(parent.Team) == "Prisoner" then
                            mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )

                if tostring(parent.Team) == "Criminal" then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(parent.Team) == "Police" then
                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                elseif tostring(parent.Team) == "Prisoner" then
                    mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                end
            end
        end
    end

    parent:GetPropertyChangedSignal("Team"):connect(
        function()
            if tostring(parent.Team) == "Criminal" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            elseif tostring(parent.Team) == "Police" then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(parent.Team) == "Prisoner" then
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )

    if tostring(parent.Team) == "Criminal" then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    elseif tostring(parent.Team) == "Police" then
        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
    elseif tostring(parent.Team) == "Prisoner" then
        nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        o.CharacterAdded:Connect(
            function(characterModel)
                wait(0.5)
                if o.Name ~= lplr.Name then
                    createESP(o)
                end
            end
        )
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(0.5)
                    if newPlayer.Name ~= lplr.Name then
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
            if o.Character ~= nil then
                wait(0.1)
                createESP(o)
            end
        end
    end
end

espFirst()

function firstScript()
    if wp:FindFirstChild("SecretBaseCriminal") then
        wp.SecretBaseCriminal.Doors:Destroy()
    end

    for _, v in pairs(wp:GetChildren()) do
        if v.Name == "Drop" then
            wait()
            local item = v:GetChildren()[1]
            if item then
                dropBox(item)
                notify(item.Name .. " is drop")
                SendChat(item.Name .. " is drop")
            end
        end
    end

    wp.ChildAdded:connect(
        function(m)
            if m.Name == "Drop" then
                wait(0.1)
                local item1 = m:GetChildren()[1]
                if item1 then
                    dropBox(item1)
                    notify(item1.Name .. " is drop")
                end
                local item2 = m:GetChildren()[2]
                if item2 then
                    dropBox(item2)
                    notify(item2.Name .. " is drop")
                end
            end
        end
    )
end
firstScript()

function statsPlayerWs()
    _G.humanoidP.WalkSpeed = _G.wsSpeed

    _G.humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if _G.humanoidP.WalkSpeed ~= _G.wsSpeed then
                _G.humanoidP.WalkSpeed = _G.wsSpeed
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            _G.humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            _G.humanoidP.WalkSpeed = _G.wsSpeed
            _G.humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if _G.humanoidP.WalkSpeed ~= _G.wsSpeed then
                        _G.humanoidP.WalkSpeed = _G.wsSpeed
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.wsSpeed = _G.wsSpeed + 5
        _G.humanoidP.WalkSpeed = _G.wsSpeed
    elseif typeWS == 1 then
        if _G.wsSpeed >= 0 then
            _G.wsSpeed = _G.wsSpeed - 5
            _G.humanoidP.WalkSpeed = _G.wsSpeed
        end
        if _G.wsSpeed < 0 then
            _G.wsSpeed = 0
            _G.humanoidP.WalkSpeed = _G.wsSpeed
        end
    end
end

-- uis.InputBegan:Connect(
--     function(input, gameProcessed)
--         if input.UserInputType.Value == 8 then
--             if input.KeyCode.Value == 107 then
--                 changeWS(0)
--                 SendChat("Walk Speed :" .. _G.humanoidP.WalkSpeed)
--             end

--             if input.KeyCode.Value == 108 then
--                 changeWS(1)
--                 SendChat("Walk Speed :" .. _G.humanoidP.WalkSpeed)
--             end
--         end
--     end
-- )

function statsPlayerJp()
    _G.humanoidP.JumpPower = _G.jump
    _G.humanoidP:GetPropertyChangedSignal("JumpPower"):connect(
        function()
            if _G.humanoidP.JumpPower ~= _G.jump then
                _G.humanoidP.JumpPower = _G.jump
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            _G.humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            _G.humanoidP.JumpPower = _G.jump
            _G.humanoidP:GetPropertyChangedSignal("JumpPower"):connect(
                function()
                    if _G.humanoidP.JumpPower ~= _G.jump then
                        _G.humanoidP.JumpPower = _G.jump
                    end
                end
            )
        end
    )
end

statsPlayerJp()

function infJump()
    if lplr.Character ~= nil then
        lplr.Character.Humanoid.JumpPower = _G.jump
        lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end

function changeJP(typeJP)
    if typeJP == 0 then
        _G.jump = _G.jump + 5
        _G.humanoidP.JumpPower = _G.jump
    elseif typeJP == 1 then
        if _G.jump >= 50 then
            _G.jump = _G.jump - 5
            _G.humanoidP.JumpPower = _G.jump
        end
        if _G.jump < 50 then
            _G.jump = 50
            _G.humanoidP.JumpPower = _G.jump
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "k" then
            changeWS(0)
            SendChat("Walk Speed :" .. _G.humanoidP.WalkSpeed)
        end

        if keyDown == "l" then
            changeWS(1)
            SendChat("Walk Speed :" .. _G.humanoidP.WalkSpeed)
        end

        if keyDown == "x" then
            _G.noclipAll = not _G.noclipAll
        end

        if keyDown == "[" then
            changeJP(0)
            SendChat("Jump Power :" .. _G.humanoidP.JumpPower)
        end

        if keyDown == "]" then
            changeJP(1)
            SendChat("Jump Power :" .. _G.humanoidP.JumpPower)
        end

        if keyDown == " " then
            infJump()
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll and lplr.Character ~= nil then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
