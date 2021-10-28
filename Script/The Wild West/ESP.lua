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

_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.ws_g = 27
_G.jp_g = 30
_G.noclipAll = false
_G.speedEN = false
_G.speedDash = 30

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
TRANSPARENCY = 0.5 --//Transparency of the ESP
HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
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

function checkPart(obj)
    if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name ~= "HumanoidRootPart" then
        return true
    end
end


function actualESP(obj)
    for i = 0, 5 do
        surface = Instance.new("SurfaceGui", obj) --//Creates the SurfaceGui
        surface.Face = Enum.NormalId[_G.faces[i + 1]] --//Adjusts the Face and chooses from the face table
        surface.AlwaysOnTop = true

        frame = Instance.new("Frame", surface) --//Creates the viewable Frame
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BorderSizePixel = 0
        frame.BackgroundTransparency = TRANSPARENCY
        frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1], ENEMYCOLOR[2], ENEMYCOLOR[3]) --//If in another Team
    end
end

function createHealthbar(hrp)
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
-- -----------------------------------------------------------------------------------
function checkTeams(gui, o)
    if gui:IsA("TextLabel") then
        if tostring(o.Team) == "Cowboys" then
            gui.TextColor3 = Color3.fromRGB(253, 234, 141)
        else
            gui.TextColor3 = Color3.fromRGB(196, 40, 28)
        end
        o:GetPropertyChangedSignal("Team"):connect(
            function()
                if tostring(o.Team) == "Cowboys" then
                    gui.TextColor3 = Color3.fromRGB(253, 234, 141)
                else
                    gui.TextColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        )
    end
end

function createESP(c) --//Checks and calls the proper function
    local bgui = Instance.new("BillboardGui", c.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = c.DisplayName
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    checkTeams(nam, c)
    for _, v in pairs(c.Character:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c.Character:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        createESP(o)
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
                        createESP(newPlayer)
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
                        createESP(o)          
                    end
                end
            )
        end
    end
end
espFirst()

-------------------------------------------------------------
--------------------------Other------------------------------

function createESPItem(parent, r, g, b, fontSize, name)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = name
    nam.BackgroundTransparency = 1
    nam.TextSize = fontSize
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function eventESPOther(parent)
    if tostring(parent.Parent.Name) == "Animals" then
        if parent.Name == "Cow" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐄")
        elseif parent.Name == "Bison" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐂")
        elseif parent.Name == "Gator" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐊")
        elseif parent.Name == "Bear" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🐻")
        elseif parent.Name == "Deer" then
            createESPItem(parent.Head, 242, 243, 243, 14, "🦌")
        end
    end
end

function funcAnimals()
    for _, v in pairs(wp.WORKSPACE_Entities.Animals:GetChildren()) do
        eventESPOther(v)
    end
    wp.WORKSPACE_Entities.Animals.ChildAdded:connect(
        function(m)
            wait(0.1)
            eventESPOther(m)
        end
    )
end
funcAnimals()

function statsGun()
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'MaxAmmo') then
            v.FireSpeed = 100
            v.ReloadSpeed = 100
            v.LoadSpeed = 100
            v.LoadEndSpeed = 100
            v.BaseRecoil = 0
            v.HeadshotMult = 2
            v.ProjectileAccuracy = 1
            v.ProjectilePenetration = 1
            v.HorseAccuracyModifier = 1
        end
    end
end

function funcF()
    statsGun()
    lplr.Backpack.ChildAdded:connect(
        function(m)
            statsGun()
        end
    )
end
funcF()

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

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "[" then
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)