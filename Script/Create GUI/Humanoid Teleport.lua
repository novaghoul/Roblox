loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

if cg:FindFirstChild("HumanoidTeleport") then
	cg["HumanoidTeleport"]:Destroy()
end

_G.autoOneT = false
_G.autoAllT = false
_G.guiOn = false

-- Gui to Lua
-- Version: 3.2

-- Instances:

local HumanoidTeleport = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Distance = Instance.new("TextBox")
local Reset = Instance.new("TextButton")
local NamePlayer = Instance.new("TextBox")
local BringPlayer = Instance.new("TextButton")
local BringAll = Instance.new("TextButton")
local AutoAll = Instance.new("TextButton")
local AutoOne = Instance.new("TextButton")
local OpenBNT = Instance.new("TextButton")

--Properties:

HumanoidTeleport.Name = "HumanoidTeleport"
HumanoidTeleport.Parent = cg

MainGUI.Name = "MainGUI"
MainGUI.Parent = HumanoidTeleport
MainGUI.BackgroundColor3 = Color3.fromRGB(242, 243, 243)
MainGUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainGUI.Position = UDim2.new(0.120326385, 0, 0.254854709, 0)
MainGUI.Size = UDim2.new(0, 290, 0, 230)
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true

Title.Name = "Title"
Title.Parent = MainGUI
Title.BackgroundColor3 = Color3.fromRGB(109, 110, 108)
Title.Size = UDim2.new(0, 290, 0, 50)
Title.Font = Enum.Font.SourceSans
Title.Text = "Teleport"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 30.000

Distance.Name = "Distance"
Distance.Parent = Title
Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Distance.Position = UDim2.new(0, 265, 0, 0)
Distance.Size = UDim2.new(0, 25, 0, 25)
Distance.Font = Enum.Font.SourceSans
Distance.Text = "5"
Distance.TextColor3 = Color3.fromRGB(0, 0, 0)
Distance.TextSize = 14.000
Distance.TextWrapped = true

Reset.Name = "Reset"
Reset.Parent = Title
Reset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Reset.Position = UDim2.new(0, 0, -3.44589353e-08, 0)
Reset.Size = UDim2.new(0, 50, 0, 25)
Reset.Font = Enum.Font.SourceSans
Reset.Text = "Reset"
Reset.TextColor3 = Color3.fromRGB(0, 0, 0)
Reset.TextSize = 14.000

NamePlayer.Name = "NamePlayer"
NamePlayer.Parent = MainGUI
NamePlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NamePlayer.Position = UDim2.new(0, 0, 0, 60)
NamePlayer.Size = UDim2.new(0, 290, 0, 50)
NamePlayer.Font = Enum.Font.SourceSans
NamePlayer.PlaceholderColor3 = Color3.fromRGB(161, 165, 162)
NamePlayer.PlaceholderText = "Name Here"
NamePlayer.Text = ""
NamePlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
NamePlayer.TextSize = 20.000

BringPlayer.Name = "BringPlayer"
BringPlayer.Parent = MainGUI
BringPlayer.BackgroundColor3 = Color3.fromRGB(161, 165, 162)
BringPlayer.Position = UDim2.new(0, 0, 0, 120)
BringPlayer.Size = UDim2.new(0, 290, 0, 50)
BringPlayer.Font = Enum.Font.SourceSans
BringPlayer.Text = "Bring to Me"
BringPlayer.TextColor3 = Color3.fromRGB(242, 243, 243)
BringPlayer.TextSize = 30.000

BringAll.Name = "BringAll"
BringAll.Parent = MainGUI
BringAll.BackgroundColor3 = Color3.fromRGB(161, 165, 162)
BringAll.Position = UDim2.new(0, 0, 0, 180)
BringAll.Size = UDim2.new(0, 290, 0, 50)
BringAll.Font = Enum.Font.SourceSans
BringAll.Text = "Bring All to Me"
BringAll.TextColor3 = Color3.fromRGB(242, 243, 243)
BringAll.TextSize = 30.000

AutoAll.Name = "AutoAll"
AutoAll.Parent = MainGUI
AutoAll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoAll.Position = UDim2.new(0.827586234, 0, 0.782608688, 0)
AutoAll.Size = UDim2.new(0, 50, 0, 25)
AutoAll.Font = Enum.Font.SourceSans
AutoAll.Text = "Auto Off"
AutoAll.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoAll.TextSize = 14.000

AutoOne.Name = "AutoOne"
AutoOne.Parent = MainGUI
AutoOne.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoOne.Position = UDim2.new(0.824137926, 0, 0.521739125, 0)
AutoOne.Size = UDim2.new(0, 50, 0, 25)
AutoOne.Font = Enum.Font.SourceSans
AutoOne.Text = "Auto Off"
AutoOne.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoOne.TextSize = 14.000

OpenBNT.Name = "OpenBNT"
OpenBNT.Parent = HumanoidTeleport
OpenBNT.BackgroundColor3 = Color3.fromRGB(161, 165, 162)
OpenBNT.Position = UDim2.new(0, 0, 0.819410324, 0)
OpenBNT.Size = UDim2.new(0, 25, 0, 25)
OpenBNT.Font = Enum.Font.SourceSans
OpenBNT.Text = ">"
OpenBNT.TextColor3 = Color3.fromRGB(0, 0, 0)
OpenBNT.TextSize = 30.000

-- Scripts:

OpenBNT.MouseButton1Down:connect(
	function()
		if _G.guiOn == false then
			OpenBNT.Text = "<"
			MainGUI.Visible = true
			_G.guiOn = true
		else
			OpenBNT.Text = ">"
			MainGUI.Visible = false
			_G.guiOn = false
		end
	end
)

BringPlayer.MouseButton1Down:connect(
	function()
		if tonumber(tostring(Distance.Text)) == nil then
			Distance.BorderColor3 = Color3.fromRGB(196, 40, 28)
		else
			Distance.BorderColor3 = Color3.fromRGB(27, 42, 53)
			local dis = tonumber(tostring(Distance.Text))
			local pos = lplr.Character.HumanoidRootPart.CFrame
			local charplayer = wp:FindFirstChild(plrlist(NamePlayer.Text).Name)
			if charplayer then
				wait(0.5)
				if plrlist(NamePlayer.Text).Name ~= lplr.Name then
					charplayer.HumanoidRootPart.Anchored = false
					charplayer.HumanoidRootPart.CanCollide = false
					charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
					charplayer.HumanoidRootPart.Anchored = true
				end
			end
		end
	end
)

AutoOne.MouseButton1Down:connect(
	function()
		if _G.autoOneT == false then
			_G.autoOneT = true
			AutoOne.Text = "Auto On"
			while _G.autoOneT == true do
				if tonumber(tostring(Distance.Text)) == nil then
					Distance.BorderColor3 = Color3.fromRGB(196, 40, 28)
				else
					Distance.BorderColor3 = Color3.fromRGB(27, 42, 53)
					local dis = tonumber(tostring(Distance.Text))
					local pos = lplr.Character.HumanoidRootPart.CFrame
					local charplayer = wp:FindFirstChild(plrlist(NamePlayer.Text).Name)
					if charplayer then
						wait(0.1)
						if plrlist(NamePlayer.Text).Name ~= lplr.Name then
							charplayer.HumanoidRootPart.Anchored = false
							charplayer.HumanoidRootPart.CanCollide = false
							charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
							charplayer.HumanoidRootPart.Anchored = true
						end
					end
				end
				wait(0.01)
			end
		else
			_G.autoOneT = false
			AutoOne.Text = "Auto Off"
		end
	end
)

AutoAll.MouseButton1Down:connect(
	function()
		if _G.autoAllT == false then
			_G.autoAllT = true
			AutoAll.Text = "Auto On"
			while _G.autoAllT == true do
				if tonumber(tostring(Distance.Text)) == nil then
					Distance.BorderColor3 = Color3.fromRGB(196, 40, 28)
				else
					Distance.BorderColor3 = Color3.fromRGB(27, 42, 53)
					local dis = tonumber(tostring(Distance.Text))
					local pos = lplr.Character.HumanoidRootPart.CFrame
					for _, v in pairs(plrs:GetPlayers()) do
						local charplayer = wp:FindFirstChild(v.Name)
						if charplayer then
							wait()
							if v.Name ~= lplr.Name then
								charplayer.HumanoidRootPart.Anchored = false
								charplayer.HumanoidRootPart.CanCollide = false
								charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
								charplayer.HumanoidRootPart.Anchored = true
							end
						end
					end
				end
				wait(0.01)
			end
		else
			_G.autoAllT = false
			AutoAll.Text = "Auto Off"
		end
	end
)

BringAll.MouseButton1Down:connect(
	function()
		if tonumber(tostring(Distance.Text)) == nil then
			Distance.BorderColor3 = Color3.fromRGB(196, 40, 28)
		else
			Distance.BorderColor3 = Color3.fromRGB(27, 42, 53)
			local dis = tonumber(tostring(Distance.Text))
			local pos = lplr.Character.HumanoidRootPart.CFrame
			for _, v in pairs(plrs:GetPlayers()) do
				local charplayer = wp:FindFirstChild(v.Name)
				if charplayer then
					wait()
					if v.Name ~= lplr.Name then
						charplayer.HumanoidRootPart.Anchored = false
						charplayer.HumanoidRootPart.CanCollide = false
						charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, -dis)
						charplayer.HumanoidRootPart.Anchored = true
					end
				end
			end
		end
	end
)

Reset.MouseButton1Down:connect(
	function()
		for _, v in pairs(plrs:GetPlayers()) do
			if v.Name ~= lplr.Name then
				local charplayer = wp:FindFirstChild(v.Name)
				if charplayer then
					charplayer.HumanoidRootPart.Anchored = false
					charplayer.HumanoidRootPart.CanCollide = false
				end
			end
		end
	end
)
