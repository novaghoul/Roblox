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
_G.ws_g = 20
_G.jp_g = 50
_G.Farm = false
-- _G.sellNX = wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame.X
-- _G.sellNY = wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame.Y
-- _G.sellNZ = wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame.Z
-- _G.sellGX = wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame.X
-- _G.sellGY = wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame.Y
-- _G.sellGZ = wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame.Z
_G.typeSell = "normal" -- normal or ghost
_G.distance = 100
_G.listGhostEntries = {}

partFarm = Instance.new("Part")
partFarm.Name = "partFarm"
partFarm.Size = Vector3.new(1, 1, 1)
partFarm.Anchored = true
partFarm.CanCollide = false
partFarm.Parent = wp
partFarm.CFrame = lplr.Character.HumanoidRootPart.CFrame

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[OUTPUT]: " .. String
    })
end

function autoFarm()
    _G.Farm = not _G.Farm
    partFarm.CFrame = lplr.Character.HumanoidRootPart.CFrame

    while _G.Farm do
        wait()
        for _, v in pairs(wp.Ghosts:GetChildren()) do
            if v:FindFirstChild("Body") then
                print("...")
                if (v.Body.Position - partFarm.Position).magnitude < _G.distance then
                    for l, c in pairs(_G.listGhostEntries) do
                        if l == v.Name then
                            if c <= lplr.Stats.AntennaLevel.Value then
                                if _G.Farm == false then
                                    break
                                end
                                lplr.Character.HumanoidRootPart.CFrame = v.Body.CFrame
                                wait(.2)
                                local A_1 = v
                                local Event = rs.Network.ToServer.Requests.VacuumEnemy
                                Event:FireServer(A_1)
                                repeat
                                    wait()
                                    if _G.Farm == false then
                                        break
                                    end
                                until not v:FindFirstChild("Body")
                                if _G.typeSell == "normal" then
                                    wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame =
                                        lplr.Character.HumanoidRootPart.CFrame
                                    wait(.1)
                                    wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame =
                                        CFrame.new(_G.sellNX, _G.sellNY, _G.sellNZ)
                                elseif _G.typeSell == "ghost" then
                                    wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame =
                                        lplr.Character.HumanoidRootPart.CFrame
                                    wait(.1)
                                    wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame =
                                        CFrame.new(_G.sellGX, _G.sellGY, _G.sellGZ)
                                end
                                lplr.Character.HumanoidRootPart.CFrame = partFarm.CFrame
                            end
                        end
                    end
                end
            end
        end
    end
    wait(0.1)
end

function firstScript()
    if lplr.Stats.BoardsUnlocked.Value == false then
        lplr.Stats.BoardsUnlocked.Value = true
    end
    lplr.Stats.MagnetismUnlocked.Value = true
    lplr.Stats.GemDropFactor.Value = 9999999999999999999
    for _, v in pairs(lplr.Stats.AppliedPasses:GetChildren()) do
        v.Value = true
    end
    lplr.Stats.VacuumRange.Value = 26
    for _, v in pairs(wp.ScriptParts.AntennaFog:GetChildren()) do
        v:Destroy()
    end

    for _, c in pairs(rs.GhostEntries:GetChildren()) do
        for _, l in pairs(c:GetChildren()) do
            _G.listGhostEntries[tostring(l.Info.GhostName.Value)] = l.Stats.AntennaLevel.Value
        end
    end
end
firstScript()

-------------------------------------------------------------
--------------------------Other------------------------------
function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = _G.ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            end
        end)
    lplr.CharacterAdded:Connect(function(characterModel)
        wait(1)
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                    lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                end
            end)
    end)
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

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "[" then
        changeWS(0)
        SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == "]" then
        changeWS(1)
        SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == " " then
        infJump()
    end

    if keyDown == "k" then
        autoFarm()
    end

    if keyDown == "l" then
        -- if _G.typeSell == "normal" then
        --     wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame =
        --         lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
        --     wait()
        --     wp.ScriptParts.EctoplasmConverters.NormalWorldConverter.CFrame =
        --         CFrame.new(_G.sellNX, _G.sellNY, _G.sellNZ)
        -- elseif _G.typeSell == "ghost" then
        --     wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame =
        --         lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
        --     wait()
        --     wp.ScriptParts.EctoplasmConverters.GhostWorldConverter.CFrame =
        --         CFrame.new(_G.sellGX, _G.sellGY, _G.sellGZ)
        -- end
    end

    if keyDown == "p" then
        if _G.typeSell == "normal" then
            _G.typeSell = "ghost"
        elseif _G.typeSell == "ghost" then
            _G.typeSell = "normal"
        end
        SendChat("Converter :" .. _G.typeSell)
    end
end)
