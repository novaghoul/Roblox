local LocalPlayer = game:GetService("Players").LocalPlayer
local torsoname = "Torso"
if LocalPlayer.Character:FindFirstChild("Humanoid").RigType == Enum.HumanoidRigType.R15 then
    torsoname = "UpperTorso"
end
LocalPlayer.Character:FindFirstChild("Animate").toolnone.ToolNoneAnim.AnimationId = math.huge
LocalPlayer.Character:FindFirstChild(torsoname).Anchored = true
local tool = Instance.new("Tool", LocalPlayer.Backpack)
LocalPlayer.Character:FindFirstChildOfClass("Accessory").Handle.Parent = tool
tool.Handle.Massless = true
tool.GripPos = Vector3.new(0, math.huge, 0)
tool.Parent = LocalPlayer.Character
wait()
tool.Grip = CFrame.new(Vector3.new(0, 0, 0))
LocalPlayer.Character:FindFirstChild(torsoname).Anchored = false
