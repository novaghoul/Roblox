local uis = game:GetService("UserInputService")
local wp = game:GetService("Workspace")
local rs =  game:GetService("ReplicatedStorage")
local lgt = game:GetService("Lighting")
local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()

pcall(function()
	lplr.Stats.SightRange.Value = 2000000

	if rs.Events:FindFirstChild("GetServerTime") then
		rs.Events.GetServerTime:Destroy()
	end

	if rs:FindFirstChild("Fogbox") then
		rs.Fogbox:Destroy()
	end

	if lplr.Character:FindFirstChild("Fogbox") then
		lplr.Character.Fogbox:Destroy()
	end

	if lplr.PlayerScripts:FindFirstChild("Fog") then
		lplr.PlayerScripts.Fog:Destroy()
	end
end)

function espFireflyLocal()
	for _, v in pairs(wp:GetChildren()) do
		if v.Name == "FireflyLocal" then
			if v:FindFirstChild("EGUI") then
				v.EGUI:Destroy()
			end
			local bgui = Instance.new("BillboardGui",v)
			bgui.Name = ("EGUI")
			bgui.AlwaysOnTop = true
			bgui.ExtentsOffset = Vector3.new(0,0,0)
			bgui.Size = UDim2.new(1,0,1,0)
			local nam = Instance.new("TextLabel",bgui)
			nam.Text = "F"
			nam.BackgroundTransparency = 1
			nam.TextSize = 10
			nam.Font = ("Arial")
			nam.TextColor3 = Color3.fromRGB(245, 205, 48)
			nam.Size = UDim2.new(1,0,1,0)
		end
	end
end

function espPresent()
	pcall(function()

		if lplr.Character.Torso:FindFirstChild("Attachment") then
			lplr.Character.Torso.Attachment:Destroy()
		end
		
		if lplr.Character.Torso:FindFirstChild("Track") then
			lplr.Character.Torso.Track:Destroy()
		end
		
		if wp:FindFirstChild("Present1") then
			if wp.Present1.PP:FindFirstChild("Attachment") then
				wp.Present1.PP.Attachment:Destroy()
			end
			Mushroom = wp.Present1.PP
			local Beam = Instance.new("Beam")
			Beam.Name = "Track"
			Beam.Parent = lplr.Character.Torso
			Beam.Width0 = 0.3
			Beam.Width1 = 0.3
			local Point1 = Instance.new("Attachment")
			local Point2 = Instance.new("Attachment")
			Point1.Parent = lplr.Character.Torso
			Point2.Parent = Mushroom
			Beam.Attachment0 = Point1
			Beam.Attachment1 = Point2
		end
		
		if wp:FindFirstChild("Present2") then
			if wp.Present2.PP:FindFirstChild("Attachment") then
				wp.Present2.PP.Attachment:Destroy()
			end
			Mushroom = wp.Present2.PP
			local Beam = Instance.new("Beam")
			Beam.Name = "Track"
			Beam.Parent = lplr.Character.Torso
			Beam.Width0 = 0.3
			Beam.Width1 = 0.3
			local Point1 = Instance.new("Attachment")
			local Point2 = Instance.new("Attachment")
			Point1.Parent = lplr.Character.Torso
			Point2.Parent = Mushroom
			Beam.Attachment0 = Point1
			Beam.Attachment1 = Point2
		end
		
		if wp:FindFirstChild("Present3") then
			if wp.Present3.PP:FindFirstChild("Attachment") then
				wp.Present3.PP.Attachment:Destroy()
			end
			Mushroom = wp.Present3.PP
			local Beam = Instance.new("Beam")
			Beam.Name = "Track"
			Beam.Parent = lplr.Character.Torso
			Beam.Width0 = 0.3
			Beam.Width1 = 0.3
			local Point1 = Instance.new("Attachment")
			local Point2 = Instance.new("Attachment")
			Point1.Parent = lplr.Character.Torso
			Point2.Parent = Mushroom
			Beam.Attachment0 = Point1
			Beam.Attachment1 = Point2
		end
		
		if wp:FindFirstChild("Present4") then
			if wp.Present4.PP:FindFirstChild("Attachment") then
				wp.Present4.PP.Attachment:Destroy()
			end
			Mushroom = wp.Present4.PP
			local Beam = Instance.new("Beam")
			Beam.Name = "Track"
			Beam.Parent = lplr.Character.Torso
			Beam.Width0 = 0.3
			Beam.Width1 = 0.3
			local Point1 = Instance.new("Attachment")
			local Point2 = Instance.new("Attachment")
			Point1.Parent = lplr.Character.Torso
			Point2.Parent = Mushroom
			Beam.Attachment0 = Point1
			Beam.Attachment1 = Point2
		end
		
		if wp:FindFirstChild("Present5") then
			if wp.Present5.PP:FindFirstChild("Attachment") then
				wp.Present5.PP.Attachment:Destroy()
			end
			Mushroom = wp.Present5.PP
			local Beam = Instance.new("Beam")
			Beam.Name = "Track"
			Beam.Parent = lplr.Character.Torso
			Beam.Width0 = 0.3
			Beam.Width1 = 0.3
			local Point1 = Instance.new("Attachment")
			local Point2 = Instance.new("Attachment")
			Point1.Parent = lplr.Character.Torso
			Point2.Parent = Mushroom
			Beam.Attachment0 = Point1
			Beam.Attachment1 = Point2
		end
		
	end)
end

function espNPCGiver()
	pcall(function()
	
	if lplr.Character.Head:FindFirstChild("Attachment") then
		lplr.Character.Head.Attachment:Destroy()
	end
	
	if lplr.Character.Head:FindFirstChild("Track") then
		lplr.Character.Head.Track:Destroy()
	end
	
	if wp.PassiveNPCs:FindFirstChild("NPC_Giver") then
		local NPCGiver = wp.PassiveNPCs.NPC_Giver.Head
		if NPCGiver:FindFirstChild("Attachment") then
			NPCGiver.Attachment:Destroy()
		end
		local Beam = Instance.new("Beam")
		Beam.Name = "Track"
		Beam.Parent = lplr.Character.Head
		Beam.Width0 = 0.3
		Beam.Width1 = 0.3
		local Point1 = Instance.new("Attachment")
		local Point2 = Instance.new("Attachment")
		Point1.Parent = lplr.Character.Head
		Point2.Parent = NPCGiver
		Beam.Attachment0 = Point1
		Beam.Attachment1 = Point2
	end
	
	end)
end

function destroyESPItem(typeDestroy)
	pcall(function()
		if typeDestroy == 0 then
			for _, v in pairs(wp:GetChildren()) do
				if v.Name == "FireflyLocal" then
					if v:FindFirstChild("EGUI") then
						v.EGUI:Destroy()
					end
				end
			end
		end
	end)
end

mouse.KeyDown:connect(function(keyDown)
	
	if keyDown == "c" then
		espNPCGiver()
	end
	
	if keyDown == "v" then
		espPresent()
	end
	
	if keyDown == "k" then
		espFireflyLocal()
	end
	
	if keyDown == "l" then
		destroyESPItem(0)
	end
end)