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
VirtualUser = game:GetService("VirtualUser")

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Chest"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent:GetChildren()) do
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
    wp.Characters.ChildAdded:connect(
        function(m)
            if tostring(m.Name) ~= tostring(lplr.Name) then
                -- local plt = plrs:FindFirstChild(m.Name)
                -- if tostring(plt.Team) ~= tostring(lplr.Team) then
                    wait(0.5)
                    createESP(m.Hitbox)
                -- end
            end
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(wp.Characters:GetChildren()) do
        if tostring(o.Name) ~= tostring(lplr.Name) then
            -- local plt = plrs:FindFirstChild(o.Name)
            -- if tostring(plt.Team) ~= tostring(lplr.Team) then
                spawn(
                    function()
                        if o.Hitbox:FindFirstChild("Head") then
                            wait(0.1)
                            createESP(o.Hitbox)
                        end
                    end
                )
            -- end
        end
    end
end
espFirst()

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)


-- -- Created by Peyton @ V3rmillion
-- local LocalPlayer, Characters, ESPList, LocalCharacter =
-- 	game:GetService("Players").LocalPlayer,
-- 	workspace.Characters,
-- 	{}
-- local Leaderboard = LocalPlayer.PlayerGui.LeaderboardGui.Leaderboard

-- local function NewCircle()
-- 	local Circle = Drawing.new("Circle")
-- 	Circle.Color = Color3.new(255, 0, 0)
-- 	Circle.Filled = true
-- 	Circle.Transparency = 0.5
-- 	Circle.Visible = true
-- 	return Circle
-- end

-- local function GetTeam(Player)
-- 	local Name = Player.Name
-- 	for i, v in next, Leaderboard.Teams:GetDescendants() do
-- 		if v.Name == "NameLabel" and v.Text == Name then
-- 			return v.Parent.Parent.Parent
-- 		end
-- 	end
-- end

-- local function Add(Character)
-- 	if Character == workspace.Characters:FindFirstChild(LocalPlayer.Name) then
-- 		LocalCharacter = Character
-- 	elseif GetTeam(Character) ~= GetTeam(LocalPlayer) then
-- 		ESPList[Character] = NewCircle()
-- 	end
-- end

-- local function Remove(Character)
-- 	if ESPList[Character] then
-- 		ESPList[Character]:Remove()
-- 		ESPList[Character] = nil
-- 	end
-- end

-- local function UpdateCircles()
-- 	for Character, v in next, ESPList do
-- 		if Character and Character.Parent ~= Characters then
-- 			Remove(Characters)
-- 		elseif Character:FindFirstChild("Hitbox") and Character.Hitbox:FindFirstChild("Head") then
-- 			local Position, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(Character.Hitbox.Head.Position)
-- 			v.Position = Vector2.new(Position.X, Position.Y)
-- 			v.Radius = 700 / Position.Z
-- 			v.Visible = OnScreen
-- 		end
-- 	end
-- end
-- -- Created by Peyton @ V3rmillion
-- for i, v in next, Characters:GetChildren() do
-- 	Add(v)
-- end
-- Characters.ChildAdded:Connect(Add)
-- Characters.ChildRemoved:Connect(Remove)
-- game:GetService("RunService").RenderStepped:Connect(UpdateCircles)