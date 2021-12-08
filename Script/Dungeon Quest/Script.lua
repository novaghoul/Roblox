loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
function createHitBoxS(parent)
    parent.Humanoid.HipHeight = 9
    local bgui = Instance.new("BillboardGui", parent.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = "X"
    nam.BackgroundTransparency = 1
    nam.TextSize = 20
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function hitBoxE()
    if wp:FindFirstChild("dungeon") then
        for _, o in pairs(wp.dungeon:GetChildren()) do
            if o:FindFirstChild("enemyFolder") then
                for _, v in pairs(o.enemyFolder:GetChildren()) do
                    if v:IsA("Model") then
                        createHitBoxS(v)
                    end
                end
                o.enemyFolder.ChildAdded:connect(
                    function(m)
                        wait(0.1)
                        if m:IsA("Model") then
                            createHitBoxS(m)
                        end
                    end
                )
            end
        end
    end
end
hitBoxE()

-- local PartBoss = nil
-- mouse.KeyDown:connect(function(keyDown)
--     if keyDown == "f" then
--         if PartBoss ~= nil then
--             PartBoss:Destroy()
--         end
--         wait(0.01)
--         local Part = Instance.new("Part")
--         Part.Name = "PartKillBoss"
--         Part.Parent = wp
--         Part.Size = Vector3.new(10, 1, 10)
--         Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 0)
--         Part.Anchored = true
--         PartBoss = Part
--     end
-- end)
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))()