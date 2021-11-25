st:GetPropertyChangedSignal(""):connect(
    function()
    end
)
st:FindFirstChildOfClass("")
st:WaitForChild("")
st:GetPlayers()
st:GetChildren()
st:FindFirstChild("")
st:ClearAllChildren()
st:Clone()
st:GetPlayers()
st:FireServer()
st:IsA("ClickDetector")
st.CharacterAdded:Connect(
    function(characterModel)
    end
)
st.ChildAdded:connect(
    function(m)
    end
)
st.ChildRemoved:connect(
    function(m)
    end
)
st.Changed:connect(
    function(property)
    end
)
st:GetPropertyChangedSignal("WalkSpeed"):connect(
    function()
    end
)

fireclickdetector(v)
firetouchinterest(PartTouch,  BodyTouch, 0)
table.foreach(v.damage, print)



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
virtualUser = game:GetService("VirtualUser")

local tool = lplr.Backpack:FindFirstChildOfClass("Tool") or lplr.Character:FindFirstChildOfClass("Tool")
if tool then
    tool.Handle.Size = Vector3.new(5, 5, 5)
end

function createESPItem(parent, r, g, b, fontSize, name)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = name
    nam.BackgroundTransparency = 1
    nam.TextSize = fontSize
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

for _, v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
    if tostring(v.Name) == "JudyCollection" then
        for _, l in pairs(v:GetChildren()) do
            if l:FindFirstChildOfClass("Part") then
                createESPItem(l:FindFirstChildOfClass("Part"), 196, 40, 28, 10, l.Name)
            end
        end
    else
        if v:FindFirstChildOfClass("Part") then
            createESPItem(v:FindFirstChildOfClass("Part"), 196, 40, 28, 10, v.Name)
        end
    end
end


local string_1 = "Dest";
local userdata_1 = game:GetService("Workspace").Rooms["Room_1"].Destructible["Destructible-Shower Room1"].Model;
local string_2 = "Destructible-Shower Room1";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.AttackRemote;
Target:FireServer(string_1, userdata_1, string_2);

_G.autoFarm = true
while _G.autoFarm do
    wait()
    local string_1 = "Click";
    local table_1 = {};
    local Target = game:GetService("ReplicatedStorage").Events.Npc;
    Target:FireServer(string_1, table_1);
end


-- game:GetService("Workspace").Areas.Starter.NPCs.Villager

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

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function createHitBox(parent)
    -- parent.Humanoid.HipHeight = 8
    -- parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    -- parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    -- parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    -- parent[_G.hitBoxBody].Material = "Neon"
    -- parent[_G.hitBoxBody].CanCollide = false

    -- parent[_G.hitBoxBody].Changed:connect(
    --     function(property)
    --         wait(0.1)
    --         if property == "Size" or property == "CanCollide" then
    --             parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    --             parent[_G.hitBoxBody].CanCollide = false
    --         end
    --     end
    -- )

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

function hitBox()
    for _, o in pairs(wp.dungeon:GetChildren()) do
        if o:FindFirstChild("enemyFolder") then
            for _, v in pairs(o.enemyFolder:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    wait(0.1)
                    createHitBox(v)
                end
            end
            o.enemyFolder.ChildAdded:connect(
                function(m)
                    wait(1)
                    if m:FindFirstChild("HumanoidRootPart") then
                        wait(0.1)
                        createHitBox(m)
                    end
                end
            )
        end
    end
end
hitBox()
plrs.LocalPlayer.Character.Humanoid.HipHeight = 7
_G.ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip%20Other.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()

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

_G.hitBoxSize = {50, 50, 50}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function createHitBox(parent)
    -- parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    -- parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    -- parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    -- parent[_G.hitBoxBody].Material = "Neon"
    -- parent[_G.hitBoxBody].CanCollide = false

    -- parent[_G.hitBoxBody].Changed:connect(
    --     function(property)
    --         wait(0.1)
    --         if property == "Size" or property == "CanCollide" then
    --             parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    --             parent[_G.hitBoxBody].CanCollide = false
    --         end
    --     end
    -- )

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

function hitBox()
    for _, o in pairs(wp:GetChildren()) do
        if o:FindFirstChild("HumanoidRootPart") and o:FindFirstChild("NPC") then
            wait(0.1)
            createHitBox(o)
        end
    end
    wp.ChildAdded:connect(
        function(m)
            wait(1)
            if m:FindFirstChild("HumanoidRootPart") and m:FindFirstChild("NPC") then
                wait(0.1)
                createHitBox(m)
            end
        end
    )
end
hitBox()
_G.ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()