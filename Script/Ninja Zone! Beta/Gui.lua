--]]
plr = game:GetService('Players').LocalPlayer
B1 = 0
B2 = 0
B3 = 0
B4 = 0
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local GuiCredit = Instance.new("TextLabel")
local ScriptCredit = Instance.new("TextLabel")
local GameName = Instance.new("TextLabel")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local Button3 = Instance.new("TextButton")
local Light2 = Instance.new("TextLabel")
local Button4 = Instance.new("TextButton")
local Light4 = Instance.new("TextLabel")
local Light1 = Instance.new("TextLabel")
local Light3 = Instance.new("TextLabel")
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 0.44999998807907
Frame.BorderSizePixel = 0
Frame.LayoutOrder = 1
Frame.Position = UDim2.new(0, 510, 0, 204)
Frame.Selectable = true
Frame.Size = UDim2.new(0, 394, 0, 223)
Frame.Draggable = true
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Frame_2.BackgroundTransparency = 0.5
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 1, 0)
Frame_2.Size = UDim2.new(0, 402, 0, 8)
Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Frame_3.BackgroundTransparency = 0.5
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(1, 0, 0, 0)
Frame_3.Size = UDim2.new(0, 8, 0, 223)
Button1.TextWrapped = true
Button2.TextWrapped = true
Button3.TextWrapped = true
Button4.TextWrapped = true
GuiCredit.Name = "GuiCredit"
GuiCredit.Parent = Frame
GuiCredit.BackgroundColor3 = Color3.new(1, 1, 1)
GuiCredit.BackgroundTransparency = 1
GuiCredit.Position = UDim2.new(0, 0, 0.905829608, 0)
GuiCredit.Size = UDim2.new(0, 194, 0, 21)
GuiCredit.Font = Enum.Font.SourceSans
GuiCredit.TextColor3 = Color3.new(0, 0, 0)
GuiCredit.TextSize = 16
ScriptCredit.Name = "ScriptCredit"
ScriptCredit.Parent = Frame
ScriptCredit.BackgroundColor3 = Color3.new(1, 1, 1)
ScriptCredit.BackgroundTransparency = 1
ScriptCredit.Position = UDim2.new(0, 194, 0, 202)
ScriptCredit.Size = UDim2.new(0, 208, 0, 21)
ScriptCredit.Font = Enum.Font.SourceSans
ScriptCredit.TextColor3 = Color3.new(0, 0, 0)
ScriptCredit.TextSize = 16
ScriptCredit.TextWrapped = true
GameName.Name = "GameName"
GameName.Parent = Frame
GameName.BackgroundColor3 = Color3.new(1, 1, 1)
GameName.BackgroundTransparency = 1
GameName.BorderSizePixel = 0
GameName.Size = UDim2.new(0, 394, 0, 21)
GameName.Font = Enum.Font.SourceSans
GameName.TextColor3 = Color3.new(0, 0, 0)
GameName.TextSize = 16
Button1.Name = "Button1"
Button1.Parent = Frame
Button1.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Button1.BackgroundTransparency = 0.40000000596046
Button1.BorderColor3 = Color3.new(0.32549, 0.32549, 0.32549)
Button1.BorderSizePixel = 0
Button1.Position = UDim2.new(0, 23, 0, 49)
Button1.Size = UDim2.new(0, 149, 0, 45)
Button1.Font = Enum.Font.SourceSans
Button1.Text = ""
Button1.TextColor3 = Color3.new(0, 0, 0)
Button1.TextSize = 14
Button2.Name = "Button2"
Button2.Parent = Frame
Button2.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Button2.BackgroundTransparency = 0.40000000596046
Button2.BorderColor3 = Color3.new(0.32549, 0.32549, 0.32549)
Button2.BorderSizePixel = 0
Button2.Position = UDim2.new(0, 23, 0, 127)
Button2.Size = UDim2.new(0, 149, 0, 46)
Button2.Font = Enum.Font.SourceSans
Button2.Text = ""
Button2.TextColor3 = Color3.new(0, 0, 0)
Button2.TextSize = 14
Button3.Name = "Button3"
Button3.Parent = Frame
Button3.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Button3.BackgroundTransparency = 0.40000000596046
Button3.BorderColor3 = Color3.new(0.32549, 0.32549, 0.32549)
Button3.BorderSizePixel = 0
Button3.Position = UDim2.new(0, 223, 0, 49)
Button3.Size = UDim2.new(0, 149, 0, 45)
Button3.Font = Enum.Font.SourceSans
Button3.Text = ""
Button3.TextColor3 = Color3.new(0, 0, 0)
Button3.TextSize = 14
Light2.Name = "Light2"
Light2.Parent = Frame
Light2.BackgroundColor3 = Color3.new(0, 0, 0)
Light2.BorderSizePixel = 0
Light2.Position = UDim2.new(0, 162, 0, 127)
Light2.Size = UDim2.new(0, 10, 0, 10)
Light2.Font = Enum.Font.SourceSans
Light2.Text = ""
Light2.TextColor3 = Color3.new(0, 0, 0)
Light2.TextSize = 14
Button4.Name = "Button4"
Button4.Parent = Frame
Button4.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Button4.BackgroundTransparency = 0.40000000596046
Button4.BorderColor3 = Color3.new(0.32549, 0.32549, 0.32549)
Button4.BorderSizePixel = 0
Button4.Position = UDim2.new(0, 223, 0, 127)
Button4.Size = UDim2.new(0, 149, 0, 46)
Button4.Font = Enum.Font.SourceSans
Button4.Text = ""
Button4.TextColor3 = Color3.new(0, 0, 0)
Button4.TextSize = 14
Light4.Name = "Light4"
Light4.Parent = Frame
Light4.BackgroundColor3 = Color3.new(0, 0, 0)
Light4.BorderSizePixel = 0
Light4.Position = UDim2.new(0, 362, 0, 127)
Light4.Size = UDim2.new(0, 10, 0, 10)
Light4.Font = Enum.Font.SourceSans
Light4.Text = ""
Light4.TextColor3 = Color3.new(0, 0, 0)
Light4.TextSize = 14
Light1.Name = "Light1"
Light1.Parent = Frame
Light1.BackgroundColor3 = Color3.new(0, 0, 0)
Light1.BorderSizePixel = 0
Light1.Position = UDim2.new(0, 162, 0, 49)
Light1.Size = UDim2.new(0, 10, 0, 10)
Light1.Font = Enum.Font.SourceSans
Light1.Text = ""
Light1.TextColor3 = Color3.new(0, 0, 0)
Light1.TextSize = 14
Light3.Name = "Light3"
Light3.Parent = Frame
Light3.BackgroundColor3 = Color3.new(0, 0, 0)
Light3.BorderSizePixel = 0
Light3.Position = UDim2.new(0, 362, 0, 49)
Light3.Size = UDim2.new(0, 10, 0, 10)
Light3.Font = Enum.Font.SourceSans
Light3.Text = ""
Light3.TextColor3 = Color3.new(0, 0, 0)
Light3.TextSize = 14
-------------------------------
GuiCredit.Text = "Gui ~ WhereMYCHess" 
ScriptCredit.Text = "Script ~ Idk who"-- credit yourself here if you made the script
GameName.Text = "Ninja Zone"--Enter the game name you are exploiting
-------------------------------
Button1.Text = "Kill all enemies (equip a shurkin)"

Button2.Text = "Kill all players (equip a shurkin)"

Button3.Text = "XP Farm (Must have meditate)"

Button4.Text = "Punching bag instant destruction (get near one)"
--------------------------------

Button1.MouseButton1Click:connect(function()
	if B1 == 0 then
		B1 = 1
		Light1.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --White
		while B1 == 1 do
      game:GetService('RunService').Stepped:wait()
			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				local check = v:FindFirstChildOfClass("Model")
				if check ~= nil and B1 == 1 then
					local weapon = game.Workspace[plr.Name]:FindFirstChildOfClass("Tool")
					if weapon ~= nil then
						game:GetService('RunService').Stepped:wait()
						local A_1 = v.Humanoid
						local A_2 = weapon.Name
						local Event = game:GetService("ReplicatedStorage").Remotes.Hit
						Event:FireServer(A_1, A_2)
					else
						print('Equip a Shurkin')
						B1 = 0
						Light1.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
					end
				end
			end
		end
	elseif B1 == 1 then
		B1 = 0
		Light1.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
	end
end)

Button2.MouseButton1Click:connect(function()
	if B2 == 0 then
		B2 = 1
		Light2.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --White
		while B2 == 1 do
			game:GetService('RunService').Stepped:wait()
			for i,players in pairs(game.Players:GetChildren()) do
				if players.Name ~= plr.Name and B2 == 1 then
					for a,work in pairs(game.Workspace:GetChildren()) do
						if B2 == 1 and players.Name == work.Name then
							local weapon = game.Workspace[plr.Name]:FindFirstChildOfClass("Tool")
							if weapon ~= nil and B2 == 1 then
  								game:GetService('RunService').Stepped:wait()
  								local Remote = game.ReplicatedStorage.Remotes['Hit']
  								
  								local Arguments = {
  								        [1] = Workspace[work.Name].Humanoid,
  								        [2] = weapon.Name
  								}
  								
  								Remote:FireServer(unpack(Arguments))
							else
								B2 = 0
								Light2.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
								print('Equip a weapon')
							end
						end
					end
				end
			end
		end
	elseif B2 == 1 then
		B2 = 0
		Light2.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
	end
end)
Button3.MouseButton1Click:connect(function()
	if B3 == 0 then
		B3 = 1
		Light3.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --White
		while B3 == 1 do
  			local Remote = game.ReplicatedStorage.Remotes['Reset']
  			
  			local Arguments = {
  			        [1] = "3e71eo932P"
  			}
  			
  			Remote:InvokeServer(unpack(Arguments))
      		game:GetService('RunService').Stepped:wait()
		end
	elseif B3 == 1 then
		B3 = 0
		Light3.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
	end
end)
Button4.MouseButton1Click:connect(function()
	if B4 == 0 then
		B4 = 1
		Light4.BackgroundColor3 = Color3.fromRGB(255, 255, 255) --White
		while B4 == 1 do
			game:GetService('RunService').Stepped:wait()
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Punching Bag" and B4 == 1 then
					local check = v.Bag:FindFirstChild("Model")
					if check ~= nil and v.Dead ~= true and B4 == 1 then
						local Remote = game.ReplicatedStorage.Remotes['HitBag']
								
						local Arguments = {
						        [1] = v.Bag.Model.Bag
						}
						
						Remote:FireServer(unpack(Arguments))
					end
				end
			end
		end
	elseif B4 == 1 then
		B4 = 0
		Light4.BackgroundColor3 = Color3.fromRGB(0, 0, 0) --Black
	end
end)