local ts = game:GetService("TweenService")
local char = game:GetService("Players").LocalPlayer.Character
local part = char.HumanoidRootPart
local tp = {
    CFrame = New_CFrame
}

function tp(CFrametp)
    ts:Create(part, TweenInfo.new((CFrametp.Position - char.HumanoidRootPart.Position).magnitude / 44,
        Enum.EasingStyle.Quad), {
        CFrame = CFrametp.CFrame
    }):Play()
end
_G.testing = true
while _G.testing do
    wait(.1)
    if game.Workspace:FindFirstChild("CombatFolder") then
        if game.Workspace:FindFirstChild("CombatFolder"):FindFirstChild(game.Players.LocalPlayer.Name) and
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(game.Workspace.CombatFolder[game.Players.LocalPlayer.Name]:GetChildren()) do
                tp(v:FindFirstChildOfClass("Part"))
            end
        end
    end
end
