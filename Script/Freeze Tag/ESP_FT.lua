uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

local faces = {"Back","Bottom","Front","Left","Right","Top"}
local speed = 20

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = '[OUTPUT]: ' .. String
})
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
			o.CharacterAdded:Connect(function(characterModel)
				wait(1)
				local bgui = Instance.new("BillboardGui",o.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,3,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = o.Name
				nam.BackgroundTransparency = 1
				nam.TextSize = 14
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(75, 151, 75)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(o.Character:GetChildren()) do
					if p.Name == ("Head") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.Active      = true
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
							o:GetPropertyChangedSignal("Team"):connect(function()
								if tostring(o.Team) == "Runner" then
                                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                elseif tostring(o.Team) == "Tagger" then
									mf.BackgroundTransparency = 0.7
									mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
								end
							end)
						end
					end
				end

				o:GetPropertyChangedSignal("Team"):connect(function()
                    if tostring(o.Team) == "Runner" then
                        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                    elseif tostring(o.Team) == "Tagger" then
                        nam.Text = ""
                    end
                end)

			end)
		end
	end

	plrs.PlayerAdded:Connect(function(newPlayer)
		if newPlayer.Name ~= lplr.Name then
			newPlayer.CharacterAdded:Connect(function(characterModel)
				wait(1)
				local bgui = Instance.new("BillboardGui",newPlayer.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,3,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = newPlayer.Name
				nam.BackgroundTransparency = 1
				nam.TextSize = 14
				nam.Font = ("Arial")
				nam.TextColor3 = Color3.fromRGB(75, 151, 75)
				nam.Size = UDim2.new(0,200,0,50)
				for _, p in pairs(newPlayer.Character:GetChildren()) do
					if p.Name == ("Head") then 
						for _, f in pairs(faces) do
							local m = Instance.new("SurfaceGui",p)
							m.Name = ("EGUI")
							m.Face = f
							m.Active      = true
							m.AlwaysOnTop = true
							local mf = Instance.new("Frame",m)
							mf.Size = UDim2.new(1,0,1,0)
							mf.BorderSizePixel = 0
							mf.BackgroundTransparency = 0.5
							mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)

							newPlayer:GetPropertyChangedSignal("Team"):connect(function()
								if tostring(newPlayer.Team) == "Runner" then
                                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                elseif tostring(newPlayer.Team) == "Tagger" then
									mf.BackgroundTransparency = 0.7
									mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
								end
							end)
						end
					end
				end

				newPlayer:GetPropertyChangedSignal("Team"):connect(function()
                    if tostring(newPlayer.Team) == "Runner" then
                        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                    elseif tostring(newPlayer.Team) == "Tagger" then
                        nam.Text = ""
                    end
                end)
                
			end)
		end
	end)

	lplr.Character.Humanoid.WalkSpeed = speed

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(function()
        if lplr.Character.Humanoid.WalkSpeed ~= speed then
            lplr.Character.Humanoid.WalkSpeed = speed
        end
	end)
	
	lplr.CharacterAdded:Connect(function(characterModel)
        wait(0.5)
        characterModel.Humanoid.WalkSpeed = speed
        characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(function()
            if characterModel.Humanoid.WalkSpeed ~= speed then
                characterModel.Humanoid.WalkSpeed = speed
            end
        end)
	end)
end

enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
			local bgui = Instance.new("BillboardGui",o.Character.Head)
			bgui.Name = ("EGUI")
			bgui.AlwaysOnTop = true
			bgui.ExtentsOffset = Vector3.new(0,3,0)
			bgui.Size = UDim2.new(0,200,0,50)
			local nam = Instance.new("TextLabel",bgui)
			nam.Text = o.Name
			nam.BackgroundTransparency = 1
			nam.TextSize = 14
			nam.Font = ("Arial")
			nam.TextColor3 = Color3.fromRGB(75, 151, 75)
			nam.Size = UDim2.new(0,200,0,50)
			for _, p in pairs(o.Character:GetChildren()) do
				if p.Name == ("Head") then 
					for _, f in pairs(faces) do
						local m = Instance.new("SurfaceGui",p)
						m.Name = ("EGUI")
						m.Face = f
						m.Active      = true
						m.AlwaysOnTop = true
						local mf = Instance.new("Frame",m)
						mf.Size = UDim2.new(1,0,1,0)
						mf.BorderSizePixel = 0
						mf.BackgroundTransparency = 0.5
						mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)

						o:GetPropertyChangedSignal("Team"):connect(function()
                            if tostring(o.Team) == "Runner" then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            elseif tostring(o.Team) == "Tagger" then
								mf.BackgroundTransparency = 0.7
								mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            end
                        end)

                        if tostring(o.Team) == "Runner" then
                            mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                        elseif tostring(o.Team) == "Tagger" then
							mf.BackgroundTransparency = 0.7
							mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                        end
					end
				end
			end

			o:GetPropertyChangedSignal("Team"):connect(function()
                if tostring(o.Team) == "Runner" then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                elseif tostring(o.Team) == "Tagger" then
                    nam.Text = ""
                end
            end)

            if tostring(o.Team) == "Runner" then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif tostring(o.Team) == "Tagger" then
                nam.Text = ""
            end
		end
	end
end

function changeWS(typeWS)
	if typeWS == 0 then
        speed = speed + 5
        lplr.Character.Humanoid.WalkSpeed = speed
    elseif typeWS == 1 then
        if speed >= 0 then
            speed = speed - 5
            lplr.Character.Humanoid.WalkSpeed = speed
        end
        if speed < 0 then
            speed = 0
            lplr.Character.Humanoid.WalkSpeed = speed
        end
	end
end

function infJump()
	--lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(function(keyDown)
	
	if keyDown == " " then
		infJump()
	end
	
	if keyDown == "c" then
		changeWS(0)
		SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
	end
	
	if keyDown == "v" then
		changeWS(1)
		SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
	end
end)

espFirst()