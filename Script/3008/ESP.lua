loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))() -- Inf_Jump Lua

-- game:GetService("Workspace").GameObjects.Physical.Items.Apple.Apple
-- game:GetService("Workspace").GameObjects.Physical.Employees["Abomination Employee"].Head
-- game:GetService("Workspace").GameObjects.Physical.Items.Chips.Root
function enableESPItemsCode()
    wp.Gravity = 130
    
    for _, v in pairs(wp.GameObjects.Physical:GetChildren()) do
        if tostring(v.Name) == "Items" then
            for _, l in pairs(v:GetChildren()) do
                local itemPart = l:GetChildren()[1]
                if itemPart then
                    createESPItem(itemPart, 245, 205, 48, 14, tostring(l.Name))
                end
                l.ChildAdded:connect(function(m)
                    wait(.1)
                    createESPItem(m, 245, 205, 48, 14, tostring(l.Name))
                end)
            end
            v.ChildAdded:connect(function(m)
                wait(0.1)
                local itemPart = m:GetChildren()[1]
                if itemPart then
                    createESPItem(itemPart, 245, 205, 48, 14, tostring(m.Name))
                end
                m.ChildAdded:connect(function(n)
                    wait(.1)
                    createESPItem(n, 245, 205, 48, 14, tostring(m.Name))
                end)
            end)
        elseif tostring(v.Name) == "Employees" then
            for _, l in pairs(v:GetChildren()) do
                if l:FindFirstChild("   ") then
                    createESPItem(l.Head, 13, 105, 14, tostring(l.Name))
                end
                
                l.ChildAdded:connect(function(m)
                    wait(.1)
                    if tostring(m.Name) == "Head" then
                        createESPItem(m, 13, 105, 172, 14, tostring(l.Name))
                    end
                end)
            end
        end
    end
    wp.GameObjects.Physical.ChildAdded:connect(function(m)
        wait(.1)
        if tostring(m.Name) == "Items" then
            for _, v in pairs(m:GetChildren()) do
                local itemPart = v:GetChildren()[1]
                if itemPart then
                    createESPItem(itemPart, 245, 205, 48, 14, tostring(v.Name))
                end
                v.ChildAdded:connect(function(n)
                    wait(.1)
                    createESPItem(n, 245, 205, 48, 14, tostring(v.Name))
                end)
            end
            m.ChildAdded:connect(function(n)
                wait(0.1)
                local itemPart = n:GetChildren()[1]
                if itemPart then
                    createESPItem(itemPart, 245, 205, 48, 14, tostring(n.Name))
                end
                n.ChildAdded:connect(function(l)
                    wait(.1)
                    createESPItem(l, 245, 205, 48, 14, tostring(n.Name))
                end)
            end)
        elseif tostring(m.Name) == "Employees" then
            for _, v in pairs(m:GetChildren()) do
                if v:FindFirstChild("Head") then
                    createESPItem(v.Head, 13, 105, 14, tostring(v.Name))
                end
                
                v.ChildAdded:connect(function(n)
                    wait(.1)
                    if tostring(n.Name) == "Head" then
                        createESPItem(n, 13, 105, 172, 14, tostring(v.Name))
                    end
                end)
            end
        end
    end)
end
enableESPItemsCode()

function createESP(c) --//Checks and calls the proper function
    -- createESPItem(c.Head, 196, 40, 28, 14, plrs:FindFirstChild(c.Name).DisplayName)
    for _, v in pairs(c:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end

function espFirst()
    for _, o in pairs(wp.GameObjects.Physical.Players:GetChildren()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o:WaitForChild("Head") then
                        wait(0.1)
                        createESP(o)
                    end
                end
            )
        end
    end
    wp.GameObjects.Physical.Players.ChildAdded:connect(
        function(m)
            if m.Name ~= lplr.Name then
                spawn(
                    function()
                        if m:WaitForChild("Head") then
                            wait(0.1)
                            createESP(m)
                        end
                    end
                )
            end
        end
    )
end
espFirst()