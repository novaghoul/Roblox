repeat wait() until game:IsLoaded()

getgenv().uis = game:GetService("UserInputService")
getgenv().cg = game:GetService("CoreGui")
getgenv().sg = game:GetService("StarterGui")
getgenv().wp = game:GetService("Workspace")
getgenv().cmr = wp.Camera
getgenv().rs = game:GetService("ReplicatedStorage")
getgenv().rsd = game:GetService("RunService").RenderStepped
getgenv().lgt = game:GetService("Lighting")
getgenv().plrs = game:GetService("Players")
getgenv().lplr = plrs.LocalPlayer
getgenv().bp = lplr.Backpack
getgenv().mouse = lplr:GetMouse()
getgenv().virtualUser = game:GetService("VirtualUser")

getgenv().ws_g = 20
getgenv().jp_g = 50

getgenv().disTeleport = -5

getgenv().noclipAll = false
getgenv().noclipAllKey = "f"

getgenv().r6 = {"Head", "Torso"}
getgenv().r15 = {"Head", "UpperTorso", "LowerTorso"}

if faces == nil then
	getgenv().faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
end

getgenv().ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
getgenv().TRANSPARENCY = 0.5 --//Transparency of the ESP
getgenv().HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

if hitBoxSize == nil then
	getgenv().hitBoxSize = {5, 5, 5}
	getgenv().hitBoxBody = "Head"
	getgenv().hitBoxColor = "Really blue"
	getgenv().hitBoxTransparency = 1
	-- HumanoidRootPart
end

getgenv().checkRigType = function()
    if lplr.Character:FindFirstChild("Torso") then
        return r6
    else
        return r15
    end
end

getgenv().SendChat = function(tle, msg) -- Send a chat to the game chat
	sg:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = tle .. " : " .. msg
		}
	)
end

getgenv().notify = function(tle, msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = tle,
            Text = msg,
            Duration = 3
        }
    )
end

getgenv().checkReturn = function(tle, msg)
	if sg:GetCoreGuiEnabled(3) == false then
		return notify(tle, msg)
	else
		return SendChat(tle, msg)
	end
end

getgenv().createESPItem = function(parent, r, g, b, fontSize, name)
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

function checkPart(obj)
    if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name ~= "HumanoidRootPart" then
        return true
    end
end

getgenv().actualESP = function(obj)
	for i = 0, 5 do
		surface = Instance.new("SurfaceGui", obj) --//Creates the SurfaceGui
		surface.Face = Enum.NormalId[faces[i + 1]] --//Adjusts the Face and chooses from the face table
		surface.AlwaysOnTop = true

		frame = Instance.new("Frame", surface) --//Creates the viewable Frame
		frame.Size = UDim2.new(1, 0, 1, 0)
		frame.BorderSizePixel = 0
		frame.BackgroundTransparency = TRANSPARENCY
		frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1], ENEMYCOLOR[2], ENEMYCOLOR[3]) --//If in another Team
	end
end

getgenv().createHealthbar = function(hrp)
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

getgenv().createHitBox = function(parent)
    local sizeBody = parent[hitBoxBody].Size.x
    parent[hitBoxBody].Size = Vector3.new(hitBoxSize[1], hitBoxSize[2], hitBoxSize[3])
    parent[hitBoxBody].Transparency = hitBoxTransparency
    parent[hitBoxBody].BrickColor = BrickColor.new(hitBoxColor)
    parent[hitBoxBody].Material = "Neon"
    parent[hitBoxBody].CanCollide = false

    parent[hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent[hitBoxBody].Size = Vector3.new(hitBoxSize[1], hitBoxSize[2], hitBoxSize[3])
                parent[hitBoxBody].CanCollide = false
            end
        end
    )
end

getgenv().plrlist = function(thing)
    for _, v in pairs(plrs:GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(thing)) then
            return v
        end
    end
end

getgenv().eventTP = function(parent)
    local pos = lplr.Character.HumanoidRootPart.CFrame
    for _, v in pairs(parent) do
        if tostring(v.Name) ~= tostring(lplr.Name) then
            local charplayer = v.Character
            if charplayer ~= nil then
                charplayer.HumanoidRootPart.Anchored = false
                charplayer.HumanoidRootPart.CanCollide = false
                charplayer.HumanoidRootPart.CFrame = pos * CFrame.new(0, 2, disTeleport)
                charplayer.HumanoidRootPart.Anchored = true
            end
        end
    end
end

getgenv().resetTP = function()
    for _, v in pairs(plrs:GetPlayers()) do
        if tostring(v.Name) ~= tostring(lplr.Name) then
            local charplayer = v.Character
            if charplayer ~= nil then
                charplayer.HumanoidRootPart.Anchored = false
                charplayer.HumanoidRootPart.CanCollide = false
            end
        end
    end
end

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)