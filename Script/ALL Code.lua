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
st.Touched:connect(
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

spawn(function()
    
end)

fireclickdetector(v)
firetouchinterest(PartTouch,  BodyTouch, 0)
table.foreach(v.damage, print)

local filetest = require(game:GetService("ReplicatedStorage").GTycoonClient.Modules.GamepassCache)
filetest.CheckOwnsPass = function() return true end
filetest.CheckOwnsPassAsync = function() return true end

local filetest = require(game:GetService("Workspace").Plots["4"].Buttons.QuickSell.Button.QuickSell)
filetest.Init = function() return; end


_G.arrayNameButton = {
    "addSpeed",
    "subSpeed",
    "infJump",
    "killAllZom",
    "noclipToggle"
}

_G.arrayTextButton = {
    "Press C to + Speed",
    "Press V to - Speed",
    "Press Space to Inf Jump",
    "Press E to Kill All Zombie",
    "Press F to Noclip"
}

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/TutorialMod.lua"), true))() -- Tutorial Lua

local tool = lplr.Backpack:FindFirstChildOfClass("Tool") or lplr.Character:FindFirstChildOfClass("Tool")
if tool then
    tool.Handle.Size = Vector3.new(5, 5, 5)
end

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
-- game:GetService("Workspace").Activities.IceSkating.PickupSpots.PickupSpot["Logo_Stadium"]

local countLogo = 0
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "e" then
            for _,v in pairs(wp.Activities.IceSkating.PickupSpots:GetChildren()) do
                if v:FindFirstChildOfClass("Part") and countLogo < 2 then
                    countLogo = countLogo + 1
                    v:GetChildren()[1].CFrame = lplr.Character.HumanoidRootPart.CFrame
                end
            end
            countLogo = 0
        end
    end
)

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

for _,v in pairs(game:GetService("Workspace").Coins:GetChildren()) do
    local userdata_1 = v
    local bool_1 = false
    local Target = game:GetService("ReplicatedStorage").Events.GameEvents.CollectCoin
    Target:FireServer(userdata_1, bool_1)
end

------------ Magnet Simulator 2 ------------
while wait(.1) do
    wp.Rings.Sellx25.Touch.CFrame = lplr.Character.HumanoidRootPart.CFrame
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "c" then
        lplr.Character.HumanoidRootPart.CFrame = wp.Rings.Sellx25.OuterRing.CFrame * CFrame.new(0, 10, 0)
    end
    if keyDown == "q" then
        for i=1,10 do
            local Target = rs.Events.GameEvents.UpgradeStorage;
            Target:FireServer();
        end
    end
end)

---------------- Slayer Tycoon ------------
getgenv().hitBoxSize = {30, 30, 30}
getgenv().hitBoxBody = "HumanoidRootPart"
getgenv().hitBoxColor = "Really blue"
getgenv().hitBoxTransparency = 1
-- HumanoidRootPart

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Hit%20Box.lua"), true))() -- Hit Box

for _,v in pairs(wp.TycoonSets.Tycoons.Grasslands.PurchasedObjects:GetChildren()) do
    if v.Name == "WisteriaTrees" then
        v.Lasers:Destroy()
    end
end
wp.TycoonSets.Tycoons.Grasslands.PurchasedObjects.ChildAdded:connect(
    function(m)
        if m.Name == "WisteriaTrees" then
            wait(.5)
            m.Lasers:Destroy()
        end
    end
)