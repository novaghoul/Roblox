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

folderMobs = nil
folderNPCs = nil
folderChest = nil

local positionNPCs = {}

local enableAutoMobs = false
local enableAutoBring = false
local enableAutoBringAll = false
local enableAutoChest = false
local enableAutoTool = false

local enableAutoLuffy = false
local enableAutoNoob = false
local enableAutoMarine = false
local enableAutoBuggy = false
local enableAutoThief = false

local autoChestActive = false
local autoStealItem = true

local farm = false
local noclip = false

wsSpeed = 20

if wsSpeed == nil then
	wsSpeed = 20
end

local jump = 50

if cg:FindFirstChild("Steve's One Piece V2") then
	cg["Steve's One Piece V2"]:Destroy()
end

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local StevesOnePieceV2 = Instance.new("ScreenGui")
local OCB = Instance.new("TextButton")
local MainGUI = Instance.new("Frame")
local MenuGUI = Instance.new("Frame")
local MainMenu = Instance.new("TextButton")
local TeleportMenu = Instance.new("TextButton")
local OtherMenu = Instance.new("TextButton")
local MainFunction = Instance.new("Frame")
local lblautotool = Instance.new("TextLabel")
local bntAutoTool = Instance.new("TextButton")
local txtNameTool = Instance.new("TextBox")
local lblautostealitem = Instance.new("TextLabel")
local bntAutoStealItem = Instance.new("TextButton")
local textAmountTool = Instance.new("TextBox")
local bntCheckChest = Instance.new("TextButton")
local bntAutoCheckChest = Instance.new("TextButton")
local bntTPNPCs = Instance.new("TextButton")
local bntResetNPCs = Instance.new("TextButton")
local bntTPMobs = Instance.new("TextButton")
local bntAutoTPMobs = Instance.new("TextButton")
local txtNamePlayer = Instance.new("TextBox")
local bntTPPlayer = Instance.new("TextButton")
local bntAutoTPPlayer = Instance.new("TextButton")
local bntTPAllPlayer = Instance.new("TextButton")
local bntAutoTPAllPlayer = Instance.new("TextButton")
local bntResetAllPlayers = Instance.new("TextButton")
local bntSetJP = Instance.new("TextButton")
local bntSetWS = Instance.new("TextButton")
local txtWSValue = Instance.new("TextBox")
local txtJPValue = Instance.new("TextBox")
local lblDistance = Instance.new("TextLabel")
local txtDisValue = Instance.new("TextBox")
local TeleportFunction = Instance.new("Frame")
local bntAutoTPNoob = Instance.new("TextButton")
local bntAutoTPMarine = Instance.new("TextButton")
local bntAutoTPBuggy = Instance.new("TextButton")
local bntAutoTPLuffy = Instance.new("TextButton")
local bntTPLuffyIsland = Instance.new("TextButton")
local bntTPMarineIsland = Instance.new("TextButton")
local bntTPNoobIsland = Instance.new("TextButton")
local bntTPBuggyIsland = Instance.new("TextButton")
local bntTPThiefIsland = Instance.new("TextButton")
local bntTPSanjiIsland = Instance.new("TextButton")
local bntTPSaboIsland = Instance.new("TextButton")
local bntAutoTPThief = Instance.new("TextButton")
local OtherFunction = Instance.new("Frame")
--Properties:
StevesOnePieceV2.Name = "Steve's One Piece V2"
StevesOnePieceV2.Parent = cg
StevesOnePieceV2.ResetOnSpawn = false

OCB.Name = "OCB"
OCB.Parent = StevesOnePieceV2
OCB.BackgroundColor3 = Color3.new(0.666667, 0.333333, 1)
OCB.BorderSizePixel = 0
OCB.Position = UDim2.new(0, 0, 0.803439796, 0)
OCB.Size = UDim2.new(0, 50, 0, 25)
OCB.Font = Enum.Font.SourceSans
OCB.Text = "Open"
OCB.TextColor3 = Color3.new(0, 0, 0)
OCB.TextSize = 14

MainGUI.Name = "MainGUI"
MainGUI.Parent = StevesOnePieceV2
MainGUI.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
MainGUI.BorderSizePixel = 0
MainGUI.Position = UDim2.new(0.137569413, 0, 0.117936105, 0)
MainGUI.Size = UDim2.new(0, 500, 0, 450)
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true

MenuGUI.Name = "MenuGUI"
MenuGUI.Parent = MainGUI
MenuGUI.BackgroundColor3 = Color3.new(0.470588, 0.470588, 0.470588)
MenuGUI.BorderColor3 = Color3.new(0, 1, 1)
MenuGUI.Size = UDim2.new(0, 100, 0, 450)

MainMenu.Name = "MainMenu"
MainMenu.Parent = MenuGUI
MainMenu.BackgroundColor3 = Color3.new(1, 1, 1)
MainMenu.BorderSizePixel = 0
MainMenu.Position = UDim2.new(0, 10, 0, 10)
MainMenu.Size = UDim2.new(0, 80, 0, 25)
MainMenu.Font = Enum.Font.SourceSans
MainMenu.Text = "Main"
MainMenu.TextColor3 = Color3.new(0, 0, 0)
MainMenu.TextSize = 14

TeleportMenu.Name = "TeleportMenu"
TeleportMenu.Parent = MenuGUI
TeleportMenu.BackgroundColor3 = Color3.new(1, 1, 1)
TeleportMenu.BorderSizePixel = 0
TeleportMenu.Position = UDim2.new(0, 10, 0, 45)
TeleportMenu.Size = UDim2.new(0, 80, 0, 25)
TeleportMenu.Font = Enum.Font.SourceSans
TeleportMenu.Text = "Teleport"
TeleportMenu.TextColor3 = Color3.new(0, 0, 0)
TeleportMenu.TextSize = 14

OtherMenu.Name = "OtherMenu"
OtherMenu.Parent = MenuGUI
OtherMenu.BackgroundColor3 = Color3.new(1, 1, 1)
OtherMenu.BorderSizePixel = 0
OtherMenu.Position = UDim2.new(0, 10, 0, 80)
OtherMenu.Size = UDim2.new(0, 80, 0, 25)
OtherMenu.Font = Enum.Font.SourceSans
OtherMenu.Text = "Other"
OtherMenu.TextColor3 = Color3.new(0, 0, 0)
OtherMenu.TextSize = 14

MainFunction.Name = "MainFunction"
MainFunction.Parent = MainGUI
MainFunction.BackgroundColor3 = Color3.new(1, 1, 1)
MainFunction.BackgroundTransparency = 1
MainFunction.BorderSizePixel = 0
MainFunction.Position = UDim2.new(0, 100, 0, 0)
MainFunction.Size = UDim2.new(0, 400, 0, 450)

lblautotool.Name = "lblautotool"
lblautotool.Parent = MainFunction
lblautotool.BackgroundColor3 = Color3.new(1, 1, 1)
lblautotool.BackgroundTransparency = 1
lblautotool.BorderSizePixel = 0
lblautotool.Size = UDim2.new(0, 75, 0, 50)
lblautotool.Font = Enum.Font.SourceSans
lblautotool.Text = "Auto Tool :"
lblautotool.TextColor3 = Color3.new(0, 0, 0)
lblautotool.TextSize = 14

bntAutoTool.Name = "bntAutoTool"
bntAutoTool.Parent = MainFunction
bntAutoTool.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTool.BackgroundTransparency = 1
bntAutoTool.BorderSizePixel = 0
bntAutoTool.Position = UDim2.new(0, 70, 0, 15)
bntAutoTool.Size = UDim2.new(0, 25, 0, 25)
bntAutoTool.Font = Enum.Font.SourceSans
bntAutoTool.Text = "▶"
bntAutoTool.TextColor3 = Color3.new(0, 0, 0)
bntAutoTool.TextSize = 20

txtNameTool.Name = "txtNameTool"
txtNameTool.Parent = MainFunction
txtNameTool.BackgroundColor3 = Color3.new(1, 1, 1)
txtNameTool.BorderColor3 = Color3.new(0.666667, 0, 1)
txtNameTool.Position = UDim2.new(0, 150, 0, 0)
txtNameTool.Size = UDim2.new(0, 125, 0, 50)
txtNameTool.Font = Enum.Font.SourceSans
txtNameTool.PlaceholderColor3 = Color3.new(0.333333, 0.333333, 0.498039)
txtNameTool.PlaceholderText = "Weapon's Name"
txtNameTool.Text = ""
txtNameTool.TextColor3 = Color3.new(0, 0, 0)
txtNameTool.TextSize = 20

lblautostealitem.Name = "lblautostealitem"
lblautostealitem.Parent = MainFunction
lblautostealitem.BackgroundColor3 = Color3.new(1, 1, 1)
lblautostealitem.BackgroundTransparency = 1
lblautostealitem.BorderSizePixel = 0
lblautostealitem.Position = UDim2.new(0, 270, 0, 0)
lblautostealitem.Size = UDim2.new(0, 100, 0, 50)
lblautostealitem.Font = Enum.Font.SourceSans
lblautostealitem.Text = "Auto Steal Item :"
lblautostealitem.TextColor3 = Color3.new(0, 0, 0)
lblautostealitem.TextSize = 14

bntAutoStealItem.Name = "bntAutoStealItem"
bntAutoStealItem.Parent = MainFunction
bntAutoStealItem.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoStealItem.BackgroundTransparency = 1
bntAutoStealItem.BorderSizePixel = 0
bntAutoStealItem.Position = UDim2.new(0, 370, 0, 15)
bntAutoStealItem.Size = UDim2.new(0, 25, 0, 25)
bntAutoStealItem.Font = Enum.Font.SourceSans
bntAutoStealItem.Text = "⏹"
bntAutoStealItem.TextColor3 = Color3.new(0, 0, 0)
bntAutoStealItem.TextSize = 20

textAmountTool.Name = "textAmountTool"
textAmountTool.Parent = MainFunction
textAmountTool.BackgroundColor3 = Color3.new(1, 1, 1)
textAmountTool.BorderColor3 = Color3.new(0.666667, 0, 1)
textAmountTool.Position = UDim2.new(0, 100, 0, 0)
textAmountTool.Size = UDim2.new(0, 50, 0, 50)
textAmountTool.Font = Enum.Font.SourceSans
textAmountTool.Text = "1"
textAmountTool.TextColor3 = Color3.new(0, 0, 0)
textAmountTool.TextSize = 14

bntCheckChest.Name = "bntCheckChest"
bntCheckChest.Parent = MainFunction
bntCheckChest.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntCheckChest.BorderColor3 = Color3.new(0.666667, 1, 0)
bntCheckChest.Position = UDim2.new(0, 10, 0, 75)
bntCheckChest.Size = UDim2.new(0, 185, 0, 50)
bntCheckChest.Font = Enum.Font.SourceSans
bntCheckChest.Text = "Check Chest"
bntCheckChest.TextColor3 = Color3.new(0, 0, 0)
bntCheckChest.TextSize = 14

bntAutoCheckChest.Name = "bntAutoCheckChest"
bntAutoCheckChest.Parent = bntCheckChest
bntAutoCheckChest.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoCheckChest.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoCheckChest.Size = UDim2.new(0, 50, 0, 25)
bntAutoCheckChest.Font = Enum.Font.SourceSans
bntAutoCheckChest.Text = "Auto"
bntAutoCheckChest.TextColor3 = Color3.new(0, 0, 0)
bntAutoCheckChest.TextSize = 14

bntTPNPCs.Name = "bntTPNPCs"
bntTPNPCs.Parent = MainFunction
bntTPNPCs.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntTPNPCs.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPNPCs.Position = UDim2.new(0, 205, 0, 75)
bntTPNPCs.Size = UDim2.new(0, 185, 0, 50)
bntTPNPCs.Font = Enum.Font.SourceSans
bntTPNPCs.Text = "TP NPCs"
bntTPNPCs.TextColor3 = Color3.new(0, 0, 0)
bntTPNPCs.TextSize = 14

bntResetNPCs.Name = "bntResetNPCs"
bntResetNPCs.Parent = bntTPNPCs
bntResetNPCs.BackgroundColor3 = Color3.new(1, 1, 1)
bntResetNPCs.BorderColor3 = Color3.new(0.666667, 1, 0)
bntResetNPCs.Position = UDim2.new(0, 135, 0, 0)
bntResetNPCs.Size = UDim2.new(0, 50, 0, 25)
bntResetNPCs.Font = Enum.Font.SourceSans
bntResetNPCs.Text = "Reset"
bntResetNPCs.TextColor3 = Color3.new(0, 0, 0)
bntResetNPCs.TextSize = 14

bntTPMobs.Name = "bntTPMobs"
bntTPMobs.Parent = MainFunction
bntTPMobs.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntTPMobs.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPMobs.Position = UDim2.new(0, 10, 0, 135)
bntTPMobs.Size = UDim2.new(0, 185, 0, 50)
bntTPMobs.Font = Enum.Font.SourceSans
bntTPMobs.Text = "TP Mobs"
bntTPMobs.TextColor3 = Color3.new(0, 0, 0)
bntTPMobs.TextSize = 14

bntAutoTPMobs.Name = "bntAutoTPMobs"
bntAutoTPMobs.Parent = bntTPMobs
bntAutoTPMobs.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPMobs.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPMobs.Size = UDim2.new(0, 50, 0, 25)
bntAutoTPMobs.Font = Enum.Font.SourceSans
bntAutoTPMobs.Text = "Auto"
bntAutoTPMobs.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPMobs.TextSize = 14

txtNamePlayer.Name = "txtNamePlayer"
txtNamePlayer.Parent = MainFunction
txtNamePlayer.BackgroundColor3 = Color3.new(1, 1, 1)
txtNamePlayer.BorderSizePixel = 0
txtNamePlayer.Position = UDim2.new(0, 10, 0, 195)
txtNamePlayer.Size = UDim2.new(0, 380, 0, 50)
txtNamePlayer.Font = Enum.Font.SourceSans
txtNamePlayer.PlaceholderText = "Name Player"
txtNamePlayer.Text = ""
txtNamePlayer.TextColor3 = Color3.new(0, 0, 0)
txtNamePlayer.TextSize = 20

bntTPPlayer.Name = "bntTPPlayer"
bntTPPlayer.Parent = MainFunction
bntTPPlayer.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntTPPlayer.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPPlayer.Position = UDim2.new(0, 10, 0, 255)
bntTPPlayer.Size = UDim2.new(0, 380, 0, 50)
bntTPPlayer.Font = Enum.Font.SourceSans
bntTPPlayer.Text = "TP Player"
bntTPPlayer.TextColor3 = Color3.new(0, 0, 0)
bntTPPlayer.TextSize = 14

bntAutoTPPlayer.Name = "bntAutoTPPlayer"
bntAutoTPPlayer.Parent = bntTPPlayer
bntAutoTPPlayer.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPPlayer.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPPlayer.Size = UDim2.new(0, 50, 0, 25)
bntAutoTPPlayer.Font = Enum.Font.SourceSans
bntAutoTPPlayer.Text = "Auto"
bntAutoTPPlayer.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPPlayer.TextSize = 14

bntTPAllPlayer.Name = "bntTPAllPlayer"
bntTPAllPlayer.Parent = MainFunction
bntTPAllPlayer.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntTPAllPlayer.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPAllPlayer.Position = UDim2.new(0, 10, 0, 315)
bntTPAllPlayer.Size = UDim2.new(0, 380, 0, 50)
bntTPAllPlayer.Font = Enum.Font.SourceSans
bntTPAllPlayer.Text = "TP All Players"
bntTPAllPlayer.TextColor3 = Color3.new(0, 0, 0)
bntTPAllPlayer.TextSize = 14

bntAutoTPAllPlayer.Name = "bntAutoTPAllPlayer"
bntAutoTPAllPlayer.Parent = bntTPAllPlayer
bntAutoTPAllPlayer.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPAllPlayer.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPAllPlayer.Size = UDim2.new(0, 50, 0, 25)
bntAutoTPAllPlayer.Font = Enum.Font.SourceSans
bntAutoTPAllPlayer.Text = "Auto"
bntAutoTPAllPlayer.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPAllPlayer.TextSize = 14

bntResetAllPlayers.Name = "bntResetAllPlayers"
bntResetAllPlayers.Parent = bntTPAllPlayer
bntResetAllPlayers.BackgroundColor3 = Color3.new(1, 1, 1)
bntResetAllPlayers.BorderColor3 = Color3.new(0.666667, 1, 0)
bntResetAllPlayers.Position = UDim2.new(0, 330, 0, 0)
bntResetAllPlayers.Size = UDim2.new(0, 50, 0, 25)
bntResetAllPlayers.Font = Enum.Font.SourceSans
bntResetAllPlayers.Text = "Reset"
bntResetAllPlayers.TextColor3 = Color3.new(0, 0, 0)
bntResetAllPlayers.TextSize = 14

bntSetJP.Name = "bntSetJP"
bntSetJP.Parent = MainFunction
bntSetJP.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntSetJP.BorderColor3 = Color3.new(0, 1, 1)
bntSetJP.BorderSizePixel = 0
bntSetJP.Position = UDim2.new(0, 10, 0, 410)
bntSetJP.Size = UDim2.new(0, 90, 0, 25)
bntSetJP.Font = Enum.Font.SourceSans
bntSetJP.Text = "Set JP"
bntSetJP.TextColor3 = Color3.new(0, 0, 0)
bntSetJP.TextSize = 14

bntSetWS.Name = "bntSetWS"
bntSetWS.Parent = MainFunction
bntSetWS.BackgroundColor3 = Color3.new(0.890196, 0.890196, 0.890196)
bntSetWS.BorderColor3 = Color3.new(0, 1, 1)
bntSetWS.BorderSizePixel = 0
bntSetWS.Position = UDim2.new(0, 10, 0, 375)
bntSetWS.Size = UDim2.new(0, 90, 0, 25)
bntSetWS.Font = Enum.Font.SourceSans
bntSetWS.Text = "Set WS"
bntSetWS.TextColor3 = Color3.new(0, 0, 0)
bntSetWS.TextSize = 14

txtWSValue.Name = "txtWSValue"
txtWSValue.Parent = MainFunction
txtWSValue.BackgroundColor3 = Color3.new(1, 1, 1)
txtWSValue.BorderSizePixel = 0
txtWSValue.Position = UDim2.new(0, 110, 0, 375)
txtWSValue.Size = UDim2.new(0, 45, 0, 25)
txtWSValue.Font = Enum.Font.SourceSans
txtWSValue.Text = "16"
txtWSValue.TextColor3 = Color3.new(0, 0, 0)
txtWSValue.TextSize = 14

txtJPValue.Name = "txtJPValue"
txtJPValue.Parent = MainFunction
txtJPValue.BackgroundColor3 = Color3.new(1, 1, 1)
txtJPValue.BorderSizePixel = 0
txtJPValue.Position = UDim2.new(0, 110, 0, 410)
txtJPValue.Size = UDim2.new(0, 45, 0, 25)
txtJPValue.Font = Enum.Font.SourceSans
txtJPValue.Text = "50"
txtJPValue.TextColor3 = Color3.new(0, 0, 0)
txtJPValue.TextSize = 14

lblDistance.Name = "lblDistance"
lblDistance.Parent = MainFunction
lblDistance.BackgroundColor3 = Color3.new(1, 1, 1)
lblDistance.BackgroundTransparency = 1
lblDistance.BorderSizePixel = 0
lblDistance.Position = UDim2.new(0, 270, 0, 375)
lblDistance.Size = UDim2.new(0, 75, 0, 25)
lblDistance.Font = Enum.Font.SourceSans
lblDistance.Text = "Distance :"
lblDistance.TextColor3 = Color3.new(0, 0, 0)
lblDistance.TextSize = 14

txtDisValue.Name = "txtDisValue"
txtDisValue.Parent = MainFunction
txtDisValue.BackgroundColor3 = Color3.new(1, 1, 1)
txtDisValue.BorderSizePixel = 0
txtDisValue.Position = UDim2.new(0, 345, 0, 375)
txtDisValue.Size = UDim2.new(0, 45, 0, 25)
txtDisValue.Font = Enum.Font.SourceSans
txtDisValue.Text = "5"
txtDisValue.TextColor3 = Color3.new(0, 0, 0)
txtDisValue.TextSize = 14

TeleportFunction.Name = "TeleportFunction"
TeleportFunction.Parent = MainGUI
TeleportFunction.BackgroundColor3 = Color3.new(1, 1, 1)
TeleportFunction.BackgroundTransparency = 1
TeleportFunction.BorderSizePixel = 0
TeleportFunction.Position = UDim2.new(0, 100, 0, 0)
TeleportFunction.Size = UDim2.new(0, 400, 0, 600)
TeleportFunction.Visible = false

bntAutoTPNoob.Name = "bntAutoTPNoob"
bntAutoTPNoob.Parent = TeleportFunction
bntAutoTPNoob.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPNoob.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPNoob.Position = UDim2.new(0, 10, 0, 70)
bntAutoTPNoob.Size = UDim2.new(0, 185, 0, 50)
bntAutoTPNoob.Font = Enum.Font.SourceSans
bntAutoTPNoob.Text = "Auto TP Noob"
bntAutoTPNoob.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPNoob.TextSize = 14

bntAutoTPMarine.Name = "bntAutoTPMarine"
bntAutoTPMarine.Parent = TeleportFunction
bntAutoTPMarine.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPMarine.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPMarine.Position = UDim2.new(0, 205, 0, 10)
bntAutoTPMarine.Size = UDim2.new(0, 185, 0, 50)
bntAutoTPMarine.Font = Enum.Font.SourceSans
bntAutoTPMarine.Text = "Auto TP Marine"
bntAutoTPMarine.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPMarine.TextSize = 14

bntAutoTPBuggy.Name = "bntAutoTPBuggy"
bntAutoTPBuggy.Parent = TeleportFunction
bntAutoTPBuggy.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPBuggy.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPBuggy.Position = UDim2.new(0, 205, 0, 70)
bntAutoTPBuggy.Size = UDim2.new(0, 185, 0, 50)
bntAutoTPBuggy.Font = Enum.Font.SourceSans
bntAutoTPBuggy.Text = "Auto TP Buggy"
bntAutoTPBuggy.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPBuggy.TextSize = 14

bntAutoTPLuffy.Name = "bntAutoTPLuffy"
bntAutoTPLuffy.Parent = TeleportFunction
bntAutoTPLuffy.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPLuffy.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPLuffy.Position = UDim2.new(0, 10, 0, 10)
bntAutoTPLuffy.Size = UDim2.new(0, 185, 0, 50)
bntAutoTPLuffy.Font = Enum.Font.SourceSans
bntAutoTPLuffy.Text = "Auto TP Luffy"
bntAutoTPLuffy.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPLuffy.TextSize = 14

bntTPLuffyIsland.Name = "bntTPLuffyIsland"
bntTPLuffyIsland.Parent = TeleportFunction
bntTPLuffyIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPLuffyIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPLuffyIsland.Position = UDim2.new(0, 10, 0, 210)
bntTPLuffyIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPLuffyIsland.Font = Enum.Font.SourceSans
bntTPLuffyIsland.Text = "TP Luffy's Island"
bntTPLuffyIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPLuffyIsland.TextSize = 14

bntTPMarineIsland.Name = "bntTPMarineIsland"
bntTPMarineIsland.Parent = TeleportFunction
bntTPMarineIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPMarineIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPMarineIsland.Position = UDim2.new(0, 10, 0, 270)
bntTPMarineIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPMarineIsland.Font = Enum.Font.SourceSans
bntTPMarineIsland.Text = "TP Marine's Island"
bntTPMarineIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPMarineIsland.TextSize = 14

bntTPNoobIsland.Name = "bntTPNoobIsland"
bntTPNoobIsland.Parent = TeleportFunction
bntTPNoobIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPNoobIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPNoobIsland.Position = UDim2.new(0, 205, 0, 210)
bntTPNoobIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPNoobIsland.Font = Enum.Font.SourceSans
bntTPNoobIsland.Text = "TP Noob's Island"
bntTPNoobIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPNoobIsland.TextSize = 14

bntTPBuggyIsland.Name = "bntTPBuggyIsland"
bntTPBuggyIsland.Parent = TeleportFunction
bntTPBuggyIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPBuggyIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPBuggyIsland.Position = UDim2.new(0, 205, 0, 270)
bntTPBuggyIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPBuggyIsland.Font = Enum.Font.SourceSans
bntTPBuggyIsland.Text = "TP Buggy's Island"
bntTPBuggyIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPBuggyIsland.TextSize = 14

bntTPThiefIsland.Name = "bntTPThiefIsland"
bntTPThiefIsland.Parent = TeleportFunction
bntTPThiefIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPThiefIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPThiefIsland.Position = UDim2.new(0, 10, 0, 330)
bntTPThiefIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPThiefIsland.Font = Enum.Font.SourceSans
bntTPThiefIsland.Text = "TP Thief's Island"
bntTPThiefIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPThiefIsland.TextSize = 14

bntTPSanjiIsland.Name = "bntTPSanjiIsland"
bntTPSanjiIsland.Parent = TeleportFunction
bntTPSanjiIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPSanjiIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPSanjiIsland.Position = UDim2.new(0, 205, 0, 330)
bntTPSanjiIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPSanjiIsland.Font = Enum.Font.SourceSans
bntTPSanjiIsland.Text = "TP Sanji's Island"
bntTPSanjiIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPSanjiIsland.TextSize = 14

bntTPSaboIsland.Name = "bntTPSaboIsland"
bntTPSaboIsland.Parent = TeleportFunction
bntTPSaboIsland.BackgroundColor3 = Color3.new(1, 1, 1)
bntTPSaboIsland.BorderColor3 = Color3.new(0.666667, 1, 0)
bntTPSaboIsland.Position = UDim2.new(0, 205, 0, 390)
bntTPSaboIsland.Size = UDim2.new(0, 185, 0, 50)
bntTPSaboIsland.Font = Enum.Font.SourceSans
bntTPSaboIsland.Text = "TP Sabo's Island"
bntTPSaboIsland.TextColor3 = Color3.new(0, 0, 0)
bntTPSaboIsland.TextSize = 14

bntAutoTPThief.Name = "bntAutoTPThief"
bntAutoTPThief.Parent = TeleportFunction
bntAutoTPThief.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoTPThief.BorderColor3 = Color3.new(0.666667, 1, 0)
bntAutoTPThief.Position = UDim2.new(0, 10, 0, 130)
bntAutoTPThief.Size = UDim2.new(0, 185, 0, 50)
bntAutoTPThief.Font = Enum.Font.SourceSans
bntAutoTPThief.Text = "Auto TP Thief"
bntAutoTPThief.TextColor3 = Color3.new(0, 0, 0)
bntAutoTPThief.TextSize = 14

OtherFunction.Name = "OtherFunction"
OtherFunction.Parent = MainGUI
OtherFunction.BackgroundColor3 = Color3.new(1, 1, 1)
OtherFunction.BackgroundTransparency = 1
OtherFunction.BorderSizePixel = 0
OtherFunction.Position = UDim2.new(0, 100, 0, 0)
OtherFunction.Size = UDim2.new(0, 400, 0, 450)
OtherFunction.Visible = false
-- Scripts:

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = String
		}
	)
end

function plrlist(thing)
	for _, v in pairs(plrs:GetPlayers()) do
		if string.find(string.lower(v.Name), string.lower(thing)) then
			return v
		end
	end
end

OCB.MouseButton1Down:connect(
	function()
		if MainGUI.Visible == false then
			OCB.Text = "Close"
			MainGUI.Visible = true
		else
			OCB.Text = "Open"
			MainGUI.Visible = false
		end
	end
)

MainMenu.MouseButton1Down:connect(
	function()
		if MainFunction.Visible == false then
			MainFunction.Visible = true
			TeleportFunction.Visible = false
		end
	end
)

TeleportMenu.MouseButton1Down:connect(
	function()
		if TeleportFunction.Visible == false then
			MainFunction.Visible = false
			TeleportFunction.Visible = true
		end
	end
)

bntAutoTool.MouseButton1Down:connect(
	function()
		enableAutoTool = not enableAutoTool

		if enableAutoTool == true then
			for i, v in pairs(lplr.Character:GetChildren()) do
				if tostring(v.Name) == tostring(txtNameTool.Text) then
					v.Parent = lplr.Backpack
				end
			end

			bntAutoTool.Text = "⏹"

			while enableAutoTool == true do
				wait()
				-- lplr.Character.Humanoid:EquipTool(lplr.Backpack["Ryusoken"])
				-- lplr.Character["Ryusoken"]:Activate()
				-- wait()
				-- lplr.Character.Humanoid:EquipTool(lplr.Backpack["Gryphon"])
				-- lplr.Character["Gryphon"]:Activate()
				-- wait()
				-- lplr.Character.Humanoid:EquipTool(lplr.Backpack["Dual Flintlock"])
				-- lplr.Character["Dual Flintlock"]:Activate()
				if wp:FindFirstChild(lplr.Name) then
					if lplr.Character:FindFirstChild("Torso") then
						lplr.Character.Torso:Remove()
					end
				end
				for i, v in pairs(lplr.Backpack:GetChildren()) do
					if tostring(v.Name) == tostring(txtNameTool.Text) then
						v.Parent = lplr
					end
				end
			end

			repeat
				wait()
			until wp:FindFirstChild(lplr.Name)

			wait(2)
			for i, v in pairs(lplr:GetChildren()) do
				if tostring(v.Name) == tostring(txtNameTool.Text) then
					v.Parent = lplr.Backpack
				end
			end
			wait()
			for i, v in pairs(lplr.Backpack:GetChildren()) do
				if tostring(v.Name) == tostring(txtNameTool.Text) then
					v.Parent = lplr.Character
				end
			end
		else
			amountTool = 1
			bntAutoTool.Text = "▶"
		end
	end
)

bntAutoStealItem.MouseButton1Down:connect(
	function()
		autoStealItem = not autoStealItem
		if autoStealItem == false then
			bntAutoStealItem.Text = "⏹"
		else
			bntAutoStealItem.Text = "▶"
		end
	end
)

bntTPPlayer.MouseButton1Down:connect(
	function()
		if tonumber(tostring(txtDisValue.Text)) == nil then
			txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
		else
			txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
			local dis = tonumber(tostring(txtDisValue.Text))
			local pos = lplr.Character.HumanoidRootPart.CFrame
			local charplayer = plrlist(txtNamePlayer.Text).Character
			if charplayer ~= nil then
				if tostring(plrlist(txtNamePlayer.Text).Name) ~= tostring(lplr.Name) then
					charplayer.Torso.Anchored = false
					charplayer.Torso.CanCollide = true
					charplayer.HumanoidRootPart.Anchored = false
					charplayer.HumanoidRootPart.CanCollide = false
					charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
					charplayer.HumanoidRootPart.Anchored = true
					if charplayer.Torso.Anchored == false then
						charplayer.Torso.Anchored = true
						charplayer.Torso.CanCollide = false
					end
				end
			end
		end
	end
)

bntAutoTPPlayer.MouseButton1Down:connect(
	function()
		enableAutoBring = not enableAutoBring

		if enableAutoBring == false then
			bntAutoTPPlayer.Text = "Auto"
			bntAutoTPPlayer.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPPlayer.Text = "Stop"
			bntAutoTPPlayer.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoBring == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoBring = false
				bntAutoTPPlayer.Text = "Auto"
				bntAutoTPPlayer.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				local dis = tonumber(tostring(txtDisValue.Text))
				local pos = lplr.Character.HumanoidRootPart.CFrame
				local charplayer = plrlist(txtNamePlayer.Text).Character
				if charplayer ~= nil then
					if tostring(plrlist(txtNamePlayer.Text).Name) ~= tostring(lplr.Name) then
						charplayer.Torso.Anchored = false
						charplayer.Torso.CanCollide = true
						charplayer.HumanoidRootPart.Anchored = false
						charplayer.HumanoidRootPart.CanCollide = false
						charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
						charplayer.HumanoidRootPart.Anchored = true
						if charplayer.Torso.Anchored == false then
							charplayer.Torso.Anchored = true
							charplayer.Torso.CanCollide = false
						end
					end
				end
			end
			wait(0.5)
		end
	end
)

function BringAllEvent()
	local dis = tonumber(tostring(txtDisValue.Text))
	local pos = lplr.Character.HumanoidRootPart.CFrame
	for _, v in pairs(plrs:GetPlayers()) do
		local charplayer = v.Character
		if charplayer ~= nil then
			if tostring(v.Name) ~= tostring(lplr.Name) then
				charplayer.Torso.Anchored = false
				charplayer.Torso.CanCollide = true
				charplayer.HumanoidRootPart.Anchored = false
				charplayer.HumanoidRootPart.CanCollide = false
				charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
				charplayer.HumanoidRootPart.Anchored = true
				if charplayer.Torso.Anchored == false then
					charplayer.Torso.Anchored = true
					charplayer.Torso.CanCollide = false
				end
			end
		end
	end
end

bntTPAllPlayer.MouseButton1Down:connect(
	function()
		if tonumber(tostring(txtDisValue.Text)) == nil then
			txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
		else
			txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
			BringAllEvent()
		end
	end
)

bntAutoTPAllPlayer.MouseButton1Down:connect(
	function()
		enableAutoBringAll = not enableAutoBringAll

		if enableAutoBringAll == false then
			bntAutoTPAllPlayer.Text = "Auto"
			bntAutoTPAllPlayer.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPAllPlayer.Text = "Stop"
			bntAutoTPAllPlayer.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoBringAll == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoBringAll = false
				bntAutoTPAllPlayer.Text = "Auto"
				bntAutoTPAllPlayer.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				BringAllEvent()
			end
			wait(1)
		end
	end
)

bntResetAllPlayers.MouseButton1Down:connect(
	function()
		local pos = lplr.Character.HumanoidRootPart.CFrame
		for _, v in pairs(plrs:GetPlayers()) do
			local humanoid = v.Character
			if v.Name ~= lplr.Name then
				humanoid.HumanoidRootPart.Anchored = false
				humanoid.Torso.Anchored = false
				humanoid.Torso.CanCollide = true
				humanoid.HumanoidRootPart.CanCollide = true
			end
		end
	end
)

function CheckChestEvent()
	local locationX = lplr.Character.HumanoidRootPart.CFrame.x
	local locationY = lplr.Character.HumanoidRootPart.CFrame.y
	local locationZ = lplr.Character.HumanoidRootPart.CFrame.z
	char = lplr.Character

	pos = char.HumanoidRootPart

	for _, v in pairs(folderChest:GetChildren()) do
		if tostring(v.ClassName) == "Part" then
			if v:FindFirstChildOfClass("UnionOperation") and v:FindFirstChildOfClass("BlockMesh") then
				local UO = v:FindFirstChildOfClass("UnionOperation")
				autoChestActive = true
				wait(0.5)
				pos.CFrame = UO.CFrame
			end
		end
	end
	pos.CFrame = CFrame.new(locationX, locationY + 5, locationZ)
	autoChestActive = false
end

bntCheckChest.MouseButton1Down:connect(
	function()
		CheckChestEvent()
	end
)

bntAutoCheckChest.MouseButton1Down:connect(
	function()
		enableAutoChest = not enableAutoChest

		if enableAutoChest == false then
			bntAutoCheckChest.Text = "Auto"
			bntAutoCheckChest.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoCheckChest.Text = "Stop"
			bntAutoCheckChest.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoChest == true do
			CheckChestEvent()
			wait(1)
		end
	end
)

bntTPNPCs.MouseButton1Down:connect(
	function()
		for _, l in pairs(folderNPCs:GetChildren()) do
			l:MoveTo(lplr.Character.Torso.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10)))
		end
	end
)

bntResetNPCs.MouseButton1Down:connect(
	function()
		for i, l in pairs(folderNPCs:GetChildren()) do
			local posNPCs = positionNPCs[i]
			posNPCs = Vector3.new(posNPCs.x, posNPCs.y, posNPCs.z - 0.5)
			l:MoveTo(posNPCs)
		end
	end
)

function TeleportMobsEvent()
	local dis = tonumber(tostring(txtDisValue.Text))
	local mobs = lplr.Character.HumanoidRootPart.CFrame
	if autoChestActive == false then
		for _, l in pairs(folderMobs:GetChildren()) do
			wait(0.05)
			l.HumanoidRootPart.Anchored = false
			l.Torso.Anchored = false
			l["Left Leg"].Anchored = false
			l["Left Arm"].Anchored = false
			l["Right Leg"].Anchored = false
			l["Right Arm"].Anchored = false
			l.Torso.Anchored = false
			l.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 0, -dis)
			l.HumanoidRootPart.CanCollide = false
			l.HumanoidRootPart.Anchored = true
			l.Torso.CanCollide = false
			l.Torso.Anchored = true
			l["Left Leg"].CanCollide = false
			l["Left Arm"].CanCollide = false
			l["Right Leg"].CanCollide = false
			l["Right Arm"].CanCollide = false
			l["Left Leg"].Anchored = true
			l["Left Arm"].Anchored = true
			l["Right Leg"].Anchored = true
			l["Right Arm"].Anchored = true
		end
	end
end

bntTPMobs.MouseButton1Down:connect(
	function()
		TeleportMobsEvent()
	end
)

bntAutoTPMobs.MouseButton1Down:connect(
	function()
		enableAutoMobs = not enableAutoMobs

		if enableAutoMobs == false then
			bntAutoTPMobs.Text = "Auto"
			bntAutoTPMobs.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPMobs.Text = "Stop"
			bntAutoTPMobs.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoMobs == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoMobs = false
				bntAutoTPMobs.Text = "Auto"
				bntAutoTPMobs.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				TeleportMobsEvent()
			end
			wait(0.5)
		end
	end
)

function AutoTPMobs(nameMobs)
	local dis = tonumber(tostring(txtDisValue.Text))
	local mobs = lplr.Character.HumanoidRootPart.CFrame
	if autoChestActive == false then
		for _, l in pairs(folderMobs:GetChildren()) do
			if string.find(l.Name, nameMobs) then
				l.HumanoidRootPart.Anchored = false
				l.Torso.Anchored = false
				l["Left Leg"].Anchored = false
				l["Left Arm"].Anchored = false
				l["Right Leg"].Anchored = false
				l["Right Arm"].Anchored = false
				l.Torso.Anchored = false
				l.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 0, -dis)
				l.HumanoidRootPart.CanCollide = false
				l.HumanoidRootPart.Anchored = true
				l.Torso.CanCollide = false
				l.Torso.Anchored = true
				l["Left Leg"].CanCollide = false
				l["Left Arm"].CanCollide = false
				l["Right Leg"].CanCollide = false
				l["Right Arm"].CanCollide = false
				l["Left Leg"].Anchored = true
				l["Left Arm"].Anchored = true
				l["Right Leg"].Anchored = true
				l["Right Arm"].Anchored = true
			end
		end
	end
end

function ResetTPMobs(nameMobs)
	local dis = tonumber(tostring(txtDisValue.Text))
	local mobs = lplr.Character.HumanoidRootPart.CFrame
	if autoChestActive == false then
		for _, l in pairs(folderMobs:GetChildren()) do
			if string.find(l.Name, nameMobs) then
				l.HumanoidRootPart.Anchored = false
				l.Torso.Anchored = false
				l["Left Leg"].Anchored = false
				l["Left Arm"].Anchored = false
				l["Right Leg"].Anchored = false
				l["Right Arm"].Anchored = false
				l.Torso.Anchored = false
				l.HumanoidRootPart.CanCollide = true
				l.Torso.CanCollide = true
			end
		end
	end
end

bntAutoTPLuffy.MouseButton1Down:connect(
	function()
		enableAutoLuffy = not enableAutoLuffy

		if enableAutoLuffy == false then
			bntAutoTPLuffy.Text = "Auto TP Luffy"
			bntAutoTPLuffy.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPLuffy.Text = "Stop"
			bntAutoTPLuffy.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoLuffy == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoLuffy = false
				bntAutoTPLuffy.Text = "Auto TP Luffy"
				bntAutoTPLuffy.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				AutoTPMobs("Luffy")
			end
			wait(0.5)
		end

		ResetTPMobs("Luffy")
	end
)

bntAutoTPNoob.MouseButton1Down:connect(
	function()
		enableAutoNoob = not enableAutoNoob

		if enableAutoNoob == false then
			bntAutoTPNoob.Text = "Auto TP Noob"
			bntAutoTPNoob.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPNoob.Text = "Stop"
			bntAutoTPNoob.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoNoob == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoNoob = false
				bntAutoTPNoob.Text = "Auto TP Noob"
				bntAutoTPNoob.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				AutoTPMobs("Noob")
			end
			wait(0.5)
		end

		ResetTPMobs("Noob")
	end
)

bntAutoTPMarine.MouseButton1Down:connect(
	function()
		enableAutoMarine = not enableAutoMarine

		if enableAutoMarine == false then
			bntAutoTPMarine.Text = "Auto TP Marine"
			bntAutoTPMarine.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPMarine.Text = "Stop"
			bntAutoTPMarine.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoMarine == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoMarine = false
				bntAutoTPMarine.Text = "Auto TP Marine"
				bntAutoTPMarine.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				AutoTPMobs("Marine")
			end
			wait(0.5)
		end
		ResetTPMobs("Marine")
	end
)

bntAutoTPBuggy.MouseButton1Down:connect(
	function()
		enableAutoBuggy = not enableAutoBuggy

		if enableAutoBuggy == false then
			bntAutoTPBuggy.Text = "Auto TP Buggy"
			bntAutoTPBuggy.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPBuggy.Text = "Stop"
			bntAutoTPBuggy.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoBuggy == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoBuggy = false
				bntAutoTPBuggy.Text = "Auto TP Buggy"
				bntAutoTPBuggy.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				AutoTPMobs("Buggy")
			end
			wait(0.5)
		end
		ResetTPMobs("Buggy")
	end
)

bntAutoTPThief.MouseButton1Down:connect(
	function()
		enableAutoThief = not enableAutoThief

		if enableAutoThief == false then
			bntAutoTPThief.Text = "Auto TP Thief"
			bntAutoTPThief.BorderColor3 = Color3.fromRGB(75, 151, 75)
		else
			bntAutoTPThief.Text = "Stop"
			bntAutoTPThief.BorderColor3 = Color3.fromRGB(196, 40, 28)
		end

		while enableAutoThief == true do
			if tonumber(tostring(txtDisValue.Text)) == nil then
				txtDisValue.BorderColor3 = Color3.fromRGB(196, 40, 28)
				enableAutoThief = false
				bntAutoTPThief.Text = "Auto TP Thief"
				bntAutoTPThief.BorderColor3 = Color3.fromRGB(75, 151, 75)
			else
				txtDisValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				AutoTPMobs("Thief")
			end
			wait(0.5)
		end
		ResetTPMobs("Thief")
	end
)

function teleIsland(x, y, z)
	lplr.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
end

bntTPLuffyIsland.MouseButton1Down:connect(
	function()
		teleIsland(-2356.8479, 20.880209, -3909.14209)
	end
)

bntTPNoobIsland.MouseButton1Down:connect(
	function()
		teleIsland(2977.60352, 4.20113182, 1599.50696)
	end
)

bntTPMarineIsland.MouseButton1Down:connect(
	function()
		teleIsland(3329.59473, 33.5079842, 6153.21924)
	end
)

bntTPBuggyIsland.MouseButton1Down:connect(
	function()
		teleIsland(-4243.22217, 5.53208089, 1218.2793)
	end
)

bntTPThiefIsland.MouseButton1Down:connect(
	function()
		teleIsland(-17.3448639, 4.3691361, 555.573303)
	end
)

bntTPSanjiIsland.MouseButton1Down:connect(
	function()
		teleIsland(-1388.3158, 39.6378441, 5067.11084)
	end
)

bntTPSaboIsland.MouseButton1Down:connect(
	function()
		teleIsland(2321.99634, 33.1988869, -3149.31689)
	end
)

bntSetWS.MouseButton1Down:connect(
	function()
		wsSpeed = tostring(txtWSValue.Text)
		lplr.Character.Humanoid.WalkSpeed = wsSpeed
	end
)

bntSetJP.MouseButton1Down:connect(
	function()
		jump = tostring(txtJPValue.Text)
		lplr.Character.Humanoid.JumpPower = jump
	end
)

function firstScript()
	for _, v in pairs(wp:GetChildren()) do
		if v:FindFirstChild("Bob") then
			folderNPCs = v
			for i, l in pairs(folderNPCs:GetChildren()) do
				if l:FindFirstChild("HumanoidRootPart") then
					l.Head.ClickDetector.MaxActivationDistance = 10000
					local bgui = Instance.new("BillboardGui", l.HumanoidRootPart)
					bgui.Name = ("EGUI")
					bgui.AlwaysOnTop = true
					bgui.ExtentsOffset = Vector3.new(0, 0, 0)
					bgui.Size = UDim2.new(1, 0, 1, 0)
					local nam = Instance.new("TextLabel", bgui)
					nam.Text = l.Name
					nam.BackgroundTransparency = 1
					nam.TextSize = 10
					nam.Font = ("Arial")
					nam.TextColor3 = Color3.fromRGB(245, 205, 48)
					nam.Size = UDim2.new(1, 0, 1, 0)

					positionNPCs[i] = l.Torso.Position
				elseif l:FindFirstChild("Head") then
					local bgui = Instance.new("BillboardGui", l.Head)
					bgui.Name = ("EGUI")
					bgui.AlwaysOnTop = true
					bgui.ExtentsOffset = Vector3.new(0, 0, 0)
					bgui.Size = UDim2.new(1, 0, 1, 0)
					local nam = Instance.new("TextLabel", bgui)
					nam.Text = l.Name
					nam.BackgroundTransparency = 1
					nam.TextSize = 10
					nam.Font = ("Arial")
					nam.TextColor3 = Color3.fromRGB(245, 205, 48)
					nam.Size = UDim2.new(1, 0, 1, 0)

					positionNPCs[i] = l.Head.Position
				end
			end
		end
	end

	for _, v in pairs(wp:GetChildren()) do
		if v:FindFirstChild("Thief(lvl:5)") then
			folderMobs = v
			print(v.ClassName)
		end
	end

	for _, v in pairs(wp:GetChildren()) do
		if tostring(v.ClassName) == "Folder" then
			if v:FindFirstChildOfClass("Part") then
				folderChest = v
				print(v.ClassName)
			else
				print("No Have Part")
			end
		end
	end

	if wp.Sea:FindFirstChild("Mesh") then
		wp.Sea.Mesh:Destroy()
	end

	-- if rs:FindFirstChild("Player_Event") then
	-- 	rs["Player_Event"]:Destroy()
	-- end

	-- rs.ChildAdded:connect(
	-- 	function(m)
	-- 		if tostring(m.Name) == "Player_Event" then
	-- 			rs["Player_Event"]:Destroy()
	-- 		end
	-- 	end
	-- )

	for _, v in pairs(lplr.Character:GetChildren()) do
		if v.ClassName == "Script" then
			v:ClearAllChildren()
		elseif v.ClassName == "LocalScript" then
			if v:FindFirstChild("Effects") then
				for _, l in pairs(v.Effects:GetChildren()) do
					l:Destroy()
				end
			end
		end
	end

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			for _, v in pairs(lplr.Character:GetChildren()) do
				if v.ClassName == "Script" then
					v:ClearAllChildren()
				elseif v.ClassName == "LocalScript" then
					if v:FindFirstChild("Effects") then
						for _, l in pairs(v.Effects:GetChildren()) do
							l:Destroy()
						end
					end
				end
			end
		end
	)

	wp.ChildAdded:connect(
		function(m)
			m.ChildAdded:connect(
				function(n)
					if tostring(n.Name) == "Handle" and autoStealItem == true then
						wait()
						n.CFrame = lplr.Character.HumanoidRootPart.CFrame
					end
				end
			)
			if m:FindFirstChild("Script") and m:FindFirstChild("Handle") and autoStealItem == true then --MoneyBag or HakiBook or Devil Fruit
				wait()
				m.Handle.CFrame = lplr.Character.HumanoidRootPart.CFrame
			end
		end
	)
end

firstScript()

-------------------------------------------------------------
--------------------------CMDS-------------------------------
function infoPlayer(namePlayer)
	if namePlayer == "me" then
		SendChat("-------------------------------------------------------------")
		SendChat("Name Player : " .. lplr.Name)
		for _, v in pairs(lplr.Stats:GetChildren()) do
			SendChat(v.Name .. ": " .. v.Value)
		end
	else
		if plrlist(namePlayer) ~= nil then
			SendChat("-------------------------------------------------------------")
			SendChat("Name Player : " .. plrlist(namePlayer).Name)
			for _, v in pairs(plrlist(namePlayer).Stats:GetChildren()) do
				SendChat(v.Name .. ": " .. v.Value)
			end
		end
	end
end

function backpackPlayer(namePlayer)
	if namePlayer == "me" then
		SendChat("-------------------------------------------------------------")
		SendChat("Name Player : " .. lplr.Name)
		for _, v in pairs(lplr.Backpack:GetChildren()) do
			SendChat(v.Name)
		end
	else
		if plrlist(namePlayer) ~= nil then
			SendChat("-------------------------------------------------------------")
			SendChat("Name Player : " .. plrlist(namePlayer).Name)
			for _, v in pairs(plrlist(namePlayer).Backpack:GetChildren()) do
				SendChat(v.Name)
			end
		end
	end
end

function checkChestGame()
	local countChest = 0
	for _, v in pairs(folderChest:GetChildren()) do
		if tostring(v.ClassName) == "Part" then
			if v:FindFirstChildOfClass("UnionOperation") and v:FindFirstChildOfClass("BlockMesh") then
				local UO = v:FindFirstChildOfClass("UnionOperation")
				countChest = countChest + 1
				if not UO:FindFirstChild("EGUI") then
					local bgui = Instance.new("BillboardGui", UO)
					bgui.Name = ("EGUI")
					bgui.AlwaysOnTop = true
					bgui.ExtentsOffset = Vector3.new(0, 0, 0)
					bgui.Size = UDim2.new(1, 0, 1, 0)
					local nam = Instance.new("TextLabel", bgui)
					nam.Text = "Chest Here"
					nam.BackgroundTransparency = 1
					nam.TextSize = 10
					nam.Font = ("Arial")
					nam.TextColor3 = Color3.fromRGB(245, 205, 48)
					nam.Size = UDim2.new(1, 0, 1, 0)
				end
			end
		end
	end
	SendChat("-------------------------------------------------------------")
	SendChat("Have " .. countChest .. " chest")
	SendChat("-------------------------------------------------------------")
	countChest = 0
end

local function executeChat(code)
	if string.lower(string.sub(code, 1, 2)) == "/e" then
		local split = {}

		for part in code:gmatch("%S+") do
			table.insert(split, part)
		end

		table.remove(split, 1)

		local command = string.lower(string.sub(split[1], 1))

		local first = split[2]

		if string.find("info", command) then
			infoPlayer(first)
		elseif string.find("backpack", command) then
			backpackPlayer(first)
		elseif string.find("checkchest", command) then
			checkChestGame()
		end
	end
end
lplr.Chatted:Connect(executeChat)
-------------------------------------------------------------
----------------------------ESP------------------------------

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

function checkESP(parent)
	local numEGUI = 0
	for _, v in pairs(parent.Character.Head:GetChildren()) do
		if v.Name == "EGUI" then
			numEGUI = numEGUI + 1
		end
	end

	if numEGUI < 7 then
		for _, v in pairs(parent.Character.Head:GetChildren()) do
			if v.Name == "EGUI" then
				v:Destroy()
			end
		end
		createESP(parent.Character)
	end
end

function createESP(parent)
	local bgui = Instance.new("BillboardGui", parent.Head)
	bgui.Name = ("EGUI")
	bgui.AlwaysOnTop = true
	bgui.ExtentsOffset = Vector3.new(0, 3, 0)
	bgui.Size = UDim2.new(0, 200, 0, 50)
	local nam = Instance.new("TextLabel", bgui)
	nam.Text = parent.Name
	nam.BackgroundTransparency = 1
	nam.TextSize = 14
	nam.Font = ("Arial")
	nam.TextColor3 = Color3.fromRGB(196, 40, 28)
	nam.Size = UDim2.new(0, 200, 0, 50)
	for _, p in pairs(parent:GetChildren()) do
		if p.Name == ("Head") then
			for _, f in pairs(_G.faces) do
				local m = Instance.new("SurfaceGui", p)
				m.Name = ("EGUI")
				m.Face = f
				m.Active = true
				m.AlwaysOnTop = true
				local mf = Instance.new("Frame", m)
				mf.Size = UDim2.new(1, 0, 1, 0)
				mf.BorderSizePixel = 0
				mf.BackgroundTransparency = 0.5
				mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
			end
		end
	end
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		if tostring(o.Name) ~= tostring(lplr.Name) then
			o.CharacterAdded:Connect(
				function(characterModel)
					if characterModel:WaitForChild("Head") then
						createESP(characterModel)
					end
				end
			)
		end
	end

	plrs.PlayerAdded:Connect(
		function(newPlayer)
			newPlayer.CharacterAdded:Connect(
				function(characterModel)
					if characterModel:WaitForChild("Head") then
						createESP(characterModel)
					end
				end
			)
		end
	)
end

enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if tostring(o.Name) ~= tostring(lplr.Name) then
			if o.Character ~= nil and o.Character:FindFirstChild("Head") then
				checkESP(o)
			end
		end
	end
end
espFirst()

------------------------------------------------------------
------------------------------------------------------------

function statsPlayerWs()
	lplr.Character.Humanoid.WalkSpeed = wsSpeed

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character.Humanoid.WalkSpeed ~= wsSpeed then
				lplr.Character.Humanoid.WalkSpeed = wsSpeed
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character.Humanoid.WalkSpeed = wsSpeed
			lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if lplr.Character.Humanoid.WalkSpeed ~= wsSpeed then
						lplr.Character.Humanoid.WalkSpeed = wsSpeed
					end
				end
			)
		end
	)
end

statsPlayerWs()

function changeWS(typeWS)
	if typeWS == 0 then
		wsSpeed = wsSpeed + 5
		lplr.Character.Humanoid.WalkSpeed = wsSpeed
	elseif typeWS == 1 then
		if wsSpeed >= 0 then
			wsSpeed = wsSpeed - 5
			lplr.Character.Humanoid.WalkSpeed = wsSpeed
		end
		if wsSpeed < 0 then
			wsSpeed = 0
			lplr.Character.Humanoid.WalkSpeed = wsSpeed
		end
	end
end

function statsPlayerJp()
	lplr.Character.Humanoid.JumpPower = jump
	lplr.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(
		function()
			if lplr.Character.Humanoid.JumpPower ~= jump then
				lplr.Character.Humanoid.JumpPower = jump
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character.Humanoid.JumpPower = jump
			lplr.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):connect(
				function()
					if lplr.Character.Humanoid.JumpPower ~= jump then
						lplr.Character.Humanoid.JumpPower = jump
					end
				end
			)
		end
	)
end

statsPlayerJp()

function infJump()
	uis.JumpRequest:connect(
		function()
			if lplr.Character ~= nil then
				lplr.Character.Humanoid.JumpPower = jump
				lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end
	)
end

infJump()

function changeJP(typeJP)
	if typeJP == 0 then
		jump = jump + 5
		lplr.Character.Humanoid.JumpPower = jump
	elseif typeJP == 1 then
		if jump >= 50 then
			jump = jump - 5
			lplr.Character.Humanoid.JumpPower = jump
		end
		if jump < 50 then
			jump = 50
			lplr.Character.Humanoid.JumpPower = jump
		end
	end
end

mouse.Button2Down:Connect(
	function()
		for i, v in pairs(lplr.Backpack:GetChildren()) do
			if v.Name == tostring(txtNameTool.Text) then
				v.Parent = lplr.Character
			end
		end
	end
)

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "f" then
			farm = not farm
			local nameWeapon = tostring(txtNameTool.Text)
			while farm do
				wait(0.1)
				for _, v in pairs(lplr.Character:GetChildren()) do
					if tostring(v.Name) == nameWeapon then
						v:Activate()
					end
				end
			end
		end

		if keyDown == "p" then
			noclip = not noclip

			while noclip do
				wait()
				lplr.Character.Humanoid:ChangeState(11)
			end
		end

		if keyDown == "k" then
			changeWS(0)
			SendChat("[OUTPUT] Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "l" then
			changeWS(1)
			SendChat("[OUTPUT] Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "[" then
			changeJP(0)
			SendChat("[OUTPUT] Jump Power :" .. lplr.Character.Humanoid.JumpPower)
		end

		if keyDown == "]" then
			changeJP(1)
			SendChat("[OUTPUT] Jump Power :" .. lplr.Character.Humanoid.JumpPower)
		end

		if keyDown == "m" then
			for _, o in pairs(plrs:GetPlayers()) do
				if tostring(o.Name) ~= tostring(lplr.Name) then
					if o.Character:FindFirstChild("Head") then
						checkESP(o)
					end
				end
			end
		end
	end
)
