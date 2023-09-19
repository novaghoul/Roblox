st:FindFirstChildOfClass("")
st:WaitForChildOfClass("")
st:WaitForChild("")
st:GetPlayers()
st:GetChildren()
st:GetDescendants()
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
repeat task.wait(30) until game:IsLoaded()
spawn(function()
    
end)

while wait(10) do
    
end

fireclickdetector(v)
firetouchinterest(PartTouch,  BodyTouch, 0)
table.foreach(v.damage, print)

local filetest = require(game:GetService("ReplicatedStorage").GTycoonClient.Modules.GamepassCache)
filetest.CheckOwnsPass = function() return true end
filetest.CheckOwnsPassAsync = function() return true end

local filetest = require(game:GetService("Workspace").Plots["4"].Buttons.QuickSell.Button.QuickSell)
filetest.Init = function() return; end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "z" then
        end
    end
)

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
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ExecuteChats.lua"), true))()

for i, v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'MaxAmmo') then
        print("-------------------------------------------------------------")
        table.foreach(v, print)
    end
end

for i, v in pairs(getgc()) do
    if type(v) == "function" and getinfo(v).name == "Reload" then
        debug.setupvalue(v, 2, math.huge)
    end
end