-- Objects

local ScreenGui = Instance.new("ScreenGui")
local basegui = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Subtitle1 = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local buggypirates = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local naturegoblins = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local bandits = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
local Subtitle2 = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local swordautofarm = Instance.new("TextButton")
local haki = Instance.new("TextButton")
local meleeautofarm = Instance.new("TextButton")
local defenseautofarm = Instance.new("TextButton")
local close = Instance.new("TextButton")
local Frame_3 = Instance.new("Frame")
local Frame_4 = Instance.new("Frame")
local autodf = Instance.new("TextButton")
local fruitduper = Instance.new("TextButton")
local dfautolevel = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

basegui.Name = "basegui"
basegui.Parent = ScreenGui
basegui.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
basegui.BackgroundTransparency = 0.15000000596046
basegui.BorderSizePixel = 0
basegui.Position = UDim2.new(1, 0, 0.144999996, 0)
basegui.Size = UDim2.new(0, 298, 0, 503)

Title.Name = "Title"
Title.Parent = basegui
Title.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
Title.BackgroundTransparency = 0.10000000149012
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 298, 0, 50)
Title.Font = Enum.Font.ArialBold
Title.Text = "OPT Gui v2.6"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 25

Subtitle1.Name = "Subtitle1"
Subtitle1.Parent = basegui
Subtitle1.BackgroundColor3 = Color3.new(1, 1, 1)
Subtitle1.BackgroundTransparency = 1
Subtitle1.Position = UDim2.new(0.164429531, 0, 0.100844353, 0)
Subtitle1.Size = UDim2.new(0, 200, 0, 50)
Subtitle1.Font = Enum.Font.ArialBold
Subtitle1.Text = "Mobs to Farm"
Subtitle1.TextColor3 = Color3.new(1, 1, 1)
Subtitle1.TextSize = 20

Frame.Parent = Subtitle1
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.0949999988, 0, 0.980000019, 0)
Frame.Size = UDim2.new(0, 237, 0, 1)

buggypirates.Name = "buggypirates"
buggypirates.Parent = basegui
buggypirates.BackgroundColor3 = Color3.new(1, 1, 1)
buggypirates.Position = UDim2.new(0.802013397, 0, 0.229255557, 0)
buggypirates.Size = UDim2.new(0, 20, 0, 20)
buggypirates.Font = Enum.Font.SourceSans
buggypirates.Text = ""
buggypirates.TextColor3 = Color3.new(0, 0, 0)
buggypirates.TextScaled = true
buggypirates.TextSize = 14
buggypirates.TextWrapped = true
buggypirates.TextYAlignment = Enum.TextYAlignment.Top

TextLabel.Parent = buggypirates
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(-9.60000038, 0, -0.699999988, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.ArialBold
TextLabel.Text = "Buggy Pirates"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14

naturegoblins.Name = "naturegoblins"
naturegoblins.Parent = basegui
naturegoblins.BackgroundColor3 = Color3.new(1, 1, 1)
naturegoblins.Position = UDim2.new(0.802013397, 0, 0.290265739, 0)
naturegoblins.Size = UDim2.new(0, 20, 0, 20)
naturegoblins.Font = Enum.Font.SourceSans
naturegoblins.Text = ""
naturegoblins.TextColor3 = Color3.new(0, 0, 0)
naturegoblins.TextScaled = true
naturegoblins.TextSize = 14
naturegoblins.TextWrapped = true
naturegoblins.TextYAlignment = Enum.TextYAlignment.Top

TextLabel_2.Parent = naturegoblins
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(-9.60000134, 0, -0.75, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.ArialBold
TextLabel_2.Text = "Nature Bosses"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 14

bandits.Name = "bandits"
bandits.Parent = basegui
bandits.BackgroundColor3 = Color3.new(1, 1, 1)
bandits.Position = UDim2.new(0.802013397, 0, 0.351275921, 0)
bandits.Size = UDim2.new(0, 20, 0, 20)
bandits.Font = Enum.Font.SourceSans
bandits.Text = ""
bandits.TextColor3 = Color3.new(0, 0, 0)
bandits.TextScaled = true
bandits.TextSize = 14
bandits.TextWrapped = true
bandits.TextYAlignment = Enum.TextYAlignment.Top

TextLabel_3.Parent = bandits
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(-9.60000038, 0, -0.75, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
TextLabel_3.Font = Enum.Font.ArialBold
TextLabel_3.Text = "Bandits"
TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextSize = 14

Subtitle2.Name = "Subtitle2"
Subtitle2.Parent = basegui
Subtitle2.BackgroundColor3 = Color3.new(1, 1, 1)
Subtitle2.BackgroundTransparency = 1
Subtitle2.Position = UDim2.new(0.164429531, 0, 0.421194792, 0)
Subtitle2.Size = UDim2.new(0, 200, 0, 50)
Subtitle2.Font = Enum.Font.ArialBold
Subtitle2.Text = "Farms"
Subtitle2.TextColor3 = Color3.new(1, 1, 1)
Subtitle2.TextSize = 20

Frame_2.Parent = Subtitle2
Frame_2.BackgroundColor3 = Color3.new(1, 1, 1)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.0949999988, 0, 0.980000019, 0)
Frame_2.Size = UDim2.new(0, 237, 0, 1)

swordautofarm.Name = "swordautofarm"
swordautofarm.Parent = basegui
swordautofarm.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
swordautofarm.BackgroundTransparency = 0.10000000149012
swordautofarm.Position = UDim2.new(0.164429531, 0, 0.538028121, 0)
swordautofarm.Size = UDim2.new(0, 200, 0, 25)
swordautofarm.Font = Enum.Font.ArialBold
swordautofarm.Text = "Sword Autofarm : OFF"
swordautofarm.TextColor3 = Color3.new(1, 1, 1)
swordautofarm.TextSize = 14

haki.Name = "haki"
haki.Parent = basegui
haki.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
haki.BackgroundTransparency = 0.10000000149012
haki.Position = UDim2.new(0.164429531, 0, 0.911566794, 0)
haki.Size = UDim2.new(0, 200, 0, 25)
haki.Font = Enum.Font.ArialBold
haki.Text = "Haki"
haki.TextColor3 = Color3.new(1, 1, 1)
haki.TextSize = 14

meleeautofarm.Name = "meleeautofarm"
meleeautofarm.Parent = basegui
meleeautofarm.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
meleeautofarm.BackgroundTransparency = 0.10000000149012
meleeautofarm.Position = UDim2.new(0.161073819, 0, 0.599516571, 0)
meleeautofarm.Size = UDim2.new(0, 200, 0, 25)
meleeautofarm.Font = Enum.Font.ArialBold
meleeautofarm.Text = "Melee AutoFarm : OFF"
meleeautofarm.TextColor3 = Color3.new(1, 1, 1)
meleeautofarm.TextSize = 14

defenseautofarm.Name = "defenseautofarm"
defenseautofarm.Parent = basegui
defenseautofarm.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
defenseautofarm.BackgroundTransparency = 0.10000000149012
defenseautofarm.Position = UDim2.new(0.164429531, 0, 0.663012922, 0)
defenseautofarm.Size = UDim2.new(0, 200, 0, 25)
defenseautofarm.Font = Enum.Font.ArialBold
defenseautofarm.Text = "Defense Autofarm : OFF"
defenseautofarm.TextColor3 = Color3.new(1, 1, 1)
defenseautofarm.TextSize = 14

close.Name = "close"
close.Parent = basegui
close.BackgroundColor3 = Color3.new(1, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.016778525, 0, 0.0133630289, 0)
close.Size = UDim2.new(0, 25, 0, 25)
close.Font = Enum.Font.ArialBold
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.TextSize = 17

Frame_3.Parent = close
Frame_3.BackgroundColor3 = Color3.new(0.705882, 0.705882, 0.705882)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0, 0, 1, 0)
Frame_3.Size = UDim2.new(0, 25, 0, 3)

Frame_4.Parent = close
Frame_4.BackgroundColor3 = Color3.new(0.705882, 0.705882, 0.705882)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(1, 0, 0, 0)
Frame_4.Size = UDim2.new(0, 3, 0, 28)

autodf.Name = "autodf"
autodf.Parent = basegui
autodf.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
autodf.BackgroundTransparency = 0.10000000149012
autodf.Position = UDim2.new(0.164429531, 0, 0.789176643, 0)
autodf.Size = UDim2.new(0, 200, 0, 25)
autodf.Font = Enum.Font.ArialBold
autodf.Text = "Auto DevilFruit : OFF"
autodf.TextColor3 = Color3.new(1, 1, 1)
autodf.TextSize = 14

fruitduper.Name = "fruitduper"
fruitduper.Parent = basegui
fruitduper.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
fruitduper.BackgroundTransparency = 0.10000000149012
fruitduper.Position = UDim2.new(0.164429531, 0, 0.851425707, 0)
fruitduper.Size = UDim2.new(0, 200, 0, 25)
fruitduper.Font = Enum.Font.ArialBold
fruitduper.Text = "DevilFruit Duper"
fruitduper.TextColor3 = Color3.new(1, 1, 1)
fruitduper.TextSize = 14

dfautolevel.Name = "dfautolevel"
dfautolevel.Parent = basegui
dfautolevel.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
dfautolevel.BackgroundTransparency = 0.10000000149012
dfautolevel.Position = UDim2.new(0.164429531, 0, 0.725281894, 0)
dfautolevel.Size = UDim2.new(0, 200, 0, 25)
dfautolevel.Font = Enum.Font.ArialBold
dfautolevel.Text = "DF AutoLevel : OFF"
dfautolevel.TextColor3 = Color3.new(1, 1, 1)
dfautolevel.TextSize = 14

spawn(function()
basegui:TweenPosition(UDim2.new(0.8,0,0.145,0), "Out", "Linear", 1.5)
end)

close.MouseButton1Click:Connect(function()
basegui:TweenPosition(UDim2.new(1,0,0.145,0), "Out", "Linear", 1.5)
wait(2)
basegui.Visible = false
end)

value1 = 0
name1 = ""
value2 = 0
name2 = ""
value3 = 0
name3 = ""

buggypirates.MouseButton1Click:Connect(function()
if value1 == 0 then
buggypirates.Text = "X"
value1 = 1
name1 = "BuggyPirate"
elseif value1 == 1 then
buggypirates.Text = ""
value1 = 0
name1 = ""
end
end)

naturegoblins.MouseButton1Click:Connect(function()
if value2 == 0 then
naturegoblins.Text = "X"
value2 = 1
name2 = "NatureBoss"
elseif value2 == 1 then
naturegoblins.Text = ""
value2 = 0
name2 = ""
end
end)

bandits.MouseButton1Click:Connect(function()
if value3 == 0 then
bandits.Text = "X"
value3 = 1
name3 = "Bandit"
elseif value3 == 1 then
bandits.Text = ""
value3 = 0
name3 = ""
end
end)

haki.MouseButton1Click:Connect(function()
local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == "" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.x, pos.y, pos.z)
end
end
end)

swordvalue = 0
swordfarmactivated = false
swordautofarm.MouseButton1Click:Connect(function()
if swordvalue == 0 then
swordvalue = 1
swordautofarm.Text = "Sword AutoFarm : ON"
swordfarmactivated = true


spawn(function()
while swordfarmactivated == true do
wait()
pcall(function()
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == name1 or v.Name == name2 or v.Name == name3 then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
while v.Humanoid.Health > 1 and swordfarmactivated == true do
local pos = v.HumanoidRootPart.Position
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,Vector3.new(pos.x, pos.y, pos.z))
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 0, -3.5)
end
end
end
end
end)
end
end)

spawn(function()
while swordfarmactivated == true do
wait(0.4)
pcall(function()
local A_1 = 1
local Event = game:GetService("ReplicatedStorage").Events.SWORD.SwordSlash
Event:FireServer()
end)
end
end)

spawn(function()
game.Players.LocalPlayer.CharacterAdded:Connect(function()
if swordfarmactivated == true then
wait(3)
local Event = game:GetService("Players").LocalPlayer.Backpack.Sword.SwordEvents.UnSeath
Event:FireServer()
end
end)
end)

spawn(function()
wait(1)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

elseif swordvalue == 1 then
swordvalue = 0
swordfarmactivated = false
swordautofarm.Text = "Sword AutoFarm : OFF"
end
end)

meleevalue = 0
meleefarmactivated = false
meleeautofarm.MouseButton1Click:Connect(function()
if meleevalue == 0 then
meleevalue = 1
meleefarmactivated = true
meleeautofarm.Text = "Melee AutoFarm : ON"

spawn(function()
while meleefarmactivated == true do
wait()
pcall(function()
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == name1 or v.Name == name2 or v.Name == name3 then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
while v.Humanoid.Health > 1 and meleefarmactivated == true do
local pos2 = v.HumanoidRootPart.Position
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,Vector3.new(pos2.x, pos2.y, pos2.z))
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 0, -3.5)
end
end
end
end
end)
end
end)
 
spawn(function()
while meleefarmactivated == true do
wait(0.35)
pcall(function()
local A_1 = 1
local Event = game:GetService("Players").LocalPlayer.Backpack.Combat.COMBAT
Event:FireServer(A_1)
end)
end
end)

elseif meleevalue == 1 then
meleevalue = 0
meleefarmactivated = false
meleeautofarm.Text = "Melee AutoFarm : OFF"
end
end)

defvalue = 0
deffarmactivated = false
defenseautofarm.MouseButton1Click:Connect(function()
if defvalue == 0 then
defvalue = 1
deffarmactivated = true
defenseautofarm.Text = "Defense AutoFarm : ON"

spawn(function()
while wait() do
pcall(function()
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == name1 or v.Name == name2 or v.Name == name3 then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
while v.Humanoid.Health > 1 and deffarmactivated == true do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 0, -2)
end
end
end
end
end)
end
end)

elseif defvalue == 1 then
defvalue = 0
deffarmactivated = false
defenseautofarm.Text = "Defense AutoFarm : OFF"
end
end)

fruitduper.MouseButton1Click:Connect(function()
for i=1,15 do
local Event = game:GetService("ReplicatedStorage").Events.DF.Drop
Event:FireServer()
end
end)

autodfactivated = false
autodfv = 0
autodf.MouseButton1Click:connect(function()
if autodfv == 0 then
autodfv = 1
autodfactivated = true
autodf.Text = "Auto DevilFruit : ON"
while autodfactivated == true do
wait(0.1)
pcall(function()
wait()
for i,v in pairs(game.Workspace.PlayerList:GetChildren()) do
if v.Name ~= "Script" and autodfactivated == true and v.ClassName ~= "StringValue" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
end
end
end)
end
elseif autodfv == 1 then
autodfv = 0
autodfactivated = false
autodf.Text = "Auto DevilFruit : OFF"
end
end)

dfautov = 0
dfautolevelactivated = false
dfautolevel.MouseButton1Click:Connect(function()
if dfautov == 0 then
dfautov = 1
dfautolevelactivated = true
dfautolevel.Text = "DF AutoLevel : ON"


spawn(function()
while dfautolevelactivated == true do
wait()
pcall(function()
for i,v in pairs(game.Workspace:GetChildren()) do
if v.Name == name1 or v.Name == name2 or v.Name == name3 then
if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
while v.Humanoid.Health > 1 and dfautolevelactivated == true do
local pos4 = v.HumanoidRootPart.Position
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p,Vector3.new(pos4.x, pos4.y, pos4.z))
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0, 0, -3.5)
local A_1 = "Z"
local A_2 = "X"
local A_3 = "C"
local A_4 = "V"
local A_5 = "B"
local A_6 = "X"
local A_7 = false
local A_8 = "GURA"
local A_9 = 2
local Event = game:GetService("ReplicatedStorage").Events.DF.Gura1
Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9)


local A_1 = CFrame.new(pos4.x, pos4.y, pos4.z)
local A_2 = "Z"
local A_3 = "X"
local A_4 = "C"
local A_5 = "V"
local A_6 = "B"
local A_7 = "X"
local A_8 = false
local A_9 = "GURA"
local A_10 = 2
local Event = game:GetService("ReplicatedStorage").Events.DF.Gura1
Event:FireServer(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10)
end
end
end
end
end)
end
end)


elseif dfautov == 1 then
dfautov = 0
dfautolevelactivated = false
dfautolevel.Text = "DF AutoLevel : OFF"
end
end)