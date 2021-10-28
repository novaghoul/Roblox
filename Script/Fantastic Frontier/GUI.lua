-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local Mason = Instance.new("ScreenGui")
local First = Instance.new("Frame")
local Open = Instance.new("TextButton")
local Second = Instance.new("Frame")
local Close = Instance.new("TextButton")
local SelectPresents = Instance.new("TextButton")
local SelectIDTraveler = Instance.new("TextButton")
local SelectSightRange = Instance.new("TextButton")
local SelectFly = Instance.new("TextButton")
local SelectFireFly = Instance.new("TextButton")
--Properties:
Mason.Name = "Mason"
Mason.Parent = game.CoreGui

First.Name = "First"
First.Parent = Mason
First.BackgroundColor3 = Color3.new(1, 1, 1)
First.Position = UDim2.new(0.0176678449, 0, 0.335968375, 0)
First.Size = UDim2.new(0, 100, 0, 20)

Open.Name = "Open"
Open.Parent = First
Open.BackgroundColor3 = Color3.new(0, 0, 0)
Open.BorderColor3 = Color3.new(1, 1, 1)
Open.Size = UDim2.new(0, 100, 0, 20)
Open.Font = Enum.Font.SourceSansBold
Open.Text = "Open"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextScaled = true
Open.TextSize = 14
Open.TextStrokeColor3 = Color3.new(1, 1, 1)
Open.TextWrapped = true
Open.MouseButton1Down:connect(function()
Second.Visible = true
First.Visible = false
end)

Second.Name = "Second"
Second.Parent = Mason
Second.BackgroundColor3 = Color3.new(1, 0.666667, 0)
Second.BorderColor3 = Color3.new(1, 1, 1)
Second.Position = UDim2.new(0.0176678449, 0, 0.395256907, 0)
Second.Size = UDim2.new(0, 100, 0, 170)
Second.Visible = false

Close.Name = "Close"
Close.Parent = Second
Close.BackgroundColor3 = Color3.new(0, 0, 0)
Close.BorderColor3 = Color3.new(1, 1, 1)
Close.Size = UDim2.new(0, 100, 0, 20)
Close.Font = Enum.Font.SourceSansBold
Close.Text = "Close"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextScaled = true
Close.TextSize = 14
Close.TextStrokeColor3 = Color3.new(1, 1, 1)
Close.TextWrapped = true
Close.MouseButton1Down:connect(function()
First.Visible = true
Second.Visible = false
end)

SelectPresents.Name = "SelectPresents"
SelectPresents.Parent = Second
SelectPresents.BackgroundColor3 = Color3.new(0, 0, 0)
SelectPresents.BorderColor3 = Color3.new(1, 1, 1)
SelectPresents.Position = UDim2.new(0, 0, 0.176470593, 0)
SelectPresents.Size = UDim2.new(0, 100, 0, 20)
SelectPresents.Font = Enum.Font.SourceSansBold
SelectPresents.Text = "Presents"
SelectPresents.TextColor3 = Color3.new(1, 1, 1)
SelectPresents.TextScaled = true
SelectPresents.TextSize = 14
SelectPresents.TextStrokeColor3 = Color3.new(1, 1, 1)
SelectPresents.TextWrapped = true
SelectPresents.MouseButton1Down:connect(function()
Mushroom = workspace.Present1.PP
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)
SelectPresents.MouseButton1Click:connect(function()
Mushroom = workspace.Present2.PP
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)
SelectPresents.MouseButton1Click:connect(function()
Mushroom = workspace.Present3.PP
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)
SelectPresents.MouseButton1Click:connect(function()
Mushroom = workspace.Present4.PP
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)
SelectPresents.MouseButton1Click:connect(function()
Mushroom = workspace.Present5.PP
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)

SelectIDTraveler.Name = "SelectIDTraveler"
SelectIDTraveler.Parent = Second
SelectIDTraveler.BackgroundColor3 = Color3.new(0, 0, 0)
SelectIDTraveler.BorderColor3 = Color3.new(1, 1, 1)
SelectIDTraveler.Position = UDim2.new(0, 0, 0.352941185, 0)
SelectIDTraveler.Size = UDim2.new(0, 100, 0, 20)
SelectIDTraveler.Font = Enum.Font.SourceSansBold
SelectIDTraveler.Text = "ID Traveler"
SelectIDTraveler.TextColor3 = Color3.new(1, 1, 1)
SelectIDTraveler.TextScaled = true
SelectIDTraveler.TextSize = 14
SelectIDTraveler.TextStrokeColor3 = Color3.new(1, 1, 1)
SelectIDTraveler.TextWrapped = true
SelectIDTraveler.MouseButton1Down:connect(function()
Mushroom = workspace.PassiveNPCs["NPC_Giver"].Head
local Beam = Instance.new("Beam")
Beam.Name = "Track"
Beam.Parent = game.Players.LocalPlayer.Character.Head
Beam.Width0 = 0.3
Beam.Width1 = 0.3
local Point1 = Instance.new("Attachment")
local Point2 = Instance.new("Attachment")
Point1.Parent = game.Players.LocalPlayer.Character.Head
Point2.Parent = Mushroom
Beam.Attachment0 = Point1
Beam.Attachment1 = Point2
end)

SelectSightRange.Name = "SelectSightRange"
SelectSightRange.Parent = Second
SelectSightRange.BackgroundColor3 = Color3.new(0, 0, 0)
SelectSightRange.BorderColor3 = Color3.new(1, 1, 1)
SelectSightRange.Position = UDim2.new(0, 0, 0.529411793, 0)
SelectSightRange.Size = UDim2.new(0, 100, 0, 20)
SelectSightRange.Font = Enum.Font.SourceSansBold
SelectSightRange.Text = "No Fog"
SelectSightRange.TextColor3 = Color3.new(1, 1, 1)
SelectSightRange.TextScaled = true
SelectSightRange.TextSize = 14
SelectSightRange.TextStrokeColor3 = Color3.new(1, 1, 1)
SelectSightRange.TextWrapped = true
SelectSightRange.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Stats.SightRange.Value = 2000000
end)

SelectFly.Name = "SelectFly"
SelectFly.Parent = Second
SelectFly.BackgroundColor3 = Color3.new(0, 0, 0)
SelectFly.BorderColor3 = Color3.new(1, 1, 1)
SelectFly.Position = UDim2.new(0, 0, 0.882352948, 0)
SelectFly.Size = UDim2.new(0, 100, 0, 20)
SelectFly.Font = Enum.Font.SourceSansBold
SelectFly.Text = "Fly[F]"
SelectFly.TextColor3 = Color3.new(1, 1, 1)
SelectFly.TextScaled = true
SelectFly.TextSize = 14
SelectFly.TextStrokeColor3 = Color3.new(1, 1, 1)
SelectFly.TextWrapped = true
SelectFly.MouseButton1Down:connect(function()
repeat wait()
   until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "f" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
end)

SelectFireFly.Name = "SelectFireFly"
SelectFireFly.Parent = Second
SelectFireFly.BackgroundColor3 = Color3.new(0, 0, 0)
SelectFireFly.BorderColor3 = Color3.new(1, 1, 1)
SelectFireFly.Position = UDim2.new(0, 0, 0.70588237, 0)
SelectFireFly.Size = UDim2.new(0, 100, 0, 20)
SelectFireFly.Font = Enum.Font.SourceSansBold
SelectFireFly.Text = "FireFly"
SelectFireFly.TextColor3 = Color3.new(1, 1, 1)
SelectFireFly.TextScaled = true
SelectFireFly.TextSize = 14
SelectFireFly.TextStrokeColor3 = Color3.new(1, 1, 1)
SelectFireFly.TextWrapped = true
SelectFireFly.MouseButton1Down:connect(function()
local child = workspace:children()
for i = 1, #child do
if child[i].Name == "FireflyLocal" then
local ech = Instance.new("Beam")
ech.Name = "dddd"
ech.Parent = game.Players.LocalPlayer.Character.Torso
ech.Width0 = 0.1
ech.Width1 = 0.1
local dab = Instance.new("Attachment")
local pp = Instance.new("Attachment")
dab.Parent = game.Players.LocalPlayer.Character.Torso
pp.Parent = child[i].PP
ech.Attachment0 = dab
ech.Attachment1 = pp
end
end
end)