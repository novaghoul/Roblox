loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local nameGun = ""

function funcHealth(parent)
    spawn(function()
        while parent do
            wait()
            parent.Head.nameEGUI.nameESP.Text = tostring(parent.Humanoid.Health)
        end
    end)
end

function hitBox()
    for _, o in pairs(wp.enemies:GetChildren()) do
        if o:WaitForChild("Head") then
            wait(0.1)
            createHitBox(o)
            createESPItem(o.Head, 196, 40, 28, 14, tostring(o.Humanoid.Health), 1)
            funcHealth(o)
        end
    end

    wp.enemies.ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head") then
                wait(0.1)
                createHitBox(m)
                createESPItem(m.Head, 196, 40, 28, 14, tostring(m.Humanoid.Health), 1)
                funcHealth(m)
            end
        end
    )

    for _, o in pairs(wp.BossFolder:GetChildren()) do
        wait(0.1)
        createHitBox(o)
        createESPItem(o.Head, 196, 40, 28, 14, tostring(o.Humanoid.Health), 1)
        funcHealth(o)
    end

    wp.BossFolder.ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head") then
                wait(0.1)
                createHitBox(m)
                createESPItem(m.Head, 196, 40, 28, 14, tostring(m.Humanoid.Health), 1)
                funcHealth(m)
            end
        end
    )
end
hitBox()

function funcFirst()
    for i, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Spread') then
            v.Automatic = true
            if v.Firerate < 3 then
                v.Firerate = 3
            end
            -- if v.Damage < 100 then
            --     v.Damage = 100
            -- end
            -- v.Damage = 100
            v.Spread = {
                Min = 0,
                Rec = 0,
                Inc = 0,
                Max = 0
            }
        end
    end
    
    if wp.map:GetChildren() then
        local mapGame = wp.map:GetChildren()[1]
        if mapGame:FindFirstChild("Walls") then
            mapGame.Walls:Destroy()
        end
    end

    wp.map.ChildAdded:connect(
        function(m)
            wait(1)
            if m:FindFirstChild("Walls") then
                m.Walls:Destroy()
            end
            m.ChildAdded:connect(
                function(n)
                    if n:FindFirstChild("Walls") then
                        n.Walls:Destroy()
                    end
                end
            )
        end
    )

    for _,v in pairs(wp.Powerups:GetChildren()) do
        v.Part.CFrame = lplr.Character.HumanoidRootPart.CFrame
    end

    wp.Powerups.ChildAdded:connect(
        function(m)
            wait(.1)
            m.Part.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    )
end
funcFirst()

-- game:GetService("Workspace").WAOKyoHana["Machine Gun"].GunController
-- game:GetService("Workspace").WAOKyoHana["Rainbow Horse Sword"].KnifeController

-------------------------------------------------------------
--------------------------Other------------------------------
function infJump()
    lplr.Character.Humanoid.JumpPower = jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
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
            lplr.Character.Humanoid.WalkSpeed = ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                        lplr.Character.Humanoid.WalkSpeed = ws_g
                    end
                end
            )
            characterModel.ChildAdded:connect(
                function(m)
                    wait(1)
                    if m:FindFirstChild("GunController") then
                        nameGun = tostring(m.Name)
                        print(m)
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
        lplr.Character.Humanoid.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "[" then
            changeWS(0)
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "f" then
            noclipAll = not noclipAll
            NotifyG("Noclip", tostring(noclipAll))
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)


spawn(function()
    while wait(0.05) do
        -- if mouse.Target.Parent:FindFirstChild("Head") then
            local table_1 = {
                ["Normal"] = "0, 0, 0",
                ["Direction"] = "0, 0, 0",
                ["Name"] = nameGun,
                ["Hit"] = mouse.Target,
                ["Origin"] = "0, 0, 0",
                ["Pos"] = "0, 0, 0"
            }
            local Target = rs.Gun
            Target:FireServer(table_1)
        -- end
    end
end)
-- spawn(function()
--     while wait() do
--         local string_1 = "hit"
--         local string_2 = nameMelee
--         local userdata_1 = partTouch
--         local Target = rs.forhackers
--         Target:InvokeServer(string_1, string_2, userdata_1)
--     end
-- end)
-- spawn(function()
--     while wait() do
--         local string_1 = "throw"
--         local string_2 = nameMelee
--         local userdata_1 = mouse.Hit
--         local Target = rs.forhackers
--         Target:InvokeServer(string_1, string_2, userdata_1)
--     end
-- end)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)