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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {2, 2, 2}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

spawn(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() -- ESP ALL Players
end)

spawn(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() -- Hit Box
end)

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

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "k" then
        for _, v in pairs(wp.ItemLocationHolder:GetChildren()) do
            v.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
end)
print(game:GetService("Teams").Police.TeamColor)
-- HideWhenZoomed

-- Decompiled with the Synapse X Luau decompiler.
for i, v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'MaxAmmo') then
        print("-------------------------------------------------------------")
        table.foreach(v, print)
    end
end


_G.autoTrain = true
while _G.autoTrain do
    wait()
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Resources.Pickups:GetChildren()) do
            pcall(function()
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end)
        end
    end)
end

local namePet = "Isaac"

for _, v in pairs(game:GetService("Workspace")["__THINGS"].Pets:GetChildren()) do
    if tostring(v["__BILLBOARD"].Nickname.Text) == namePet then
        local table_1 = {
            [1] = tostring(v.Name)
        };
        local Target = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["enchant pet"];
        Target:InvokeServer(table_1);
    end
end
