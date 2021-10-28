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

_G = {
    currentLocation = CFrame.new(0, 0, 0),
    autoSellEN = false
}

function notify(title, msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = title,
            Text = msg,
            Duration = 3
        }
    )
end

function firstScript()
    wp.Effects.ChildAdded:connect(
        function(m)
            if tostring(m.Name) == "500" or tostring(m.Name) == "501" or tostring(m.Name) == "2" then
                wait()
                for _,v in pairs(m:GetChildren()) do
                    v.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
                end
            end
        end
    )
end
firstScript()

function autoSell()
    _G.autoSellEN = not _G.autoSellEN

    if _G.autoSellEN then
        notify("Auto Sell", "Activated")
    else
        notify("Auto Sell", "Deactivated")
    end

    while _G.autoSellEN do
        wait()
        if lplr.PlayerGui.MainGui.BackpackFullDialog.Visible == true then
            _G.currentLocation = lplr.Character.HumanoidRootPart.CFrame
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(17, 0, 41)
            wait(0.5)
            lplr.Character.HumanoidRootPart.CFrame = _G.currentLocation * CFrame.new(0, 3, 0)
            lplr.PlayerGui.MainGui.BackpackFullDialog.Visible = false
            wait(1)
            lplr.Character.HumanoidRootPart.CFrame = _G.currentLocation * CFrame.new(0, 3, 0)
            wait(1)
            lplr.Character.HumanoidRootPart.CFrame = _G.currentLocation * CFrame.new(0, 3, 0)
            wait(1)
            lplr.Character.HumanoidRootPart.CFrame = _G.currentLocation * CFrame.new(0, 3, 0)
        end
    end
end

virtualUser = game:GetService("VirtualUser")
lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "l" then
            autoSell()
        end
    end
)
