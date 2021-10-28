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

local noclipEnableLPLR = false

pcall(function()
    if sg:GetCoreGuiEnabled(2) == false then
        sg:SetCoreGuiEnabled(2, true)
    end
    if bp:FindFirstChild("NoClip Tool") then
        bp:FindFirstChild("NoClip Tool"):Destroy()
    end

    lplr.Character.Head.Touched:connect(function(obj)
        if obj ~= workspace.Terrain then
            if noclipEnableLPLR == true then
                obj.CanCollide = false
            else
                obj.CanCollide = true
            end
        end
    end)

	local tool = Instance.new("Tool")
	tool.RequiresHandle = false
	tool.Name = "NoClip Tool"
	tool.CanBeDropped = false
    tool.Parent = bp
    tool.Equipped:connect(function(mouse)
        function clickNoClip()
            if lplr.Character.Humanoid.RigType.Name == "R15" then
                if noclipEnableLPLR == false then
                    -- lplr.Character.Head.CanCollide = false
                    -- lplr.Character.UpperTorso.CanCollide = false
                    -- lplr.Character.LowerTorso.CanCollide = false
                    -- lplr.Character.LeftUpperArm.CanCollide = false
                    -- lplr.Character.LeftLowerArm.CanCollide = false
                    -- lplr.Character.LeftHand.CanCollide = false
                    -- lplr.Character.RightUpperArm.CanCollide = false
                    -- lplr.Character.RightLowerArm.CanCollide = false
                    -- lplr.Character.RightHand.CanCollide = false
                    -- lplr.Character.LeftUpperLeg.CanCollide = false
                    -- lplr.Character.LeftLowerLeg.CanCollide = false
                    -- lplr.Character.LeftFoot.CanCollide = false
                    -- lplr.Character.RightUpperLeg.CanCollide = false
                    -- lplr.Character.RightLowerLeg.CanCollide = false
                    -- lplr.Character.RightFoot.CanCollide = false
                    noclipEnableLPLR = true
                elseif noclipEnableLPLR == true then
                    -- lplr.Character.Head.CanCollide = true
                    -- lplr.Character.UpperTorso.CanCollide = true
                    -- lplr.Character.LowerTorso.CanCollide = true
                    -- lplr.Character.LeftUpperArm.CanCollide = true
                    -- lplr.Character.LeftLowerArm.CanCollide = true
                    -- lplr.Character.LeftHand.CanCollide = true
                    -- lplr.Character.RightUpperArm.CanCollide = true
                    -- lplr.Character.RightLowerArm.CanCollide = true
                    -- lplr.Character.RightHand.CanCollide = true
                    -- lplr.Character.LeftUpperLeg.CanCollide = true
                    -- lplr.Character.LeftLowerLeg.CanCollide = true
                    -- lplr.Character.LeftFoot.CanCollide = true
                    -- lplr.Character.RightUpperLeg.CanCollide = true
                    -- lplr.Character.RightLowerLeg.CanCollide = true
                    -- lplr.Character.RightFoot.CanCollide = true
                    noclipEnableLPLR = false
                end
            elseif lplr.Character.Humanoid.RigType.Name == "R6" then
                if noclipEnableLPLR == false then
                    -- lplr.Character.Head.CanCollide = false
                    -- lplr.Character.Torso.CanCollide = false
                    -- lplr.Character["Left Arm"].CanCollide = false
                    -- lplr.Character["Right Arm"].CanCollide = false
                    -- lplr.Character["Left Leg"].CanCollide = false
                    -- lplr.Character["Right Leg"].CanCollide = false
                    noclipEnableLPLR = true
                elseif noclipEnableLPLR == true then
                    -- lplr.Character.Head.CanCollide = true
                    -- lplr.Character.Torso.CanCollide = true
                    -- lplr.Character["Left Arm"].CanCollide = true
                    -- lplr.Character["Right Arm"].CanCollide = true
                    -- lplr.Character["Left Leg"].CanCollide = true
                    -- lplr.Character["Right Leg"].CanCollide = true
                    noclipEnableLPLR = false
                end   
            end
        end
    end)
    tool.Activated:connect(function()
        clickNoClip()
	end)
end)