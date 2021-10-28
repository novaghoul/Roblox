uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

if sg:GetCoreGuiEnabled(2) == false then
    sg:SetCoreGuiEnabled(2, true)
end

if bp:FindFirstChild("Collision Tool") then
    bp:FindFirstChild("Collision Tool"):Destroy()
end

_G.CanCollided = true

local a = Instance.new("Tool")
a.RequiresHandle = false
a.Name = "Collision Tool"
a.Parent = lplr:WaitForChild("Backpack")
local b = false
local c = Instance.new("SelectionBox")
c.Color3 = Color3.new(0, 0.6, 0.6, 6)
c.Parent = lplr.PlayerGui
c.Name = "derp"
mouse.Move:connect(
    function()
        if b then
            local d = mouse.Target
            if not d then
                c.Adornee = nil
            else
                if mouse.Target.Locked == true then
                    mouse.Target.Locked = false
                end
                if d:IsA("BasePart") then
                    c.Adornee = d
                else
                    c.Adornee = nil
                end
            end
        end
    end
)
a.Equipped:Connect(
    function()
        b = true
    end
)
a.Unequipped:Connect(
    function()
        c.Adornee = nil
        b = false
    end
)
a.Activated:Connect(
    function()
        if c.Adornee then
            if _G.CanCollided == false then
                c.Adornee.CanCollide = true
                _G.CanCollided = true
            elseif _G.CanCollided == true then
                c.Adornee.CanCollide = false
                _G.CanCollided = false
            end
            c.Adornee = nil
        end
    end
)
