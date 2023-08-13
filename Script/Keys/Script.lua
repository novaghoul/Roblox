loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
toggleWS = false
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

local exitD = nil
disTeleport = 10

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
                createESPItem(l["Point_1"].ToolModel.Handle, 245, 205, 48, 14, "🔐", 0)
            end
            l["Point_1"].ChildAdded:connect(
                function(m)
                    wait(.5)
                    if tostring(m.Name) == "ToolModel" then
                        createESPItem(m.Handle, 245, 205, 48, 14, "🔐", 0)
                    end
                end
            )
        end
        if l:FindFirstChild("SpawnPoint_1") then
            if l["SpawnPoint_1"]:FindFirstChild("ToolModel") then
                createESPItem(l["SpawnPoint_1"].ToolModel.Handle, 245, 205, 48, 14, "🔐", 0)
            end
            l["SpawnPoint_1"].ChildAdded:connect(
                function(m)
                    wait(.5)
                    if tostring(m.Name) == "ToolModel" then
                        createESPItem(m.Handle, 245, 205, 48, 14, "🔐", 0)
                    end
                end
            )
        end
        -- workspace.Maps.Forest.ItemHuntFolder.ItemSpawn:GetChildren()[68].Point_1.InteractPrompt
        l.ChildAdded:connect(
            function(n)
                wait(.5)
                if tostring(n) == "Point_1" then
                    if n:FindFirstChild("ToolModel") then
                        createESPItem(n.ToolModel.Handle, 245, 205, 48, 14, "🔐", 0)
                    end
                    n.ChildAdded:connect(
                        function(m)
                            wait(.5)
                            if tostring(m.Name) == "ToolModel" then
                                createESPItem(m.Handle, 245, 205, 48, 14, "🔐", 0)
                            end
                        end
                    )
                end
                if tostring(n) == "SpawnPoint_1" then
                    if n:FindFirstChild("ToolModel") then
                        createESPItem(n.ToolModel.Handle, 245, 205, 48, 14, "🔐", 0)
                    end
                    n.ChildAdded:connect(
                        function(m)
                            wait(.5)
                            if tostring(m.Name) == "ToolModel" then
                                createESPItem(m.Handle, 245, 205, 48, 14, "🔐", 0)
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

for _,v in pairs(wp.Game.TeleportFolder:GetChildren()) do
    v:Destroy()
end
wp.Game.TeleportFolder.ChildAdded:connect(
    function(m)
        wait()
        m:Destroy()
    end
)

function buyItems(name, sl)
    if sl then
        sl = sl
    else
        sl = 1
    end
    for i=1,sl do
        local args = {
            [1] = {
                ["IsExtend"] = "Extend",
                ["ItemId"] = name
            }
        }
        rs.Remotes.ExchangeShopRE:FireServer(unpack(args))
        wait(.2)
    end
end

function exitMap()
    if exitD then
        lplr.Character.HumanoidRootPart.CFrame = exitD.CFrame
        exitD = nil
    else
        NotifyG("Exit Door", "Appear Yet")
    end
end

local function executeChat(code)
    if string.lower(string.sub(code, 1, 2)) == "/e" then
        local split = {}

        for part in code:gmatch("%S+") do
            table.insert(split, part)
        end

        table.remove(split, 1)

        local command = string.lower(string.sub(split[1], 1))

        local first = split[2]

        if string.find("lp", command) then
            buyItems("PickLock", first)
        elseif string.find("ip", command) then
            buyItems("InvisibityPotion", first)
        end
    end
end
lplr.Chatted:Connect(executeChat)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "x" then
            if ws_g == 40 then
                ws_g = 16
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            else
                ws_g = 40
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            end
        end
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, .5, -disTeleport)
		end
		if keyDown == "z" then
			exitMap()
		end
    end
)

wp.Maps.School.Parts.BUILD.build["1F"].door:Destroy()
wp.Maps.School.Parts.BUILD.build["2F"].door:Destroy()

while wait(1) do
    wp.Gravity = 150
    if wp:FindFirstChild("Maps") then
        for _,v in pairs(wp.Maps:GetChildren()) do
            if v:FindFirstChild("ItemHuntFolder") then
                if v.ItemHuntFolder:FindFirstChild("ItemPlace") then
                    for _,l in pairs(v.ItemHuntFolder.ItemPlace:GetChildren()) do
                        if l:FindFirstChild("ControlPart") then
                            spawn(function()
                                if l:FindFirstChild("ExitRoot") then
                                    if l.ExitRoot:FindFirstChild("BillBoard_Exit") then
                                        exitD = l.ExitRoot
                                    end
                                end
                                if l["ControlPart"]:FindFirstChild("InteractPrompt") then
                                    l.ControlPart.InteractPrompt.HoldDuration = 0
                                    l.ControlPart.InteractPrompt.MaxActivationDistance = 15
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
                            end)
                        end
                    end
                end
            end
        end
    end
end