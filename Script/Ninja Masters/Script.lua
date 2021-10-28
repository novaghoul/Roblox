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

farmEN = false
_G.sell = false
nameLands = "Start Area Back"
speedWs = 20

if wp:FindFirstChild("ZoneBuy") then
    wp.ZoneBuy:Destroy()
end

function farmEnemys()
    farmEN = not farmEN

    while farmEN do
        local pos = lplr.Character.HumanoidRootPart.CFrame

        for _, v in pairs(wp.NPCs.Spawns:GetChildren()) do
            if v.Name == nameLands then
                local npc = v:GetChildren()[2]
                if npc then
                    while npc.Humanoid.Health ~= 0 do
                        wait()
                        if farmEN == false then
                            local tool = lplr.Character:FindFirstChildOfClass("Tool")
                            if tool then
                                tool.Parent = lplr.Backpack
                            end
                            wait(1)
                            lplr.Character.HumanoidRootPart.CFrame = pos
                            break
                        end
                        local tool = lplr.Backpack:FindFirstChildOfClass("Tool")
                        if tool then
                            tool.Parent = lplr.Character
                        end
                        wait()
                        lplr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        lplr.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5.5)
                    end
                end
            end
        end
        lplr.Character.HumanoidRootPart.CFrame = pos
    end
end

function autoSell()
    _G.sell = not _G.sell

    while _G.sell do
        wait()
        wp.Rings.Sell.CFrame = lplr.Character.HumanoidRootPart.CFrame
    end
end

function Wspeed()
    lplr.Character.Humanoid.WalkSpeed = speedWs

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= speedWs then
                lplr.Character.Humanoid.WalkSpeed = speedWs
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            characterModel.Humanoid.WalkSpeed = speedWs
            characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if characterModel.Humanoid.WalkSpeed ~= speedWs then
                        characterModel.Humanoid.WalkSpeed = speedWs
                    end
                end
            )
        end
    )
end

Wspeed()

function changeWS(typeWS)
    if typeWS == 0 then
        speedWs = speedWs + 5
        lplr.Character.Humanoid.WalkSpeed = speedWs
    elseif typeWS == 1 then
        if speedWs >= 0 then
            speedWs = speedWs - 5
            lplr.Character.Humanoid.WalkSpeed = speedWs
        end
        if speedWs < 16 then
            speedWs = 16
            lplr.Character.Humanoid.WalkSpeed = speedWs
        end
    end
end

function infJump()
    --lplr.Character.Humanoid.JumpPower = 50
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            farmEnemys()
        end

        if keyDown == "k" then
            autoSell()
        end

        if keyDown == " " then
            infJump()
        end

        if keyDown == "c" then
            changeWS(0)
        end

        if keyDown == "v" then
            changeWS(1)
        end
    end
)
print("Done")

--Start Area Back
--Autumn
--Frostland
--Inferno
--Voidland
--Skyland
--Grassland
--Iceland
