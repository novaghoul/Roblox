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

function createESP(parent)
    local bgui = Instance.new("BillboardGui", parent.Head)
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
    wp.ChildAdded:connect(
        function(m)
            if m:IsA("Model") then
                if m:WaitForChild("Head") then
                    wait(0.1)
                    createESP(m)
                end
            end
        end
    )
end
enableESPCode()

function espFirst()
    for _, o in pairs(wp:GetChildren()) do
        if o:IsA("Model") then
            spawn(
                function()
                    if o:WaitForChild("Head") then
                        wait(0.1)
                        createESP(o)
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
