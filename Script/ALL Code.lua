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


while wait(10) do
    local curentPosition = lplr.Character.HumanoidRootPart.CFrame
    lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Server.Sell.Ring.CFrame * CFrame.new(0, 20000, 0)
    wait(.5)
    lplr.Character.HumanoidRootPart.CFrame = curentPosition
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

local string_1 = "skin";
local number_1 = 1;
local Target = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenLegendaryCrate;
Target:InvokeServer(string_1, number_1);

local string_1 = "weapon";
local number_1 = 1;
local Target = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenLegendaryCrate;
Target:InvokeServer(string_1, number_1);

