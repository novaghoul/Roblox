loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

if sg:GetCoreGuiEnabled(2) == false then
    sg:SetCoreGuiEnabled(2, true)
end
if bp:FindFirstChild("Delete Tool") then
    bp:FindFirstChild("Delete Tool"):Destroy()
end

local a = Instance.new("Tool")
a.RequiresHandle = false
a.Name = "Delete Tool"
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
            c.Adornee:Destroy()
            c.Adornee = nil
        end
    end
)
