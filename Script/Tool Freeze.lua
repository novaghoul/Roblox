uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

pcall(function()
    if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild("Freeze Tool") then
        bp:FindFirstChild("Freeze Tool"):Destroy()
    end
	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "Freeze Tool"
	tool.CanBeDropped = false
    tool.Parent = bp
    tool.Equipped:connect(function(mouse)
        function clickFreeze()
            if not mouse.Target then return end
            if mouse.Target.Locked == true then mouse.Target.Locked = false end
            local tp = mouse.Target.Parent
            if tp:FindFirstChild("Humanoid") then
                if tp.Humanoid.RigType.Name == "R15" then
                    if tp.UpperTorso.Anchored == false then
                        tp.UpperTorso.Anchored = true
                    elseif tp.UpperTorso.Anchored == true then
                        tp.UpperTorso.Anchored = false
                    end
                    if tp.LowerTorso.Anchored == false then
                        tp.LowerTorso.Anchored = true
                    elseif tp.LowerTorso.Anchored == true then
                        tp.LowerTorso.Anchored = false
                    end
                elseif tp.Humanoid.RigType.Name == "R6" then
                    if tp.Torso.Anchored == false then
                        tp.Torso.Anchored = true
                    elseif tp.Torso.Anchored == true then
                        tp.Torso.Anchored = false
                    end
                end
			elseif tp.Parent:FindFirstChild("Humanoid") then
				if tp.Parent.Humanoid.RigType.Name == "R15" then
                    if tp.Parent.UpperTorso.Anchored == false then
                        tp.Parent.UpperTorso.Anchored = true
                    elseif tp.Parent.UpperTorso.Anchored == true then
                        tp.Parent.UpperTorso.Anchored = false
                    end
                    if tp.Parent.LowerTorso.Anchored == false then
                        tp.Parent.LowerTorso.Anchored = true
                    elseif tp.Parent.LowerTorso.Anchored == true then
                        tp.Parent.LowerTorso.Anchored = false
                    end
                elseif tp.Parent.Humanoid.RigType.Name == "R6" then
                    if tp.Parent.Torso.Anchored == false then
                        tp.Parent.Torso.Anchored = true
                    elseif tp.Parent.Torso.Anchored == true then
                        tp.Parent.Torso.Anchored = false
                    end
                end
			end
        end
    end)
    tool.Activated:connect(function()
        clickFreeze()
	end)
end)