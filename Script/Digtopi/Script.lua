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

function pointLight()
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

function firstFunc()
    pointLight()

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            pointLight()
            while wait(0.1) do
                wp.SellPad.CFrame = lplr.Character.HumanoidRootPart.CFrame
            end
        end
    )

    while wait(0.01) do
        local tg = mouse.Target
        if tg.Parent.Name == "Ore" then
            local A_1 = tg
            local A_2 = 2
            local Event = rs.Events.Break
            Event:FireServer(A_1, A_2)
        end
    end
end
spawn(
    function()
        while wait(0.1) do
            wp.SellPad.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
)
firstFunc()

-- mouse.Button1Down:connect(
--     function()
--         if not mouse.Target then
--             return
--         end
--         local tg = mouse.Target
--         if tg.Parent.Name == "Ore" then
--             local A_1 = tg
--             local A_2 = 2
--             local Event = rs.Events.Break
--             Event:FireServer(A_1, A_2)
--         end
--     end
-- )
