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

_G.ws_g = 25
_G.jp_g = 30

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
end

function eventESPItem(parent)
    spawn(function()
        if tostring(parent.Name) == "ExteriorCam" then
            createESPItem(parent.Body, 203, 132, 66, 10, "CAM")
        end
        if tostring(parent.Name) == "PowerBox" then
            createESPItem(parent.PowerDoor.Union, 245, 205, 48, 10, tostring(parent.Name))
        end
        if tostring(parent.Name) == "FileFolder" then
            createESPItem(parent.PowerDoor.Base, 245, 205, 48, 10, tostring(parent.Name))
        end
        if tostring(parent.Name) == "NPC0" then
            createESPItem(parent.Character.Head, 196, 40, 28, 10, tostring(parent.Character.Interact.ObjectName.Value))
        elseif tostring(parent.Name) == "NPC2" then
            if tostring(parent.Character.Interact.ObjectName.Value) == "Manager" then
                createESPItem(parent.Character.Head, 13, 105, 172, 10, tostring(parent.Character.Interact.ObjectName.Value))
            elseif tostring(parent.Character.Interact.ObjectName.Value) == "Civilian" then
                createESPItem(parent.Character.Head, 75, 151, 75, 10, tostring(parent.Character.Interact.ObjectName.Value))
            elseif tostring(parent.Character.Interact.ObjectName.Value) == "Employee" then
                createESPItem(parent.Character.Head, 245, 205, 48, 10, tostring(parent.Character.Interact.ObjectName.Value))
            end
        end
    end)
end

function enableESPItemsCode()
    for _, v in pairs(wp.Level.Glass:GetChildren()) do
        eventESPItem(v)
    end
    for _, v in pairs(wp.Level.Actors:GetChildren()) do
        eventESPItem(v)
    end
    for _, v in pairs(wp.Level.Geometry:GetChildren()) do
        eventESPItem(v)
    end
    wp.Level.Actors.ChildAdded:connect(function(p)
        wait(1)
        eventESPItem(p)
    end)
end
enableESPItemsCode()
-- game:GetService("Workspace").Level.Actors.NPC2.Character.Interact.ObjectName.Value

function firstScript()
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Type') then
            -- v.FireType = 1
            v.FireRate = 0
            v.FireDelay = 0
            v.ReloadSpeed = 0
            v.WalkSpeed = 2
            v.RangeMin = 100
            v.RangePref = 150
            v.RangeMax = 200
            v.DmgRangeMin = 100
            v.DmgRangeMax = 500
            v.DmgAtMin = 100
            v.DmgAtMax = 500
            -- v.PenFactor = 10
            v.RecoilXMin = 0
            v.RecoilXSpread = 0
            v.RecoilUp = 0
            v.RecoilDecrease = 0
            v.RecoilFirstShot = 0
            -- v.RecoilCam = 0
            -- v.RecoilCamTm = 0
            v.SpreadAimMin = 1
            v.SpreadAimMax = 1
            v.SpreadAimMovMin = 1
            v.SpreadAimMovMax = 1
            v.SpreadHipMin = 1
            v.SpreadHipMax = 1
            v.SpreadHipMovMin = 1
            v.SpreadHipMovMax = 1
            v.SpreadDecrease = 1
            v.SpreadIncrease = 1
            -- v.ZoomMag = 5
            v.ZoomTime = 0
            v.Concealment = 100
            v.Threat = 0
            -- v.MagazineSize = 30
            -- v.MagSize = 30
        end
    end
end
firstScript()

function statsPlayerWs()
	lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g

	lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
				lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(1)
			lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
			lplr.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed ~= _G.ws_g then
						lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G.ws_g
					end
				end
			)
		end
	)
end
statsPlayerWs()
-- game:GetService("Workspace").Level.Glass.ExteriorCam.Body
-- game:GetService("Workspace").Level.Players.Player.Interact.ObjectTip.Value
-- game:GetService("Workspace").Level.Actors.NPC0.Character.Head