-- Open the Dev Console (F9) to read information about the GUI --

uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

local root = char.HumanoidRootPart
local CoreGui = game:GetService("CoreGui")
local Run = game:GetService("RunService")
local human = plr.Character:FindFirstChildOfClass("Humanoid")

resetplayerstat = false
killplayeractive = false
farmallactive = false
farmfistactive = false
farmbodyactive = false
farmspeedactive = false
farmjumpactive = false
farmpsychicactive = false
punchmodeactive = false
ESPEnabled = false
ESPLength = 10000

CharAddedEvent = { }

Plrs.PlayerAdded:connect(function(plr)
	if CharAddedEvent[plr.Name] == nil then
		CharAddedEvent[plr.Name] = plr.CharacterAdded:connect(function(char)
			wait(1)
			if ESPEnabled then
				CreateESP(plr)
			end
		end)
	end
end)

function UpdateESP(plr)
	local Find = CoreGui:FindFirstChild("ESP_" .. plr.Name)
	if Find then
		local plrStatus = game.Players[plr.Name].leaderstats.Status
		if plrStatus.Value == "Criminal" or plrStatus.Value == "Lawbreaker" then
			Find.Frame.Names.TextColor3 = Color3.new(1, 0.1, 0.1)
		elseif plrStatus.Value == "Protector" or plrStatus.Value == "Guardian" then
			Find.Frame.Names.TextColor3 = Color3.new(0.1, 0.1, 1)
		elseif plrStatus.Value == "Supervillain" then
			Find.Frame.Names.TextColor3 = Color3.new(0.3, 0.1, 0.1)
		elseif plrStatus.Value == "Superhero" then
			Find.Frame.Names.TextColor3 = Color3.new(0.8, 0.8, 0)
		else
			Find.Frame.Names.TextColor3 = Color3.new(1, 1, 1)
		end
		Find.Frame.Dist.TextColor3 = Color3.new(1, 1, 1)
		Find.Frame.Health.TextColor3 = Color3.new(1, 1, 1)
		Find.Frame.Fist.TextColor3 = Color3.new(1, 1, 1)
		Find.Frame.Psychic.TextColor3 = Color3.new(1, 1, 1)
		local GetChar = plr.Character
		if MyChar and GetChar then
			local Find2 = MyChar:FindFirstChild("HumanoidRootPart")
			local Find3 = GetChar:FindFirstChild("HumanoidRootPart")
			local Find4 = GetChar:FindFirstChildOfClass("Humanoid")
			if Find2 and Find3 then
				local pos = Find3.Position
				local Dist = (Find2.Position - pos).magnitude
				if Dist > ESPLength then
					Find.Frame.Names.Visible = false
					Find.Frame.Dist.Visible = false
					Find.Frame.Health.Visible = false
					Find.Frame.Fist.Visible = false
					Find.Frame.Psychic.Visible = false
					return
				else
					Find.Frame.Names.Visible = true
					Find.Frame.Dist.Visible = true
					Find.Frame.Health.Visible = true
					Find.Frame.Fist.Visible = true
					Find.Frame.Psychic.Visible = true
				end
				Find.Frame.Dist.Text = "Distance: " .. string.format("%.0f", Dist)
				--Find.Frame.Pos.Text = "(X: " .. string.format("%.0f", pos.X) .. ", Y: " .. string.format("%.0f", pos.Y) .. ", Z: " .. string.format("%.0f", pos.Z) .. ")"
				if Find4 then
					Find.Frame.Health.Text = "Health: " .. string.format("%.0f", Find4.Health)
					Find.Frame.Fist.Text = "Fist: " .. string.format("%.0f", game.Players[plr.Name].PrivateStats.FistStrength.Value)
					Find.Frame.Psychic.Text = "Psychic: " .. string.format("%.0f", game.Players[plr.Name].PrivateStats.PsychicPower.Value)
				else
					Find.Frame.Health.Text = ""
					Find.Frame.Fist.Text = ""
					Find.Frame.Psychic.Text = ""
				end
			end
		end
	end
end

function RemoveESP(plr)
	local ESP = CoreGui:FindFirstChild("ESP_" .. plr.Name)
	if ESP then
		ESP:Destroy()
	end
end

function CreateESP(plr)
	if plr ~= nil then
		local GetChar = plr.Character
		if not GetChar then return end
		local GetHead do
			repeat wait() until GetChar:FindFirstChild("Head")
		end
		GetHead = GetChar.Head
		
		local bb = Instance.new("BillboardGui", CoreGui)
		bb.Adornee = GetHead
		bb.ExtentsOffset = Vector3.new(0, 1, 0)
		bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 5, 0, 5)
		bb.StudsOffset = Vector3.new(0, 3, 0)
		bb.Name = "ESP_" .. plr.Name
		
		local frame = Instance.new("Frame", bb)
		frame.ZIndex = 10
		frame.BackgroundTransparency = 1
		frame.Size = UDim2.new(1, 0, 1, 0)
		
		local TxtName = Instance.new("TextLabel", frame)
		TxtName.Name = "Names"
		TxtName.ZIndex = 10
		TxtName.Text = plr.Name
		TxtName.BackgroundTransparency = 1
		TxtName.Position = UDim2.new(0, 0, 0, -45)
		TxtName.Size = UDim2.new(1, 0, 10, 0)
		TxtName.Font = "SourceSansBold"
		TxtName.TextColor3 = Color3.new(0, 0, 0)
		TxtName.TextSize = 14
		TxtName.TextStrokeTransparency = 0.5
		
		local TxtDist = Instance.new("TextLabel", frame)
		TxtDist.Name = "Dist"
		TxtDist.ZIndex = 10
		TxtDist.Text = ""
		TxtDist.BackgroundTransparency = 1
		TxtDist.Position = UDim2.new(0, 0, 0, -35)
		TxtDist.Size = UDim2.new(1, 0, 10, 0)
		TxtDist.Font = "SourceSansBold"
		TxtDist.TextColor3 = Color3.new(0, 0, 0)
		TxtDist.TextSize = 15
		TxtDist.TextStrokeTransparency = 0.5

		local TxtHealth = Instance.new("TextLabel", frame)
		TxtHealth.Name = "Health"
		TxtHealth.ZIndex = 10
		TxtHealth.Text = ""
		TxtHealth.BackgroundTransparency = 1
		TxtHealth.Position = UDim2.new(0, 0, 0, -25)
		TxtHealth.Size = UDim2.new(1, 0, 10, 0)
		TxtHealth.Font = "SourceSansBold"
		TxtHealth.TextColor3 = Color3.new(0, 0, 0)
		TxtHealth.TextSize = 15
		TxtHealth.TextStrokeTransparency = 0.5

		local TxtFist = Instance.new("TextLabel", frame)
		TxtFist.Name = "Fist"
		TxtFist.ZIndex = 10
		TxtFist.Text = ""
		TxtFist.BackgroundTransparency = 1
		TxtFist.Position = UDim2.new(0, 0, 0, -15)
		TxtFist.Size = UDim2.new(1, 0, 10, 0)
		TxtFist.Font = "SourceSansBold"
		TxtFist.TextColor3 = Color3.new(0, 0, 0)
		TxtFist.TextSize = 15
		TxtFist.TextStrokeTransparency = 0.5

		local TxtPsychic = Instance.new("TextLabel", frame)
		TxtPsychic.Name = "Psychic"
		TxtPsychic.ZIndex = 10
		TxtPsychic.Text = ""
		TxtPsychic.BackgroundTransparency = 1
		TxtPsychic.Position = UDim2.new(0, 0, 0, -5)
		TxtPsychic.Size = UDim2.new(1, 0, 10, 0)
		TxtPsychic.Font = "SourceSansBold"
		TxtPsychic.TextColor3 = Color3.new(0, 0, 0)
		TxtPsychic.TextSize = 15
		TxtPsychic.TextStrokeTransparency = 0.5
	end
end

local MainGUI = Instance.new("ScreenGui")
local TopFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Open = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local PunchMode = Instance.new("TextButton")
local WayPoints = Instance.new("TextButton")
local WayPointsFrame = Instance.new("Frame")
local FarmExp = Instance.new("TextButton")
local FarmExpFrame = Instance.new("Frame")
local ShowLocation = Instance.new("TextLabel")
local SetLocation = Instance.new("TextButton")
local TPLocation = Instance.new("TextButton")
local Location1 = Instance.new("TextButton")
local Location2 = Instance.new("TextButton")
local Location3 = Instance.new("TextButton")
local Location4 = Instance.new("TextButton")
local Location5 = Instance.new("TextButton")
local Location6 = Instance.new("TextButton")
local Location7 = Instance.new("TextButton")
local Location8 = Instance.new("TextButton")
local Location9 = Instance.new("TextButton")
local Location10 = Instance.new("TextButton")
local FarmAll = Instance.new("TextButton")
local FarmFist = Instance.new("TextButton")
local FarmBody = Instance.new("TextButton")
local FarmSpeed = Instance.new("TextButton")
local FarmJump = Instance.new("TextButton")
local FarmPsychic = Instance.new("TextButton")
local FarmBodyLabel = Instance.new("TextLabel")
local FarmSpeedLabel = Instance.new("TextLabel")
local esptrack = Instance.new("TextButton")
local ESPLength = Instance.new("TextBox")
local Extras = Instance.new("TextButton")
local ExtrasFrame = Instance.new("Frame")
local AnnoyNameLabel = Instance.new("TextLabel")
local AnnoyName = Instance.new("TextBox")
local AnnoyStart = Instance.new("TextButton")
local KillPlayerStart = Instance.new("TextButton")
local TptoPlayer = Instance.new("TextButton")
local PanicToggleLabel = Instance.new("TextLabel")
local PanicToggle = Instance.new("TextBox")
local ReJoinServer = Instance.new("TextButton")
local InfoScreen = Instance.new("TextButton")
local InfoFrame = Instance.new("Frame")
local InfoText1 = Instance.new("TextLabel")
local PlayerName = Instance.new("TextBox")
local StatsFrame = Instance.new("Frame")
local ShowStats1 = Instance.new("TextLabel")
local ShowStats2 = Instance.new("TextLabel")
local StatNameSet = Instance.new("TextButton")

-- Properties

MainGUI.Name = "MainGUI"
MainGUI.Parent = game.CoreGui
MainGUI.ResetOnSpawn = false
local MainCORE = game.CoreGui["MainGUI"]

TopFrame.Name = "TopFrame"
TopFrame.Parent = MainGUI
TopFrame.BackgroundColor3 = Color3.new(0, 0, 0)
TopFrame.BorderColor3 = Color3.new(0, 0, 0)
TopFrame.BackgroundTransparency = 1
TopFrame.Position = UDim2.new(0.75, -30, 0, -27)
TopFrame.Size = UDim2.new(0, 80, 0, 20)
TopFrame.Visible = false

Open.Name = "Open"
Open.Parent = TopFrame
Open.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Open.BorderColor3 = Color3.new(0, 1, 0)
Open.Size = UDim2.new(0, 60, 0, 20)
Open.Font = Enum.Font.Fantasy
Open.Text = "Open"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextSize = 18
Open.Selectable = true
Open.TextWrapped = true

MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGUI
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Selectable = true
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0.5, -323.5, 0, -32)
MainFrame.Size = UDim2.new(0, 647, 0, 30)
MainFrame.Visible = true

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Close.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Close.Position = UDim2.new(0, 10, 0, 5)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Font = Enum.Font.Fantasy
Close.Text = "X"
Close.TextColor3 = Color3.new(1, 0, 0)
Close.TextSize = 17
Close.TextScaled = true
Close.TextWrapped = true

Minimize.Name = "Minimize"
Minimize.Parent = MainFrame
Minimize.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Minimize.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Minimize.Position = UDim2.new(0, 35, 0, 5)
Minimize.Size = UDim2.new(0, 20, 0, 20)
Minimize.Font = Enum.Font.Fantasy
Minimize.Text = "-"
Minimize.TextColor3 = Color3.new(1, 0, 1)
Minimize.TextSize = 17
Minimize.TextScaled = true
Minimize.TextWrapped = true

WayPoints.Name = "WayPoints"
WayPoints.Parent = MainFrame
WayPoints.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
WayPoints.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
WayPoints.Position = UDim2.new(0, 60, 0, 5)
WayPoints.Size = UDim2.new(0, 65, 0, 20)
WayPoints.Font = Enum.Font.Fantasy
WayPoints.TextColor3 = Color3.new(1, 1, 1)
WayPoints.Text = "Teleport"
WayPoints.TextSize = 17
WayPoints.TextWrapped = true

WayPointsFrame.Name = "WayPointsFrame"
WayPointsFrame.Parent = MainFrame
WayPointsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
WayPointsFrame.BorderColor3 = Color3.new(0, 0, 0)
WayPointsFrame.BackgroundTransparency = 0.2
WayPointsFrame.Position = UDim2.new(0, 1, 0, 33)
WayPointsFrame.Size = UDim2.new(0, 375, 0, 230)
WayPointsFrame.Visible = false

FarmExp.Name = "FarmExp"
FarmExp.Parent = MainFrame
FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmExp.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmExp.Position = UDim2.new(0, 130, 0, 5)
FarmExp.Size = UDim2.new(0, 80, 0, 20)
FarmExp.Font = Enum.Font.Fantasy
FarmExp.TextColor3 = Color3.new(1, 1, 1)
FarmExp.Text = "Farm Exp"
FarmExp.TextSize = 17
FarmExp.TextWrapped = true

FarmExpFrame.Name = "FarmExpFrame"
FarmExpFrame.Parent = MainFrame
FarmExpFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmExpFrame.BorderColor3 = Color3.new(0, 0, 0)
FarmExpFrame.BackgroundTransparency = 0.2
FarmExpFrame.Position = UDim2.new(0, 65, 0, 33)
FarmExpFrame.Size = UDim2.new(0, 210, 0, 165)
FarmExpFrame.Visible = false

ShowLocation.Name = "ShowLocation"
ShowLocation.Parent = WayPointsFrame
ShowLocation.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ShowLocation.TextColor3 = Color3.new(1, 1, 1)
ShowLocation.BorderColor3 = Color3.new(0, 0, 0)
ShowLocation.Position = UDim2.new(0, 5, 0, 5)
ShowLocation.Size = UDim2.new(0, 170, 0, 20)
ShowLocation.Font = Enum.Font.Fantasy
ShowLocation.Text = "Current Location"
ShowLocation.TextWrapped = true
ShowLocation.TextSize = 15

SetLocation.Name = "SetLocation"
SetLocation.Parent = WayPointsFrame
SetLocation.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
SetLocation.TextColor3 = Color3.new(1, 1, 1)
SetLocation.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
SetLocation.Position = UDim2.new(0, 180, 0, 5)
SetLocation.Size = UDim2.new(0, 120, 0, 20)
SetLocation.Font = Enum.Font.Fantasy
SetLocation.Text = "Set Location"
SetLocation.TextWrapped = true
SetLocation.TextSize = 16

TPLocation.Name = "TPLocation"
TPLocation.Parent = WayPointsFrame
TPLocation.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TPLocation.TextColor3 = Color3.new(1, 1, 1)
TPLocation.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
TPLocation.Position = UDim2.new(0, 305, 0, 5)
TPLocation.Size = UDim2.new(0, 65, 0, 20)
TPLocation.Font = Enum.Font.Fantasy
TPLocation.Text = "Tp to"
TPLocation.TextWrapped = true
TPLocation.TextSize = 16

Location1.Name = "Location1"
Location1.Parent = WayPointsFrame
Location1.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location1.TextColor3 = Color3.new(1, 1, 1)
Location1.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location1.Position = UDim2.new(0, 5, 0, 30)
Location1.Size = UDim2.new(0, 365, 0, 20)
Location1.Font = Enum.Font.Fantasy
Location1.Text = "Teleport to Spawn Location (Safe Zone)"
Location1.TextWrapped = true
Location1.TextSize = 16

Location2.Name = "Location2"
Location2.Parent = WayPointsFrame
Location2.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location2.TextColor3 = Color3.new(1, 1, 1)
Location2.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location2.Position = UDim2.new(0, 5, 0, 55)
Location2.Size = UDim2.new(0, 365, 0, 20)
Location2.Font = Enum.Font.Fantasy
Location2.Text = "Teleport to Rock [10x Fist Strength]"
Location2.TextWrapped = true
Location2.TextSize = 16

Location7.Name = "Location7"
Location7.Parent = WayPointsFrame
Location7.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location7.TextColor3 = Color3.new(1, 1, 1)
Location7.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location7.Position = UDim2.new(0, 5, 0, 80)
Location7.Size = UDim2.new(0, 365, 0, 20)
Location7.Font = Enum.Font.Fantasy
Location7.Text = "Teleport to Crystal [100x Fist Strength]"
Location7.TextWrapped = true
Location7.TextSize = 16

Location3.Name = "Location3"
Location3.Parent = WayPointsFrame
Location3.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location3.TextColor3 = Color3.new(1, 1, 1)
Location3.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location3.Position = UDim2.new(0, 5, 0, 105)
Location3.Size = UDim2.new(0, 365, 0, 20)
Location3.Font = Enum.Font.Fantasy
Location3.Text = "Tp to City Port Training 1 [5x BT]: 100 BT required"
Location3.TextWrapped = true
Location3.TextSize = 16

Location4.Name = "Location4"
Location4.Parent = WayPointsFrame
Location4.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location4.TextColor3 = Color3.new(1, 1, 1)
Location4.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location4.Position = UDim2.new(0, 5, 0, 130)
Location4.Size = UDim2.new(0, 365, 0, 20)
Location4.Font = Enum.Font.Fantasy
Location4.Text = "Tp to City Port Training 2 [10x BT]: 10k BT required"
Location4.TextWrapped = true
Location4.TextSize = 16

Location5.Name = "Location5"
Location5.Parent = WayPointsFrame
Location5.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location5.TextColor3 = Color3.new(1, 1, 1)
Location5.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location5.Position = UDim2.new(0, 5, 0, 155)
Location5.Size = UDim2.new(0, 365, 0, 20)
Location5.Font = Enum.Font.Fantasy
Location5.Text = "Tp to Ice Mountain [20x BT]: 100k BT required"
Location5.TextWrapped = true
Location5.TextSize = 16

Location6.Name = "Location6"
Location6.Parent = WayPointsFrame
Location6.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location6.TextColor3 = Color3.new(1, 1, 1)
Location6.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location6.Position = UDim2.new(0, 5, 0, 180)
Location6.Size = UDim2.new(0, 365, 0, 20)
Location6.Font = Enum.Font.Fantasy
Location6.Text = "Tp to Tornado [50x BT]: 1M BT required"
Location6.TextWrapped = true
Location6.TextSize = 16

Location8.Name = "Location8"
Location8.Parent = WayPointsFrame
Location8.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Location8.TextColor3 = Color3.new(1, 1, 1)
Location8.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Location8.Position = UDim2.new(0, 5, 0, 205)
Location8.Size = UDim2.new(0, 365, 0, 20)
Location8.Font = Enum.Font.Fantasy
Location8.Text = "Tp to Volcano [100x BT]: 10M BT required"
Location8.TextWrapped = true
Location8.TextSize = 16

FarmAll.Name = "FarmAll"
FarmAll.Parent = FarmExpFrame
FarmAll.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmAll.TextColor3 = Color3.new(1, 1, 1)
FarmAll.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmAll.Position = UDim2.new(0, 5, 0, 5)
FarmAll.Size = UDim2.new(0, 200, 0, 20)
FarmAll.Font = Enum.Font.Fantasy
FarmAll.Text = "Farm All: OFF"
FarmAll.TextWrapped = true
FarmAll.TextSize = 16

FarmFist.Name = "FarmFist"
FarmFist.Parent = FarmExpFrame
FarmFist.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmFist.TextColor3 = Color3.new(1, 1, 1)
FarmFist.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmFist.Position = UDim2.new(0, 5, 0, 40)
FarmFist.Size = UDim2.new(0, 200, 0, 20)
FarmFist.Font = Enum.Font.Fantasy
FarmFist.Text = "Farm Fist Strength: OFF"
FarmFist.TextWrapped = true
FarmFist.TextSize = 16

FarmBody.Name = "FarmBody"
FarmBody.Parent = FarmExpFrame
FarmBody.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmBody.TextColor3 = Color3.new(1, 1, 1)
FarmBody.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmBody.Position = UDim2.new(0, 5, 0, 65)
FarmBody.Size = UDim2.new(0, 200, 0, 20)
FarmBody.Font = Enum.Font.Fantasy
FarmBody.Text = "Farm Body Toughness: OFF"
FarmBody.TextWrapped = true
FarmBody.TextSize = 16

FarmSpeed.Name = "FarmSpeed"
FarmSpeed.Parent = FarmExpFrame
FarmSpeed.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmSpeed.TextColor3 = Color3.new(1, 1, 1)
FarmSpeed.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmSpeed.Position = UDim2.new(0, 5, 0, 90)
FarmSpeed.Size = UDim2.new(0, 200, 0, 20)
FarmSpeed.Font = Enum.Font.Fantasy
FarmSpeed.Text = "Farm Movement Speed: OFF"
FarmSpeed.TextWrapped = true
FarmSpeed.TextSize = 16

FarmJump.Name = "FarmJump"
FarmJump.Parent = FarmExpFrame
FarmJump.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmJump.TextColor3 = Color3.new(1, 1, 1)
FarmJump.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmJump.Position = UDim2.new(0, 5, 0, 115)
FarmJump.Size = UDim2.new(0, 200, 0, 20)
FarmJump.Font = Enum.Font.Fantasy
FarmJump.Text = "Farm Jump Force: OFF"
FarmJump.TextWrapped = true
FarmJump.TextSize = 16

FarmPsychic.Name = "FarmPsychic"
FarmPsychic.Parent = FarmExpFrame
FarmPsychic.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmPsychic.TextColor3 = Color3.new(1, 1, 1)
FarmPsychic.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
FarmPsychic.Position = UDim2.new(0, 5, 0, 140)
FarmPsychic.Size = UDim2.new(0, 200, 0, 20)
FarmPsychic.Font = Enum.Font.Fantasy
FarmPsychic.Text = "Farm Psychic Power: OFF"
FarmPsychic.TextWrapped = true
FarmPsychic.TextSize = 16

FarmBodyLabel.Name = "FarmBodyLabel"
FarmBodyLabel.Parent = FarmExpFrame
FarmBodyLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmBodyLabel.TextColor3 = Color3.new(1, 1, 1)
FarmBodyLabel.BorderColor3 = Color3.new(0.1, 0.1, 0.1)
FarmBodyLabel.Position = UDim2.new(0, 213, 0, 65)
FarmBodyLabel.Size = UDim2.new(0, 200, 0, 100)
FarmBodyLabel.Font = Enum.Font.Fantasy
FarmBodyLabel.Text = "Look at teleports and go to the best place you can go for your Body Toughness. You need 10Mil to go in the volcano but you need at least 50Mil before you can afk in there."
FarmBodyLabel.TextSize = 16
FarmBodyLabel.TextWrapped = true
FarmBodyLabel.Visible = false

FarmSpeedLabel.Name = "FarmSpeedLabel"
FarmSpeedLabel.Parent = FarmExpFrame
FarmSpeedLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
FarmSpeedLabel.TextColor3 = Color3.new(1, 1, 1)
FarmSpeedLabel.BorderColor3 = Color3.new(0.1, 0.1, 0.1)
FarmSpeedLabel.Position = UDim2.new(0, 213, 0, 65)
FarmSpeedLabel.Size = UDim2.new(0, 200, 0, 100)
FarmSpeedLabel.Font = Enum.Font.Fantasy
FarmSpeedLabel.Text = "Press 4 and equip the 100TON weight to get the maximum boost. If you still want to move around select the heaviest weight you can move around with but you wont get as much."
FarmSpeedLabel.TextSize = 16
FarmSpeedLabel.TextWrapped = true
FarmSpeedLabel.Visible = false

PunchMode.Name = "PunchMode"
PunchMode.Parent = MainFrame
PunchMode.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
PunchMode.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
PunchMode.Position = UDim2.new(0, 215, 0, 5)
PunchMode.Size = UDim2.new(0, 125, 0, 20)
PunchMode.TextColor3 = Color3.new(1, 1, 1)
PunchMode.Font = Enum.Font.Fantasy
PunchMode.Text = "Punch Mode: OFF"
PunchMode.TextSize = 16
PunchMode.TextWrapped = true

esptrack.Name = "esptrack"
esptrack.Parent = MainFrame
esptrack.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
esptrack.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
esptrack.Position = UDim2.new(0, 345, 0, 5)
esptrack.Size = UDim2.new(0, 40, 0, 20)
esptrack.TextColor3 = Color3.new(1, 1, 1)
esptrack.Font = Enum.Font.Fantasy
esptrack.Text = "ESP"
esptrack.TextSize = 16
esptrack.TextWrapped = true

Extras.Name = "Extras"
Extras.Parent = MainFrame
Extras.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Extras.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
Extras.Position = UDim2.new(0, 390, 0, 5)
Extras.Size = UDim2.new(0, 50, 0, 20)
Extras.TextColor3 = Color3.new(1, 1, 1)
Extras.Font = Enum.Font.Fantasy
Extras.Text = "Extras"
Extras.TextSize = 16
Extras.TextWrapped = true

ExtrasFrame.Name = "ExtrasFrame"
ExtrasFrame.Parent = MainFrame
ExtrasFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ExtrasFrame.BorderColor3 = Color3.new(0, 0, 0)
ExtrasFrame.BackgroundTransparency = 0.2
ExtrasFrame.Position = UDim2.new(0, 323, 0, 33)
ExtrasFrame.Size = UDim2.new(0, 160, 0, 151)
ExtrasFrame.Visible = false

AnnoyName.Name = "AnnoyName"
AnnoyName.Parent = ExtrasFrame
AnnoyName.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
AnnoyName.BorderColor3 = Color3.new(0.8, 0.8, 0.8)
AnnoyName.Position = UDim2.new(0, 5, 0, 5)
AnnoyName.Size = UDim2.new(0, 150, 0, 20)
AnnoyName.TextColor3 = Color3.new(1, 1, 1)
AnnoyName.Font = Enum.Font.Fantasy
AnnoyName.Text = tostring(MyPlr.Name)
AnnoyName.TextSize = 14
AnnoyName.TextScaled = false
AnnoyName.TextWrapped = true

TptoPlayer.Name = "TptoPlayer"
TptoPlayer.Parent = ExtrasFrame
TptoPlayer.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TptoPlayer.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
TptoPlayer.Position = UDim2.new(0, 5, 0, 26)
TptoPlayer.Size = UDim2.new(0, 150, 0, 20)
TptoPlayer.TextColor3 = Color3.new(1, 1, 1)
TptoPlayer.Font = Enum.Font.Fantasy
TptoPlayer.Text = "TP to Player"
TptoPlayer.TextSize = 16
TptoPlayer.TextWrapped = true

AnnoyStart.Name = "AnnoyStart"
AnnoyStart.Parent = ExtrasFrame
AnnoyStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
AnnoyStart.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
AnnoyStart.Position = UDim2.new(0, 5, 0, 47)
AnnoyStart.Size = UDim2.new(0, 150, 0, 20)
AnnoyStart.TextColor3 = Color3.new(1, 1, 1)
AnnoyStart.Font = Enum.Font.Fantasy
AnnoyStart.Text = "TP Spam Player: OFF"
AnnoyStart.TextSize = 16
AnnoyStart.TextWrapped = true

KillPlayerStart.Name = "KillPlayerStart"
KillPlayerStart.Parent = ExtrasFrame
KillPlayerStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
KillPlayerStart.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
KillPlayerStart.Position = UDim2.new(0, 5, 0, 68)
KillPlayerStart.Size = UDim2.new(0, 150, 0, 20)
KillPlayerStart.TextColor3 = Color3.new(1, 1, 1)
KillPlayerStart.Font = Enum.Font.Fantasy
KillPlayerStart.Text = "Kill Player: OFF"
KillPlayerStart.TextSize = 16
KillPlayerStart.TextWrapped = true

PanicToggleLabel.Name = "PanicToggleLabel"
PanicToggleLabel.Parent = ExtrasFrame
PanicToggleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
PanicToggleLabel.BorderSizePixel = 0
PanicToggleLabel.Position = UDim2.new(0, 5, 0, 98)
PanicToggleLabel.Size = UDim2.new(0, 125, 0, 20)
PanicToggleLabel.TextColor3 = Color3.new(1, 1, 1)
PanicToggleLabel.Font = Enum.Font.Fantasy
PanicToggleLabel.Text = "Panic KeyBind"
PanicToggleLabel.TextSize = 16
PanicToggleLabel.TextWrapped = true

PanicToggle.Name = "PanicToggle"
PanicToggle.Parent = ExtrasFrame
PanicToggle.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
PanicToggle.BorderColor3 = Color3.new(0.8, 0.8, 0.8)
PanicToggle.Position = UDim2.new(0, 130, 0, 99)
PanicToggle.Size = UDim2.new(0, 25, 0, 18)
PanicToggle.TextColor3 = Color3.new(1, 1, 1)
PanicToggle.Font = Enum.Font.Fantasy
PanicToggle.Text = "y"
PanicToggle.TextSize = 16
PanicToggle.TextWrapped = true

ReJoinServer.Name = "ReJoinServer"
ReJoinServer.Parent = ExtrasFrame
ReJoinServer.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ReJoinServer.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
ReJoinServer.Position = UDim2.new(0, 5, 0, 126)
ReJoinServer.Size = UDim2.new(0, 150, 0, 20)
ReJoinServer.TextColor3 = Color3.new(1, 1, 1)
ReJoinServer.Font = Enum.Font.Fantasy
ReJoinServer.Text = "ReJoin Server"
ReJoinServer.TextSize = 16
ReJoinServer.TextWrapped = true

InfoScreen.Name = "InfoScreen"
InfoScreen.Parent = MainFrame
InfoScreen.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
InfoScreen.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
InfoScreen.Position = UDim2.new(0, 445, 0, 5)
InfoScreen.Size = UDim2.new(0, 37, 0, 20)
InfoScreen.BackgroundTransparency = 0
InfoScreen.Font = Enum.Font.Fantasy
InfoScreen.TextColor3 = Color3.new(1, 1, 1)
InfoScreen.Text = "Info"
InfoScreen.TextSize = 17
InfoScreen.TextWrapped = true

InfoText1.Name = "InfoText1"
InfoText1.Parent = MainFrame
InfoText1.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
InfoText1.BorderColor3 = Color3.new(0, 0, 0)
InfoText1.BackgroundTransparency = 0
InfoText1.Position = UDim2.new(0, 293, 0, 32)
InfoText1.Size = UDim2.new(0, 190, 0, 230)
InfoText1.TextColor3 = Color3.new(1, 1, 1)
InfoText1.Font = Enum.Font.Fantasy
InfoText1.Text = "This Gui was created by LuckyMMB@V3rmillion.net\nDiscord https://discord.gg/GKzJnUC\n\nCredits:\n-racist dolphin for the original ESP script which I edited and customised and whoever found the remotes for farming exp."
InfoText1.TextSize = 15
InfoText1.TextWrapped = true
InfoText1.Visible = false
InfoText1.ZIndex = 7
InfoText1.TextYAlignment = Enum.TextYAlignment.Top

PlayerName.Name = "PlayerName"
PlayerName.Parent = MainFrame
PlayerName.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
PlayerName.BorderColor3 = Color3.new(0.6, 0.6, 0.6)
PlayerName.Position = UDim2.new(0, 487, 0, 5)
PlayerName.Size = UDim2.new(0, 150, 0, 20)
PlayerName.Font = Enum.Font.Fantasy
PlayerName.TextColor3 = Color3.new(1, 1, 1)
PlayerName.Text = tostring(MyPlr.Name)
PlayerName.TextSize = 15
PlayerName.TextScaled = true
PlayerName.TextWrapped = false

StatsFrame.Name = "StatsFrame"
StatsFrame.Parent = MainFrame
StatsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
StatsFrame.BorderColor3 = Color3.new(0.1, 0.1, 0.1)
StatsFrame.BackgroundTransparency = 0
StatsFrame.Position = UDim2.new(0, 487, 0, 31)
StatsFrame.Size = UDim2.new(0, 151, 0, 90)
StatsFrame.Visible = false

ShowStats1.Name = "ShowStats1"
ShowStats1.Parent = StatsFrame
ShowStats1.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ShowStats1.BackgroundTransparency = 1
ShowStats1.Position = UDim2.new(0, 0, 0, 0)
ShowStats1.Size = UDim2.new(0, 50, 0, 90)
ShowStats1.Font = Enum.Font.Fantasy
ShowStats1.TextColor3 = Color3.new(1, 1, 1)
ShowStats1.Text = " "
ShowStats1.TextSize = 15
ShowStats1.TextXAlignment = Enum.TextXAlignment.Right

ShowStats2.Name = "ShowStats2"
ShowStats2.Parent = StatsFrame
ShowStats2.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
ShowStats2.BackgroundTransparency = 1
ShowStats2.Position = UDim2.new(0, 55, 0, 0)
ShowStats2.Size = UDim2.new(0, 93, 0, 90)
ShowStats2.Font = Enum.Font.Fantasy
ShowStats2.TextColor3 = Color3.new(1, 1, 1)
ShowStats2.Text = "Stats"
ShowStats2.TextSize = 15
ShowStats2.TextXAlignment = Enum.TextXAlignment.Right

-- Close --

Open.MouseButton1Down:connect(function()
	TopFrame.Visible = false
	MainFrame.Visible = true
end)

Minimize.MouseButton1Down:connect(function()
	TopFrame.Visible = true
	MainFrame.Visible = false
end)

Close.MouseButton1Down:connect(function()
MainGUI:Destroy()
end)

-- Menus --

local Menus = {
	[WayPoints] = WayPointsFrame;
	[FarmExp] = FarmExpFrame;
	[Extras] = ExtrasFrame;
}
for button,frame in pairs(Menus) do
	button.MouseButton1Click:connect(function()
		if frame.Visible then
			frame.Visible = false
			return
		end
		for k,v in pairs(Menus) do
			v.Visible = v == frame
		end
	end)
end

FarmBody.MouseEnter:connect(function()
	FarmBodyLabel.Visible = true
end)

FarmBody.MouseLeave:connect(function()
	FarmBodyLabel.Visible = false
end)

FarmSpeed.MouseEnter:connect(function()
	FarmSpeedLabel.Visible = true
end)

FarmSpeed.MouseLeave:connect(function()
	FarmSpeedLabel.Visible = false
end)

FarmJump.MouseEnter:connect(function()
	FarmSpeedLabel.Visible = true
end)

FarmJump.MouseLeave:connect(function()
	FarmSpeedLabel.Visible = false
end)

InfoScreen.MouseEnter:connect(function()
	InfoText1.Visible = true
end)

InfoScreen.MouseLeave:connect(function()
	InfoText1.Visible = false
end)

-- Show Location --

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local curlocation = coroutine.wrap(function()

	while true do
		LocationX = round(lplr.Character.HumanoidRootPart.Position.x, 0)
		LocationY = round(lplr.Character.HumanoidRootPart.Position.y, 0)
		LocationZ = round(lplr.Character.HumanoidRootPart.Position.z, 0)
		ShowLocation.Text = "Coords: "..LocationX..", "..LocationY..", "..LocationZ
		wait(0.5)
	end

end)

curlocation()

-- Set Locations --

SetLocation.MouseButton1Down:connect(function()

	setlocationx = round(lplr.Character.HumanoidRootPart.Position.x, 0)
	setlocationy = round(lplr.Character.HumanoidRootPart.Position.y, 0)
	setlocationz = round(lplr.Character.HumanoidRootPart.Position.z, 0)
	print("Set Custom Location: "..setlocationx..", "..setlocationy..", "..setlocationz)
    SetLocation.Text = setlocationx..","..setlocationy..","..setlocationz
	CustomLocationSet = true

end)

--- TP to custom location ---

TPLocation.MouseButton1Down:connect(function()
	if CustomLocationSet == true then
		wp:WaitForChild(lplr.Name).HumanoidRootPart.CFrame = CFrame.new(setlocationx, setlocationy, setlocationz)
	end
end)

Location1.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = (wp:FindFirstChild('SpawnLocation', true).CFrame) * CFrame.new(0, 2, 0)
end)
	
Location2.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(409, 271, 978)
end)

Location3.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(365, 250, -445)
end)

Location4.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(358, 254, -445)
end)

Location5.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(1624, 270, 2262)
end)

Location6.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-2307, 976, 1068)
end)

Location7.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-2279, 1944, 1053)
end)

Location8.MouseButton1Click:connect(function()
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-2006, 741, -1806)
end)

-- ESP Stuff --

Run:BindToRenderStep("UpdateESP", Enum.RenderPriority.Character.Value, function()
	for _, v in next, plrs:GetPlayers() do
		UpdateESP(v)
	end
end)

-- Farm Exp --

function fActive()
	repeat
		local Event = rs.RemoteEvent
		local fistarguments = {"+FS5", "+FS4", "+FS3", "+FS2", "+FS1"}
		for i,v in pairs(fistarguments) do
			Event:FireServer({[1] = v})
			wait()
		end
		wait(0.05)
	until farmfistactive == false
end

function bActive()
	repeat
		local bodyarguments = {"+BT5", "+BT4", "+BT3", "+BT2", "+BT1"}
		local event = rs.RemoteEvent
		for i,v in pairs(bodyarguments) do
			event:FireServer({[1] = v})
			wait()
		end
		wait(0.05)
	until farmbodyactive == false
end

function sActive()
	repeat
		local speedarguments = {"+MS5", "+MS4", "+MS3", "+MS2", "+MS1"}
		local event = rs.RemoteEvent
		for i,v in pairs(speedarguments) do
			event:FireServer({[1] = v})
			wait()
		end
		wait(0.05)
	until farmspeedactive == false
end

function jActive()
	repeat
		local jumparguments = {"+JF5", "+JF4", "+JF3", "+JF2", "+JF1"}
		local event = rs.RemoteEvent
		for i,v in pairs(jumparguments) do
			event:FireServer({[1] = v})
			wait()
		end
		wait(0.05)
	until farmjumpactive == false
end

function pActive()
	repeat
		local psychicarguments = {"+PP5", "+PP4", "+PP3", "+PP2", "+PP1"}
		local event = rs.RemoteEvent
		for i,v in pairs(psychicarguments) do
			event:FireServer({[1] = v})
			wait()
		end
		wait(0.05)
	until farmpsychicactive == false
end

FarmAll.MouseButton1Click:Connect(function()
	if farmallactive ~= true then
		farmallactive = true
		farmfistactive = true
		farmbodyactive = true
		farmspeedactive = true
		farmpsychicactive = true
		farmjumpactive = true
		FarmAll.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmAll.Text = "Farm All: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		fActive()
		bActive()
		sActive()
		jActive()
		pActive()
	else
		farmallactive = false
		farmfistactive = false
		farmbodyactive = false
		farmspeedactive = false
		farmpsychicactive = false
		farmjumpactive = false
		FarmFist.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmBody.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmSpeed.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmJump.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmPsychic.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmAll.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmAll.Text = "Farm All: OFF"
		FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	end
end)

FarmFist.MouseButton1Click:Connect(function()
	if farmfistactive ~= true then
		farmfistactive = true
		FarmFist.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmFist.Text = "Farm Fist Strength: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		fActive()
	else
		farmfistactive = false
		FarmFist.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmFist.Text = "Farm Fist Strength: OFF"
		FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	end
end)

FarmBody.MouseButton1Click:Connect(function()
	if farmbodyactive ~= true then
		farmbodyactive = true
		FarmBody.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmBody.Text = "Farm Body Strength: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		bActive()
	else
		farmbodyactive = false
		FarmBody.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmBody.Text = "Farm Body Strength: OFF"
		FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	end
end)

FarmSpeed.MouseButton1Click:Connect(function()
	if farmspeedactive ~= true then
		farmspeedactive = true
		FarmSpeed.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmSpeed.Text = "Farm Speed Strength: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		sActive()
	else
		farmspeedactive = false
		FarmSpeed.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmSpeed.Text = "Farm Speed Strength: OFF"
		FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	end
end)

FarmJump.MouseButton1Click:Connect(function()
	if farmjumpactive ~= true then
		farmjumpactive = true
		FarmJump.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmJump.Text = "Farm Jump Strength: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		jActive()
	else
		farmjumpactive = false
		FarmJump.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmJump.Text = "Farm Jump Strength: OFF"
		FarmExp.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	end
end)

FarmPsychic.MouseButton1Click:Connect(function()
	if farmpsychicactive ~= true then
		farmpsychicactive = true
		FarmPsychic.BackgroundColor3 = Color3.new(0, 0.5, 0)
		FarmPsychic.Text = "Farm Psychic Strength: ON"
		FarmExp.BackgroundColor3 = Color3.new(0, 0.5, 0)
		pActive()
	else
		farmpsychicactive = false
		FarmPsychic.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		FarmPsychic.Text = "Farm Psychic Strength: OFF"
	end
end)
-- Punch Mode --

PunchMode.MouseButton1Click:Connect(function()
	if punchmodeactive ~= true then
		punchmodeactive = true
		PunchMode.BackgroundColor3 = Color3.new(0, 0.5, 0)
		PunchMode.Text = "Punch Mode: ON"
		repeat
			rs.RemoteEvent:FireServer("Skill_Punch", "Left")
			rs.RemoteEvent:FireServer("Skill_Punch", "Right")
			wait(0.05)
		until punchmodeactive == false
	else
		punchmodeactive = false
		PunchMode.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		PunchMode.Text = "Punch Mode: OFF"
	end
end)


-- Annoy Player --

AnnoyStart.MouseButton1Click:Connect(function()
	if annoyplayeractive ~= true then
		annoyplayeractive = true
		AnnoyStart.BackgroundColor3 = Color3.new(0, 0.5, 0)
		AnnoyStart.Text = "TP Spam Player: ON"
	else
		annoyplayeractive = false
		AnnoyStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		AnnoyStart.Text = "TP Spam Player: OFF"
	end
end)

spawn(function()
	while true do
		wait(0.5)
		if annoyplayeractive then
			for i,v in pairs(plrs:GetChildren()) do
				if v.Name:lower():find(AnnoyName.Text:lower()) then
					if v.Name == "LuckyMMB" or v.Name == "LuckyMMB2" or v.Name == "LuckyMMB2017" or v.Name == "Deadly_Banana" then
						print("You can't TP Spam this player.")
					else
						player = lplr.Character
						local startpos = player.HumanoidRootPart.CFrame
						v.Character.Humanoid.Died:connect(function()
							annoyplayeractive = false
							AnnoyStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
							AnnoyStart.Text = "TP Spam Player: OFF"
						end)
						player.Humanoid.Died:connect(function()
							annoyplayeractive = false
							AnnoyStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
							AnnoyStart.Text = "TP Spam Player: OFF"
						end)

						while annoyplayeractive == true do
							player.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
							wait(.005)
						end
						player.HumanoidRootPart.CFrame = startpos
					end
				end
			end
		end
	end
end)

TptoPlayer.MouseButton1Click:Connect(function()
	for i,v in pairs(plrs:GetChildren()) do
		if v.Name:lower():find(AnnoyName.Text:lower()) then
			if v.Name ~= tostring(MyPlr.Name) then
				player = lplr.Character
				player.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, 3)
			end
		end
	end
end)

-- TP Kill Player --

KillPlayerStart.MouseButton1Click:Connect(function()
	if killplayeractive ~= true then
		local player = lplr.Character
		player.Humanoid:Remove()
		Instance.new('Humanoid',player)	
		wait()
		KillPlayerStart.BackgroundColor3 = Color3.new(0, 0.5, 0)
		KillPlayerStart.Text = "Kill Player: ON"
		annoyplayeractive = false
		AnnoyStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		AnnoyStart.Text = "TP Spam Player: OFF"
		killplayeractive = true
	else
		killplayeractive = false
		KillPlayerStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		KillPlayerStart.Text = "Kill Player: OFF"
	end
end)

spawn(function()
	while true do
		wait(0.5)
		if killplayeractive then
			player = lplr.Character
			if string.lower(AnnoyName.Text):find(string.lower("all")) then
				local startpos = player.HumanoidRootPart.CFrame
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-2300, 1000, 1070)
				for i = 1, 100 do
					while killplayeractive do
						wait()
						local loc = CFrame.new(-2300, 1000, 1070)
						for i, SelectedPlayer in pairs(game.Players:GetPlayers()) do
							if SelectedPlayer.Name ~= lplr.Name then
								SelectedPlayer.Character:SetPrimaryPartCFrame(loc)
							end
						end
					end
				end
				player.HumanoidRootPart.CFrame = startpos
			else
				for i,v in pairs(plrs:GetChildren()) do
					if string.lower(v.Name):find(string.lower(AnnoyName.Text)) then
						if v.Name == "LuckyMMB" or v.Name == "LuckyMMB2" or v.Name == "LuckyMMB2017" or v.Name == "Deadly_Banana" then
							print("You can't TP Kill this player.")
						else
							player = lplr.Character
							v.Character.Humanoid.Died:connect(function()
								killplayeractive = false
								KillPlayerStart.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
								KillPlayerStart.Text = "Kill Player: OFF"
							end)
							print("Killing: " ..v.Name)
							local startpos = player.HumanoidRootPart.CFrame
							lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-2300, 1000, 1070)
							for i = 1, 100 do
								while killplayeractive do
									wait()
									local loc = CFrame.new(-2300, 1000, 1070)
									v.Character:SetPrimaryPartCFrame(loc)
								end
							end
							player.HumanoidRootPart.CFrame = startpos
						end
					end
				end
			end
		end
	end
end)

mouse.KeyDown:connect(function(key)
	if key == tostring(PanicToggle.Text) then
		lplr.Character.HumanoidRootPart.CFrame = (wp:FindFirstChild('SpawnLocation', true).CFrame) * CFrame.new(0, 2, 0)
	end
end)

-- Remove Weather Effect --

game.Lighting.Changed:connect(function()
	lgt.TimeOfDay = "12:00:00"
	lgt.FogEnd = 9999
	lgt.Brightness = 1
end)

-- ESP --

esptrack.MouseButton1Click:connect(function()
	ESPEnabled = not ESPEnabled
	if ESPEnabled then
		esptrack.BackgroundColor3 = Color3.new(0, 0.5, 0)
		for _, v in next, Plrs:GetPlayers() do
			if v ~= MyPlr then
				if CharAddedEvent[v.Name] == nil then
					CharAddedEvent[v.Name] = v.CharacterAdded:connect(function(Char)
						if ESPEnabled then
							CreateESP(v)
						end
						repeat wait() until Char:FindFirstChild("HumanoidRootPart")
					end)
				end
				RemoveESP(v)
				CreateESP(v)
			end
		end
	else
		esptrack.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		for _, v in next, Plrs:GetPlayers() do
			RemoveESP(v)
		end
	end
end)

-- Display Player Info --

spawn(function()
	while true do
		statplayer = tostring(PlayerName.Text)
		StatsFrame.Visible = false
		for i,v in pairs(plrs:GetChildren()) do
			if string.lower(v.Name) == string.lower(statplayer) then
				local FindHum = v.Character:FindFirstChildOfClass("Humanoid")
				local PlayerHealth = tostring(string.format("%.0f", FindHum.Health))
				local PlayerFist = tostring(string.format("%.0f", plrs[v.Name].PrivateStats.FistStrength.Value))
				local PlayerBody = tostring(string.format("%.0f", plrs[v.Name].PrivateStats.BodyToughness.Value))
				local PlayerSpeed = tostring(string.format("%.0f", plrs[v.Name].PrivateStats.MovementSpeed.Value))
				local PlayerJump = tostring(string.format("%.0f", plrs[v.Name].PrivateStats.JumpForce.Value))
				local PlayerPsychic = tostring(string.format("%.0f", plrs[v.Name].PrivateStats.PsychicPower.Value))
				ShowStats1.Text = "Health:\nFist:\nBody:\nSpeed:\nJump:\nPsychic:"
				ShowStats2.Text = PlayerHealth.. "\n" ..PlayerFist.. "\n" ..PlayerBody.. "\n" ..PlayerSpeed.. "\n" ..PlayerJump.. "\n" ..PlayerPsychic
				StatsFrame.Visible = true
			end
		end
		wait(0.25)
	end
end)

--- ReJoin Server ---

ReJoinServer.MouseButton1Click:connect(function()
	local placeId = 2202352383
	game:GetService("TeleportService"):Teleport(placeId)
end)