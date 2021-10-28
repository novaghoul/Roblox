uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

local faces = {"Back","Bottom","Front","Left","Right","Top"}
local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = '[OUTPUT]: ' .. String
})
end

if wsSpeed == nil then
    wsSpeed = 20
end

function enableESPCode()
	for _, o in pairs(plrs:GetPlayers()) do
		o.CharacterAdded:Connect(function(characterModel)
            wait(2)
			if tostring(o.Name) ~= tostring(lplr.Name) then
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
                                if tostring(o.Team) == "THE STALKER" then
                                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                                elseif tostring(o.Team) == "UNIT 8" then
                                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                end
                            end)
        
                            if tostring(o.Team) == "THE STALKER" then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            elseif tostring(o.Team) == "UNIT 8" then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
                    end
                end

                o:GetPropertyChangedSignal("Team"):connect(function()
                    if tostring(o.Team) == "THE STALKER" then
                        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                    elseif tostring(o.Team) == "UNIT 8" then
                        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end)

                if tostring(o.Team) == "THE STALKER" then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(o.Team) == "UNIT 8" then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end
		end)
	end

	plrs.PlayerAdded:Connect(function(newPlayer)
		newPlayer.CharacterAdded:Connect(function(characterModel)
            wait(2)
			if tostring(newPlayer.Name) ~= tostring(lplr.Name) then
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
                                if tostring(newPlayer.Team) == "THE STALKER" then
                                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                                elseif tostring(newPlayer.Team) == "UNIT 8" then
                                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                end
                            end)
        
                            if tostring(newPlayer.Team) == "THE STALKER" then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            elseif tostring(newPlayer.Team) == "UNIT 8" then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
                    end
                end

                newPlayer:GetPropertyChangedSignal("Team"):connect(function()
                    if tostring(newPlayer.Team) == "THE STALKER" then
                        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                    elseif tostring(newPlayer.Team) == "UNIT 8" then
                        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end)

                if tostring(newPlayer.Team) == "THE STALKER" then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(newPlayer.Team) == "UNIT 8" then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end
		end)
    end)
end

enableESPCode()

function espFirst()
	for _, o in pairs(plrs:GetPlayers()) do
		if tostring(o.Name) ~= tostring(lplr.Name) then
            if o.Character ~= nil then
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
                                if tostring(o.Team) == "THE STALKER" then
                                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                                elseif tostring(o.Team) == "UNIT 8" then
                                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                end
                            end)
        
                            if tostring(o.Team) == "THE STALKER" then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            elseif tostring(o.Team) == "UNIT 8" then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
                    end
                end

                o:GetPropertyChangedSignal("Team"):connect(function()
                    if tostring(o.Team) == "THE STALKER" then
                        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                    elseif tostring(o.Team) == "UNIT 8" then
                        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                    end
                end)

                if tostring(o.Team) == "THE STALKER" then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                elseif tostring(o.Team) == "UNIT 8" then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                end
            end
        end
    end
end

function infJump()
    --humanoidP.JumpPower = 50
	humanoidP:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

    humanoidP.WalkSpeed = wsSpeed

    humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(function()
    if humanoidP.WalkSpeed ~= wsSpeed then
        humanoidP.WalkSpeed = wsSpeed
        end
    end)

    lplr.CharacterAdded:Connect(function(characterModel)
        wait(1)
        humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
        humanoidP.WalkSpeed = wsSpeed
        humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(function()
            if humanoidP.WalkSpeed ~= wsSpeed then
                humanoidP.WalkSpeed = wsSpeed
            end
        end)
    end)
end

statsPlayerWs()


function changeWS(typeWS)
    if typeWS == 0 then
        wsSpeed = wsSpeed + 5
        humanoidP.WalkSpeed = wsSpeed
    elseif typeWS == 1 then
        if wsSpeed >= 0 then
            wsSpeed = wsSpeed - 5
            humanoidP.WalkSpeed = wsSpeed
        end
        if wsSpeed < 0 then
            wsSpeed = 0
            humanoidP.WalkSpeed = wsSpeed
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    
    if keyDown == " " then
		infJump()
	end

    if keyDown == "c" then
        changeWS(0)
        SendChat("Walk Speed :" .. humanoidP.WalkSpeed)
    end
    
    if keyDown == "v" then
        changeWS(1)
        SendChat("Walk Speed :" .. humanoidP.WalkSpeed)
    end
end)

espFirst()