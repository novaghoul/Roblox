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

while wait() do
    local A_1 = "Began"
    local A_2 = {
        ["UserInputType"] = Enum.UserInputType.MouseButton1,
        ["KeyCode"] = Enum.KeyCode.Unknown
    }
    local tp = mouse.Target

    while not tp:FindFirstChild("HumanoidRootPart") and tostring(tp.Parent) ~= "Workspace" do
        tp = tp.Parent
    end

    if tp:FindFirstChild("HumanoidRootPart") then
        local A_3 = {
            ["Target"] = tp.HumanoidRootPart,
            ["Hit"] = tp.HumanoidRootPart.CFrame
        }
        local Event = game:GetService("ReplicatedStorage").Remotes.Input
        Event:FireServer(A_1, A_2, A_3)
    end
   
end
