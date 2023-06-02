loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

function createESP(parent)
    createESPItem(parent.HeadRearMESH, 196, 40, 28, 14, parent.Name)
    for _, p in pairs(parent:GetChildren()) do
        if p.Name == ("HeadRearMESH") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 196, 40, 28)
            end
        end
    end
end
for _,v in pairs(wp.GameplayAssets.Monsters:GetChildren()) do
    if v:FindFirstChild("HeadRearMESH") then
        createESP(v)
    end
end

wp.GameplayAssets.Monsters.ChildAdded:connect(
    function(m)
        wait(.5)
        if m:FindFirstChild("HeadRearMESH") then
            createESP(m)
        end
    end
)

for _,v in pairs(wp.GameplayAssets.Items.Normal.PaintBucket:GetChildren()) do
    if v:FindFirstChild("PaintRoot") then
        createESPItem(v.PaintRoot, 249, 233, 153, 14, "🎨 " .. v.Name)
    end
end

for _,v in pairs(wp.GameplayAssets.Items.Normal.Tool:GetChildren()) do
    if v:FindFirstChild("Root") then
        createESPItem(v.Root, 249, 233, 153, 14, v.Name)
    end
end

for _,v in pairs(wp.GameplayAssets.Items.Secret.Tool:GetChildren()) do
    if v:FindFirstChild("Root") then
        createESPItem(v.Root, 249, 233, 153, 14, v.Name)
    end
end

for _,v in pairs(wp.GameplayAssets.Items.Collectable.Collectable:GetChildren()) do
    if v:FindFirstChild("Root") then
        createESPItem(v.Root, 249, 233, 153, 14, "🖌️")
    end
end

-- game:GetService("Workspace").GameplayAssets.Items.Normal.PaintBucket.Orange.PaintRoot
-- game:GetService("Workspace").GameplayAssets.Items.Normal.Tool.Key.Root
-- game:GetService("Workspace").GameplayAssets.Items.Secret.Tool.ScrewDriver.Root
-- game:GetService("Workspace").GameplayAssets.Items.Collectable.Collectable.13.Root
-- game:GetService("Workspace").GameplayAssets.Monsters.Bill.HeadRearMESH
