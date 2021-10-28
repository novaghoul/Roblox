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
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {2.5, 2.5, 2.5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

function SendChat(String) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Walk Speed and Jump Power",
            Text = msg,
            Duration = 3
        }
    )
end

if wsSpeed == nil then
	wsSpeed = 25
end

function checkReturn(String)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(String)
	else
		return SendChat(String)
	end
end

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(_G.faces) do
                local m = Instance.new("SurfaceGui", p)
                m.Name = ("EGUI")
                m.Face = f
                m.Active = true
                m.AlwaysOnTop = true
                local mf = Instance.new("Frame", m)
                mf.Size = UDim2.new(1, 0, 1, 0)
                mf.BorderSizePixel = 0
                mf.BackgroundTransparency = 0.5
                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(o.Team) ~= tostring(lplr.Team) then
                                createESP(o)
                            end
                        else
                            createESP(o)
                        end
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(newPlayer.Team) ~= tostring(lplr.Team) then
                                createESP(newPlayer)
                            end
                        else
                            createESP(newPlayer)
                        end
                    end
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:FindFirstChild("Head") then
                        wait(0.1)
                        if tostring(lplr.Team) ~= "nil" then
                            if tostring(o.Team) ~= tostring(lplr.Team) then
                                createESP(o)
                            end
                        else
                            createESP(o)
                        end
                    end
                end
            )
        end
    end
end
espFirst()

function createHitBox(parent)
    local sizeBody = parent.Character[_G.hitBoxBody].Size.x
    parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
    parent.Character[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    parent.Character[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    parent.Character[_G.hitBoxBody].Material = "Neon"
    parent.Character[_G.hitBoxBody].CanCollide = false

    parent.Character[_G.hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent.Character[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                parent.Character[_G.hitBoxBody].CanCollide = false
            end
        end
    )
end

function hitBox()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild(_G.hitBoxBody) then
                        wait(0.5)
                        createHitBox(newPlayer)
                    end
                end
            )
        end
    )

    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:WaitForChild(_G.hitBoxBody) then
                        wait(0.1)
                        createHitBox(o)
                    end
                end
            )
        end
    end
end
hitBox()

function statsPlayerWs()
	humanoidP.WalkSpeed = wsSpeed

	humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if humanoidP.WalkSpeed ~= wsSpeed then
				humanoidP.WalkSpeed = wsSpeed
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
			humanoidP.WalkSpeed = wsSpeed
			humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if humanoidP.WalkSpeed ~= wsSpeed then
						humanoidP.WalkSpeed = wsSpeed
					end
				end
			)
		end
	)
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
		if wsSpeed < 16 then
			wsSpeed = 16
			humanoidP.WalkSpeed = wsSpeed
		end
	end
end

uis.InputBegan:Connect(
	function(input, gameProcessed)
		if input.UserInputType.Value == 8 then
			if input.KeyCode.Value == 107 then
				changeWS(0)
				checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
			end

			if input.KeyCode.Value == 108 then
				changeWS(1)
				checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
			end
		end
	end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
