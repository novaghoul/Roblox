loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

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
    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                local m = Instance.new("SurfaceGui", p)
                m.Name = ("EGUI")
                m.Face = f
                m.Active = true
                m.AlwaysOnTop = true
                local mf = Instance.new("Frame", m)
                mf.Size = UDim2.new(1, 0, 1, 0)
                mf.BorderSizePixel = 0
                mf.BackgroundTransparency = 0.5
                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                if parent.Character:FindFirstChild("KillScript") then
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
                parent.Character.ChildAdded:connect(
                    function(m)
                        if m.Name == "KillScript" then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        end
                    end
                )
            end
        end
    end
    if parent.Character:FindFirstChild("KillScript") then
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
    parent.Character.ChildAdded:connect(
        function(m)
            if m.Name == "KillScript" then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    )
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(0.5)
                    if characterModel:WaitForChild("Head") then
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
                    wait(0.5)
                    if characterModel:WaitForChild("Head") then
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
        if tostring(o.Name) ~= tostring(lplr.Name) then
            if o.Character ~= nil then
                wait(0.1)
                createESP(o)
            end
        end
    end
end
espFirst()

function takeCoin()
    for _, v in pairs(wp.MapHolder:GetChildren()) do
        if v.Name == "Coin" then
            wait()
            v.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
end

function statsPlayerWs()
    humanoidP.WalkSpeed = ws_g

    humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if humanoidP.WalkSpeed ~= ws_g then
                humanoidP.WalkSpeed = ws_g
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            humanoidP.WalkSpeed = ws_g
            humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if humanoidP.WalkSpeed ~= ws_g then
                        humanoidP.WalkSpeed = ws_g
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        ws_g = ws_g + 5
        humanoidP.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 5
            humanoidP.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            humanoidP.WalkSpeed = ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "c" then
            noclipAll = not noclipAll
            NotifyG("Noclip", noclipAll)
        end

        if keyDown == "k" then
            changeWS(0)
            SendChatG("Walk Speed", humanoidP.WalkSpeed)
        end

        if keyDown == "l" then
            changeWS(1)
            SendChatG("Walk Speed", humanoidP.WalkSpeed)
        end

        if keyDown == " " then
            infJump()
        end

        if keyDown == "q" then
            takeCoin()
        end
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        else
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = true
            end
            lplr.Character.HumanoidRootPart.CanCollide = true
        end
    end
)
