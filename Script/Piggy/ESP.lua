loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.folderItem = nil
_G.folderItemMod = nil
_G.folderNPC = nil
_G.folderNPCMod = nil

function createESP(parent, r, g, b)
    local bgui = Instance.new("BillboardGui", parent.Head)
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
    for _, p in pairs(parent:GetChildren()) do
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
                mf.BackgroundColor3 = Color3.fromRGB(r, g, b)
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    if o.Character:FindFirstChild("Enemy") then
                        if o.Character:FindFirstChild("Ghost") then
                            createESP(o.Character, 242, 243, 243)
                        else
                            createESP(o.Character, 196, 40, 28)
                        end
                    else
                        createESP(o.Character, 75, 151, 75)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    if newPlayer.Character:FindFirstChild("Enemy") then
                        createESP(newPlayer.Character, 196, 40, 28)
                    else
                        createESP(newPlayer.Character, 75, 151, 75)
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
            if o.Character then
                if o.Character:FindFirstChild("Enemy") then
                    createESP(o.Character, 196, 40, 28)
                else
                    createESP(o.Character, 75, 151, 75)
                end
            end
        end
    end
end
espFirst()

-- function createESPItem(parent, r, g, b, fontSize)
--     local bgui = Instance.new("BillboardGui", parent)
--     bgui.Name = ("EGUI")
--     bgui.AlwaysOnTop = true
--     bgui.ExtentsOffset = Vector3.new(0, 0, 0)
--     bgui.Size = UDim2.new(1, 0, 1, 0)
--     local nam = Instance.new("TextLabel", bgui)
--     if tonumber(nam.Text) ~= nil then
--         nam.Text = "Items"
--     else
--         nam.Text = parent.Name
--     end
--     nam.BackgroundTransparency = 1
--     nam.TextSize = fontSize
--     nam.Font = ("Arial")
--     nam.TextColor3 = Color3.fromRGB(r, g, b)
--     nam.Size = UDim2.new(1, 0, 1, 0)
-- end

function firstScript()
    if wp:FindFirstChild("ItemFolder") then
        _G.folderItem = wp.ItemFolder
        for _, v in pairs(_G.folderItem:GetChildren()) do
            createESPItem(v, 245, 205, 48, 13, tostring(v.Name))
        end
        _G.folderItem.ChildAdded:connect(
            function(m)
                wait()
                createESPItem(m, 245, 205, 48, 13, tostring(m.Name))
            end
        )
    end

    if wp:FindFirstChild("PeppaNPC") then
        _G.folderNPC = wp.PeppaNPC
        for _, v in pairs(_G.folderNPC:GetChildren()) do
            createESP(v, 196, 40, 28)
        end
        _G.folderNPC.ChildAdded:connect(
            function(m)
                wait()
                createESP(m, 196, 40, 28)
            end
        )
    end

    if wp.GameFolder:FindFirstChild("ItemFolder") then
        _G.folderItemMod = wp.GameFolder.ItemFolder
        for _, v in pairs(_G.folderItemMod:GetChildren()) do
            createESPItem(v, 245, 205, 48, 13)
        end
        _G.folderItemMod.ChildAdded:connect(
            function(m)
                wait()
                createESPItem(m, 245, 205, 48, 13)
            end
        )
    end

    if wp.GameFolder:FindFirstChild("PiggyNPC") then
        _G.folderNPCMod = wp.GameFolder.PiggyNPC
        for _, v in pairs(_G.folderNPCMod:GetChildren()) do
            createESP(v, 196, 40, 28)
        end
        _G.folderNPCMod.ChildAdded:connect(
            function(m)
                wait()
                createESP(m, 196, 40, 28)
            end
        )
    end
end
firstScript()
-- game:GetService("Workspace").PeppaNPC
-- game:GetService("Workspace").ItemFolder
-- game:GetService("Workspace").GameFolder.ItemFolder
-- game:GetService("Workspace").GameFolder.PiggyNPC

function lightCode()
    lgt.Brightness = 1
    lgt.GlobalShadows = false
    lgt.TimeOfDay = "12:00:00"
    lgt.ClockTime = 12
    lgt.FogStart = 0
    lgt.FogEnd = 100000
    lgt.Changed:connect(
        function(property)
            if property == "Brightness" or property == "FogEnd" then
                lgt.Brightness = 1
                lgt.GlobalShadows = false
                lgt.TimeOfDay = "12:00:00"
                lgt.ClockTime = 12
                lgt.FogStart = 0
                lgt.FogEnd = 100000
            end
        end
    )
end

function statsPlayerWs()
    if lplr:FindFirstChild("Character") then
        lplr.Character.Humanoid.WalkSpeed = ws_g

        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                lplr.Character.Humanoid.WalkSpeed = ws_g
            end
        )
    end
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait()
            lplr.Character.Humanoid.WalkSpeed = ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    lplr.Character.Humanoid.WalkSpeed = ws_g
                end
            )
        end
    )
end
statsPlayerWs()

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

function infJump()
    if lplr.Character.Humanoid ~= nil then
        lplr.Character.Humanoid.JumpPower = 50
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        -- lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "x" then
            if ws_g == 20 then
                ws_g = 18
                lplr.Character.Humanoid.WalkSpeed = ws_g
                NotifyG("Walk Speed", tostring(ws_g))
            else
                ws_g = 20
                lplr.Character.Humanoid.WalkSpeed = ws_g
                NotifyG("Walk Speed", tostring(ws_g))
            end
        end

        if keyDown == "c" then
            changeWS(0)
            NotifyG("Walk Speed", tostring(ws_g))
        end

        if keyDown == "v" then
            changeWS(1)
            NotifyG("Walk Speed", tostring(ws_g))
        end

        if keyDown == " " then
            infJump()
        end
    end
)
lightCode()

-- local string_1 = "DefaultTrap";
-- local Target = game:GetService("ReplicatedStorage").Remotes.TrapRemote;
-- Target:InvokeServer(string_1);

-- local string_1 = "PlayerSprint";
-- local Target = game:GetService("ReplicatedStorage").Remotes.TrapRemote;
-- Target:InvokeServer(string_1);

-- -- Ghost
-- -- Enemy
-- game:GetService("Workspace").PeppaNPC
-- game:GetService("Workspace").ItemFolder
-- game:GetService("Workspace").GameFolder.ItemFolder
-- game:GetService("Workspace").GameFolder.PiggyNPC