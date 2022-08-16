loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if tostring(game.GameId) == "86781307" then
    ws_g = 25
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS%20Other.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()
    -- loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESP%20Test.lua"), true))()
    function changeGame(parent, pos, size)
        local posNus = parent.Position.y - pos
        local sizeNus = parent.Size.y - size
        if pos == 0 then
            parent.Position = parent.Position + Vector3.new(0, -pos, 0)
        else
            parent.Position = parent.Position + Vector3.new(0, -(parent.Position.y - pos), 0)
        end
        parent.Size = parent.Size + Vector3.new(0, -(parent.Size.y - size), 0)
    end
    for _,v in pairs(wp["_MAZE"].MainGates:GetChildren()) do
        changeGame(v.LeftOuter, 0, 50)
        changeGame(v.RightOuter, 0, 50)
        changeGame(v.RightInner, 0, 50)
        changeGame(v.LeftInner, 0, 50)
    end
    for _,v in pairs(wp["_MAZE"].MovingWalls:GetChildren()) do
        changeGame(v.Main, 0, 130)
    end
    for _,v in pairs(wp["_MAZE"].InnerMaze.Walls.GladeWalls:GetChildren()) do
        for _,l in pairs(v:GetChildren()) do
            changeGame(l, 560, 20)
        end
    end
    for _,v in pairs(wp["_MAZE"].InnerMaze.Walls:GetChildren()) do
        if tostring(v.Name) == "InnerWall" then
            local posNus = v.Position.y - 550
            local sizeNus = v.Size.y - 10
            v.Position = v.Position + Vector3.new(0, -posNus, 0)
            v.Size = v.Size + Vector3.new(0, -sizeNus, 0)
        end
    end
    for _,v in pairs(wp["_MAZE"].OuterMaze.Walls:GetChildren()) do
        if v:IsA("Model") then
            for _,l in pairs(v:GetChildren()) do
                if tostring(l.Name) == "HugeWall" then
                    local posNus = l.Position.y - 550
                    local sizeNus = l.Size.y - 10
                    l.Position = l.Position + Vector3.new(0, -posNus, 0)
                    l.Size = l.Size + Vector3.new(0, -sizeNus, 0)
                end
            end
        end
    end
    for _,v in pairs(wp.AIGrievers:GetChildren()) do
        createHealthbar(v.HumanoidRootPart)
    end
    wp.AIGrievers.ChildAdded:connect(
        function(m)
            wait(.5)
            createHealthbar(m.HumanoidRootPart)
        end
    )
    -- game:GetService("Workspace").Chests.Part["Gold Chest"].Main
    for _,v in pairs(wp.Chests:GetChildren()) do
        if v:FindFirstChildOfClass("Model") then
            local typeChest = v:FindFirstChildOfClass("Model")
            createESPItem(typeChest.Main, 242, 243, 243, 10, typeChest.Name)
        end
        v.ChildAdded:connect(
            function(m)
                wait(.5)
                createESPItem(m.Main, 242, 243, 243, 10, m.Name)
            end
        )
    end
end
-- game:GetService("Workspace")["_MAZE"].InnerMaze.Walls.GladeWalls.Walls["Meshes/Wall1"] MeshPart pos 560 size 20
-- game:GetService("Workspace").Chests
-- game:GetService("Workspace").Badges
-- game:GetService("Workspace").Special.SectorTraps.Sector1.TrapTripper
-- game:GetService("Workspace").AIGrievers


-- local table_1 = {
-- 	[1] = 'SwingRequest',
-- 	[2] = true
-- };
-- local Target = game:GetService("Players").WAOKyoHana.Backpack.Tool.SpearScript.toolFunctions
-- Target:FireServer(table_1);
