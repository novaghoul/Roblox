local KoiraWaypoints = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TpTemplate = Instance.new("TextButton")
local NameLabel = Instance.new("TextLabel")
local EditBtn = Instance.new("ImageButton")
local TopLabel = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local HideBtn = Instance.new("TextButton")
local AddBtn = Instance.new("ImageButton")
local EditFrame = Instance.new("Frame")
local SettingsLabel = Instance.new("TextLabel")
local ShowBtn = Instance.new("TextButton")
local CloseBtn_2 = Instance.new("TextButton")
local HideBtn_2 = Instance.new("TextButton")
local NameBox = Instance.new("TextBox")
local EditBtn_2 = Instance.new("ImageButton")
local DeleteBtn = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")

KoiraWaypoints.Name = "KoiraWaypoints"
KoiraWaypoints.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = KoiraWaypoints
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.new(0.396078, 1, 0.486275)
MainFrame.BorderColor3 = Color3.new(0.188235, 0.47451, 0.223529)
MainFrame.Position = UDim2.new(0.100000001, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 300)

ShowBtn.Name = "ShowBtn"
ShowBtn.Parent = KoiraWaypoints
ShowBtn.AnchorPoint = Vector2.new(0, 1)
ShowBtn.BackgroundColor3 = Color3.new(0.396078, 1, 0.486275)
ShowBtn.BorderColor3 = Color3.new(0.188235, 0.47451, 0.223529)
ShowBtn.Position = UDim2.new(-0.5, 0, 0.899999976, 0)
ShowBtn.Size = UDim2.new(0, 50, 0, 50)
ShowBtn.Font = Enum.Font.SourceSans
ShowBtn.Text = "Show"
ShowBtn.TextColor3 = Color3.new(0, 0, 0)
ShowBtn.TextSize = 14

ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 0, 0.100000001, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.899999976, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
ScrollingFrame.ScrollBarThickness = 6

TpTemplate.Name = "TpTemplate"
TpTemplate.Parent = ScrollingFrame
TpTemplate.BackgroundColor3 = Color3.new(0.356863, 0.905882, 0.431373)
TpTemplate.BorderSizePixel = 0
TpTemplate.Size = UDim2.new(1, 0, 0, 25)
TpTemplate.Visible = false
TpTemplate.Font = Enum.Font.SourceSans
TpTemplate.Text = ""
TpTemplate.TextSize = 14
TpTemplate.TextXAlignment = Enum.TextXAlignment.Left

NameLabel.Name = "NameLabel"
NameLabel.Parent = TpTemplate
NameLabel.BackgroundColor3 = Color3.new(1, 1, 1)
NameLabel.BackgroundTransparency = 1
NameLabel.BorderSizePixel = 0
NameLabel.Position = UDim2.new(0.0500000007, 0, 0, 0)
NameLabel.Size = UDim2.new(0, 150, 1, 0)
NameLabel.Font = Enum.Font.SourceSans
NameLabel.TextColor3 = Color3.new(0, 0, 0)
NameLabel.TextSize = 14
NameLabel.TextXAlignment = Enum.TextXAlignment.Left

EditBtn.Name = "EditBtn"
EditBtn.Parent = TpTemplate
EditBtn.AnchorPoint = Vector2.new(1, 0)
EditBtn.BackgroundColor3 = Color3.new(0.294118, 0.74902, 0.356863)
EditBtn.BorderSizePixel = 0
EditBtn.Position = UDim2.new(0.970000029, 0, 0, 0)
EditBtn.Size = UDim2.new(0, 25, 1, 0)
EditBtn.Image = "rbxassetid://247421757"

TopLabel.Name = "TopLabel"
TopLabel.Parent = MainFrame
TopLabel.BackgroundColor3 = Color3.new(0.341176, 0.866667, 0.411765)
TopLabel.BorderSizePixel = 0
TopLabel.Size = UDim2.new(1, 0, 0.100000001, 0)
TopLabel.Font = Enum.Font.SourceSans
TopLabel.Text = "      Waypoint Gui"
TopLabel.TextColor3 = Color3.new(0, 0, 0)
TopLabel.TextSize = 14
TopLabel.TextXAlignment = Enum.TextXAlignment.Left

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopLabel
CloseBtn.AnchorPoint = Vector2.new(1, 0)
CloseBtn.BackgroundColor3 = Color3.new(1, 0.411765, 0.411765)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, 0, 0, 0)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.SourceSans
CloseBtn.Text = ""
CloseBtn.TextSize = 14

HideBtn.Name = "HideBtn"
HideBtn.Parent = TopLabel
HideBtn.AnchorPoint = Vector2.new(1, 0)
HideBtn.BackgroundColor3 = Color3.new(0.294118, 0.74902, 0.356863)
HideBtn.BorderSizePixel = 0
HideBtn.Position = UDim2.new(0.897499979, 0, 0, 0)
HideBtn.Size = UDim2.new(0, 20, 0, 20)
HideBtn.Font = Enum.Font.SourceSans
HideBtn.Text = ""
HideBtn.TextSize = 14

AddBtn.Name = "AddBtn"
AddBtn.Parent = TopLabel
AddBtn.AnchorPoint = Vector2.new(1, 0)
AddBtn.BackgroundColor3 = Color3.new(0.258824, 0.666667, 0.313726)
AddBtn.BorderSizePixel = 0
AddBtn.Position = UDim2.new(0.800000012, 0, 0, 0)
AddBtn.Size = UDim2.new(0, 20, 0, 20)
AddBtn.Image = "rbxassetid://257579835"
AddBtn.ImageColor3 = Color3.new(0, 0, 0)

EditFrame.Name = "EditFrame"
EditFrame.Parent = KoiraWaypoints
EditFrame.Active = true
EditFrame.Draggable = true
EditFrame.AnchorPoint = Vector2.new(0.5, 0.5)
EditFrame.BackgroundColor3 = Color3.new(0.396078, 1, 0.486275)
EditFrame.BorderColor3 = Color3.new(0.188235, 0.47451, 0.223529)
EditFrame.Position = UDim2.new(0.300000012, 0, 0.5, 0)
EditFrame.Size = UDim2.new(0, 200, 0, 100)
EditFrame.Visible = false

SettingsLabel.Name = "SettingsLabel"
SettingsLabel.Parent = EditFrame
SettingsLabel.BackgroundColor3 = Color3.new(0.341176, 0.866667, 0.411765)
SettingsLabel.BorderSizePixel = 0
SettingsLabel.Size = UDim2.new(1, 0, 0, 25)
SettingsLabel.Font = Enum.Font.SourceSans
SettingsLabel.Text = "      Settings"
SettingsLabel.TextColor3 = Color3.new(0, 0, 0)
SettingsLabel.TextSize = 14
SettingsLabel.TextXAlignment = Enum.TextXAlignment.Left

CloseBtn_2.Name = "CloseBtn"
CloseBtn_2.Parent = SettingsLabel
CloseBtn_2.AnchorPoint = Vector2.new(1, 0)
CloseBtn_2.BackgroundColor3 = Color3.new(1, 0.411765, 0.411765)
CloseBtn_2.BorderSizePixel = 0
CloseBtn_2.Position = UDim2.new(1, 0, 0, 0)
CloseBtn_2.Size = UDim2.new(0, 20, 0, 20)
CloseBtn_2.Font = Enum.Font.SourceSans
CloseBtn_2.Text = ""
CloseBtn_2.TextSize = 14

HideBtn_2.Name = "HideBtn"
HideBtn_2.Parent = SettingsLabel
HideBtn_2.AnchorPoint = Vector2.new(1, 0)
HideBtn_2.BackgroundColor3 = Color3.new(0.294118, 0.74902, 0.356863)
HideBtn_2.BorderSizePixel = 0
HideBtn_2.Position = UDim2.new(0.897499979, 0, 0, 0)
HideBtn_2.Size = UDim2.new(0, 20, 0, 20)
HideBtn_2.Font = Enum.Font.SourceSans
HideBtn_2.Text = ""
HideBtn_2.TextSize = 14

NameBox.Name = "NameBox"
NameBox.Parent = EditFrame
NameBox.BackgroundColor3 = Color3.new(0.341176, 0.866667, 0.411765)
NameBox.BorderSizePixel = 0
NameBox.Position = UDim2.new(0.0500000007, 0, 0.330000013, 0)
NameBox.Size = UDim2.new(0, 150, 0, 25)
NameBox.Font = Enum.Font.SourceSans
NameBox.Text = "Label"
NameBox.TextColor3 = Color3.new(0, 0, 0)
NameBox.TextSize = 14
NameBox.TextXAlignment = Enum.TextXAlignment.Left
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = KoiraWaypoints
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 1, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 25)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Waypoint GUI :)"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14
TextLabel.TextStrokeTransparency = 0
EditBtn_2.Name = "EditBtn"
EditBtn_2.Parent = NameBox
EditBtn_2.AnchorPoint = Vector2.new(1, 0)
EditBtn_2.BackgroundColor3 = Color3.new(0.294118, 0.74902, 0.356863)
EditBtn_2.BorderSizePixel = 0
EditBtn_2.Position = UDim2.new(1.20000005, 0, 0, 0)
EditBtn_2.Size = UDim2.new(0, 25, 1, 0)
EditBtn_2.Image = "rbxassetid://247421757"

DeleteBtn.Name = "DeleteBtn"
DeleteBtn.Parent = EditFrame
DeleteBtn.BackgroundColor3 = Color3.new(1, 0.521569, 0.521569)
DeleteBtn.BorderSizePixel = 0
DeleteBtn.Position = UDim2.new(0.100000001, 0, 0.660000026, 0)
DeleteBtn.Size = UDim2.new(0.800000012, 0, 0, 25)
DeleteBtn.Font = Enum.Font.SourceSans
DeleteBtn.Text = "     Delete"
DeleteBtn.TextColor3 = Color3.new(0, 0, 0)
DeleteBtn.TextSize = 14
DeleteBtn.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel.Parent = DeleteBtn
ImageLabel.AnchorPoint = Vector2.new(1, 0)
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.995000005, 0, 0.0500000007, 0)
ImageLabel.Size = UDim2.new(0, 22, 0, 22)
ImageLabel.Image = "rbxassetid://145360650"
ImageLabel.ImageColor3 = Color3.new(0, 0, 0)

function sort()
	local rs = game:service'ReplicatedStorage'
	local fol = Instance.new("Folder",rs)
	fol.Name = "Hello"
	for i,v in pairs(ScrollingFrame:GetChildren()) do
		if v.Name ~= "TpTemplate" then
			v.Parent = fol
		end
	end
	for i,v in pairs(fol:GetChildren()) do
		v.Parent = ScrollingFrame
		v.Position = UDim2.new(0,0,0,-50+(25*#ScrollingFrame:GetChildren()))
	end
	fol:Destroy()
end

ShowBtn.MouseButton1Click:connect(function()
	MainFrame:TweenPosition(UDim2.new(0.1,0,0.5,0),"Out", "Quad", 0.5)
	ShowBtn:TweenPosition(UDim2.new(-0.5,0,0.9,0),"Out", "Quad", 0.5)
end)

CloseBtn.MouseButton1Click:connect(function()
	KoiraWaypoints:Destroy()
end)

HideBtn.MouseButton1Click:connect(function()
	MainFrame:TweenPosition(UDim2.new(-0.5,0,0.5,0),"Out", "Quad", 0.5)
	ShowBtn:TweenPosition(UDim2.new(0,0,0.9,0),"Out", "Quad", 0.5)
end)

AddBtn.MouseButton1Click:connect(function()
	local lol = TpTemplate:Clone()
	lol.Parent = ScrollingFrame
	lol.Visible = true
	lol.Position = UDim2.new(0,0,0,-50+(25*#ScrollingFrame:GetChildren()))
	local val = Instance.new("Vector3Value",lol)
	val.Value = game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame.p
	lol.MouseButton1Click:connect(function()
		game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(val.Value)
	end)
	val.Name = "Pos"
	lol.Name = "Waypoint"
	lol.NameLabel.Text = "Waypoint"
	lol.EditBtn.MouseButton1Click:connect(function()
		local dsa = EditFrame:Clone()
		dsa.Visible =true
		dsa.NameBox.Text = lol.NameLabel.Text
		dsa.SettingsLabel.HideBtn:Destroy()
		dsa.Parent = KoiraWaypoints
		dsa.DeleteBtn.MouseButton1Click:connect(function()
			lol:Destroy()
			dsa:Destroy()
			sort()
		end)
		dsa.NameBox.EditBtn.MouseButton1Click:connect(function()
			if dsa.NameBox.Text ~= nil then
				lol.NameLabel.Text = dsa.NameBox.Text
			end
		end)
		dsa.SettingsLabel.CloseBtn.MouseButton1Click:connect(function()
			dsa:Destroy()
		end)
	end)
end)
for i=30,0,-1 do
	wait(1)
	TextLabel.Text = "Waypoint GUI ("..i..")"
end
TextLabel:Destroy()