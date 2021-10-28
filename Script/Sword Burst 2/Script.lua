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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.ws_g = 25
-- HitEffects
-- Entiny
-- Mob
function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Swordburst 2",
            Text = msg,
            Duration = 3
        }
    )
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
                    if o.Character:WaitForChild("Head") then
                        wait(0.1)
                        createESP(o)
                    end
                end
            )
        end
    end
end
espFirst()

function createHitBox(parent)
    if parent:FindFirstChild("Head") then
        parent.HumanoidRootPart.Transparency = 0.9
        parent.HumanoidRootPart.Size = Vector3.new(40, 40, 40)
        parent.HumanoidRootPart.Color = Color3.new(255, 255, 255)
        parent.HumanoidRootPart.Material = "Neon"
        -- if not parent:FindFirstChild("partHitbox") then
        --     local partHitbox = Instance.new("Part", parent)
        --     partHitbox.Name = "partHitbox"
        --     partHitbox.Size = Vector3.new(10, 1, 10)
        --     partHitbox.CanCollide = true
        --     partHitbox.Anchored = true
        --     partHitbox.CFrame = parent.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
        --     spawn(
        --         function()
        --             while wait(.1) do
        --                 partHitbox.CFrame = parent.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
        --             end
        --         end
        --     )
        -- end
        spawn(
            function()
                wait()
                parent.HumanoidRootPart.CanCollide = false
                parent.Torso.CanCollide = true
            end
        )
    end
end

function firstScript()
    for _, v in pairs(wp.Mobs:GetChildren()) do
        createHitBox(v)
        v.ChildAdded:connect(
            function(l)
                wait(.1)
                createHitBox(v)
            end
        )
    end

    wp.Mobs.ChildAdded:connect(
        function(m)
            wait(.1)
            createHitBox(m)
            m.ChildAdded:connect(
                function(l)
                    wait(.1)
                    createHitBox(m)
                end
            )
        end
    )

    wp.HitEffects.ChildAdded:connect(
        function(m)
            m:Destroy()
        end
    )
end
-- firstScript()

local services, crystalForge
do
    repeat
        for i, v in next, getreg() do
            if (typeof(v) == "table" and rawget(v, "Services")) then
                services = v.Services
            elseif (typeof(v) == "table" and rawget(v, "Craft")) then
                crystalForge = v
            end

            if (services and crystalForge) then
                break
            end
        end

        heartbeat:Wait()
    until services and crystalForge
end

local rpcKey = getupvalue(services.Combat.Init, 2)

function attack(target)
    for i = 1, 3 do
        replicatedStorage.Event:FireServer("Skills", {"UseSkill", "Summon Pistol"})
        replicatedStorage.Event:FireServer("Combat", rpcKey, {"Attack", "Summon Pistol", 1, target})
    end
end

function infJump()
    --lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = _G.ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            end
        end
    )
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
            if sg:GetCoreGuiEnabled(2) == false then
                sg:SetCoreGuiEnabled(2, true)
            end
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 16 then
            _G.ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
    end
end

uis.InputBegan:Connect(
    function(input, gameProcessed)
        if input.UserInputType.Value == 8 then
            if input.KeyCode.Value == 32 then
                infJump()
            end

            if input.KeyCode.Value == 91 then
                changeWS(0)
                notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
            end

            if input.KeyCode.Value == 93 then
                changeWS(1)
                notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
            end
        end
    end
)

-- mouse.KeyDown:connect(
--     function(keyDown)
--         if keyDown == "l" then
--             for _, v in pairs(wp.Mobs:GetChildren()) do
--                 createHitBox(v)
--             end
--         end
--     end
-- )

mouse.Button1Down:connect(
    function()
        if not mouse.Target then
            return
        end
        local pant = mouse.Target
        local ppant = nil
        repeat
            ppant = pant
            pant = pant.Parent
        until pant.Name == "Mobs" or pant == nil
        if (ppant:FindFirstChild("HumanoidRootPart") and ppant:FindFirstChild("Nameplate") and ppant.PrimaryPart and ppant.Parent and ppant:FindFirstChild("Entity") and ppant.Entity.Health.Value > 0) then
            repeat
                attack(ppant)
                wait(0.15)
            until not mob or not mob:FindFirstChild("Nameplate") or not mob:FindFirstChild("Healthbar") or not mob:FindFirstChild("Entity")
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
