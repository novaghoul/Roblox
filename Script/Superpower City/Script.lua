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
_G.farmEn = false
_G.nameEnemy = {"Deathstroke", "War Machine", "The Deceiver", "Elektra", "Space Marine", "Nous", "Martian"}
_G.listEnemy = {}
_G.ws_g = 40

partHitbox = Instance.new("MeshPart", wp)
partHitbox.Name = "partHitbox"
partHitbox.Size = Vector3.new(10, 1, 10)
partHitbox.CanCollide = true
partHitbox.Anchored = true
partHitbox.CFrame = CFrame.new(0, 0, 0)

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function changeTool(toolI)
    if toolI then
        toolI.HitPart.Size = Vector3.new(30, 30, 30)
    else
        local tool = lplr.Backpack:FindFirstChildOfClass("Tool") or lplr.Character:FindFirstChildOfClass("Tool")
        if tool then
            tool.HitPart.Size = Vector3.new(30, 30, 30)
        end
    end
end

function firstScript()
    changeTool(nil)

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            if _G.farmEn == true then
                _G.farmEn = false
                wait(0.5)
                autoFarm()
            end
        end
    )

    lplr.Backpack.ChildAdded:connect(
        function(m)
            wait(1)
            changeTool(m)
        end
    )

    lplr.Idled:connect(
        function()
            virtualUser:CaptureController()
            virtualUser:ClickButton2(Vector2.new())
        end
    )

    wp.NPCGroups.ChildAdded:connect(
        function(m)
            repeat
                wait()
            until m:GetChildren()[1]
            for i = 1, #_G.nameEnemy do
                if m:GetChildren()[1].Name == _G.nameEnemy[i] then
                    table.insert(_G.listEnemy, m:GetChildren()[1])
                end
            end
        end
    )

    -- spawn(
    --     function()
    --         while wait() do
    --             for i = 1, #_G.listEnemy do
    --                 local checkName = false
    --                 for j = 1, #_G.nameEnemy do
    --                     if _G.listEnemy[i].Name == _G.nameEnemy[j] then
    --                         checkName = true
    --                     end
    --                 end
    --                 if checkName == false or _G.listEnemy[i].Parent == nil then
    --                     table.remove(_G.listEnemy, i)
    --                 end
    --             end
    --         end
    --     end
    -- )
end
firstScript()

function autoFarm()
    _G.farmEn = not _G.farmEn
    _G.listEnemy = {}

    for _, v in pairs(wp.NPCGroups:GetChildren()) do
        if v then
            local npc = v:GetChildren()[1]
            if npc then
                for i = 1, #_G.nameEnemy do
                    if npc.Name == _G.nameEnemy[i] then
                        table.insert(_G.listEnemy, npc)
                    end
                end
            end
        end
    end

    for _, v in pairs(lplr.Backpack:GetChildren()) do
        v.Parent = lplr.Character
    end

    local locationCurrent = lplr.Character.HumanoidRootPart.CFrame

    while _G.farmEn do
        wait(0.1)
        locationCurrent = lplr.Character.HumanoidRootPart.CFrame
        for i = 1, #_G.listEnemy do
            wait()
            if _G.farmEn == false then
                break
            end
            local npc = _G.listEnemy[i]
            if npc and npc:FindFirstChildOfClass("Humanoid").Health ~= 0 and npc.Parent ~= nil then
                if npc:FindFirstChild("UpperTorso") then
                    partHitbox.CFrame = npc.UpperTorso.CFrame * CFrame.new(0, -12, 0)
                    lplr.Character.HumanoidRootPart.CFrame = partHitbox.CFrame * CFrame.new(0, 3, 0)
                    while npc:FindFirstChildOfClass("Humanoid").Health ~= 0 do
                        if _G.farmEn == false then
                            break
                        end
                        for _, v in pairs(lplr.Backpack:GetChildren()) do
                            v.Parent = lplr.Character
                        end
                        spawn(
                            function()
                                partHitbox.CFrame = npc.UpperTorso.CFrame * CFrame.new(0, -12, 0)
                                lplr.Character.HumanoidRootPart.CFrame = partHitbox.CFrame * CFrame.new(0, 3, 0)
                                -- virtualUser:ClickButton1(Vector2.new())
                                local A_1 = npc.UpperTorso
                                local Event = rs.Events.HE
                                Event:FireServer(A_1)
                            end
                        )
                        wait(0.1)
                    end
                    wait()
                end
                lplr.Character.HumanoidRootPart.CFrame = locationCurrent
            else
                table.remove(_G.listEnemy, i)
            end
        end
        wait(0.1)
    end
end

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

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
            if sg:GetCoreGuiEnabled(3) == false then
                sg:SetCoreGuiEnabled(3, true)
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

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "p" then
            autoFarm()
        end

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
    end
)
