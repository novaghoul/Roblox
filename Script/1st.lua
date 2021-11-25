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
bp = lplr.Backpack
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

_G.ws_g = 20
_G.jp_g = 50
_G.noclipAll = false

_G.noclipAllKey = "f"

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
TRANSPARENCY = 0.5 --//Transparency of the ESP
HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 1
-- HumanoidRootPart

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function notify(tle, msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = tle,
            Text = msg,
            Duration = 3
        }
    )
end

function checkReturn(tle, msg)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(tle, msg)
	else
		return SendChat(msg)
	end
end

function createESPItem(parent, r, g, b, fontSize, name)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = name
    nam.BackgroundTransparency = 1
    nam.TextSize = fontSize
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
	return nam
end

function actualESP(obj)
	for i = 0, 5 do
		surface = Instance.new("SurfaceGui", obj) --//Creates the SurfaceGui
		surface.Face = Enum.NormalId[_G.faces[i + 1]] --//Adjusts the Face and chooses from the face table
		surface.AlwaysOnTop = true

		frame = Instance.new("Frame", surface) --//Creates the viewable Frame
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BorderSizePixel = 0
		frame.BackgroundTransparency = TRANSPARENCY
		frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1], ENEMYCOLOR[2], ENEMYCOLOR[3]) --//If in another Team
	end
end

function createHealthbar(hrp)
	board = Instance.new("BillboardGui", hrp) --//Creates the BillboardGui with HumanoidRootPart as the Parent
	board.Name = "total"
	board.Size = UDim2.new(1, 0, 1, 0)
	board.StudsOffset = Vector3.new(3, 1, 0)
	board.AlwaysOnTop = true

	bar = Instance.new("Frame", board) --//Creates the red background
	bar.BackgroundColor3 = Color3.new(255, 0, 0)
	bar.BorderSizePixel = 0
	bar.Size = UDim2.new(0.2, 0, 4, 0)
	bar.Name = "total2"

	health = Instance.new("Frame", bar) --//Creates the changing green Frame
	health.BackgroundColor3 = Color3.new(0, 255, 0)
	health.BorderSizePixel = 0
	health.Size = UDim2.new(1, 0, hrp.Parent.Humanoid.Health / 100, 0)
	hrp.Parent.Humanoid.Changed:Connect(
		function(property) --//Triggers when any Property changed
			hrp.total.total2.Frame.Size = UDim2.new(1, 0, hrp.Parent.Humanoid.Health / 100, 0) --//Adjusts the size of the green Frame
		end
	)
end