loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

if cg:FindFirstChild("TutorialGUI") then
	cg["TutorialGUI"]:Destroy()
end

_G.guiOn = false

if _G.arrayNameButton == nil then
    _G.arrayNameButton = {
        "addSpeed",
        "subSpeed",
        "infJump",
        "noclipToggle"
    }
    _G.arrayTextButton = {
        "Press C to + Speed",
        "Press V to - Speed",
        "Press Space to Inf Jump",
        "Press F to Noclip"
    }
end

local posCurent = 10
local sizeMFCurent = 45

local TutorialGUI = Instance.new("ScreenGui")
local MFrame = Instance.new("Frame")
local OpenBut = Instance.new("TextButton")

TutorialGUI.Name = "TutorialGUI"
TutorialGUI.Parent = cg

MFrame.Name = "MFrame"
MFrame.Parent = TutorialGUI
MFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MFrame.BackgroundTransparency = 0.500
MFrame.Position = UDim2.new(0.400000006, 0, 0.400000006, 0)
MFrame.Size = UDim2.new(0, 200, 0, sizeMFCurent)
MFrame.Visible = false
MFrame.Active = true
MFrame.Draggable = true

OpenBut.Name = "OpenBut"
OpenBut.Parent = TutorialGUI
OpenBut.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenBut.BackgroundTransparency = 0.3
OpenBut.Position = UDim2.new(0, 0, 0.7, 0)
OpenBut.Size = UDim2.new(0, 50, 0, 25)
OpenBut.Font = Enum.Font.SourceSans
OpenBut.Text = "Open"
OpenBut.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBut.TextSize = 14.000

function createUse(createArray)
    local Use = Instance.new("TextLabel")
    Use.Name = _G.arrayNameButton[createArray]
    Use.Parent = MFrame
    Use.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Use.BackgroundTransparency = 1.000
    Use.Position = UDim2.new(0, 10, 0, posCurent)
    Use.Size = UDim2.new(0.899999976, 0, 0, 25)
    Use.Font = Enum.Font.SourceSans
    Use.Text = _G.arrayTextButton[createArray]
    Use.TextColor3 = Color3.fromRGB(0, 0, 0)
    Use.TextSize = 14.000
end

for i = 1, #_G.arrayNameButton do
    createUse(i)
    posCurent = posCurent +  25
end

MFrame.Size = UDim2.new(0, 200, 0, sizeMFCurent + 25 * (#_G.arrayNameButton - 1))
-- Scripts:

OpenBut.MouseButton1Down:connect(
	function()
		if _G.guiOn == false then
			OpenBut.Text = "Close"
			MFrame.Visible = true
			_G.guiOn = true
		else
			OpenBut.Text = "Open"
			MFrame.Visible = false
			_G.guiOn = false
		end
	end
)
