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

spawn(
    function()
        while wait() do
            local A_1 = 1
            local Event = rs.FillBalloon
            Event:FireServer(A_1)
        end
    end
)
spawn(
    function()
        while wait(0.1) do
            for _, v in pairs(wp.UITriggers:GetChildren()) do
                if v.Name == "Sell" then
                    local A_1 = v
                    local Event = rs.Sell
                    Event:FireServer(A_1)
                end
            end
        end
    end
)

-- for _,v in pairs(wp.Destinations:GetChildren()) do
-- 	wait(0.5)
-- 	lplr.Character.HumanoidRootPart.CFrame = v.CFrame
-- end

-- game:GetService("ReplicatedStorage").Rebirth:InvokeServer()

-- game:GetService("ReplicatedStorage").BuyBalloon:InvokeServer("Unlimited")