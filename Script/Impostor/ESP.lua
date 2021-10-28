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

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore(
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
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

function checkReturn(String)
    if sg:GetCoreGuiEnabled(3) == false then
        return notify(String)
    else
        return SendChat(String)
    end
end

if wsSpeed == nil then
    wsSpeed = 20
end

if _G.faces == nil then
    _G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
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
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
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
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
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
            spawn(
                function()
                    if o.Character:FindFirstChild("Head") then
                        wait(0.1)
                        createESP(o)
                    end
                end
            )
        end
    end
end
espFirst()

function fStart()
    for _, jjk in pairs(game.Workspace.Interact:GetChildren()) do
        if jjk.Name == "Double Doors" or jjk.Name == "Lockdown Doors" or jjk.Name == "Vent" then
            game.ReplicatedStorage.Network.Interact:InvokeServer(jjk)
        end
    end
end
fStart()

function taskFull()
    for i, v in pairs(wp.Values.Tasks:GetChildren()) do
        if v.Targets:FindFirstChild(tostring(lplr)) then
            rs.Network.Interact:InvokeServer(v.Target.Value, true, 100)
            wait(.2)
        end
    end
end

function statsPlayerWs()
    humanoidP.WalkSpeed = wsSpeed

    humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if humanoidP.WalkSpeed ~= wsSpeed then
                humanoidP.WalkSpeed = wsSpeed
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            humanoidP.WalkSpeed = wsSpeed
            humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if humanoidP.WalkSpeed ~= wsSpeed then
                        humanoidP.WalkSpeed = wsSpeed
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        wsSpeed = wsSpeed + 2
        humanoidP.WalkSpeed = wsSpeed
    elseif typeWS == 1 then
        if wsSpeed >= 0 then
            wsSpeed = wsSpeed - 2
            humanoidP.WalkSpeed = wsSpeed
        end
        if wsSpeed < 20 then
            wsSpeed = 20
            humanoidP.WalkSpeed = wsSpeed
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "e" then
            taskFull()
        end

        if keyDown == "c" then
            changeWS(0)
            checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "v" then
            changeWS(1)
            checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
