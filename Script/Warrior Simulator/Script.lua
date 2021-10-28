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

_G.toolSize = {6, 6, 7.3}
_G.saveLocation = lplr.Character.HumanoidRootPart.CFrame
_G.saveLocationOn = false
_G.choseShop = "n"
_G.noclip = false
_G.speedDash = 50

_G.folderEnemies = {}

_G.hitBoxSizeEnemies = {30, 5, 30}

local sellLocation = wp.Main.Sell.Sell.Middle.CFrame
local buyLocation = wp.Main.Buy.Buy.Middle.CFrame
local sellLocationMoon = wp.Map.Moon.Main.Sell.Sell.Middle.CFrame
local buyLocationMoon = wp.Map.Moon.Main.Buy.Buy.Middle.CFrame

local sellGui = lplr.PlayerGui.SellGui.Background
sellGui.Position = UDim2.new(0.4, 0, -0.4, 0)

function firstScript()
    for _, v in pairs(wp.Map:GetChildren()) do
        if v:FindFirstChild("Enemies") then
            local fEnemies = v.Enemies
            table.insert(_G.folderEnemies, fEnemies)
        end
    end

    for i = 1, #_G.folderEnemies do
        for _, v in pairs(_G.folderEnemies[i]:GetChildren()) do
            v.HumanoidRootPart.Size =
                Vector3.new(_G.hitBoxSizeEnemies[1], _G.hitBoxSizeEnemies[2], _G.hitBoxSizeEnemies[3])
            v.HumanoidRootPart.Transparency = 0.9
            v.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
            v.HumanoidRootPart.Material = "Neon"
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart:GetPropertyChangedSignal("Size"):connect(
                function()
                    wait(0.1)
                    v.HumanoidRootPart.Size =
                        Vector3.new(_G.hitBoxSizeEnemies[1], _G.hitBoxSizeEnemies[2], _G.hitBoxSizeEnemies[3])
                    v.HumanoidRootPart.Transparency = 0.9
                    v.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    v.HumanoidRootPart.Material = "Neon"
                    v.HumanoidRootPart.CanCollide = false
                end
            )
        end
        _G.folderEnemies[i].ChildAdded:connect(
            function(m)
                wait(0.1)
                m.HumanoidRootPart.Size =
                    Vector3.new(_G.hitBoxSizeEnemies[1], _G.hitBoxSizeEnemies[2], _G.hitBoxSizeEnemies[3])
                m.HumanoidRootPart.Transparency = 0.9
                m.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                m.HumanoidRootPart.Material = "Neon"
                m.HumanoidRootPart.CanCollide = false
                m.HumanoidRootPart:GetPropertyChangedSignal("Size"):connect(
                    function()
                        wait(0.1)
                        m.HumanoidRootPart.Size =
                            Vector3.new(_G.hitBoxSizeEnemies[1], _G.hitBoxSizeEnemies[2], _G.hitBoxSizeEnemies[3])
                        m.HumanoidRootPart.Transparency = 0.9
                        m.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        m.HumanoidRootPart.Material = "Neon"
                        m.HumanoidRootPart.CanCollide = false
                    end
                )
            end
        )
    end
end
firstScript()

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/y7jWk2Nh"), true))() --WS Other
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "q" then
            local locationCurrent = lplr.Character.HumanoidRootPart.CFrame
            if _G.choseShop == "n" then
                lplr.Character.HumanoidRootPart.CFrame =
                    CFrame.new(sellLocation.X, sellLocation.Y, sellLocation.Z) * CFrame.new(0, 2, 0)
            else
                lplr.Character.HumanoidRootPart.CFrame =
                    CFrame.new(sellLocationMoon.X, sellLocationMoon.Y, sellLocationMoon.Z) * CFrame.new(0, 2, 0)
            end
            wait(0.5)
            lplr.Character.HumanoidRootPart.CFrame = locationCurrent
        end

        if keyDown == "e" then
            local locationCurrent = lplr.Character.HumanoidRootPart.CFrame
            if _G.choseShop == "n" then
                lplr.Character.HumanoidRootPart.CFrame =
                    CFrame.new(buyLocation.X, buyLocation.Y, buyLocation.Z) * CFrame.new(0, 2, 0)
            else
                lplr.Character.HumanoidRootPart.CFrame =
                    CFrame.new(buyLocationMoon.X, buyLocationMoon.Y, buyLocationMoon.Z) * CFrame.new(0, 2, 0)
            end
            wait(0.5)
            lplr.Character.HumanoidRootPart.CFrame = locationCurrent
        end

        if keyDown == "p" then
            sellGui.Position = UDim2.new(0.4, 0, -0.4, 0)
            _G.saveLocationOn = not _G.saveLocationOn

            if _G.saveLocationOn then
                _G.saveLocation = lplr.Character.HumanoidRootPart.CFrame
                if _G.choseShop == "n" then
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-7, 5, 213)
                else
                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(2, 5, -2366)
                end
            else
                lplr.Character.HumanoidRootPart.CFrame = _G.saveLocation
            end
        end

        if keyDown == "m" then
            if _G.choseShop == "n" then
                _G.choseShop = "m"
            else
                _G.choseShop = "n"
            end
        end

        if keyDown == "r" then
            local tool = lplr.Backpack:FindFirstChildOfClass("Tool") or lplr.Character:FindFirstChildOfClass("Tool")
            for _, v in pairs(wp[lplr.Name]:GetChildren()) do
                if v:FindFirstChild("Sword") then
                    tool = v
                end
            end
            if tool then
                tool.Sword.Size = Vector3.new(_G.toolSize[1], _G.toolSize[2], _G.toolSize[3])
            end
        end

        if keyDown == "f" then
            _G.noclip = not _G.noclip
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclip then
            lplr.Character.Head.CanCollide = false
            lplr.Character.UpperTorso.CanCollide = false
            lplr.Character.LowerTorso.CanCollide = false
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
 
-- local A_1 = game:GetService("Workspace").Map.Grassland.Enemies.Warrior.Humanoid
-- local A_2 = game:GetService("Workspace").WAOHoukaShu["Basic Sword"]
-- local A_3 = Vector3.new(3.91004515, 9.96911526, 21.6459312)
-- local A_4 = 5
-- local Event = game:GetService("ReplicatedStorage").RemoteEvents.Client.SwordAttack
-- Event:FireServer(A_1, A_2, A_3, A_4)
