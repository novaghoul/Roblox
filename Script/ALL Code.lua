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

-- Entities.Infected.NameZombie.Head
-- Objectives
for _, o in pairs(wp.Entities.Infected:GetChildren()) do
    if o:WaitForChild("Head") then

    end
end
for i=1,2 do
    local Zom = wp.Entities.Infected:GetChildren()[1]
    for _,v in pairs(Zom["Head Model"]:GetChildren()) do
        print("-------------")
        print(v)
    end
end

--[[ Variables ]]
local RS = game:GetService("ReplicatedStorage")
local PS = game:GetService("Players")
local Client = RS:WaitForChild("CIient")
local RunSrv = game:GetService("RunService")

_G.auM = true

RunSrv.RenderStepped:Connect(function()
    if _G.auM then
        Client:FireServer("Melee", "Divine Shield", PS.LocalPlayer.Character)
    end
end)

