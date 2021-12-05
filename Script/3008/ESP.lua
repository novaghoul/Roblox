loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESP%20Test.lua"), true))()

function checkItems(parent)
    if parent:FindFirstChildOfClass("MeshPart") or parent:FindFirstChildOfClass("Part") then
        local itemPart = parent:FindFirstChildOfClass("MeshPart") or parent:FindFirstChildOfClass("Part")
        if itemPart then
            createESPItem(itemPart, 245, 205, 48, 14, tostring(parent.Name))
        end
    end
    parent.ChildAdded:connect(function(m)
        wait(0.5)
        if m:IsA("MeshPart") or m:IsA("Part") then
            createESPItem(m, 245, 205, 48, 14, tostring(parent.Name))
        end
    end)
end

function enableESPItemsCode()
    wp.Gravity = 100
    
    for _, v in pairs(wp.GameObjects.Physical.Items:GetChildren()) do
        checkItems(v)
    end
    -- MeshPart
    -- Part
    wp.GameObjects.Physical.Items.ChildAdded:connect(function(m)
        wait(1)
        checkItems(m)
    end)

    for _, v in pairs(wp.GameObjects.Physical.Employees:GetChildren()) do
        if v:FindFirstChild("Head") then
            createESPItem(v.Head, 13, 105, 14, tostring(v.Name))
        end
        
        v.ChildAdded:connect(function(m)
            if m.Name == "Head" then
                createESPItem(m, 13, 105, 172, 14, tostring(v.Name))
            end
        end)
    end
end
enableESPItemsCode()

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))()
lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

-- game:GetService("Workspace").GameObjects.Physical.Employees
-- game:GetService("Workspace").GameObjects.Physical.Items