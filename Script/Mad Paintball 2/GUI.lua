--God Mode [X]
--Noclip (Toggle) [N]
--Esp (Toggle) [Z]
--TP Enemies to you (they get tped to you and they're frozen, you can shoot them with a shotgun and profit) [K]
--Unlock All Weapon Slots [C]
--Give Rubies [V]
--Click TP (Toggle) [T]
--Increase/Decrease WalkSpeed by 10 [F = Increase, G = Decrease]
--Open/Close GUI [O]

local plr = game:service'Players'.LocalPlayer
local plrgui = plr.PlayerGui
local plrs = game:service'Players'
local char = plr.Character
local mouse = plr:GetMouse()
local redteam = plrgui.GameUI.MainFrame.Leaderboard.Holder.Team2.PlayerList
local blueteam  = plrgui.GameUI.MainFrame.Leaderboard.Holder.Team1.PlayerList
local enemyteam
local enemies = {}
local esp = false
local noclip = false
local clicktp = false

g1 = Instance.new("ScreenGui", plrgui)
g1.Name = "gui"
o1 = Instance.new("Frame", g1)
o1.Active = true
o1.BackgroundColor3 = Color3.new(1, 0.666667, 0)
o1.BackgroundTransparency = 0.20000000298023
o1.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o1.BorderSizePixel = 0
o1.Name = "DragPart"
o1.Position = UDim2.new(0.29290854930878, 0, 0.20436818897724, 0)
o1.Size = UDim2.new(0, 418, 0, 51)
o1.Draggable = true
o2 = Instance.new("TextLabel", o1)
o2.BackgroundColor3 = Color3.new(1, 1, 1)
o2.BackgroundTransparency = 1
o2.BorderColor3 = Color3.new(0.666667, 0, 0)
o2.BorderSizePixel = 0
o2.Name = "Title"
o2.Position = UDim2.new(0.23923444747925, 0, 0.13725490868092, 0)
o2.Size = UDim2.new(0, 217, 0, 37)
o2.Text = "Mad Paintball V2 Script"
o2.TextColor3 = Color3.new(1, 1, 1)
o2.Font = Enum.Font.SourceSansBold
o2.FontSize = Enum.FontSize.Size32
o3 = Instance.new("ScrollingFrame", o1)
o3.BackgroundColor3 = Color3.new(0.666667, 0, 0)
o3.BackgroundTransparency = 0.20000000298023
o3.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o3.BorderSizePixel = 0
o3.Position = UDim2.new(0, 0, 1, 0)
o3.Size = UDim2.new(0, 418, 0, 214)
o3.ClipsDescendants = true
o4 = Instance.new("TextButton", o3)
o4.Active = true
o4.BackgroundColor3 = Color3.new(0.427451, 0, 0)
o4.BackgroundTransparency = 1
o4.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o4.BorderSizePixel = 0
o4.Name = "teleport"
o4.Position = UDim2.new(0.36722487211227, 0, 0, 0)
o4.Size = UDim2.new(0, 110, 0, 31)
o4.Text = "Hotkeys:"
o4.TextWrapped = true
o4.TextColor3 = Color3.new(1, 1, 1)
o4.Font = Enum.Font.SourceSansBold
o4.FontSize = Enum.FontSize.Size28
o5 = Instance.new("TextLabel", o3)
o5.BackgroundColor3 = Color3.new(1, 1, 1)
o5.BackgroundTransparency = 1
o5.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o5.BorderSizePixel = 0
o5.Position = UDim2.new(0.081339709460735, 0, 0.43691590428352, 0)
o5.Size = UDim2.new(0, 110, 0, 24)
o5.Text = "Z - ESP (Toggle)"
o5.TextColor3 = Color3.new(1, 1, 1)
o5.Font = Enum.Font.SourceSansBold
o5.FontSize = Enum.FontSize.Size18
o6 = Instance.new("TextLabel", o3)
o6.BackgroundColor3 = Color3.new(1, 1, 1)
o6.BackgroundTransparency = 1
o6.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o6.BorderSizePixel = 0
o6.Position = UDim2.new(0.081339716911316, 0, 0.21495327353477, 0)
o6.Size = UDim2.new(0, 110, 0, 24)
o6.Text = "X - God Mode"
o6.TextColor3 = Color3.new(1, 1, 1)
o6.Font = Enum.Font.SourceSansBold
o6.FontSize = Enum.FontSize.Size18
o7 = Instance.new("TextLabel", o3)
o7.BackgroundColor3 = Color3.new(1, 1, 1)
o7.BackgroundTransparency = 1
o7.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o7.BorderSizePixel = 0
o7.Position = UDim2.new(0.3708133995533, 0, 0.21495327353477, 0)
o7.Size = UDim2.new(0, 110, 0, 24)
o7.Text = "C - Unlock All Slots"
o7.TextColor3 = Color3.new(1, 1, 1)
o7.Font = Enum.Font.SourceSansBold
o7.FontSize = Enum.FontSize.Size18
o8 = Instance.new("TextLabel", o3)
o8.BackgroundColor3 = Color3.new(1, 1, 1)
o8.BackgroundTransparency = 1
o8.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o8.BorderSizePixel = 0
o8.Position = UDim2.new(0.36722487211227, 0, 0.32710281014442, 0)
o8.Size = UDim2.new(0, 110, 0, 24)
o8.Text = "V - Give Rubies"
o8.TextColor3 = Color3.new(1, 1, 1)
o8.Font = Enum.Font.SourceSansBold
o8.FontSize = Enum.FontSize.Size18
o9 = Instance.new("TextLabel", o3)
o9.BackgroundColor3 = Color3.new(1, 1, 1)
o9.BackgroundTransparency = 1
o9.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o9.BorderSizePixel = 0
o9.Position = UDim2.new(0.65789473056793, 0, 0.21495327353477, 0)
o9.Size = UDim2.new(0, 110, 0, 24)
o9.Text = "F - Increase WalkSpeed by 10"
o9.TextScaled = true
o9.TextWrapped = true
o9.TextColor3 = Color3.new(1, 1, 1)
o9.Font = Enum.Font.SourceSansBold
o9.FontSize = Enum.FontSize.Size18
o10 = Instance.new("TextLabel", o3)
o10.BackgroundColor3 = Color3.new(1, 1, 1)
o10.BackgroundTransparency = 1
o10.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o10.BorderSizePixel = 0
o10.Position = UDim2.new(0.65789473056793, 0, 0.32710281014442, 0)
o10.Size = UDim2.new(0, 110, 0, 24)
o10.Text = "G - Decrease WalkSpeed by 10"
o10.TextScaled = true
o10.TextWrapped = true
o10.TextColor3 = Color3.new(1, 1, 1)
o10.Font = Enum.Font.SourceSansBold
o10.FontSize = Enum.FontSize.Size18
o11 = Instance.new("TextLabel", o3)
o11.BackgroundColor3 = Color3.new(1, 1, 1)
o11.BackgroundTransparency = 1
o11.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o11.BorderSizePixel = 0
o11.Position = UDim2.new(0.081339716911316, 0, 0.3247663974762, 0)
o11.Size = UDim2.new(0, 110, 0, 24)
o11.Text = "N - No clip (Toggle)"
o11.TextColor3 = Color3.new(1, 1, 1)
o11.Font = Enum.Font.SourceSansBold
o11.FontSize = Enum.FontSize.Size18
o12 = Instance.new("TextLabel", o11)
o12.BackgroundColor3 = Color3.new(1, 1, 1)
o12.BackgroundTransparency = 1
o12.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o12.BorderSizePixel = 0
o12.Position = UDim2.new(0.12727272510529, 0, 4.1666665077209, 0)
o12.Size = UDim2.new(0, 190, 0, 37)
o12.Text = "By Cronnie"
o12.TextColor3 = Color3.new(0.988235, 1, 0.12549)
o12.Font = Enum.Font.SourceSansBold
o12.FontSize = Enum.FontSize.Size60
o13 = Instance.new("TextLabel", o3)
o13.BackgroundColor3 = Color3.new(1, 1, 1)
o13.BackgroundTransparency = 1
o13.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o13.BorderSizePixel = 0
o13.Position = UDim2.new(0.36722487211227, 0, 0.43691590428352, 0)
o13.Size = UDim2.new(0, 110, 0, 24)
o13.Text = "T - Click TP (Toggle)"
o13.TextColor3 = Color3.new(1, 1, 1)
o13.Font = Enum.Font.SourceSansBold
o13.FontSize = Enum.FontSize.Size18
o14 = Instance.new("TextLabel", o13)
o14.BackgroundColor3 = Color3.new(1, 1, 1)
o14.BackgroundTransparency = 1
o14.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o14.BorderSizePixel = 0
o14.Position = UDim2.new(-0.59641146659851, 0, 1.1869158744812, 0)
o14.Size = UDim2.new(0, 110, 0, 24)
o14.Text = "O - Open/Close"
o14.TextColor3 = Color3.new(1, 1, 1)
o14.Font = Enum.Font.SourceSansBold
o14.FontSize = Enum.FontSize.Size18
o15 = Instance.new("TextLabel", o13)
o15.BackgroundColor3 = Color3.new(1, 1, 1)
o15.BackgroundTransparency = 1
o15.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o15.BorderSizePixel = 0
o15.Position = UDim2.new(-0.59641146659851, 0, 2.1869158744812, 0)
o15.Size = UDim2.new(0, 110, 0, 24)
o15.Text = "K - TPs Enemies to you"
o15.TextColor3 = Color3.new(1, 1, 1)
o15.Font = Enum.Font.SourceSansBold
o15.FontSize = Enum.FontSize.Size18
o16 = Instance.new("ScrollingFrame", o1)
o16.BackgroundColor3 = Color3.new(1, 1, 1)
o16.BackgroundTransparency = 1
o16.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o16.Name = "dontmind"
o16.Position = UDim2.new(0.11004784703255, 0, 1.1960784196854, 0)
o16.Size = UDim2.new(0, 372, 0, 206)
o16.ClipsDescendants = true
o17 = Instance.new("ImageLabel", o16)
o17.BackgroundColor3 = Color3.new(1, 1, 1)
o17.BackgroundTransparency = 1
o17.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o17.BorderSizePixel = 0
o17.Position = UDim2.new(0.6155914068222, 0, 0.40776699781418, 0)
o17.Size = UDim2.new(0, 118, 0, 113)
o17.Image = "rbxassetid://1268405663"
o18 = Instance.new("Frame", o1)
o18.BackgroundColor3 = Color3.new(0.337255, 0, 0)
o18.BackgroundTransparency = 0.20000000298023
o18.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o18.BorderSizePixel = 0
o18.Position = UDim2.new(0, 0, 5.2009086608887, 0)
o18.Size = UDim2.new(0, 418, 0, 11)
o19 = Instance.new("Frame", o1)
o19.BackgroundColor3 = Color3.new(0.337255, 0, 0)
o19.BackgroundTransparency = 0.20000000298023
o19.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o19.BorderSizePixel = 0
o19.Position = UDim2.new(1, 0, 1, 0)
o19.Size = UDim2.new(0, 11, 0, 225)
o20 = Instance.new("Frame", o1)
o20.BackgroundColor3 = Color3.new(0.65098, 0.435294, 0)
o20.BackgroundTransparency = 0.20000000298023
o20.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
o20.BorderSizePixel = 0
o20.Position = UDim2.new(1, 0, 0, 0)
o20.Size = UDim2.new(0, 11, 0, 51)

function espp(a)
    if a.Character and not a.Character:FindFirstChild'FatESP' then
        for i = 0,5 do
            local sg = Instance.new("SurfaceGui")
            sg.Face = i
            sg.AlwaysOnTop = true
            sg.Parent = a.Character
            sg.Name = "FatESP"
            sg.Adornee = a.Character:FindFirstChild'HumanoidRootPart'
            local fr = Instance.new("Frame", sg)
            fr.BackgroundColor3 = BrickColor.new('Really red').Color
            fr.BorderSizePixel = 0
            fr.BackgroundTransparency = 0.55
            fr.Size = UDim2.new(1,0,1,0)
        end
    end
end

function check()
    for _, a in pairs(enemyteam:children()) do
        espp(plrs[a.StatName.Text])
    end
end


function allslot()
	game.ReplicatedStorage.GameMain.Select:FireServer("BuySlot", {"2Slots1Day", 0})
	game.ReplicatedStorage.GameMain.Select:FireServer("BuySlot", {"3Slots1Day", 0})
	game.ReplicatedStorage.GameMain.Select:FireServer("BuySlot", {"4Slots1Day", 0})
end

function rubies()
	game.ReplicatedStorage.GameMain.Select:FireServer("BuySlot", {"2Slots1Day", -2e99})
end

function gm()
	if plr.Character.Humanoid then
		plr.Character.Humanoid.Name = plr.Name
		local clone = plr.Character[plr.Name]:Clone()
		clone.Parent = plr.Character
		clone.Name = "Humanoid"
		wait(0.5)
		plr.Character[plr.Name]:Destroy()
		workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
	end
end

function tpenemies()
	for _, a in pairs(enemyteam:children()) do
		local targ = plrs:FindFirstChild(a.StatName.Text)
        if targ.Character:FindFirstChild'Head' then
            targ.Character.Head.Anchored = true
            targ.Character.Head.CFrame = char.Head.CFrame
        end
	end
end

mouse.KeyDown:connect(function(key)
	if key == "x" then
		gm()
	elseif key == "n" then
		if not noclip then
			noclip = true
		else
			noclip = false
		end
	elseif key == "z" then
		if not esp then
			esp = true
		else
			for _, a in pairs(plrs:players()) do
				if a.Character and a.Character:FindFirstChild'FatESP' then
					a:Destroy()
				end
			end
			esp = false
		end
	elseif key == "o" then
		if o1.Visible then
			o1.Visible = false
		else
			o1.Visible = true
		end
	elseif key == "k" then
		tpenemies()
	elseif key == "c" then
		allslot()
	elseif key == "v" then
		rubies()
	elseif key == "t" then
		if not clicktp then
			clicktp = true
		else
			clicktp = false
		end
	elseif key == "f" then
		char:FindFirstChildOfClass'Humanoid'.WalkSpeed = char:FindFirstChildOfClass'Humanoid'.WalkSpeed + 10
	elseif key == "g" then
		char:FindFirstChildOfClass'Humanoid'.WalkSpeed = char:FindFirstChildOfClass'Humanoid'.WalkSpeed - 10
	end
end)

mouse.Button1Down:connect(function()
	if clicktp then
		char:FindFirstChild'HumanoidRootPart'.CFrame = mouse.Hit
	end
end)

while wait() do
	if redteam:FindFirstChild'SelfStats' then
        enemyteam = blueteam
    elseif blueteam:FindFirstChild'SelfStats' then
        enemyteam = redteam
    elseif not blueteam:FindFirstChild'SelfStats' and not redteam:FindFirstChild'SelfStats' then
        error('Enemy team not found')
    end
	if esp then
		check()
	else
		for _, a in pairs(enemyteam:children()) do
			local targ = a.StatName.Text
			if plrs[targ].Character:FindFirstChild'FatESP' then
				plrs[targ].Character:FindFirstChild'FatESP':Destroy()
			end
		end
	end
	if noclip then
		char:FindFirstChildOfClass'Humanoid':ChangeState(11)
	end
end