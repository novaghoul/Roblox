spawn(function()
    while wait() do
        wait(1)
        local pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        for _, l in pairs(game:GetService("Workspace").ballsFolder:GetChildren()) do
            l.Outer.CFrame = pos
        end
        for _, l in pairs(game:GetService("Workspace").ballsFolderSnow:GetChildren()) do
            l.Outer.CFrame = pos
        end
        for _, l in pairs(game:GetService("Workspace").ballsFolderMagma:GetChildren()) do
            l.Outer.CFrame = pos
        end
        for _, l in pairs(game:GetService("Workspace").ballsFolderLavaRace:GetChildren()) do
            l.Outer.CFrame = pos
        end
        for _, l in pairs(game:GetService("Workspace").diamondsFolder:GetChildren()) do
            l.Base.CFrame = pos
        end
    end
end)

spawn(function()
    while wait() do
        local pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        for _, l in pairs(game:GetService("Workspace").ringsFolder:GetChildren()) do
            l.touchPart.CFrame = pos
        end
    end
end)


game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3380,-279, 501)


-- 2204210120
-- 2305168205