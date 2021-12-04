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

local tool = lplr.Backpack:FindFirstChildOfClass("Tool") or lplr.Character:FindFirstChildOfClass("Tool")
if tool then
    tool.Handle.Size = Vector3.new(5, 5, 5)
end

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

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


loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
function createHitBoxS(parent)
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
hitBoxE()

local PartBoss = nil
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "f" then
        if PartBoss ~= nil then
            PartBoss:Destroy()
        end
        wait(0.5)
        local Part = Instance.new("Part")
        Part.Name = "PartKillBoss"
        Part.Parent = wp
        Part.Size = Vector3.new(10, 10, 10)
        Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)
        Part.Anchored = true
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 15, 0)
        PartBoss = Part
    end
end)

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
ws_g = 50