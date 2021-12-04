loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function hitBox()
    for _, o in pairs(wp.enemies:GetChildren()) do
        if o:WaitForChild("Head") then
            wait(0.1)
            createHitBox(o)
        end
    end

    wp.enemies.ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head") then
                wait(0.1)
                createHitBox(m)
            end
        end
    )

    for _, o in pairs(wp.BossFolder:GetChildren()) do
        wait(0.1)
        createHitBox(o)
    end

    wp.BossFolder.ChildAdded:connect(
        function(m)
            if m:WaitForChild("Head") then
                wait(0.1)
                createHitBox(m)
            end
        end
    )
end
hitBox()

function funcWeapon()
    for i, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Spread') then
            v.Automatic = true
            if v.Firerate < 3 then
                v.Firerate = 3
            end
            if v.Damage < 100 then
                v.Damage = 100
            end
            -- v.Damage = 100
            v.Spread = {
                Min = 0,
                Rec = 0,
                Inc = 0,
                Max = 0
            }
        end
    end
end
funcWeapon()
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
            notify("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            notify("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "f" then
            noclipAll = not noclipAll
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
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
