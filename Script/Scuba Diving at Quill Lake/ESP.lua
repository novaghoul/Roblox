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

function firstScript()
    if not lplr.Character.Head:FindFirstChild("PLADD") then
        local plg = Instance.new("PointLight", lplr.Character.Head)
        plg.Name = ("PLADD")
        plg.Range = 200
        plg.Shadows = false
        plg.Enabled = true
        plg.Color = Color3.fromRGB(255, 255, 255)
        plg.Brightness = 1
    end
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wai(1)
            if not lplr.Character.Head:FindFirstChild("PLADD") then
                local plg = Instance.new("PointLight", lplr.Character.Head)
                plg.Name = ("PLADD")
                plg.Range = 200
                plg.Shadows = false
                plg.Enabled = true
                plg.Color = Color3.fromRGB(255, 255, 255)
                plg.Brightness = 1
            end
        end
    )
end
firstScript()

function createESPItem(parent, r, g, b, fontSize)
    local bgui = Instance.new("BillboardGui", parent)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 0, 0)
    bgui.Size = UDim2.new(1, 0, 1, 0)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = fontSize
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(r, g, b)
    nam.Size = UDim2.new(1, 0, 1, 0)
end

function findESPItem()
    for _, v in pairs(wp.LocalGroup:GetChildren()) do
        if v:IsA("Part") then
            if not v:FindFirstChild("EGUI") then
                createESPItem(v, 245, 205, 48, 10)
            end
        elseif v:IsA("Model") then
            for _, l in pairs(v:GetChildren()) do
                if l:IsA("Part") then
                    if not l:FindFirstChild("EGUI") then
                        createESPItem(l, 245, 205, 48, 10)
                    end
                end
            end
            v.ChildAdded:connect(
                function(l)
                    wait(.1)
                    if l:IsA("Part") then
                        if not l:FindFirstChild("EGUI") then
                            createESPItem(l, 245, 205, 48, 10)
                        end
                    end
                end
            )
        end
    end
end
findESPItem()

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            for _, v in pairs(wp.LocalGroup:GetChildren()) do
                if v:IsA("Part") then
                    if not v:FindFirstChild("EGUI") then
                        createESPItem(v, 245, 205, 48, 10)
                    end
                end
            end
        end
    end
)