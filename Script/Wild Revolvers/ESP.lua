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

_G = {
    faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"},
    hitBoxSize = 5,
    hitBoxBody = "Head",
    hitBoxColor = "Really blue",
    hitBoxTransparency = 1
    -- HumanoidRootPart
}

function checkESP(parent)
    local numEGUI = 0
    for _, v in pairs(parent.Character.Head:GetChildren()) do
        if v.Name == "EGUI" then
            numEGUI = numEGUI + 1
        end
    end

    if numEGUI ~= 7 then
        for _, v in pairs(parent.Character.Head:GetChildren()) do
            if v.Name == "EGUI" then
                v:Destroy()
            end
        end
        for _, v in pairs(lplr.PlayerGui.PCUI.TDMLeaderboardFrame.Cowboys:GetChildren()) do
            if tostring(parent.Name) == tostring(v.Text) then
                createESP(parent, 196, 40, 28)
            end
        end
        for _, v in pairs(lplr.PlayerGui.PCUI.TDMLeaderboardFrame.Sherrifs:GetChildren()) do
            if tostring(parent.Name) == tostring(v.Text) then
                createESP(parent, 13, 105, 172)
            end
        end
    end
end

function createESP(parent, r, g, b)
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
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(3)
                    if characterModel:WaitForChild("Head") then
                        checkESP(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            if tostring(newPlayer.Name) ~= tostring(lplr.Name) then
                newPlayer.CharacterAdded:Connect(
                    function(characterModel)
                        wait(3)
                        if characterModel:WaitForChild("Head") then
                            checkESP(newPlayer)
                        end
                    end
                )
            end
        end
    )
end

enableESPCode()


spawn(function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/bYWhrnGA'),true))() --Hit Box
end)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            for _, o in pairs(plrs:GetPlayers()) do
                if tostring(o.Name) ~= tostring(lplr.Name) then
                    if o.Character:FindFirstChild("Head") then
                        checkESP(o)
                    end
                end
            end
        end
    end
)
