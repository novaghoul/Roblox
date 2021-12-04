loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.map = nil
_G.children = nil

function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end

function funcChangeColor(parent, r, g, b)
    for _, v in pairs(parent:GetChildren()) do
        if v.Name == "BS" then
            v.FR.BackgroundColor3 = Color3.fromRGB(r, g, b)
        end
    end
end

function createESP(parent)
    createESPItem(parent.Character.Head, 75, 151, 75, 14, parent.Name)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 75, 151, 75)
            end
        end
    end
    if parent.Character:FindFirstChild("BeastPowers") then
        funcChangeColor(parent.Character.Head, 196, 40, 28)
    end
    parent.Character.ChildAdded:connect(
        function(m)
            if m.Name == "BeastPowers" then
                funcChangeColor(parent.Character.Head, 196, 40, 28)
            end
        end
    )
    parent.Character.ChildRemoved:connect(
        function(m)
            if m.Name == "BeastPowers" then
                funcChangeColor(parent.Character.Head, 75, 151, 75)
            end
        end
    )
    parent.Character.ChildAdded:connect(
        function(m)
            if m.Name == "BeastPowers" then
                parent.Character.Head.EGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    )
    parent.Character.ChildRemoved:connect(
        function(m)
            if m.Name == "BeastPowers" then
                parent.Character.Head.EGUI.nameESP.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )

    if parent.Character:FindFirstChild("BeastPowers") then
        parent.Character.Head.EGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    createESP(o)
                end
            )
        end
    end
    plrs.PlayerAdded:Connect(
        function(newPlayer)
            if newPlayer.Name ~= lplr.Name then
                newPlayer.CharacterAdded:Connect(
                    function(characterModel)
                        wait(1)
                        createESP(newPlayer)
                    end
                )
            end
        end
    )
end
enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            createESP(o)
        end
    end
end
espFirst()

function createMap()
    _G.map = wp:findFirstChild(tostring(rs.CurrentMap.Value))
    _G.children = _G.map:GetChildren()
    for i = 1, #_G.children do
        if _G.children[i].Name == "ComputerTable" then
            createESPItem(_G.children[i].Screen, _G.children[i].Screen.Color.r*255, _G.children[i].Screen.Color.g*255, _G.children[i].Screen.Color.b*255, 14, "COMPUTER")
            _G.children[i].Screen:GetPropertyChangedSignal("Color"):connect(
                function()
                    _G.children[i].Screen.EGUI.nameESP.TextColor3 = _G.children[i].Screen.Color
                end
            )
            for l = 1, 3 do
                _G.children[i]["ComputerTrigger" .. l].Size = Vector3.new(3, 3, 3)
            end
        end
        -- if _G.children[i].Name == "FreezePod" then
        --     createESPItem(_G.children[i].BasePart, 13, 105, 172, 14, "FP")
        -- end
    end
end

function espMapItem()
    if rs.GameTimer.Value > 0 then
        createMap()
    end

    rs.GameStatus:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(rs.GameStatus.Value) == "15 SEC HEAD START" then
                createMap()
            end
        end
    )
end
espMapItem()

function changeLight()
    lgt.FogStart = 0
    lgt.FogEnd = 100000
    local li = require(lgt.LightingValuesList)
    li.Brightness = 1
    li.GlobalShadows = false
    li.Ambient = Color3.new(0, 0, 0)
    li.GeographicLatitude = 41
    li.ColorShift_Top = Color3.new(0, 0, 0)
    li.ColorShift_Bottom = Color3.new(0, 0, 0)
	li.OutdoorAmbient = Color3.fromRGB(191, 191, 191)
	li.ShadowSoftness = 0
	li.EnvironmentDiffuseScale = 0
	li.EnvironmentSpecularScale = 0
	li.TimeOfDay = "12:00:00"
	li.ExposureCompensation = 0
end
changeLight()

function firstScript()
    lplr.PlayerGui.ScreenGui.TimingCircle:GetPropertyChangedSignal("Visible"):connect(
        function()
            if lplr.PlayerGui.ScreenGui.TimingCircle.Visible then
                wait(0.01)
                local args = {
                    [1] = "Input",
                    [2] = "Action",
                    [3] = true
                }
                rs.RemoteEvent:FireServer(unpack(args))
            end
        end
    )
end
firstScript()

function changeSpeed()
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
            characterModel.Humanoid.WalkSpeed = ws_g
            characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if characterModel.Humanoid.WalkSpeed ~= ws_g then
                        characterModel.Humanoid.WalkSpeed = ws_g
                    end
                end
            )
            characterModel.ChildAdded:connect(
                function(m)
                    wait(0.5)
                    if m.Name == "Humanoid" then
                        if characterModel.Humanoid:FindFirstChild("HumanoidDescription") then
                            characterModel.Humanoid:FindFirstChild("HumanoidDescription"):Destroy()
                        end
                    elseif m.Name == "Animate" then
                        if characterModel.Animate:FindFirstChild("fall") then
                            characterModel.Animate:FindFirstChild("fall"):Destroy()
                        end
                        if characterModel.Animate:FindFirstChild("sit") then
                            characterModel.Animate:FindFirstChild("sit"):Destroy()
                        end
                    elseif m.Name == "Ragdoller" then
                        if characterModel:FindFirstChild("Ragdoller") then
                            characterModel:FindFirstChild("Ragdoller"):Destroy()
                        end
                    elseif m.Name == "TestLocalScript" then
                        if characterModel:FindFirstChild("TestLocalScript") then
                            characterModel:FindFirstChild("TestLocalScript"):Destroy()
                        end
                    end
                end
            )
        end
    )
    wait(0.5)
    if lplr.Character.Humanoid:FindFirstChild("HumanoidDescription") then
        lplr.Character.Humanoid:FindFirstChild("HumanoidDescription"):Destroy()
    end
    if lplr.Character.Animate:FindFirstChild("fall") then
        lplr.Character.Animate:FindFirstChild("fall"):Destroy()
    end
    if lplr.Character.Animate:FindFirstChild("sit") then
        lplr.Character.Animate:FindFirstChild("sit"):Destroy()
    end
    if lplr.Character:FindFirstChild("Ragdoller") then
        lplr.Character:FindFirstChild("Ragdoller"):Destroy()
    end
    if lplr.Character:FindFirstChild("TestLocalScript") then
        lplr.Character:FindFirstChild("TestLocalScript"):Destroy()
    end
end

function changeWS(typeWS)
    if typeWS == 0 then
        ws_g = ws_g + 2
        lplr.Character.Humanoid.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 2
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end
end
changeSpeed()

function infJump()
    if lplr.Character.Humanoid ~= nil then
        lplr.Character.Humanoid.JumpPower = jp_g
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "c" then
            changeWS(0)
            notify("Walk Speed", tostring(ws_g))
        end

        if keyDown == "x" then
            if ws_g == 20 then
                ws_g = 30
                lplr.Character.Humanoid.WalkSpeed = ws_g
                notify("Walk Speed", tostring(ws_g))
            else
                ws_g = 20
                lplr.Character.Humanoid.WalkSpeed = ws_g
                notify("Walk Speed", tostring(ws_g))
            end
        end

        if keyDown == "v" then
            changeWS(1)
            notify("Walk Speed", tostring(ws_g))
        end

        if keyDown == "f" then
            noclipAll = not noclipAll
            notify("No Clip", tostring(noclipAll))
        end
    end
)

spawn(
    function()
        while true do
            wait()
            rs.RemoteEvent:FireServer("SetPlayerMinigameResult", true)
        end
    end
)

-- game:GetService("RunService").Stepped:connect(
--     function()
--         if noclipAll then
--             for i = 1, #checkRigType() do
--                 lplr.Character[checkRigType()[i]].CanCollide = false
--             end
--             lplr.Character.HumanoidRootPart.CanCollide = false
--         else
--             for i = 1, #checkRigType() do
--                 lplr.Character[checkRigType()[i]].CanCollide = true
--             end
--             lplr.Character.HumanoidRootPart.CanCollide = true
--         end
--     end
-- )