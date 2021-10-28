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

if _G.faces == nil then
    _G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
end

ENEMYCOLOR = {196, 40, 28} --//Color of the ESP  of people on NOT the same team
TRANSPARENCY = 0.5 --//Transparency of the ESP
HEALTHBAR_ACTIVATED = true --//Renders the Healthbar

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
function createESP(c) --//Checks and calls the proper function
    local bgui = Instance.new("BillboardGui", c.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = c.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, v in pairs(c:GetChildren()) do
        if checkPart(v) then
            actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait(0.5)
                        createESP(characterModel)
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
                        createESP(characterModel)
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
                        createESP(o.Character)
                    end
                end
            )
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
