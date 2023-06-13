loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

function createESP(parent)
    createESPItem(parent.Head, 196, 40, 28, 14, parent.Name)
    for _, p in pairs(parent:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 196, 40, 28)
            end
        end
    end
end

for _,v in pairs(wp.Game.GamePlayers:GetChildren()) do
    if not v:FindFirstChild("PlayerStateControl") then
        if v:FindFirstChild("Head") then
            createESP(v)
        end
        v.ChildAdded:connect(
            function(m)
                wait(.5)
                if tostring(m.Name) == "Head" then
                    createESP(v)
                end
            end
        )
    end
end

wp.Game.GamePlayers.ChildAdded:connect(
    function(m)
        wait(.5)
        if not m:FindFirstChild("PlayerStateControl") then
            if m:FindFirstChild("Head") then
                createESP(m)
            end
            m.ChildAdded:connect(
                function(n)
                    wait(.5)
                    if tostring(n.Name) == "Head" then
                        createESP(m)
                    end
                end
            )
        end
    end
)

for _,v in pairs(wp.Maps:GetChildren()) do
    -- for _,l in pairs(v.InvisParts:GetChildren()) do
    --     l:Destroy()
    -- end
    for _,l in pairs(v.HideCabinet:GetChildren()) do
        l:Destroy()
    end
    v.HideCabinet.ChildAdded:connect(
        function(m)
            wait(.5)
            m:Destroy()
        end
    )
    for _,l in pairs(v.ItemHuntFolder.ItemSpawn:GetChildren()) do
        if l:FindFirstChild("Point_1") then
            if l["Point_1"]:FindFirstChild("ToolModel") then
                createESPItem(l["Point_1"].ToolModel.Handle, 245, 205, 48, 14, "Key", 0)
            end
            l["Point_1"].ChildAdded:connect(
                function(m)
                    wait(.5)
                    if tostring(m.Name) == "ToolModel" then
                        createESPItem(m.Handle, 245, 205, 48, 14, "Key", 0)
                    end
                end
            )
        end
        if l:FindFirstChild("SpawnPoint_1") then
            if l["SpawnPoint_1"]:FindFirstChild("ToolModel") then
                createESPItem(l["SpawnPoint_1"].ToolModel.Handle, 245, 205, 48, 14, "Key", 0)
            end
            l["SpawnPoint_1"].ChildAdded:connect(
                function(m)
                    wait(.5)
                    if tostring(m.Name) == "ToolModel" then
                        createESPItem(m.Handle, 245, 205, 48, 14, "Key", 0)
                    end
                end
            )
        end
        l.ChildAdded:connect(
            function(n)
                wait(.5)
                if tostring(n) == "Point_1" then
                    if n:FindFirstChild("ToolModel") then
                        createESPItem(n.ToolModel.Handle, 245, 205, 48, 14, "Key", 0)
                    end
                    n.ChildAdded:connect(
                        function(m)
                            wait(.5)
                            if tostring(m.Name) == "ToolModel" then
                                createESPItem(m.Handle, 245, 205, 48, 14, "Key", 0)
                            end
                        end
                    )
                end
                if tostring(n) == "SpawnPoint_1" then
                    if n:FindFirstChild("ToolModel") then
                        createESPItem(n.ToolModel.Handle, 245, 205, 48, 14, "Key", 0)
                    end
                    n.ChildAdded:connect(
                        function(m)
                            wait(.5)
                            if tostring(m.Name) == "ToolModel" then
                                createESPItem(m.Handle, 245, 205, 48, 14, "Key", 0)
                            end
                        end
                    )
                end
            end
        )
    end
end

local Part = Instance.new("Part")
Part.Name = "JurassicPart"
Part.Anchored = true
Part.Parent = wp.Maps.IceCave.Parts
Part.Shape = Enum.PartType.Block
Part.Material = Enum.Material.Ice
Part.BrickColor = BrickColor.new("Pastel Blue")
Part.Size = Vector3.new(400, 5, 400)
Part.CFrame = CFrame.new(9998.2, 172.205, 10000.1)
Part.Color = Color3.fromRGB(126, 203, 255)

wp.Maps.IceCave.Parts.ChildAdded:connect(
    function(m)
        wait(.5)
        if tostring(m.Name) == "ground" then
            m:Destroy()
        end
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "x" then
            if ws_g == 30 then
                ws_g = 16
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            else
                ws_g = 30
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            end
        end
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, disTeleport)
		end
    end
)

wp.Maps.School.Parts.BUILD.build["1F"].door:Destroy()
wp.Maps.School.Parts.BUILD.build["2F"].door:Destroy()
while wait(1) do
    wp.Gravity = 150
    for _,v in pairs(wp.Maps:GetChildren()) do
        for _,l in pairs(v.ItemHuntFolder.ItemPlace:GetChildren()) do
            if l:FindFirstChild("ControlPart") then
                if l["ControlPart"]:FindFirstChild("InteractPrompt") then
                    -- l.ControlPart.InteractPrompt.ClientInteractLimit:Destroy()
                    local doorModel = l:FindFirstChildOfClass("Model")
                    for _,k in pairs(doorModel:GetChildren()) do
                        if tostring(k.Name) == "door1" and not k:FindFirstChild("BS") then
                            for _, f in pairs(faces) do
                                createESPCharm(k, f, 75, 151, 75)
                            end
                        end
                    end
                else
                    local doorModel = l:FindFirstChildOfClass("Model")
                    for _,k in pairs(doorModel:GetChildren()) do
                        k:ClearAllChildren()
                    end
                end
            end
        end
    end
end

-- game:GetService("Workspace").Maps.Castle.InvisParts.Walls
-- game:GetService("Workspace").Maps.Castle.HideCabinet
-- game:GetService("Workspace").Maps.IceCave.Parts.ground
-- game:GetService("Workspace").Game.GamePlayers.SugarCamilia.PlayerStateControl
-- game:GetService("Workspace").Maps.IceCave.ItemHuntFolder.ItemSpawn.DrawerContainer["SpawnPoint_1"].ToolModel.Handle
-- game:GetService("Workspace").Maps.IceCave.ItemHuntFolder.ItemPlace.LockDoor["door_IceCave"].door1
-- game:GetService("Workspace").Maps.MagicCube.ItemHuntFolder.ItemPlace["LockDoor_3"]["door_mk1"]
-- game:GetService("Workspace").Maps.IceCave.ItemHuntFolder.ItemPlace.LockDoor.ControlPart.LocalItemHuntPlace
-- game:GetService("Workspace").Maps.MagicCube.ItemHuntFolder.ItemSpawn["SpawnPoint_1"]["Point_1"].ToolModel.Handle