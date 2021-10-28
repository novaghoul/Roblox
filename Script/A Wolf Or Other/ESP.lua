uis = game:GetService("UserInputService")
cg = game:GetService("CoreGui")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.ws_g = 20
_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "A Wolf Or Other",
            Text = msg,
            Duration = 3
        }
    )
end

function createESP(parent, r, g, b)
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name .. "(" .. parent.Character.Head.Nametag.TextLabel.Text .. ")"
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
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
                mf.BackgroundColor3 = Color3.fromRGB(r, g, b)
                parent.Backpack.ChildAdded:connect(
                    function(m)
                        wait(0.1)
                        if m:FindFirstChild("Ammo") then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        elseif m:FindFirstChild("ClawScript") then
                            mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        end
                    end
                )
                
                parent.Character.ChildRemoved:connect(
                    function(m)
                        wait(0.1)
                        if m:IsA("Tool") then
                            local charTool = parent.Character:FindFirstChildOfClass("Tool")
                            local backTool = parent.Backpack:FindFirstChildOfClass("Tool")
                            if not charTool and not backTool then
                                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                            end
                        end
                    end
                )
            end
        end
    end
    parent.Backpack.ChildAdded:connect(
        function(m)
            wait(0.1)
            if m:FindFirstChild("Ammo") then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif m:FindFirstChild("ClawScript") then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    )
    parent.Character.ChildRemoved:connect(
        function(m)
            wait(0.1)
            if m:IsA("Tool") then
                local charTool = parent.Character:FindFirstChildOfClass("Tool")
                local backTool = parent.Backpack:FindFirstChildOfClass("Tool")
                if not charTool and not backTool then
                    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                end
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

function createHitBox(parent)
    local sizeBody = parent.Character[_G.hitBoxBody].Size.x
    parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    parent.Character[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    parent.Character[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    parent.Character[_G.hitBoxBody].Material = "Neon"
    parent.Character[_G.hitBoxBody].CanCollide = false

    parent.Character[_G.hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                parent.Character[_G.hitBoxBody].CanCollide = false
            end
        end
    )
end

function hitBox()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(newPlayer)
                    end
                end
            )
        end
    )

    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:WaitForChild(_G.hitBoxBody) then
                        wait(0.1)
                        createHitBox(o)
                    end
                end
            )
        end
    end
end
hitBox()

function firstScript()
    for _, v in pairs(wp.EffectsBin:GetChildren()) do
        if tostring(v.Name) == "Handle" then
            local bgui = Instance.new("BillboardGui", v)
            bgui.Name = ("EGUI")
            bgui.AlwaysOnTop = true
            bgui.ExtentsOffset = Vector3.new(0, 0, 0)
            bgui.Size = UDim2.new(1, 0, 1, 0)
            local nam = Instance.new("TextLabel", bgui)
            nam.Text = "Weapon Here"
            nam.BackgroundTransparency = 1
            nam.TextSize = 10
            nam.Font = ("Arial")
            nam.TextColor3 = Color3.fromRGB(242, 243, 243)
            nam.Size = UDim2.new(1, 0, 1, 0)
        elseif v:FindFirstChild("Head") then
            for _, l in pairs(v.Head:GetChildren()) do
                if tostring(l.Name) == "EGUI" then
                    l:Destroy()
                end
            end
        else
            v:Destroy()
        end
    end
    wp.EffectsBin.ChildAdded:connect(
        function(m)
            wait(0.1)
            if tostring(m.Name) == "Handle" then
                local bgui = Instance.new("BillboardGui", m)
                bgui.Name = ("EGUI")
                bgui.AlwaysOnTop = true
                bgui.ExtentsOffset = Vector3.new(0, 0, 0)
                bgui.Size = UDim2.new(1, 0, 1, 0)
                local nam = Instance.new("TextLabel", bgui)
                nam.Text = "Weapon Here"
                nam.BackgroundTransparency = 1
                nam.TextSize = 10
                nam.Font = ("Arial")
                nam.TextColor3 = Color3.fromRGB(242, 243, 243)
                nam.Size = UDim2.new(1, 0, 1, 0)
            else
                wait(0.5)
                if m:FindFirstChild("Head") then
                    for _, l in pairs(m.Head:GetChildren()) do
                        if tostring(l.Name) == "EGUI" then
                            l:Destroy()
                        end
                    end
                else
                    m:Destroy()
                end
            end
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

function infJump()
    --lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    if wp:FindFirstChild(lplr.Name) then
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g

        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                    lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                end
            end
        )
    end
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 2
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 2
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 16 then
            _G.ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "f" then
            takeWeapon()
        end

        if keyDown == "c" then
            changeWS(0)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
