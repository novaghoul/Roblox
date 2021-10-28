local msggui = Instance.new("ScreenGui", game.CoreGui)
local msg = Instance.new("TextLabel", msggui)
msg.Size = UDim2.new(1, 0, 0, 0)
msg.BackgroundTransparency = 0.3
msg.BackgroundColor3 = Color3.new(0, 0, 0)
msg.BorderSizePixel = 0
msg.TextColor3 = Color3.new(255, 255, 255)
msg.Font = "ArialBold"
msg.FontSize = "Size24"
msg.Text = ""
msg.Visible = true
msg:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Bounce", 1.2)
repeat wait() until msg.Size == UDim2.new(1, 0, 1, 0)
msg.Text = "Welcome " .. game.Players.LocalPlayer.Name
wait(2)
msg.Text = "Loaded 34 modes!"
wait(2)
if game.Workspace.FilteringEnabled == false then
	msg.TextColor3 = Color3.new(0, 255, 0)
	msg.Text = "Filtering is Disabled!"
elseif game.Workspace.FilteringEnabled == true then
	msg.TextColor3 = Color3.new(255, 0, 0)
	msg.Text = "Filtering is Enabled!"
end
wait(2)
msggui:Destroy()
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local kind = "kill"
local lastkind = "none"
local name = "none"
local plrchosen = false
local mt = false
local modelMode = true
local selection = Instance.new("SelectionBox", game.CoreGui)
selection.Color = BrickColor.new("Bright red")
selection.SurfaceColor3 = Color3.new(150, 0, 0)
selection.SurfaceTransparency = 0.7
local disabled = false
local char = game.Workspace:FindFirstChild(plr.Name)
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MCSMenu"
local bg = Instance.new("ScrollingFrame", gui)
bg.Name = "BG"
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 0.5
bg.BorderColor3 = Color3.new(255, 255, 255)
bg.BorderSizePixel = 1
bg.Size = UDim2.new(0, 300, 0, 0)
bg.Position = UDim2.new(0.5, -150, 0, 40)
bg.CanvasSize = UDim2.new(0, 0, 0.2, 405)
bg.ScrollBarThickness = 5
bg.Visible = false
local hint = Instance.new("TextLabel", gui)
hint.Name = "Hint"
hint.BackgroundColor3 = Color3.new(0, 0, 0)
hint.BackgroundTransparency = 0.5
hint.BorderColor3 = Color3.new(255, 255, 255)
hint.BorderSizePixel = 1
hint.Size = UDim2.new(0, 1000, 0, 30)
hint.Position = UDim2.new(0.5, -500, 0, 5)
hint.TextColor3 = Color3.new(255, 255, 255)
hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Kill"
hint.Font = "ArialBold"
hint.FontSize = "Size18"
hint.Visible = true
local value = Instance.new("TextBox", gui)
value.Name = "value"
value.BackgroundColor3 = Color3.new(0, 0, 0)
value.BackgroundTransparency = 0.5
value.BorderColor3 = Color3.new(255, 255, 255)
value.BorderSizePixel = 1
value.Size = UDim2.new(0, 150, 0, 50)
value.Position = UDim2.new(0.5, -50, 0.5, -25)
value.Font = "ArialBold"
value.FontSize = "Size18"
value.TextColor3 = Color3.new(255, 255, 255)
value.Visible = false
local tb1 = Instance.new("TextButton", bg)
tb1.BackgroundColor3 = Color3.new(0, 0, 0)
tb1.BackgroundTransparency = 0.5
tb1.BorderSizePixel = 0
tb1.TextColor3 = Color3.new(255, 255, 255)
tb1.Name = "kill"
tb1.Font = "ArialBold"
tb1.FontSize = "Size18"
tb1.Size = UDim2.new(0.5, 0, 0, 40)
tb1.Position = UDim2.new(0, 0, 0, 0)
tb1.Text = "Kill"
local tb2 = Instance.new("TextButton", bg)
tb2.BackgroundColor3 = Color3.new(0, 0, 0)
tb2.BackgroundTransparency = 0.5
tb2.BorderSizePixel = 0
tb2.TextColor3 = Color3.new(255, 255, 255)
tb2.Name = "kick"
tb2.Font = "ArialBold"
tb2.FontSize = "Size18"
tb2.Size = UDim2.new(0.5, 0, 0, 40)
tb2.Position = UDim2.new(0.5, 0, 0, 0)
tb2.Text = "Kick"
local tb3 = Instance.new("TextButton", bg)
tb3.BackgroundColor3 = Color3.new(0, 0, 0)
tb3.BackgroundTransparency = 0.5
tb3.BorderSizePixel = 0
tb3.TextColor3 = Color3.new(255, 255, 255)
tb3.Name = "punish"
tb3.Font = "ArialBold"
tb3.FontSize = "Size18"
tb3.Size = UDim2.new(0.5, 0, 0, 40)
tb3.Position = UDim2.new(0, 0, 0, 40)
tb3.Text = "Punish"
local tb4 = Instance.new("TextButton", bg)
tb4.BackgroundColor3 = Color3.new(0, 0, 0)
tb4.BackgroundTransparency = 0.5
tb4.BorderSizePixel = 0
tb4.TextColor3 = Color3.new(255, 255, 255)
tb4.Name = "god"
tb4.Font = "ArialBold"
tb4.FontSize = "Size18"
tb4.Size = UDim2.new(0.5, 0, 0, 40)
tb4.Position = UDim2.new(0.5, 0, 0, 40)
tb4.Text = "God"
local tb5 = Instance.new("TextButton", bg)
tb5.BackgroundColor3 = Color3.new(0, 0, 0)
tb5.BackgroundTransparency = 0.5
tb5.BorderSizePixel = 0
tb5.TextColor3 = Color3.new(255, 255, 255)
tb5.Name = "sgod"
tb5.Font = "ArialBold"
tb5.FontSize = "Size18"
tb5.Size = UDim2.new(0.5, 0, 0, 40)
tb5.Position = UDim2.new(0, 0, 0, 80)
tb5.Text = "SGod"
local tb6 = Instance.new("TextButton", bg)
tb6.BackgroundColor3 = Color3.new(0, 0, 0)
tb6.BackgroundTransparency = 0.5
tb6.BorderSizePixel = 0
tb6.TextColor3 = Color3.new(255, 255, 255)
tb6.Name = "goto"
tb6.Font = "ArialBold"
tb6.FontSize = "Size18"
tb6.Size = UDim2.new(0.5, 0, 0, 40)
tb6.Position = UDim2.new(0.5, 0, 0, 80)
tb6.Text = "Goto"
local tb7 = Instance.new("TextButton", bg)
tb7.BackgroundColor3 = Color3.new(0, 0, 0)
tb7.BackgroundTransparency = 0.5
tb7.BorderSizePixel = 0
tb7.TextColor3 = Color3.new(255, 255, 255)
tb7.Name = "bring"
tb7.Font = "ArialBold"
tb7.FontSize = "Size18"
tb7.Size = UDim2.new(0.5, 0, 0, 40)
tb7.Position = UDim2.new(0, 0, 0, 120)
tb7.Text = "Bring"
local tb8 = Instance.new("TextButton", bg)
tb8.BackgroundColor3 = Color3.new(0, 0, 0)
tb8.BackgroundTransparency = 0.5
tb8.BorderSizePixel = 0
tb8.TextColor3 = Color3.new(255, 255, 255)
tb8.Name = "stun/unstun"
tb8.Font = "ArialBold"
tb8.FontSize = "Size18"
tb8.Size = UDim2.new(0.5, 0, 0, 40)
tb8.Position = UDim2.new(0.5, 0, 0, 120)
tb8.Text = "Stun/Unstun"
local tb9 = Instance.new("TextButton", bg)
tb9.BackgroundColor3 = Color3.new(0, 0, 0)
tb9.BackgroundTransparency = 0.5
tb9.BorderSizePixel = 0
tb9.TextColor3 = Color3.new(255, 255, 255)
tb9.Name = "rarms"
tb9.Font = "ArialBold"
tb9.FontSize = "Size18"
tb9.Size = UDim2.new(0.5, 0, 0, 40)
tb9.Position = UDim2.new(0, 0, 0, 160)
tb9.Text = "Remove Arms"
local tb10 = Instance.new("TextButton", bg)
tb10.BackgroundColor3 = Color3.new(0, 0, 0)
tb10.BackgroundTransparency = 0.5
tb10.BorderSizePixel = 0
tb10.TextColor3 = Color3.new(255, 255, 255)
tb10.Name = "rlegs"
tb10.Font = "ArialBold"
tb10.FontSize = "Size18"
tb10.Size = UDim2.new(0.5, 0, 0, 40)
tb10.Position = UDim2.new(0.5, 0, 0, 160)
tb10.Text = "Remove Legs"
local tb11 = Instance.new("TextButton", bg)
tb11.BackgroundColor3 = Color3.new(0, 0, 0)
tb11.BackgroundTransparency = 0.5
tb11.BorderSizePixel = 0
tb11.TextColor3 = Color3.new(255, 255, 255)
tb11.Name = "rlimbs"
tb11.Font = "ArialBold"
tb11.FontSize = "Size18"
tb11.Size = UDim2.new(0.5, 0, 0, 40)
tb11.Position = UDim2.new(0, 0, 0, 200)
tb11.Text = "Remove Limbs"
local tb12 = Instance.new("TextButton", bg)
tb12.BackgroundColor3 = Color3.new(0, 0, 0)
tb12.BackgroundTransparency = 0.5
tb12.BorderSizePixel = 0
tb12.TextColor3 = Color3.new(255, 255, 255)
tb12.Name = "rhats"
tb12.Font = "ArialBold"
tb12.FontSize = "Size18"
tb12.Size = UDim2.new(0.5, 0, 0, 40)
tb12.Position = UDim2.new(0.5, 0, 0, 200)
tb12.Text = "Remove Hats"
local tb13 = Instance.new("TextButton", bg)
tb13.BackgroundColor3 = Color3.new(0, 0, 0)
tb13.BackgroundTransparency = 0.5
tb13.BorderSizePixel = 0
tb13.TextColor3 = Color3.new(255, 255, 255)
tb13.Name = "rface"
tb13.Font = "ArialBold"
tb13.FontSize = "Size18"
tb13.Size = UDim2.new(0.5, 0, 0, 40)
tb13.Position = UDim2.new(0, 0, 0, 240)
tb13.Text = "Remove Face"
local tb14 = Instance.new("TextButton", bg)
tb14.BackgroundColor3 = Color3.new(0, 0, 0)
tb14.BackgroundTransparency = 0.5
tb14.BorderSizePixel = 0
tb14.TextColor3 = Color3.new(255, 255, 255)
tb14.Name = "naked"
tb14.Font = "ArialBold"
tb14.FontSize = "Size18"
tb14.Size = UDim2.new(0.5, 0, 0, 40)
tb14.Position = UDim2.new(0.5, 0, 0, 240)
tb14.Text = "Naked"
local tb15 = Instance.new("TextButton", bg)
tb15.BackgroundColor3 = Color3.new(0, 0, 0)
tb15.BackgroundTransparency = 0.5
tb15.BorderSizePixel = 0
tb15.TextColor3 = Color3.new(255, 255, 255)
tb15.Name = "sit"
tb15.Font = "ArialBold"
tb15.FontSize = "Size18"
tb15.Size = UDim2.new(0.5, 0, 0, 40)
tb15.Position = UDim2.new(0, 0, 0, 280)
tb15.Text = "Sit"
local tb16 = Instance.new("TextButton", bg)
tb16.BackgroundColor3 = Color3.new(0, 0, 0)
tb16.BackgroundTransparency = 0.5
tb16.BorderSizePixel = 0
tb16.TextColor3 = Color3.new(255, 255, 255)
tb16.Name = "jump"
tb16.Font = "ArialBold"
tb16.FontSize = "Size18"
tb16.Size = UDim2.new(0.5, 0, 0, 40)
tb16.Position = UDim2.new(0.5, 0, 0, 280)
tb16.Text = "Jump"
local tb17 = Instance.new("TextButton", bg)
tb17.BackgroundColor3 = Color3.new(0, 0, 0)
tb17.BackgroundTransparency = 0.5
tb17.BorderSizePixel = 0
tb17.TextColor3 = Color3.new(255, 255, 255)
tb17.Name = "fling"
tb17.Font = "ArialBold"
tb17.FontSize = "Size18"
tb17.Size = UDim2.new(0.5, 0, 0, 40)
tb17.Position = UDim2.new(0, 0, 0, 320)
tb17.Text = "Fling"
local tb18 = Instance.new("TextButton", bg)
tb18.BackgroundColor3 = Color3.new(0, 0, 0)
tb18.BackgroundTransparency = 0.5
tb18.BorderSizePixel = 0
tb18.TextColor3 = Color3.new(255, 255, 255)
tb18.Name = "outofbody"
tb18.Font = "ArialBold"
tb18.FontSize = "Size18"
tb18.Size = UDim2.new(0.5, 0, 0, 40)
tb18.Position = UDim2.new(0.5, 0, 0, 320)
tb18.Text = "Out of Body"
local tb19 = Instance.new("TextButton", bg)
tb19.BackgroundColor3 = Color3.new(0, 0, 0)
tb19.BackgroundTransparency = 0.5
tb19.BorderSizePixel = 0
tb19.TextColor3 = Color3.new(255, 255, 255)
tb19.Name = "stools"
tb19.Font = "ArialBold"
tb19.FontSize = "Size18"
tb19.Size = UDim2.new(0.5, 0, 0, 40)
tb19.Position = UDim2.new(0, 0, 0, 360)
tb19.Text = "Steal Tools"
local tb20 = Instance.new("TextButton", bg)
tb20.BackgroundColor3 = Color3.new(0, 0, 0)
tb20.BackgroundTransparency = 0.5
tb20.BorderSizePixel = 0
tb20.TextColor3 = Color3.new(255, 255, 255)
tb20.Name = "rtools"
tb20.Font = "ArialBold"
tb20.FontSize = "Size18"
tb20.Size = UDim2.new(0.5, 0, 0, 40)
tb20.Position = UDim2.new(0.5, 0, 0, 360)
tb20.Text = "Remove Tools"
local tb21 = Instance.new("TextButton", bg)
tb21.BackgroundColor3 = Color3.new(0, 0, 0)
tb21.BackgroundTransparency = 0.5
tb21.BorderSizePixel = 0
tb21.TextColor3 = Color3.new(255, 255, 255)
tb21.Name = "ctools"
tb21.Font = "ArialBold"
tb21.FontSize = "Size18"
tb21.Size = UDim2.new(0.5, 0, 0, 40)
tb21.Position = UDim2.new(0, 0, 0, 400)
tb21.Text = "Copy Tools"
local tb22 = Instance.new("TextButton", bg)
tb22.BackgroundColor3 = Color3.new(0, 0, 0)
tb22.BackgroundTransparency = 0.5
tb22.BorderSizePixel = 0
tb22.TextColor3 = Color3.new(255, 255, 255)
tb22.Name = "delete"
tb22.Font = "ArialBold"
tb22.FontSize = "Size18"
tb22.Size = UDim2.new(0.5, 0, 0, 40)
tb22.Position = UDim2.new(0.5, 0, 0, 400)
tb22.Text = "Delete"
local tb23 = Instance.new("TextButton", bg)
tb23.BackgroundColor3 = Color3.new(0, 0, 0)
tb23.BackgroundTransparency = 0.5
tb23.BorderSizePixel = 0
tb23.TextColor3 = Color3.new(255, 255, 255)
tb23.Name = "walkspeed"
tb23.Font = "ArialBold"
tb23.FontSize = "Size18"
tb23.Size = UDim2.new(0.5, 0, 0, 40)
tb23.Position = UDim2.new(0, 0, 0, 440)
tb23.Text = "Walkspeed"
local tb24 = Instance.new("TextButton", bg)
tb24.BackgroundColor3 = Color3.new(0, 0, 0)
tb24.BackgroundTransparency = 0.5
tb24.BorderSizePixel = 0
tb24.TextColor3 = Color3.new(255, 255, 255)
tb24.Name = "jumpheight"
tb24.Font = "ArialBold"
tb24.FontSize = "Size18"
tb24.Size = UDim2.new(0.5, 0, 0, 40)
tb24.Position = UDim2.new(0.5, 0, 0, 440)
tb24.Text = "Jumpheight"
local tb25 = Instance.new("TextButton", bg)
tb25.BackgroundColor3 = Color3.new(0, 0, 0)
tb25.BackgroundTransparency = 0.5
tb25.BorderSizePixel = 0
tb25.TextColor3 = Color3.new(255, 255, 255)
tb25.Name = "maxhealth"
tb25.Font = "ArialBold"
tb25.FontSize = "Size18"
tb25.Size = UDim2.new(0.5, 0, 0, 40)
tb25.Position = UDim2.new(0, 0, 0, 480)
tb25.Text = "Maxhealth"
local tb26 = Instance.new("TextButton", bg)
tb26.BackgroundColor3 = Color3.new(0, 0, 0)
tb26.BackgroundTransparency = 0.5
tb26.BorderSizePixel = 0
tb26.TextColor3 = Color3.new(255, 255, 255)
tb26.Name = "health"
tb26.Font = "ArialBold"
tb26.FontSize = "Size18"
tb26.Size = UDim2.new(0.5, 0, 0, 40)
tb26.Position = UDim2.new(0.5, 0, 0, 480)
tb26.Text = "Health"
local tb27 = Instance.new("TextButton", bg)
tb27.BackgroundColor3 = Color3.new(0, 0, 0)
tb27.BackgroundTransparency = 0.5
tb27.BorderSizePixel = 0
tb27.TextColor3 = Color3.new(255, 255, 255)
tb27.Name = "team"
tb27.Font = "ArialBold"
tb27.FontSize = "Size18"
tb27.Size = UDim2.new(0.5, 0, 0, 40)
tb27.Position = UDim2.new(0, 0, 0, 520)
tb27.Text = "Team"
local tb28 = Instance.new("TextButton", bg)
tb28.BackgroundColor3 = Color3.new(0, 0, 0)
tb28.BackgroundTransparency = 0.5
tb28.BorderSizePixel = 0
tb28.TextColor3 = Color3.new(255, 255, 255)
tb28.Name = "freeze"
tb28.Font = "ArialBold"
tb28.FontSize = "Size18"
tb28.Size = UDim2.new(0.5, 0, 0, 40)
tb28.Position = UDim2.new(0.5, 0, 0, 520)
tb28.Text = "Freeze: On/Off"
local tb29 = Instance.new("TextButton", bg)
tb29.BackgroundColor3 = Color3.new(0, 0, 0)
tb29.BackgroundTransparency = 0.5
tb29.BorderSizePixel = 0
tb29.TextColor3 = Color3.new(255, 255, 255)
tb29.Name = "anchor"
tb29.Font = "ArialBold"
tb29.FontSize = "Size18"
tb29.Size = UDim2.new(0.5, 0, 0, 40)
tb29.Position = UDim2.new(0, 0, 0, 560)
tb29.Text = "Anchor: On/Off"
local tb30 = Instance.new("TextButton", bg)
tb30.BackgroundColor3 = Color3.new(0, 0, 0)
tb30.BackgroundTransparency = 0.5
tb30.BorderSizePixel = 0
tb30.TextColor3 = Color3.new(255, 255, 255)
tb30.Name = "collide"
tb30.Font = "ArialBold"
tb30.FontSize = "Size18"
tb30.Size = UDim2.new(0.5, 0, 0, 40)
tb30.Position = UDim2.new(0.5, 0, 0, 560)
tb30.Text = "Collide: On/Off"
local tb31 = Instance.new("TextButton", bg)
tb31.BackgroundColor3 = Color3.new(0, 0, 0)
tb31.BackgroundTransparency = 0.5
tb31.BorderSizePixel = 0
tb31.TextColor3 = Color3.new(255, 255, 255)
tb31.Name = "kidnap"
tb31.Font = "ArialBold"
tb31.FontSize = "Size18"
tb31.Size = UDim2.new(0.5, 0, 0, 40)
tb31.Position = UDim2.new(0, 0, 0, 600)
tb31.Text = "Kidnap: On/Off"
local tb32 = Instance.new("TextButton", bg)
tb32.BackgroundColor3 = Color3.new(0, 0, 0)
tb32.BackgroundTransparency = 0.5
tb32.BorderSizePixel = 0
tb32.TextColor3 = Color3.new(255, 255, 255)
tb32.Name = "fire"
tb32.Font = "ArialBold"
tb32.FontSize = "Size18"
tb32.Size = UDim2.new(0.5, 0, 0, 40)
tb32.Position = UDim2.new(0.5, 0, 0, 600)
tb32.Text = "Fire: On/Off"
local tb33 = Instance.new("TextButton", bg)
tb33.BackgroundColor3 = Color3.new(0, 0, 0)
tb33.BackgroundTransparency = 0.5
tb33.BorderSizePixel = 0
tb33.TextColor3 = Color3.new(255, 255, 255)
tb33.Name = "smoke"
tb33.Font = "ArialBold"
tb33.FontSize = "Size18"
tb33.Size = UDim2.new(0.5, 0, 0, 40)
tb33.Position = UDim2.new(0, 0, 0, 640)
tb33.Text = "Smoke: On/Off"
local tb34 = Instance.new("TextButton", bg)
tb34.BackgroundColor3 = Color3.new(0, 0, 0)
tb34.BackgroundTransparency = 0.5
tb34.BorderSizePixel = 0
tb34.TextColor3 = Color3.new(255, 255, 255)
tb34.Name = "sparkles"
tb34.Font = "ArialBold"
tb34.FontSize = "Size18"
tb34.Size = UDim2.new(0.5, 0, 0, 40)
tb34.Position = UDim2.new(0.5, 0, 0, 640)
tb34.Text = "Sparkles: On/Off"
mouse.Move:connect(function()
	if game.CoreGui:FindFirstChild("SelectionBox") ~= nil then
		if disabled == false then
			local target = mouse.Target
			if not target then
				selection.Adornee = nil
			elseif modelMode then
				if mt == true then
					selection.Adornee = target
					if kind == "anchor" then
						if target.Anchored == true then
							selection.Color = BrickColor.new("Bright green")
							selection.SurfaceColor3 = Color3.new(0, 150, 0)
						elseif target.Anchored == false then
							selection.Color = BrickColor.new("Bright red")
							selection.SurfaceColor3 = Color3.new(150, 0, 0)
						end
					elseif kind == "collide" then
						if target.CanCollide == true then
							selection.Color = BrickColor.new("Bright green")
							selection.SurfaceColor3 = Color3.new(0, 150, 0)
						elseif target.CanCollide == false then
							selection.Color = BrickColor.new("Bright red")
							selection.SurfaceColor3 = Color3.new(150, 0, 0)
						end
					end
				else
					selection.Color = BrickColor.new("Bright red")
					selection.SurfaceColor3 = Color3.new(150, 0, 0)
					if target.Parent:FindFirstChild("Humanoid") then
					selection.Adornee = target.Parent
					elseif target.Parent.Parent:FindFirstChild("Humanoid") then
						selection.Adornee = target.Parent.Parent
					else
						selection.Adornee = nil
					end
				end
			else
				selection.Adornee = nil
			end
		elseif disabled == true then
			selection.Adornee = nil
		end
	end
	if value.Visible == true then
		if game.Players:FindFirstChild(name) == nil then
			name = "none"
			value.Visible = false
		end
	end
end)
mouse.Button1Down:connect(function()
	if mouse.Target ~= nil then
		if kind == "kill" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp:BreakJoints()
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent:BreakJoints()
				end
		elseif kind == "kick" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Name)
				plrr:Remove()
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Parent.Name)
				plrr:Remove()
			end
		elseif kind == "punish" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp:Destroy()
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent:Destroy()
			end
		elseif kind == "god" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp.Humanoid.MaxHealth = math.huge
				tp.Humanoid.Health = math.huge
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent.Humanoid.MaxHealth = math.huge
				tp.Parent.Humanoid.Health = math.huge
			end
		elseif kind == "sgod" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp.Humanoid.MaxHealth = 1000000000
				tp.Humanoid.Health = 1000000000
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent.Humanoid.MaxHealth = 1000000000
				tp.Parent.Humanoid.Health = 1000000000
			end
		elseif kind == "goto" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				plr.Character:MoveTo(tp.Head.Position)
			elseif tp.Parent:FindFirstChild("Humanoid") then
				plr.Character:MoveTo(tp.Parent.Head.Position)
			end
		elseif kind == "bring" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp:MoveTo(plr.Character.Head.Position)
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent:MoveTo(plr.Character.Head.Position)
			end
		elseif kind == "stun/unstun" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Humanoid.PlatformStand == false then
					tp.Humanoid.PlatformStand = true
				elseif tp.Humanoid.PlatformStand == true then
					tp.Humanoid.PlatformStand = false
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Humanoid.PlatformStand == false then
					tp.Parent.Humanoid.PlatformStand = true
				elseif tp.Parent.Humanoid.PlatformStand == true then
					tp.Parent.Humanoid.PlatformStand = false
				end
			end
		elseif kind == "rarms" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp:FindFirstChild("Left Arm") then
					tp["Left Arm"]:Destroy()
				end
				if tp:FindFirstChild("Right Arm") then
					tp["Right Arm"]:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent:FindFirstChild("Left Arm") then
					tp.Parent["Left Arm"]:Destroy()
				end
				if tp.Parent:FindFirstChild("Right Arm") then
					tp.Parent["Right Arm"]:Destroy()
				end
			end
		elseif kind == "rlegs" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp:FindFirstChild("Left Leg") then
					tp["Left Leg"]:Destroy()
				end
				if tp:FindFirstChild("Right Leg") then
					tp["Right Leg"]:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent:FindFirstChild("Left Leg") then
					tp.Parent["Left Leg"]:Destroy()
				end
				if tp.Parent:FindFirstChild("Right Leg") then
					tp.Parent["Right Leg"]:Destroy()
				end
			end
		elseif kind == "rlimbs" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp:FindFirstChild("Left Leg") then
					tp["Left Leg"]:Destroy()
				end
				if tp:FindFirstChild("Right Leg") then
					tp["Right Leg"]:Destroy()
				end
				if tp:FindFirstChild("Left Arm") then
					tp["Left Arm"]:Destroy()
				end
				if tp:FindFirstChild("Right Arm") then
					tp["Right Arm"]:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent:FindFirstChild("Left Leg") then
					tp.Parent["Left Leg"]:Destroy()
				end
				if tp.Parent:FindFirstChild("Right Leg") then
					tp.Parent["Right Leg"]:Destroy()
				end
				if tp.Parent:FindFirstChild("Left Arm") then
					tp.Parent["Left Arm"]:Destroy()
				end
				if tp.Parent:FindFirstChild("Right Arm") then
					tp.Parent["Right Arm"]:Destroy()
				end
			end
		elseif kind == "rhats" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Head:FindFirstChild("HeadWeld") then
					repeat
						tp.Head.HeadWeld:Destroy()
						wait()
					until tp.Head:FindFirstChild("HeadWeld") == nil
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Head:FindFirstChild("HeadWeld") then
					repeat
						tp.Parent.Head.HeadWeld:Destroy()
						wait()
					until tp.Parent.Head:FindFirstChild("HeadWeld") == nil
				end
			end
		elseif kind == "rface" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Head:FindFirstChild("face") then
					tp.Head.face:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Head:FindFirstChild("face") then
					tp.Parent.Head.face:Destroy()
				end
			end
		elseif kind == "naked" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp:FindFirstChild("Shirt") then
					tp.Shirt:Destroy()
				end
				if tp:FindFirstChild("Pants") then
					tp.Pants:Destroy()
				end
				local bc = tp:FindFirstChild("Body Colors")
				if bc ~= nil then
					bc.HeadColor = BrickColor.new("Nougat")
					bc.LeftArmColor = BrickColor.new("Nougat")
					bc.RightArmColor = BrickColor.new("Nougat")
					bc.LeftLegColor = BrickColor.new("Nougat")
					bc.RightLegColor = BrickColor.new("Nougat")
					bc.TorsoColor = BrickColor.new("Nougat")
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent:FindFirstChild("Shirt") then
					tp.Parent.Shirt:Destroy()
				end
				if tp.Parent:FindFirstChild("Pants") then
					tp.Parent.Pants:Destroy()
				end
				local bc = tp.Parent:FindFirstChild("Body Colors")
				if bc ~= nil then
					bc.HeadColor = BrickColor.new("Nougat")
					bc.LeftArmColor = BrickColor.new("Nougat")
					bc.RightArmColor = BrickColor.new("Nougat")
					bc.LeftLegColor = BrickColor.new("Nougat")
					bc.RightLegColor = BrickColor.new("Nougat")
					bc.TorsoColor = BrickColor.new("Nougat")
				end
			end
		elseif kind == "sit" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp.Humanoid.Sit = true
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent.Humanoid.Sit = true
			end
		elseif kind == "jump" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				tp.Humanoid.Jump = true
			elseif tp.Parent:FindFirstChild("Humanoid") then
				tp.Parent.Humanoid.Jump = true
			end
		elseif kind == "fling" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local b = Instance.new("BodyPosition")
				b.position = Vector3.new(500, 500, 500)
				b.maxForce = Vector3.new(35000, 35000, 35000)
				b.Parent = tp.Torso
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local b = Instance.new("BodyPosition")
				b.position = Vector3.new(500, 500, 500)
				b.maxForce = Vector3.new(35000, 35000, 35000)
				b.Parent = tp.Parent.Torso
			end
		elseif kind == "outofbody" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.HumanoidRootPart:FindFirstChild("RootJoint") then
					tp.HumanoidRootPart.RootJoint:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.HumanoidRootPart:FindFirstChild("RootJoint") then
					tp.Parent.HumanoidRootPart.RootJoint:Destroy()
				end
			end
		elseif kind == "stools" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v.Parent = plr.Backpack
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Parent.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v.Parent = plr.Backpack
				end
			end
		elseif kind == "rtools" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v:Destroy()
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Parent.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v:Destroy()
				end
			end
		elseif kind == "ctools" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v:Clone().Parent = plr.Backpack
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Parent.Name)
				for _,v in pairs(plrr.Backpack:GetChildren()) do
					v:Clone().Parent = plr.Backpack
				end
			end
		elseif kind == "delete" then
			local tp = mouse.Target
			tp:Destroy()
		elseif kind == "walkspeed" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				name = tp.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Walkspeed Value"
			elseif tp.Parent:FindFirstChild("Humanoid") then
				name = tp.Parent.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Walkspeed Value"
			end
		elseif kind == "jumpheight" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				name = tp.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Jumpheight Value"
			elseif tp.Parent:FindFirstChild("Humanoid") then
				name = tp.Parent.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Jumpheight Value"
			end
		elseif kind == "maxhealth" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				name = tp.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Maxhealth Value"
			elseif tp.Parent:FindFirstChild("Humanoid") then
				name = tp.Parent.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Maxhealth Value"
			end
		elseif kind == "health" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				name = tp.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Health Value"
			elseif tp.Parent:FindFirstChild("Humanoid") then
				name = tp.Parent.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Health Value"
			end
		elseif kind == "team" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local plrr = game.Players:FindFirstChild(tp.Name)
				name = tp.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Team Value"
			elseif tp.Parent:FindFirstChild("Humanoid") then
				name = tp.Parent.Name
				plrchosen = true
				value.Visible = true
				value.Text = "Team Value"
			end
		elseif kind == "freeze" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Torso.Anchored == false then
					tp.Torso.Anchored = true
				elseif tp.Torso.Anchored == true then
					tp.Torso.Anchored = false
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Torso.Anchored == false then
					tp.Parent.Torso.Anchored = true
				elseif tp.Parent.Torso.Anchored == true then
					tp.Parent.Torso.Anchored = false
				end
			end
		elseif kind == "anchor" then
			local tp = mouse.Target
			if tp.Anchored == false then
				tp.Anchored = true
			elseif tp.Anchored == true then
				tp.Anchored = false
			end
		elseif kind == "collide" then
			local tp = mouse.Target
			if tp.CanCollide == false then
				tp.CanCollide = true
			elseif tp.CanCollide == true then
				tp.CanCollide = false
			end
		elseif kind == "kidnap" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				local name = Instance.new("StringValue", gui)
				name.Name = tp.Name
				if tp.Torso:FindFirstChild("BodyPosition") then
					name:Destroy()
					tp.Torso.BodyPosition:Destroy()
				else
					local b = Instance.new("BodyPosition")
					b.maxForce = Vector3.new(15000, 15000, 15000)
					b.Parent = tp.Torso
					repeat
						if tp == nil then
							name:Destroy()
						end
						if tp.Torso:FindFirstChild("BodyPosition") == nil then
							name:Destroy()
						end
						if tp.Humanoid.Health == 0 then
							name:Destroy()
							if tp.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Torso.BodyPosition:Destroy()
							end
						end
						if plr.Character == nil then
							name:Destroy()
							if tp.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Torso.BodyPosition:Destroy()
							end
						end
						if plr.Character.Humanoid.Health == 0 then
							name:Destroy()
							if tp.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Torso.BodyPosition:Destroy()
							end
						end
						b.position = plr.Character.Torso.Position
						wait()
					until name == nil
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				local name = Instance.new("StringValue", gui)
				name.Name = tp.Parent.Name
				if tp.Parent.Torso:FindFirstChild("BodyPosition") then
					name:Destroy()
					tp.Parent.Torso.BodyPosition:Destroy()
				else
					local b = Instance.new("BodyPosition")
					b.maxForce = Vector3.new(25000, 25000, 25000)
					b.Parent = tp.Parent.Torso
					repeat
						if tp.Parent == nil then
							name:Destroy()
						end
						if tp.Parent.Torso:FindFirstChild("BodyPosition") == nil then
							name:Destroy()
						end
						if tp.Parent.Humanoid.Health == 0 then
							name:Destroy()
							if tp.Parent.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Parent.Torso.BodyPosition:Destroy()
							end
						end
						if plr.Character == nil then
							name:Destroy()
							if tp.Parent.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Parent.Torso.BodyPosition:Destroy()
							end
						end
						if plr.Character.Humanoid.Health == 0 then
							name:Destroy()
							if tp.Parent.Torso:FindFirstChild("BodyPosition") ~= nil then
								tp.Parent.Torso.BodyPosition:Destroy()
							end
						end
						b.position = plr.Character.Torso.Position
						wait()
					until name == nil
				end
			end
		elseif kind == "fire" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Head:FindFirstChild("Fire") ~= nil then
					tp.Head.Fire:Destroy()
				elseif tp.Head:FindFirstChild("Fire") == nil then
					local hfire = Instance.new("Fire", tp.Head)
					hfire.Heat = 0
					hfire.Size = 4
				end
				if tp.Torso:FindFirstChild("Fire") ~= nil then
					tp.Torso.Fire:Destroy()
				elseif tp.Torso:FindFirstChild("Fire") == nil then
					local tfire = Instance.new("Fire", tp.Torso)
					tfire.Heat = 0
					tfire.Size = 4
				end
				if tp:FindFirstChild("Left Arm") ~= nil then
					if tp["Left Arm"]:FindFirstChild("Fire") ~= nil then
						tp["Left Arm"].Fire:Destroy()
					elseif tp["Left Arm"]:FindFirstChild("Fire") == nil then
						local lafire = Instance.new("Fire", tp["Left Arm"])
						lafire.Heat = 0
						lafire.Size = 4
					end
				end
				if tp:FindFirstChild("Right Arm") ~= nil then
					if tp["Right Arm"]:FindFirstChild("Fire") ~= nil then
						tp["Right Arm"].Fire:Destroy()
					elseif tp["Right Arm"]:FindFirstChild("Fire") == nil then
						local rafire = Instance.new("Fire", tp["Right Arm"])
						rafire.Heat = 0
						rafire.Size = 4
					end
				end
				if tp:FindFirstChild("Left Leg") ~= nil then
					if tp["Left Leg"]:FindFirstChild("Fire") ~= nil then
						tp["Left Leg"].Fire:Destroy()
					elseif tp["Left Leg"]:FindFirstChild("Fire") == nil then
						local lefire = Instance.new("Fire", tp["Left Leg"])
						lefire.Heat = 0
						lefire.Size = 4
					end
				end
				if tp:FindFirstChild("Right Leg") ~= nil then
					if tp["Right Leg"]:FindFirstChild("Fire") ~= nil then
						tp["Right Leg"].Fire:Destroy()
					elseif tp["Right Leg"]:FindFirstChild("Fire") == nil then
						local lefire = Instance.new("Fire", tp["Right Leg"])
						lefire.Heat = 0
						lefire.Size = 4
					end
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Head:FindFirstChild("Fire") ~= nil then
					tp.Parent.Head.Fire:Destroy()
				elseif tp.Parent.Head:FindFirstChild("Fire") == nil then
					local hfire = Instance.new("Fire", tp.Parent.Head)
					hfire.Heat = 0
					hfire.Size = 4
				end
				if tp.Parent.Torso:FindFirstChild("Fire") ~= nil then
					tp.Parent.Torso.Fire:Destroy()
				elseif tp.Parent.Torso:FindFirstChild("Fire") == nil then
					local tfire = Instance.new("Fire", tp.Parent.Torso)
					tfire.Heat = 0
					tfire.Size = 4
				end
				if tp.Parent:FindFirstChild("Left Arm") ~= nil then
					if tp.Parent["Left Arm"]:FindFirstChild("Fire") ~= nil then
						tp.Parent["Left Arm"].Fire:Destroy()
					elseif tp.Parent["Left Arm"]:FindFirstChild("Fire") == nil then
						local lafire = Instance.new("Fire", tp.Parent["Left Arm"])
						lafire.Heat = 0
						lafire.Size = 4
					end
				end
				if tp.Parent:FindFirstChild("Right Arm") ~= nil then
					if tp.Parent["Right Arm"]:FindFirstChild("Fire") ~= nil then
						tp.Parent["Right Arm"].Fire:Destroy()
					elseif tp.Parent["Right Arm"]:FindFirstChild("Fire") == nil then
						local rafire = Instance.new("Fire", tp.Parent["Right Arm"])
						rafire.Heat = 0
						rafire.Size = 4
					end
				end
				if tp.Parent:FindFirstChild("Left Leg") ~= nil then
					if tp.Parent["Left Leg"]:FindFirstChild("Fire") ~= nil then
						tp.Parent["Left Leg"].Fire:Destroy()
					elseif tp.Parent["Left Leg"]:FindFirstChild("Fire") == nil then
						local lefire = Instance.new("Fire", tp.Parent["Left Leg"])
						lefire.Heat = 0
						lefire.Size = 4
					end
				end
				if tp.Parent:FindFirstChild("Right Leg") ~= nil then
					if tp.Parent["Right Leg"]:FindFirstChild("Fire") ~= nil then
						tp.Parent["Right Leg"].Fire:Destroy()
					elseif tp.Parent["Right Leg"]:FindFirstChild("Fire") == nil then
						local lefire = Instance.new("Fire", tp.Parent["Right Leg"])
						lefire.Heat = 0
						lefire.Size = 4
					end
				end
			end
		elseif kind == "smoke" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Head:FindFirstChild("Smoke") ~= nil then
					tp.Head.Smoke:Destroy()
				elseif tp.Head:FindFirstChild("Smoke") == nil then
					local hsmoke = Instance.new("Smoke", tp.Head)
				end
				if tp.Torso:FindFirstChild("Smoke") ~= nil then
					tp.Torso.Smoke:Destroy()
				elseif tp.Torso:FindFirstChild("Smoke") == nil then
					local tsmoke = Instance.new("Smoke", tp.Torso)
				end
				if tp:FindFirstChild("Left Arm") ~= nil then
					if tp["Left Arm"]:FindFirstChild("Smoke") ~= nil then
						tp["Left Arm"].Smoke:Destroy()
					elseif tp["Left Arm"]:FindFirstChild("Smoke") == nil then
						local lasmoke = Instance.new("Smoke", tp["Left Arm"])
					end
				end
				if tp:FindFirstChild("Right Arm") ~= nil then
					if tp["Right Arm"]:FindFirstChild("Smoke") ~= nil then
						tp["Right Arm"].Smoke:Destroy()
					elseif tp["Right Arm"]:FindFirstChild("Smoke") == nil then
						local rasmoke = Instance.new("Smoke", tp["Right Arm"])
					end
				end
				if tp:FindFirstChild("Left Leg") ~= nil then
					if tp["Left Leg"]:FindFirstChild("Smoke") ~= nil then
						tp["Left Leg"].Smoke:Destroy()
					elseif tp["Left Leg"]:FindFirstChild("Smoke") == nil then
						local lesmoke = Instance.new("Smoke", tp["Left Leg"])
					end
				end
				if tp:FindFirstChild("Right Leg") ~= nil then
					if tp["Right Leg"]:FindFirstChild("Smoke") ~= nil then
						tp["Right Leg"].Smoke:Destroy()
					elseif tp["Right Leg"]:FindFirstChild("Smoke") == nil then
						local lesmoke = Instance.new("Smoke", tp["Right Leg"])
					end
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Head:FindFirstChild("Smoke") ~= nil then
					tp.Parent.Head.Smoke:Destroy()
				elseif tp.Parent.Head:FindFirstChild("Smoke") == nil then
					local hsmoke = Instance.new("Smoke", tp.Parent.Head)
				end
				if tp.Parent.Torso:FindFirstChild("Smoke") ~= nil then
					tp.Parent.Torso.Smoke:Destroy()
				elseif tp.Parent.Torso:FindFirstChild("Smoke") == nil then
					local tsmoke = Instance.new("Smoke", tp.Parent.Torso)
				end
				if tp.Parent:FindFirstChild("Left Arm") ~= nil then
					if tp.Parent["Left Arm"]:FindFirstChild("Smoke") ~= nil then
						tp.Parent["Left Arm"].Smoke:Destroy()
					elseif tp.Parent["Left Arm"]:FindFirstChild("Smoke") == nil then
						local lasmoke = Instance.new("Smoke", tp.Parent["Left Arm"])
					end
				end
				if tp.Parent:FindFirstChild("Right Arm") ~= nil then
					if tp.Parent["Right Arm"]:FindFirstChild("Smoke") ~= nil then
						tp.Parent["Right Arm"].Smoke:Destroy()
					elseif tp.Parent["Right Arm"]:FindFirstChild("Smoke") == nil then
						local rasmoke = Instance.new("Smoke", tp.Parent["Right Arm"])
					end
				end
				if tp.Parent:FindFirstChild("Left Leg") ~= nil then
					if tp.Parent["Left Leg"]:FindFirstChild("Smoke") ~= nil then
						tp.Parent["Left Leg"].Smoke:Destroy()
					elseif tp.Parent["Left Leg"]:FindFirstChild("Smoke") == nil then
						local lesmoke = Instance.new("Smoke", tp.Parent["Left Leg"])
					end
				end
				if tp.Parent:FindFirstChild("Right Leg") ~= nil then
					if tp.Parent["Right Leg"]:FindFirstChild("Smoke") ~= nil then
						tp.Parent["Right Leg"].Smoke:Destroy()
					elseif tp.Parent["Right Leg"]:FindFirstChild("Smoke") == nil then
						local lesmoke = Instance.new("Smoke", tp.Parent["Right Leg"])
					end
				end
			end
		elseif kind == "sparkles" then
			local tp = mouse.Target.Parent
			if tp:FindFirstChild("Humanoid") then
				if tp.Head:FindFirstChild("Sparkles") ~= nil then
					tp.Head.Sparkles:Destroy()
				elseif tp.Head:FindFirstChild("Sparkles") == nil then
					local hspark = Instance.new("Sparkles", tp.Head)
				end
				if tp.Torso:FindFirstChild("Sparkles") ~= nil then
					tp.Torso.Sparkles:Destroy()
				elseif tp.Torso:FindFirstChild("Sparkles") == nil then
					local tspark = Instance.new("Sparkles", tp.Torso)
				end
				if tp:FindFirstChild("Left Arm") ~= nil then
					if tp["Left Arm"]:FindFirstChild("Sparkles") ~= nil then
						tp["Left Arm"].Sparkles:Destroy()
					elseif tp["Left Arm"]:FindFirstChild("Sparkles") == nil then
						local laspark = Instance.new("Sparkles", tp["Left Arm"])
					end
				end
				if tp:FindFirstChild("Right Arm") ~= nil then
					if tp["Right Arm"]:FindFirstChild("Sparkles") ~= nil then
						tp["Right Arm"].Sparkles:Destroy()
					elseif tp["Right Arm"]:FindFirstChild("Sparkles") == nil then
						local raspark = Instance.new("Sparkles", tp["Right Arm"])
					end
				end
				if tp:FindFirstChild("Left Leg") ~= nil then
					if tp["Left Leg"]:FindFirstChild("Sparkles") ~= nil then
						tp["Left Leg"].Sparkles:Destroy()
					elseif tp["Left Leg"]:FindFirstChild("Sparkles") == nil then
						local lespark = Instance.new("Sparkles", tp["Left Leg"])
					end
				end
				if tp:FindFirstChild("Right Leg") ~= nil then
					if tp["Right Leg"]:FindFirstChild("Sparkles") ~= nil then
						tp["Right Leg"].Sparkles:Destroy()
					elseif tp["Right Leg"]:FindFirstChild("Sparkles") == nil then
						local lespark = Instance.new("Sparkles", tp["Right Leg"])
					end
				end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Head:FindFirstChild("Sparkles") ~= nil then
					tp.Parent.Head.Sparkles:Destroy()
				elseif tp.Parent.Head:FindFirstChild("Sparkles") == nil then
					local hspark = Instance.new("Sparkles", tp.Parent.Head)
				end
				if tp.Parent.Torso:FindFirstChild("Sparkles") ~= nil then
					tp.Parent.Torso.Sparkles:Destroy()
				elseif tp.Parent.Torso:FindFirstChild("Sparkles") == nil then
					local tspark = Instance.new("Sparkles", tp.Parent.Torso)
				end
				if tp.Parent:FindFirstChild("Left Arm") ~= nil then
					if tp.Parent["Left Arm"]:FindFirstChild("Sparkles") ~= nil then
						tp.Parent["Left Arm"].Sparkles:Destroy()
					elseif tp.Parent["Left Arm"]:FindFirstChild("Sparkles") == nil then
						local laspark = Instance.new("Sparkles", tp.Parent["Left Arm"])
					end
				end
				if tp.Parent:FindFirstChild("Right Arm") ~= nil then
					if tp.Parent["Right Arm"]:FindFirstChild("Sparkles") ~= nil then
						tp.Parent["Right Arm"].Sparkles:Destroy()
					elseif tp.Parent["Right Arm"]:FindFirstChild("Sparkles") == nil then
						local raspark = Instance.new("Sparkles", tp.Parent["Right Arm"])
					end
				end
				if tp.Parent:FindFirstChild("Left Leg") ~= nil then
					if tp.Parent["Left Leg"]:FindFirstChild("Sparkles") ~= nil then
						tp.Parent["Left Leg"].Sparkles:Destroy()
					elseif tp.Parent["Left Leg"]:FindFirstChild("Sparkles") == nil then
						local lespark = Instance.new("Sparkles", tp.Parent["Left Leg"])
					end
				end
				if tp.Parent:FindFirstChild("Right Leg") ~= nil then
					if tp.Parent["Right Leg"]:FindFirstChild("Sparkles") ~= nil then
						tp.Parent["Right Leg"].Sparkles:Destroy()
					elseif tp.Parent["Right Leg"]:FindFirstChild("Sparkles") == nil then
						local lespark = Instance.new("Sparkles", tp.Parent["Right Leg"])
					end
				end
			end
		end
	end
end)
tb1.MouseButton1Click:connect(function()
	kind = "kill"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Kill"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb2.MouseButton1Click:connect(function()
	kind = "kick"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Kick"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb3.MouseButton1Click:connect(function()
	kind = "punish"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Punish"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb4.MouseButton1Click:connect(function()
	kind = "god"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: God"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb5.MouseButton1Click:connect(function()
	kind = "sgod"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: SGod"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb6.MouseButton1Click:connect(function()
	kind = "goto"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Goto"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb7.MouseButton1Click:connect(function()
	kind = "bring"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Bring"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb8.MouseButton1Click:connect(function()
	kind = "stun/unstun"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Stun/Unstun"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb9.MouseButton1Click:connect(function()
	kind = "rarms"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Arms"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb10.MouseButton1Click:connect(function()
	kind = "rlegs"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Legs"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb11.MouseButton1Click:connect(function()
	kind = "rlimbs"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Limbs"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb12.MouseButton1Click:connect(function()
	kind = "rhats"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Hats"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb13.MouseButton1Click:connect(function()
	kind = "rface"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Face"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb14.MouseButton1Click:connect(function()
	kind = "naked"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Naked"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb15.MouseButton1Click:connect(function()
	kind = "sit"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Sit"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb16.MouseButton1Click:connect(function()
	kind = "jump"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Jump"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb17.MouseButton1Click:connect(function()
	kind = "fling"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Fling"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb18.MouseButton1Click:connect(function()
	kind = "outofbody"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Out of Body"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb19.MouseButton1Click:connect(function()
	kind = "stools"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Steal Tools"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb20.MouseButton1Click:connect(function()
	kind = "rtools"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Remove Tools"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb21.MouseButton1Click:connect(function()
	kind = "ctools"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Copy Tools"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb22.MouseButton1Click:connect(function()
	selection.Color = BrickColor.new("Bright red")
	selection.SurfaceColor3 = Color3.new(150, 0, 0)
	kind = "delete"
	mt = true
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Delete"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb23.MouseButton1Click:connect(function()
	kind = "walkspeed"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Walkspeed"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb24.MouseButton1Click:connect(function()
	kind = "jumpheight"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Jumpheight"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb25.MouseButton1Click:connect(function()
	kind = "maxhealth"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Maxhealth"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb26.MouseButton1Click:connect(function()
	kind = "health"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Health"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb27.MouseButton1Click:connect(function()
	kind = "team"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Team"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb28.MouseButton1Click:connect(function()
	kind = "freeze"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Freeze: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb29.MouseButton1Click:connect(function()
	kind = "anchor"
	mt = true
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Anchor: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb30.MouseButton1Click:connect(function()
	kind = "collide"
	mt = true
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Collide: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb31.MouseButton1Click:connect(function()
	kind = "kidnap"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Kidnap: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb32.MouseButton1Click:connect(function()
	kind = "fire"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Fire: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb33.MouseButton1Click:connect(function()
	kind = "smoke"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Smoke: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
tb34.MouseButton1Click:connect(function()
	kind = "sparkles"
	mt = false
	hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Sparkles: On/Off"
	bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
	repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
	bg.Visible = false
	disabled = false
end)
mouse.KeyDown:connect(function(key)
	if key == "z" or key == "Z" then
		bg.Visible = true
		bg:TweenSize(UDim2.new(0, 300, 0, 400), "Out", "Quad", 0.5)
		repeat wait() until bg.Size == UDim2.new(0, 300, 0, 400)
	elseif key == "x" or key == "X" then
		disabled = true
		lastkind = kind
		kind = "disabled"
		hint.Text = "Mouse Click Script | Press Z to switch mode | Press X to disable the script | Press C to hide/show the hint | Mode: Disabled"
		bg:TweenSize(UDim2.new(0, 300, 0, 0), "Out", "Quad", 0.5)
		repeat wait() until bg.Size == UDim2.new(0, 300, 0, 0)
		bg.Visible = false
	elseif key:byte() == 13 then
		if kind == "walkspeed" then
			local child = game.Workspace:FindFirstChild(name)
			if value.Text == "Walkspeed Value" or value.Text == "" then
			else
				if plrchosen == true then
					child.Humanoid.WalkSpeed = value.Text
					value.Visible = false
					name = "none"
					plrchosen = false
				end
			end
		elseif kind == "jumpheight" then
			local child = game.Workspace:FindFirstChild(name)
			if value.Text == "Jumpheight Value" or value.Text == "" then
			else
				if plrchosen == true then
					child.Humanoid.JumpPower = value.Text
					value.Visible = false
					name = "none"
					plrchosen = false
				end
			end
		elseif kind == "maxhealth" then
			local child = game.Workspace:FindFirstChild(name)
			if value.Text == "Maxhealth Value" or value.Text == "" then
			else
				if plrchosen == true then
					child.Humanoid.MaxHealth = value.Text
					value.Visible = false
					name = "none"
					plrchosen = false
				end
			end
		elseif kind == "health" then
			local child = game.Workspace:FindFirstChild(name)
			if value.Text == "Health Value" or value.Text == "" then
			else
				if plrchosen == true then
					child.Humanoid.Health = value.Text
					value.Visible = false
					name = "none"
					plrchosen = false
				end
			end
		elseif kind == "team" then
			local plrr = game.Players:FindFirstChild(name)
			if value.Text == "Team Value" or value.Text == "" then
			else
				if plrchosen == true then
					local t = game.Teams
					if t:FindFirstChild(value.Text) then
						local te = t:FindFirstChild(value.Text)
						local tc = te.TeamColor
						plrr.TeamColor = tc
						value.Visible = false
						name = "none"
						plrchosen = false
					end
				end
			end
		end
	elseif key == "c" or key == "C" then
		if hint.Visible == true then
			hint:TweenPosition(UDim2.new(0.5, -500, 0, -65), "Out", "Bounce", 0.5)
			repeat wait() until hint.Position == UDim2.new(0.5, -500, 0, -65)
			hint.Visible = false
		elseif hint.Visible == false then
			hint.Visible = true
			hint:TweenPosition(UDim2.new(0.5, -500, 0, 5), "Out", "Bounce", 0.5)
			repeat wait() until hint.Position == UDim2.new(0.5, -500, 0, 5)
		end
	end
end)