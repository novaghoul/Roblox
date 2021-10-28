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
VirtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.noclipAll = false

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

function createESP(parent, r, g, b)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, f in pairs(_G.faces) do
        local m = Instance.new("SurfaceGui", parent)
        m.Name = ("EGUI")
        m.Face = f
        m.Active = true
        m.AlwaysOnTop = true
        local mf = Instance.new("Frame", m)
        mf.Size = UDim2.new(1, 0, 1, 0)
        mf.BorderSizePixel = 0
        mf.BackgroundTransparency = 0.5
        mf.BackgroundColor3 = Color3.fromRGB(r, g, b)
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("HumanoidRootPart") then
                        wait(0.5)
                        if tostring(o.Team) == "Seeker" then
                            createESP(o.Character.Head, 196, 40, 28)
                        elseif tostring(o.Team) == "Hider" then
                            createESP(o.Character.HumanoidRootPart, 13, 105, 172)
                        elseif tostring(o.Team) == "Lobby" then
                            createESP(o.Character.Head, 75, 151, 75)
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
                    if characterModel:WaitForChild("HumanoidRootPart") then
                        wait(0.5)
                        createESP(newPlayer)
                        if tostring(newPlayer.Team) == "Seeker" then
                            createESP(newPlayer.Character.Head, 196, 40, 28)
                        elseif tostring(newPlayer.Team) == "Hider" then
                            createESP(newPlayer.Character.HumanoidRootPart, 13, 105, 172)
                        elseif tostring(newPlayer.Team) == "Lobby" then
                            createESP(newPlayer.Character.Head, 75, 151, 75)
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
            spawn(
                function()
                    if o.Character:WaitForChild("HumanoidRootPart") then
                        wait(0.1)
                        if tostring(o.Team) == "Seeker" then
                            createESP(o.Character.Head, 196, 40, 28)
                        elseif tostring(o.Team) == "Hider" then
                            createESP(o.Character.HumanoidRootPart, 13, 105, 172)
                        elseif tostring(o.Team) == "Lobby" then
                            createESP(o.Character.Head, 75, 151, 75)
                        end
                    end
                end
            )
        end
    end
end
espFirst()

function firstScript()
    spawn(
        function()
            if wp:WaitForChild("New_WaitingRoom") then
                for _, v in pairs(wp["New_WaitingRoom"].coins:GetChildren()) do
                    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
                end
            end

            for _, v in pairs(wp.PartyTool:GetChildren()) do
                v.Handle.CFrame = lplr.Character.HumanoidRootPart.CFrame
            end
        end
    )
end

function infJump()
    --lplr.Character.Humanoid.JumpPower = 50
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "c" then
            _G.noclipAll = not _G.noclipAll
        end

        if keyDown == "v" then
            firstScript()
        end

        if keyDown == " " then
            infJump()
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
game:GetService("RunService").Stepped:connect(
    function()
        wait(0.5)
        if tostring(lplr.Team) == "Hider" then
            if _G.noclipAll then
                for _, v in pairs(lplr.Character:GetChildren()) do
                    if v:IsA("Part") or v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            else
                for _, v in pairs(lplr.Character:GetChildren()) do
                    if v:IsA("Part") or v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
        spawn(
            function()
                if wp:WaitForChild("New_WaitingRoom") then
                    for _, v in pairs(wp["New_WaitingRoom"].coins:GetChildren()) do
                        v.CFrame = lplr.Character.HumanoidRootPart.CFrame
                    end
                end

                for _, v in pairs(wp.PartyTool:GetChildren()) do
                    v.Handle.CFrame = lplr.Character.HumanoidRootPart.CFrame
                end
            end
        )
    end
)
