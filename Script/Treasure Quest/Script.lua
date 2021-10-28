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
dFolder = wp.DungeonFolder

_G.ws_g = 20
_G.jp_g = 60
_G.autoAttack = false
_G.boxHitSize = 20

lplr.SimulationRadius = 10000000

_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function damgeMonster(parent)
    if parent:FindFirstChild("Head") then
        spawn(
            function()
                while parent and parent.Parent ~= nil do
                    if parent:FindFirstChild("Head") then
                        local A_1 = wp.PlayerWeapons[lplr.Name]
                        local A_2 = parent.Head
                        local Event = rs.Remotes.HitMonster
                        Event:FireServer(A_1, A_2)
                    else
                        break
                    end
                    wait(0.1)
                end
            end
        )
        if parent:FindFirstChild("DisableAI") then
            parent.DisableAI.Destroy()
        end
        if parent:FindFirstChild("MonsterAttack") then
            parent.MonsterAttack.Destroy()
        end
        if parent:FindFirstChild("MonsterAttackServer") then
            parent.MonsterAttackServer.Destroy()
        end
        if parent:FindFirstChild("MonsterTarget") then
            parent.MonsterTarget.Destroy()
        end
        if parent:FindFirstChild("MonsterTargetServer") then
            parent.MonsterTargetServer.Destroy()
        end
    end
end

function autoTakeDamage()
    for _, v in pairs(dFolder:GetChildren()) do
        for _, l in pairs(v:GetChildren()) do
            if l.Name == "Monsters" then
                for _, p in pairs(l:GetChildren()) do
                    damgeMonster(p)
                end
            end
            if l.Name == "Extras" then
                wait(0.5)
                for _, p in pairs(l:GetChildren()) do
                    if p.Name == "Chest" then
                        p.Hitbox.CFrame = lplr.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end

    dFolder.ChildAdded:connect(
        function(l)
            l.ChildAdded:connect(
                function(m)
                    if m.Name == "Monsters" then
                        m.ChildAdded:connect(
                            function(n)
                                wait(1)
                                damgeMonster(n)
                            end
                        )
                    end

                    if m.Name == "Extras" then
                        wait(1)
                        for _, p in pairs(m:GetChildren()) do
                            if p.Name == "Chest" then
                                p.Hitbox.CFrame = lplr.Character.HumanoidRootPart.CFrame
                            end
                        end
                    end
                end
            )

            -- if l.Name == "BossRoom" then
            --     wait(2)
            --     local bossChar = l.Monsters:GetChildren()[1]
            --     if bossChar then
            --         bossChar.Humanoid.Health = 0
            --         for _,v in pairs(bossChar:GetChildren()) do
            --             if v.Name ~= "Head" then
            --                 v:Destroy()
            --             end
            --         end
            --     end
            -- end

            -- if l.Name == "BossRoomEndless" then
            --     wait(2)
            --     local bossChar = l.Monsters:GetChildren()[1]
            --     if bossChar then
            --         bossChar.Humanoid.Health = 0
            --         for _,v in pairs(bossChar:GetChildren()) do
            --             if v.Name ~= "Head" then
            --                 v:Destroy()
            --             end
            --         end
            --     end
            -- end
        end
    )

    -- lplr.Character.HumanoidRootPart.CFrame = dFolder.EndRoom.Finish.CFrame
end

function autoAttackFun()
    _G.autoAttack = not _G.autoAttack
    while _G.autoAttack do
        local EventAttack = rs.Remotes.Attack
        EventAttack:FireServer()
        wait(0.1)
    end
end

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

-- function infJump()
-- 	uis.JumpRequest:connect(
-- 		function()
-- 			if wp:FindFirstChild(lplr.Name) then
-- 				lplr.Character.Humanoid.JumpPower = _G.jp_g
-- 				lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
-- 			end
-- 		end
-- 	)
-- end
-- infJump()

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

spawn(
    function()
        autoTakeDamage()
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "k" then
            changeWS(0)
            SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "l" then
            changeWS(1)
            SendChat("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "p" then
            autoAttackFun()
        end

        if keyDown == "q" then
            _G.noclipAll = not _G.noclipAll
        end

        if keyDown == "e" then
            if wp:FindFirstChild("PartKill") then
                wp.PartKill:Destroy()
            end
            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
            local Part = Instance.new("Part")
            Part.Name = "PartKill"
            Part.Parent = wp
            Part.Size = Vector3.new(10, 10, 10)
            Part.Transparency = 0.5
            Part.Anchored = true
            Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0)
        end
    end
)

-- while wait(1) do
--     lplr.SimulationRadius = 10000000
-- end

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)