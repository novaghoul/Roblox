local SwordKiller = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Bar = Instance.new("Frame")
local LoadBar = Instance.new("Frame")
local PlayBTN = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local CommandsFrame = Instance.new("Frame")
local Header = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ExitButton = Instance.new("TextButton")
local CreditsButton = Instance.new("TextButton")
local ButtonsFrame = Instance.new("Frame")
local Floor1 = Instance.new("TextButton")
local Floor2 = Instance.new("TextButton")
local Floor3 = Instance.new("TextButton")
local Floor5 = Instance.new("TextButton")
local Floor4 = Instance.new("TextButton")
local Floor7 = Instance.new("TextButton")
local Floor8 = Instance.new("TextButton")
local Floor9 = Instance.new("TextButton")
local f1IC = Instance.new("TextButton")
local Autofarm = Instance.new("TextButton")
local f3IC = Instance.new("TextButton")
local InfStam = Instance.new("TextButton")
local Hitbox = Instance.new("TextButton")
local TpRandomMob = Instance.new("TextButton")
local MaxSkills = Instance.new("TextButton")
local FreezeMobs = Instance.new("TextButton")
local TpItemCrystal = Instance.new("TextButton")
local ParameterFrame = Instance.new("Frame")
local CommandsLabel = Instance.new("TextLabel")
local CommandsLabel_2 = Instance.new("TextLabel")
local CreditsFrame = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
local LeaveCredits = Instance.new("TextButton")
local OpenFrame = Instance.new("Frame")
local Open = Instance.new("TextButton")

SwordKiller.Name = "SwordKiller"
SwordKiller.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Background.Name = "Background"
Background.Parent = SwordKiller
Background.BackgroundColor3 = Color3.new(0.141176, 0.584314, 1)
Background.BorderColor3 = Color3.new(0.141176, 0.584314, 1)
Background.BorderSizePixel = 100
Background.Size = UDim2.new(1, 0, 1, 0)

Bar.Name = "Bar"
Bar.Parent = Background
Bar.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
Bar.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
Bar.BorderSizePixel = 5
Bar.Position = UDim2.new(0.249179661, 0, 0.400000006, 0)
Bar.Size = UDim2.new(0.5, 0, 0.100000001, 0)
Bar.ZIndex = 2

LoadBar.Name = "LoadBar"
LoadBar.Parent = Bar
LoadBar.BackgroundColor3 = Color3.new(0.0823529, 0.34902, 0.6)
LoadBar.BorderColor3 = Color3.new(0.207843, 0.207843, 0.207843)
LoadBar.BorderSizePixel = 0
LoadBar.Size = UDim2.new(0, 0, 1, 0)
LoadBar.ZIndex = 3

PlayBTN.Name = "PlayBTN"
PlayBTN.Parent = Background
PlayBTN.BackgroundColor3 = Color3.new(1, 1, 1)
PlayBTN.BackgroundTransparency = 1
PlayBTN.BorderSizePixel = 0
PlayBTN.Position = UDim2.new(0.399138629, 0, 0.400000006, 0)
PlayBTN.Size = UDim2.new(0.200000003, 0, 0.100000001, 0)
PlayBTN.Visible = false
PlayBTN.Image = "rbxassetid://2379065494"

TextLabel.Parent = Background
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.312802136, 0, -0.0202793647, 0)
TextLabel.Rotation = -7
TextLabel.Size = UDim2.new(0.372000009, 0, 0.400999993, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "  Take a Step Forward"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 65
TextLabel.TextStrokeTransparency = 0
TextLabel.TextWrapped = true

TextLabel_2.Parent = Background
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.186447233, 0, -0.0801733583, 0)
TextLabel_2.Rotation = -7
TextLabel_2.Size = UDim2.new(0.372000009, 0, 0.400999993, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "SwordKiller"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 65
TextLabel_2.TextStrokeTransparency = 0
TextLabel_2.TextWrapped = true

ImageLabel.Parent = Background
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.302136362, 0, 0.17352125, 0)
ImageLabel.Size = UDim2.new(0, 124, 0, 121)
ImageLabel.Image = "rbxassetid://68367740"

CommandsFrame.Name = "CommandsFrame"
CommandsFrame.Parent = SwordKiller
CommandsFrame.Active = true
CommandsFrame.BackgroundColor3 = Color3.new(0.235294, 0.231373, 0.235294)
CommandsFrame.BorderSizePixel = 0
CommandsFrame.Position = UDim2.new(0.296034664, 0, 0.143401414, 0)
CommandsFrame.Selectable = true
CommandsFrame.Size = UDim2.new(0.431917995, 0, 0.657237947, 0)
CommandsFrame.Visible = false
CommandsFrame.Draggable = true

Header.Name = "Header"
Header.Parent = CommandsFrame
Header.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Header.BorderSizePixel = 0
Header.Size = UDim2.new(1, 0, 0.162025318, 0)

Title.Name = "Title"
Title.Parent = Header
Title.BackgroundColor3 = Color3.new(0.235294, 0.231373, 0.235294)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.SourceSansLight
Title.Text = "SwordKiller"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.TextSize = 32
Title.TextWrapped = true

ExitButton.Name = "ExitButton"
ExitButton.Parent = Header
ExitButton.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
ExitButton.BorderSizePixel = 0
ExitButton.Position = UDim2.new(0.829710126, 0, 0, 0)
ExitButton.Size = UDim2.new(0.170289859, 0, 0.627451003, 0)
ExitButton.Font = Enum.Font.SourceSansLight
ExitButton.Text = "Exit"
ExitButton.TextColor3 = Color3.new(1, 1, 1)
ExitButton.TextScaled = true
ExitButton.TextSize = 16
ExitButton.TextWrapped = true

CreditsButton.Name = "CreditsButton"
CreditsButton.Parent = Header
CreditsButton.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
CreditsButton.BorderSizePixel = 0
CreditsButton.Position = UDim2.new(-0.000205457211, 0, 0, 0)
CreditsButton.Size = UDim2.new(0.170289859, 0, 0.627451003, 0)
CreditsButton.Font = Enum.Font.SourceSansLight
CreditsButton.Text = "Credits"
CreditsButton.TextColor3 = Color3.new(1, 1, 1)
CreditsButton.TextScaled = true
CreditsButton.TextSize = 16
CreditsButton.TextWrapped = true

ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Parent = CommandsFrame
ButtonsFrame.Active = true
ButtonsFrame.BackgroundColor3 = Color3.new(0.27451, 0.552941, 0.823529)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.BorderColor3 = Color3.new(0.333333, 0.666667, 1)
ButtonsFrame.BorderSizePixel = 0
ButtonsFrame.ClipsDescendants = true
ButtonsFrame.Position = UDim2.new(0.038869258, 0, 0.255696207, 0)
ButtonsFrame.Size = UDim2.new(0.924028277, 0, 0.559493661, 0)

Floor1.Name = "Floor1"
Floor1.Parent = ButtonsFrame
Floor1.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor1.BorderSizePixel = 0
Floor1.Position = UDim2.new(0.0756624639, 0, 0.0483302586, 0)
Floor1.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor1.Font = Enum.Font.SourceSansLight
Floor1.Text = "Floor1"
Floor1.TextColor3 = Color3.new(1, 1, 1)
Floor1.TextScaled = true
Floor1.TextSize = 14
Floor1.TextWrapped = true

Floor2.Name = "Floor2"
Floor2.Parent = ButtonsFrame
Floor2.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor2.BorderSizePixel = 0
Floor2.Position = UDim2.new(0.528665066, 0, 0.0483302474, 0)
Floor2.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor2.Font = Enum.Font.SourceSansLight
Floor2.Text = "Floor2"
Floor2.TextColor3 = Color3.new(1, 1, 1)
Floor2.TextScaled = true
Floor2.TextSize = 14
Floor2.TextWrapped = true

Floor3.Name = "Floor3"
Floor3.Parent = ButtonsFrame
Floor3.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor3.BorderSizePixel = 0
Floor3.Position = UDim2.new(0.75320816, 0, 0.0483302474, 0)
Floor3.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor3.Font = Enum.Font.SourceSansLight
Floor3.Text = "Floor3"
Floor3.TextColor3 = Color3.new(1, 1, 1)
Floor3.TextScaled = true
Floor3.TextSize = 14
Floor3.TextWrapped = true

Floor5.Name = "Floor5"
Floor5.Parent = ButtonsFrame
Floor5.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor5.BorderSizePixel = 0
Floor5.Position = UDim2.new(0.528720617, 0, 0.201511353, 0)
Floor5.Size = UDim2.new(0.198433414, 0, 0.130982369, 0)
Floor5.Font = Enum.Font.SourceSansLight
Floor5.Text = "Floor5"
Floor5.TextColor3 = Color3.new(1, 1, 1)
Floor5.TextScaled = true
Floor5.TextSize = 14
Floor5.TextWrapped = true

Floor4.Name = "Floor4"
Floor4.Parent = ButtonsFrame
Floor4.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor4.BorderSizePixel = 0
Floor4.Position = UDim2.new(0.298900038, 0, 0.201982662, 0)
Floor4.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor4.Font = Enum.Font.SourceSansLight
Floor4.Text = "Floor4"
Floor4.TextColor3 = Color3.new(1, 1, 1)
Floor4.TextScaled = true
Floor4.TextSize = 14
Floor4.TextWrapped = true

Floor7.Name = "Floor7"
Floor7.Parent = ButtonsFrame
Floor7.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor7.BorderSizePixel = 0
Floor7.Position = UDim2.new(0.753208101, 0, 0.201982677, 0)
Floor7.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor7.Font = Enum.Font.SourceSansLight
Floor7.Text = "Floor7"
Floor7.TextColor3 = Color3.new(1, 1, 1)
Floor7.TextScaled = true
Floor7.TextSize = 14
Floor7.TextWrapped = true

Floor8.Name = "Floor8"
Floor8.Parent = ButtonsFrame
Floor8.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor8.BorderSizePixel = 0
Floor8.Position = UDim2.new(0.0756624341, 0, 0.353116155, 0)
Floor8.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor8.Font = Enum.Font.SourceSansLight
Floor8.Text = "Floor8"
Floor8.TextColor3 = Color3.new(1, 1, 1)
Floor8.TextScaled = true
Floor8.TextSize = 14
Floor8.TextWrapped = true

Floor9.Name = "Floor9"
Floor9.Parent = ButtonsFrame
Floor9.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Floor9.BorderSizePixel = 0
Floor9.Position = UDim2.new(0.298900068, 0, 0.353116155, 0)
Floor9.Size = UDim2.new(0.198113203, 0, 0.131221727, 0)
Floor9.Font = Enum.Font.SourceSansLight
Floor9.Text = "Floor9"
Floor9.TextColor3 = Color3.new(1, 1, 1)
Floor9.TextScaled = true
Floor9.TextSize = 14
Floor9.TextWrapped = true

f1IC.Name = "f1IC"
f1IC.Parent = ButtonsFrame
f1IC.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
f1IC.BorderSizePixel = 0
f1IC.Position = UDim2.new(0.29895559, 0, 0.0478590131, 0)
f1IC.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
f1IC.Font = Enum.Font.SourceSansLight
f1IC.Text = "Floor1 Item Crystal"
f1IC.TextColor3 = Color3.new(1, 1, 1)
f1IC.TextScaled = true
f1IC.TextSize = 14
f1IC.TextWrapped = true

Autofarm.Name = "Autofarm"
Autofarm.Parent = ButtonsFrame
Autofarm.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Autofarm.BorderSizePixel = 0
Autofarm.Position = UDim2.new(0.0757180154, 0, 0.690176368, 0)
Autofarm.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
Autofarm.Font = Enum.Font.SourceSansLight
Autofarm.Text = 'AutoFarm - "K"'
Autofarm.TextColor3 = Color3.new(1, 1, 1)
Autofarm.TextScaled = true
Autofarm.TextSize = 14
Autofarm.TextWrapped = true

f3IC.Name = "f3IC"
f3IC.Parent = ButtonsFrame
f3IC.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
f3IC.BorderSizePixel = 0
f3IC.Position = UDim2.new(0.0757180303, 0, 0.201511338, 0)
f3IC.Size = UDim2.new(0.198433414, 0, 0.130982369, 0)
f3IC.Font = Enum.Font.SourceSansLight
f3IC.Text = "Floor3 Item Crystal"
f3IC.TextColor3 = Color3.new(1, 1, 1)
f3IC.TextScaled = true
f3IC.TextSize = 14
f3IC.TextWrapped = true

InfStam.Name = "InfStam"
InfStam.Parent = ButtonsFrame
InfStam.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
InfStam.BorderSizePixel = 0
InfStam.Position = UDim2.new(0.29895559, 0, 0.690176368, 0)
InfStam.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
InfStam.Font = Enum.Font.SourceSansLight
InfStam.Text = "Inf. Stamina"
InfStam.TextColor3 = Color3.new(1, 1, 1)
InfStam.TextScaled = true
InfStam.TextSize = 14
InfStam.TextWrapped = true

Hitbox.Name = "Hitbox"
Hitbox.Parent = ButtonsFrame
Hitbox.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Hitbox.BorderSizePixel = 0
Hitbox.Position = UDim2.new(0.528720617, 0, 0.690176368, 0)
Hitbox.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
Hitbox.Font = Enum.Font.SourceSansLight
Hitbox.Text = "Hitbox"
Hitbox.TextColor3 = Color3.new(1, 1, 1)
Hitbox.TextScaled = true
Hitbox.TextSize = 14
Hitbox.TextWrapped = true

TpRandomMob.Name = "TpRandomMob"
TpRandomMob.Parent = ButtonsFrame
TpRandomMob.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
TpRandomMob.BorderSizePixel = 0
TpRandomMob.Position = UDim2.new(0.753263712, 0, 0.690176368, 0)
TpRandomMob.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
TpRandomMob.Font = Enum.Font.SourceSansLight
TpRandomMob.Text = "Tp Random Mob"
TpRandomMob.TextColor3 = Color3.new(1, 1, 1)
TpRandomMob.TextScaled = true
TpRandomMob.TextSize = 14
TpRandomMob.TextWrapped = true

MaxSkills.Name = "MaxSkills"
MaxSkills.Parent = ButtonsFrame
MaxSkills.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
MaxSkills.BorderSizePixel = 0
MaxSkills.Position = UDim2.new(0.298955619, 0, 0.848866522, 0)
MaxSkills.Size = UDim2.new(0.428198427, 0, 0.136020154, 0)
MaxSkills.Font = Enum.Font.SourceSansLight
MaxSkills.Text = "Max Skills"
MaxSkills.TextColor3 = Color3.new(1, 1, 1)
MaxSkills.TextScaled = true
MaxSkills.TextSize = 14
MaxSkills.TextWrapped = true

FreezeMobs.Name = "FreezeMobs"
FreezeMobs.Parent = ButtonsFrame
FreezeMobs.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
FreezeMobs.BorderSizePixel = 0
FreezeMobs.Position = UDim2.new(0.753263712, 0, 0.848866522, 0)
FreezeMobs.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
FreezeMobs.Font = Enum.Font.SourceSansLight
FreezeMobs.Text = "Freeze Mobs"
FreezeMobs.TextColor3 = Color3.new(1, 1, 1)
FreezeMobs.TextScaled = true
FreezeMobs.TextSize = 14
FreezeMobs.TextWrapped = true

TpItemCrystal.Name = "TpItemCrystal"
TpItemCrystal.Parent = ButtonsFrame
TpItemCrystal.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
TpItemCrystal.BorderSizePixel = 0
TpItemCrystal.Position = UDim2.new(0.0757180154, 0, 0.848866522, 0)
TpItemCrystal.Size = UDim2.new(0.198433414, 0, 0.136020154, 0)
TpItemCrystal.Font = Enum.Font.SourceSansLight
TpItemCrystal.Text = "Tp ItemCrystal"
TpItemCrystal.TextColor3 = Color3.new(1, 1, 1)
TpItemCrystal.TextScaled = true
TpItemCrystal.TextSize = 14
TpItemCrystal.TextWrapped = true

ParameterFrame.Name = "ParameterFrame"
ParameterFrame.Parent = CommandsFrame
ParameterFrame.BackgroundColor3 = Color3.new(0.619608, 0.611765, 0.619608)
ParameterFrame.BackgroundTransparency = 1
ParameterFrame.BorderColor3 = Color3.new(0, 0, 0)
ParameterFrame.BorderSizePixel = 0
ParameterFrame.Position = UDim2.new(0.162897527, 0, 0.814999998, 0)
ParameterFrame.Size = UDim2.new(0.658536613, 0, 0.141772151, 0)

CommandsLabel.Name = "CommandsLabel"
CommandsLabel.Parent = ParameterFrame
CommandsLabel.BackgroundColor3 = Color3.new(0.235294, 0.231373, 0.235294)
CommandsLabel.BorderColor3 = Color3.new(0, 0, 0)
CommandsLabel.BorderSizePixel = 0
CommandsLabel.Position = UDim2.new(8.26548785e-06, 0, -4.42450476, 0)
CommandsLabel.Size = UDim2.new(1, 0, 0.5, 0)
CommandsLabel.Font = Enum.Font.SourceSans
CommandsLabel.Text = "Teleports"
CommandsLabel.TextColor3 = Color3.new(1, 1, 1)
CommandsLabel.TextScaled = true
CommandsLabel.TextSize = 18
CommandsLabel.TextWrapped = true

CommandsLabel_2.Name = "CommandsLabel"
CommandsLabel_2.Parent = ParameterFrame
CommandsLabel_2.BackgroundColor3 = Color3.new(0.235294, 0.231373, 0.235294)
CommandsLabel_2.BorderColor3 = Color3.new(0, 0, 0)
CommandsLabel_2.BorderSizePixel = 0
CommandsLabel_2.Position = UDim2.new(8.26641917e-06, 0, -1.83044553, 0)
CommandsLabel_2.Size = UDim2.new(1, 0, 0.5, 0)
CommandsLabel_2.Font = Enum.Font.SourceSans
CommandsLabel_2.Text = "Scripts"
CommandsLabel_2.TextColor3 = Color3.new(1, 1, 1)
CommandsLabel_2.TextScaled = true
CommandsLabel_2.TextSize = 18
CommandsLabel_2.TextWrapped = true

CreditsFrame.Name = "CreditsFrame"
CreditsFrame.Parent = CommandsFrame
CreditsFrame.BackgroundColor3 = Color3.new(1, 1, 1)
CreditsFrame.BackgroundTransparency = 1
CreditsFrame.Position = UDim2.new(0.0144752711, 0, 0.181690142, 0)
CreditsFrame.Size = UDim2.new(0, 818, 0, 443)
CreditsFrame.Visible = false

TextLabel_3.Parent = CreditsFrame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(-0.0146699268, 0, 0.821047306, 0)
TextLabel_3.Size = UDim2.new(0, 829, 0, 60)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "AFK FARM - ClassyInori"
TextLabel_3.TextColor3 = Color3.new(1, 1, 1)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = CreditsFrame
TextLabel_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.Position = UDim2.new(-0.0146699268, 0, 0.68687886, 0)
TextLabel_4.Size = UDim2.new(0, 829, 0, 60)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "Teleports - Template"
TextLabel_4.TextColor3 = Color3.new(1, 1, 1)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14
TextLabel_4.TextWrapped = true

TextLabel_5.Parent = CreditsFrame
TextLabel_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.Position = UDim2.new(-0.0146699268, 0, 0.550453067, 0)
TextLabel_5.Size = UDim2.new(0, 829, 0, 60)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Random Mob - Lilith#7498, DenDen#7963"
TextLabel_5.TextColor3 = Color3.new(1, 1, 1)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14
TextLabel_5.TextWrapped = true

TextLabel_6.Parent = CreditsFrame
TextLabel_6.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_6.BackgroundTransparency = 1
TextLabel_6.Position = UDim2.new(-0.0146699268, 0, 0.416284621, 0)
TextLabel_6.Size = UDim2.new(0, 829, 0, 60)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "Tp Item Crystal - Lilith#7498, DenDen#7963"
TextLabel_6.TextColor3 = Color3.new(1, 1, 1)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14
TextLabel_6.TextWrapped = true

TextLabel_7.Parent = CreditsFrame
TextLabel_7.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_7.BackgroundTransparency = 1
TextLabel_7.Position = UDim2.new(-0.0146699268, 0, 0.279858828, 0)
TextLabel_7.Size = UDim2.new(0, 829, 0, 60)
TextLabel_7.Font = Enum.Font.SourceSans
TextLabel_7.Text = "MaxSkills - Lilith#7498, DenDen#7963"
TextLabel_7.TextColor3 = Color3.new(1, 1, 1)
TextLabel_7.TextScaled = true
TextLabel_7.TextSize = 14
TextLabel_7.TextWrapped = true

TextLabel_8.Parent = CreditsFrame
TextLabel_8.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_8.BackgroundTransparency = 1
TextLabel_8.Position = UDim2.new(-0.0146699259, 0, 0.143433064, 0)
TextLabel_8.Size = UDim2.new(0, 829, 0, 60)
TextLabel_8.Font = Enum.Font.SourceSans
TextLabel_8.Text = "HitBox - Lilith#7498, DenDen#7963"
TextLabel_8.TextColor3 = Color3.new(1, 1, 1)
TextLabel_8.TextScaled = true
TextLabel_8.TextSize = 14
TextLabel_8.TextWrapped = true

TextLabel_9.Parent = CreditsFrame
TextLabel_9.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_9.BackgroundTransparency = 1
TextLabel_9.Position = UDim2.new(0.232729524, 0, -0.0321590826, 0)
TextLabel_9.Size = UDim2.new(0, 405, 0, 60)
TextLabel_9.Font = Enum.Font.SourceSans
TextLabel_9.Text = "Credits"
TextLabel_9.TextColor3 = Color3.new(1, 1, 1)
TextLabel_9.TextScaled = true
TextLabel_9.TextSize = 14
TextLabel_9.TextWrapped = true

LeaveCredits.Name = "LeaveCredits"
LeaveCredits.Parent = CreditsFrame
LeaveCredits.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
LeaveCredits.BorderSizePixel = 0
LeaveCredits.Position = UDim2.new(0.00122249394, 0, 1.01128674, 0)
LeaveCredits.Size = UDim2.new(0.982885063, 0, 0.268623024, 0)
LeaveCredits.Font = Enum.Font.SourceSansLight
LeaveCredits.Text = "Exit Credits"
LeaveCredits.TextColor3 = Color3.new(1, 1, 1)
LeaveCredits.TextScaled = true
LeaveCredits.TextSize = 14
LeaveCredits.TextWrapped = true

OpenFrame.Name = "OpenFrame"
OpenFrame.Parent = SwordKiller
OpenFrame.BackgroundColor3 = Color3.new(1, 1, 1)
OpenFrame.Position = UDim2.new(0.807912588, 0, 0.881481469, 0)
OpenFrame.Size = UDim2.new(0, 369, 0, 128)
OpenFrame.Visible = false

Open.Name = "Open"
Open.Parent = OpenFrame
Open.BackgroundColor3 = Color3.new(0.333333, 0.666667, 1)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(-2.98023224e-08, 0, 0, 0)
Open.Size = UDim2.new(1, 0, 1, 0)
Open.Font = Enum.Font.SourceSansLight
Open.Text = "Open"
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextScaled = true
Open.TextSize = 14
Open.TextWrapped = true

function SCRIPT_QPHZ74_FAKESCRIPT() -- Background.CoreGuiRemover
	getfenv().script = Instance.new("LocalScript", Background)

	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end
coroutine.resume(coroutine.create(SCRIPT_QPHZ74_FAKESCRIPT))
function SCRIPT_SNDF81_FAKESCRIPT() -- PlayBTN.Script
	getfenv().script = Instance.new("Script", PlayBTN)

	local plybtn = script.Parent
	local background = script.Parent.Parent
	local uis = game:GetService("UserInputService")
	local ss = script.Parent.Parent.Parent.CommandsFrame
	plybtn.MouseButton1Click:Connect(
		function(plr)
			background:TweenPosition(UDim2.new(-2, 0, 0, 0))
			wait(1)
			background:Destroy()
			ss.Visible = true
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_SNDF81_FAKESCRIPT))
function SCRIPT_LEBA80_FAKESCRIPT() -- PlayBTN.LocalScript
	getfenv().script = Instance.new("LocalScript", PlayBTN)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_LEBA80_FAKESCRIPT))
function SCRIPT_LZYB73_FAKESCRIPT() -- Background.LoadBarLoader
	getfenv().script = Instance.new("Script", Background)

	local loadbar = script.Parent.Bar.LoadBar
	local plybtn = script.Parent.PlayBTN
	wait(1)
	loadbar:TweenSize(UDim2.new(0.05, 0, 1, 0))
	wait(2)
	loadbar:TweenSize(UDim2.new(0.1, 0, 1, 0))
	wait(1)
	loadbar:TweenSize(UDim2.new(.3, 0, 1, 0))
	wait(2)
	loadbar:TweenSize(UDim2.new(.6, 0, 1, 0))
	wait(3)
	loadbar:TweenSize(UDim2.new(.65, 0, 1, 0))
	wait(2)
	loadbar:TweenSize(UDim2.new(.8, 0, 1, 0))
	wait(2)
	loadbar:TweenSize(UDim2.new(.9, 0, 1, 0))
	wait(2)
	loadbar:TweenSize(UDim2.new(1, 0, 1, 0))
	wait(2)
	loadbar.Parent.Visible = false
	plybtn.Visible = true
end
coroutine.resume(coroutine.create(SCRIPT_LZYB73_FAKESCRIPT))
function SCRIPT_AOYN88_FAKESCRIPT() -- ExitButton.Script
	getfenv().script = Instance.new("Script", ExitButton)

	script.Parent.MouseButton1Click:Connect(
		function()
			script.Parent.Parent.Parent.Parent.OpenFrame.Visible = true
			script.Parent.Parent.Parent.Parent.CommandsFrame.Visible = false
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_AOYN88_FAKESCRIPT))
function SCRIPT_WCEV72_FAKESCRIPT() -- CreditsButton.Script
	getfenv().script = Instance.new("Script", CreditsButton)

	script.Parent.MouseButton1Click:Connect(
		function()
			script.Parent.Parent.Parent.ButtonsFrame.Visible = false
			script.Parent.Parent.Parent.ParameterFrame.Visible = false
			script.Parent.Parent.Parent.CreditsFrame.Visible = true
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_WCEV72_FAKESCRIPT))
function SCRIPT_JKKV65_FAKESCRIPT() -- Floor1.Script
	getfenv().script = Instance.new("Script", Floor1)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(-3059.16, -225, 1126.32))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(-3059.16, -225, 1126.32))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_JKKV65_FAKESCRIPT))
function SCRIPT_BUCD87_FAKESCRIPT() -- Floor2.Script
	getfenv().script = Instance.new("Script", Floor2)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(-2952.43, 116.3, -9375))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(-2952.43, 116.3, -9375))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_BUCD87_FAKESCRIPT))
function SCRIPT_GTYH74_FAKESCRIPT() -- Floor3.Script
	getfenv().script = Instance.new("Script", Floor3)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(-375.99, 4168.04, -694))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(-375.99, 4168.04, -694))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_GTYH74_FAKESCRIPT))
function SCRIPT_CMXD83_FAKESCRIPT() -- Floor5.Script
	getfenv().script = Instance.new("Script", Floor5)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = CFrame.new(Vector3.new(2175.6, 1250, -388.3))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(2175.6, 1250, -388.3))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_CMXD83_FAKESCRIPT))
function SCRIPT_EXYR82_FAKESCRIPT() -- Floor4.Script
	getfenv().script = Instance.new("Script", Floor4)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(-2380.2, 2153.35, -124.97))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(-2380.2, 2153.35, -124.97))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_EXYR82_FAKESCRIPT))
function SCRIPT_DUHP74_FAKESCRIPT() -- Floor7.Script
	getfenv().script = Instance.new("Script", Floor7)

	script.Parent.MouseButton1Down:connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(3315.13281, 729.625977, -617.601))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(3315.13281, 729.625977, -617.601))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_DUHP74_FAKESCRIPT))
function SCRIPT_MWVV74_FAKESCRIPT() -- Floor8.Script
	getfenv().script = Instance.new("Script", Floor8)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1642, 4078, 7721))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = CFrame.new(Vector3.new(1642, 4078, 7721))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_MWVV74_FAKESCRIPT))
function SCRIPT_WGGA77_FAKESCRIPT() -- Floor9.Script
	getfenv().script = Instance.new("Script", Floor9)

	script.Parent.MouseButton1Down:connect(
		function()
			game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
				CFrame.new(Vector3.new(-3588.53, 2904.99, -7707.6))
			wait(1)
			if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
				wait(3)
				game.Workspace[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
					CFrame.new(Vector3.new(-3588.53, 2904.99, -7707.6))
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_WGGA77_FAKESCRIPT))
function SCRIPT_NWKM72_FAKESCRIPT() -- f1IC.Script
	getfenv().script = Instance.new("Script", f1IC)

	PlayerName = tostring(game.Players.LocalPlayer.Name)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[PlayerName].HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-817.8, -98.17, 602.55))
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_NWKM72_FAKESCRIPT))
function SCRIPT_MKBD74_FAKESCRIPT() -- Autofarm.Script
	getfenv().script = Instance.new("Script", Autofarm)

	script.Parent.MouseButton1Click:Connect(
		function()
			--[[
	Entire script was created by ClassyInori#5056.
	If you're going to make videos or re-release this or whatever make sure to give credits.
	]]
			local key = "k" -- key to toggle farm

			-- -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

			if not type(key) == "string" or string.len(key) > 1 then
				error("mega new user :holy")
			else
				key = key:upper()
			end

			local function getService(str)
				return game:GetService(str)
			end

			-- secondary bypass method, main one is used in my paid script.
			local function tpwsbypass()
				local mt = getrawmetatable(game)
				if setreadonly then
					setreadonly(mt, false)
				elseif make_writeable then
					make_writeable(mt)
				end
				local o_namecall = mt.__namecall
				local o_newindex = mt.__newindex

				mt.__namecall = function(self, ...)
					local args = {...}
					local method = args[#args]
					if method == "Kick" or method == "BreakJoints" then
						--print("Caught: "..method.." being naughty.")
						return
					end
					return o_namecall(self, ...)
				end

				mt.__newindex = function(t, k, v)
					if k == "Health" then
						--print("Caught death.")
						return error("Bypassed.")
					elseif k == "Value" and tostring(t) and tostring(t) == "Health" then
						--print("Caught death.")
						return error("Bypassed.")
					end
					return o_newindex(t, k, v)
				end
			end

			tpwsbypass()

			local plr = getService("Players").LocalPlayer
			local char = plr.Character
			local data = char:WaitForChild("Entity", 5)

			local function getMob()
				for i, v in next, getService("Workspace").Mobs:children() do
					if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Entity") and v:FindFirstChild("Healthbar") then
						return v
					end
				end
				warn("no mobs")
			end

			local toggled = false
			getService("UserInputService").InputBegan:Connect(
				function(input)
					if input.KeyCode == Enum.KeyCode[key] then
						toggled = not toggled
						warn(tostring(toggled))
					end
				end
			)

			while wait(.25) do -- 10/10 loopage 100% non-skiddery :holy:
				if toggled then
					local mob = getMob()
					if mob then
						repeat
							wait(.1)
							if plr.Character then
								char = plr.Character
							else
								break
							end
							if char:FindFirstChild("Entity") then
								data = char.Entity
							else
								break
							end
							if not mob:FindFirstChild("HumanoidRootPart") then
								break
							elseif not mob:FindFirstChild("Entity") then
								break
							elseif not mob:FindFirstChild("Healthbar") then
								break
							elseif not char:FindFirstChild("HumanoidRootPart") then
								break
							end
							char.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame
							if mouse1click then
								mouse1click()
							elseif Input then
								Input.LeftClick()
							else
								error("ey yo u using a bad exploit why dont u buy synapse instead")
							end
						until data.Health.Value == 0 or not mob or not toggled
					end
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_MKBD74_FAKESCRIPT))
function SCRIPT_WDTI74_FAKESCRIPT() -- f3IC.Script
	getfenv().script = Instance.new("Script", f3IC)

	PlayerName = tostring(game.Players.LocalPlayer.Name)

	script.Parent.MouseButton1Click:Connect(
		function()
			game.Workspace[PlayerName].HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-817.8, -98.17, 602.55))
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_WDTI74_FAKESCRIPT))
function SCRIPT_VIOG87_FAKESCRIPT() -- InfStam.Script
	getfenv().script = Instance.new("Script", InfStam)

	script.Parent.MouseButton1Click:Connect(
		function()
			local client = game:GetService("Players").LocalPlayer
			while wait() do
				if client.Character then
					client.Character:WaitForChild("Entity").Stamina.Value = 100
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_VIOG87_FAKESCRIPT))
function SCRIPT_HGVK71_FAKESCRIPT() -- Hitbox.Script
	getfenv().script = Instance.new("Script", Hitbox)

	script.Parent.MouseButton1Click:Connect(
		function()
			warn("Executed HitBox")
			for i, v in pairs(game.Workspace.Mobs:children()) do
				if v:FindFirstChild("Head") then
					v.HumanoidRootPart.Transparency = 0.5
					v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
					v.HumanoidRootPart.Color = Color3.new(255, 0, 0)
					v.HumanoidRootPart.Material = "Neon"
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_HGVK71_FAKESCRIPT))
function SCRIPT_JYZC88_FAKESCRIPT() -- TpRandomMob.Script
	getfenv().script = Instance.new("Script", TpRandomMob)

	script.Parent.MouseButton1Click:Connect(
		function()
			local model = game.Workspace.Mobs
			local mobs = model:GetChildren()
			for i = 1, #mobs do
				local themob = mobs[math.random(#mobs)]
				if themob:findFirstChild("Torso") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(themob.Torso.Position)
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_JYZC88_FAKESCRIPT))
function SCRIPT_BXGF71_FAKESCRIPT() -- MaxSkills.Script
	getfenv().script = Instance.new("Script", MaxSkills)

	script.Parent.MouseButton1Click:Connect(
		function()
			for i, v in pairs(game.ReplicatedStorage.Database.Skills:children()) do
				if v:FindFirstChild("Class") then
					v.Class:Remove()
				end
				if v:FindFirstChild("Anytime") then
					v.Anytime:Remove()
				end
				if v:FindFirstChild("Cost") then
					v.Cost.Value = -999999999
				end
				if v:FindFirstChild("Cooldown") then
					v.Cooldown.Value = -999999999
				end
				if v:FindFirstChild("Level") then
					v.Level.Value = -999999999
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_BXGF71_FAKESCRIPT))
function SCRIPT_XYBX86_FAKESCRIPT() -- FreezeMobs.Script
	getfenv().script = Instance.new("Script", FreezeMobs)

	script.Parent.MouseButton1Click:Connect(
		function()
			for i, v in pairs(workspace.Mobs:children()) do
				if v ~= nil then
					v.Humanoid.WalkSpeed = 0
					lolsss = v:GetChildren()
					for i = 1, #lolsss do
						if lolsss[i].className == "Part" then
							lolsss[i].Anchored = true
							lolsss[i].Reflectance = 1
						end
					end
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_XYBX86_FAKESCRIPT))
function SCRIPT_LALX65_FAKESCRIPT() -- TpItemCrystal.Script
	getfenv().script = Instance.new("Script", TpItemCrystal)

	script.Parent.MouseButton1Click:Connect(
		function()
			local model = game.Workspace.Mobs
			local mobs = model:GetChildren()
			for i = 1, #mobs do
				if mobs[i].Name == "Item Crystal" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mobs[i].Torso.Position)
				end
			end
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_LALX65_FAKESCRIPT))
function SCRIPT_FKXG65_FAKESCRIPT() -- LeaveCredits.Script
	getfenv().script = Instance.new("Script", LeaveCredits)

	script.Parent.MouseButton1Click:Connect(
		function()
			script.Parent.Parent.Visible = false
			script.Parent.Parent.Parent.ParameterFrame.Visible = true
			script.Parent.Parent.Parent.ButtonsFrame.Visible = true
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_FKXG65_FAKESCRIPT))
function SCRIPT_IKEL90_FAKESCRIPT() -- Open.Script
	getfenv().script = Instance.new("Script", Open)

	script.Parent.MouseButton1Click:Connect(
		function()
			script.Parent.Parent.Visible = false
			script.Parent.Parent.Parent.CommandsFrame.Visible = true
		end
	)
end
coroutine.resume(coroutine.create(SCRIPT_IKEL90_FAKESCRIPT))
