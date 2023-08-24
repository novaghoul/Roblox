loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESP Test Lua
function firstScript()
    for _, v in pairs(wp.ItemSpawns:GetChildren()) do
        if tostring(v.Name) == "Chests" then
            for _, l in pairs(v:GetChildren()) do
                if l:FindFirstChild("Chest") then
                    createESPItem(l.Chest.RootPart, 205, 205, 205, 14, "🔐", 0)
                    l.Chest.RootPart.ProximityAttachment.Interaction.HoldDuration = 0
                    l.Chest.RootPart.ProximityAttachment.Interaction.MaxActivationDistance = 15
                end
                l.ChildAdded:connect(
                    function(m)
                        wait(.5)
                        createESPItem(m.RootPart, 205, 205, 205, 14, "🔐", 0)
                        m.RootPart.ProximityAttachment.Interaction.HoldDuration = 0
                        m.RootPart.ProximityAttachment.Interaction.MaxActivationDistance = 15
                    end
                )
            end
        elseif tostring(v.Name) == "StandardItems" then
            for _, l in pairs(v:GetChildren()) do
                for _, k in pairs(l:GetChildren()) do
                    if k:IsA("Part") then
                        createESPItem(k, 245, 205, 48, 14, tostring(k.Name), 0)
                        k.ProximityAttachment.Interaction.HoldDuration = 0
                        k.ProximityAttachment.Interaction.MaxActivationDistance = 15
                    else
                        if k:FindFirstChildOfClass("MeshPart") then
                            createESPItem(k:FindFirstChildOfClass("MeshPart"), 245, 205, 48, 14, tostring(k.Name), 0)
                            k.ProximityAttachment.Interaction.HoldDuration = 0
                            k.ProximityAttachment.Interaction.MaxActivationDistance = 15
                        end
                    end
                end
                l.ChildAdded:connect(
                    function(m)
                        wait(.5)
                        if m:IsA("Part") then
                            createESPItem(m, 245, 205, 48, 14, tostring(m.Name), 0)
                            m.ProximityAttachment.Interaction.HoldDuration = 0
                            m.ProximityAttachment.Interaction.MaxActivationDistance = 15
                        else
                            if m:FindFirstChildOfClass("MeshPart") then
                                createESPItem(m:FindFirstChildOfClass("MeshPart"), 245, 205, 48, 14, tostring(m.Name), 0)
                                m.ProximityAttachment.Interaction.HoldDuration = 0
                                m.ProximityAttachment.Interaction.MaxActivationDistance = 15
                            end
                        end
                    end
                )
            end
        end
    end

end
firstScript()