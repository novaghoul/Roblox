uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
cg = game:GetService("CoreGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

_G.kiOn = false
_G.combatOn = false
_G.defenseOn = false
_G.energyOn = false

if cg:FindFirstChild("DragonBallRage") then
    cg["DragonBallRage"]:Destroy()
end

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local DragonBallRage = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local nameGame = Instance.new("TextLabel")
local bntKi = Instance.new("TextButton")
local bntCombat = Instance.new("TextButton")
local bntDefense = Instance.new("TextButton")
local bntEnergy = Instance.new("TextButton")
local OCB = Instance.new("TextButton")
--Properties:
DragonBallRage.Name = "DragonBallRage"
DragonBallRage.Parent = cg
DragonBallRage.ResetOnSpawn = false
DragonBallRage.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = DragonBallRage
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 196, 0, 105)
Main.Visible = false
Main.Active = true
Main.Draggable = true

nameGame.Name = "nameGame"
nameGame.Parent = Main
nameGame.BackgroundColor3 = Color3.new(1, 1, 1)
nameGame.Size = UDim2.new(0, 196, 0, 25)
nameGame.Font = Enum.Font.SourceSans
nameGame.Text = "Dragon Ball Rage"
nameGame.TextColor3 = Color3.new(0, 0, 0)
nameGame.TextSize = 14

bntKi.Name = "bntKi"
bntKi.Parent = Main
bntKi.BackgroundColor3 = Color3.new(1, 1, 1)
bntKi.Position = UDim2.new(0, 10, 0, 35)
bntKi.Size = UDim2.new(0, 75, 0, 25)
bntKi.Font = Enum.Font.SourceSans
bntKi.Text = "Ki (OFF)"
bntKi.TextColor3 = Color3.new(0, 0, 0)
bntKi.TextSize = 14

bntCombat.Name = "bntCombat"
bntCombat.Parent = Main
bntCombat.BackgroundColor3 = Color3.new(1, 1, 1)
bntCombat.Position = UDim2.new(0, 105, 0, 35)
bntCombat.Size = UDim2.new(0, 75, 0, 25)
bntCombat.Font = Enum.Font.SourceSans
bntCombat.Text = "Agi (OFF)"
bntCombat.TextColor3 = Color3.new(0, 0, 0)
bntCombat.TextSize = 14

bntDefense.Name = "bntDefense"
bntDefense.Parent = Main
bntDefense.BackgroundColor3 = Color3.new(1, 1, 1)
bntDefense.Position = UDim2.new(0, 105, 0, 70)
bntDefense.Size = UDim2.new(0, 75, 0, 25)
bntDefense.Font = Enum.Font.SourceSans
bntDefense.Text = "Defense (OFF)"
bntDefense.TextColor3 = Color3.new(0, 0, 0)
bntDefense.TextSize = 14

bntEnergy.Name = "bntEnergy"
bntEnergy.Parent = Main
bntEnergy.BackgroundColor3 = Color3.new(1, 1, 1)
bntEnergy.Position = UDim2.new(0, 10, 0, 70)
bntEnergy.Size = UDim2.new(0, 75, 0, 25)
bntEnergy.Font = Enum.Font.SourceSans
bntEnergy.Text = "Energy (OFF)"
bntEnergy.TextColor3 = Color3.new(0, 0, 0)
bntEnergy.TextSize = 14

OCB.Name = "OCB"
OCB.Parent = DragonBallRage
OCB.BackgroundColor3 = Color3.new(1, 1, 1)
OCB.Position = UDim2.new(0, 0, 0.800000012, 0)
OCB.Size = UDim2.new(0, 50, 0, 25)
OCB.Font = Enum.Font.SourceSans
OCB.Text = "Open"
OCB.TextColor3 = Color3.new(0, 0, 0)
OCB.TextSize = 14
-- Scripts:

OCB.MouseButton1Down:connect(
    function()
        if Main.Visible == false then
            OCB.Text = "Close"
            Main.Visible = true
        else
            OCB.Text = "Open"
            Main.Visible = false
        end
    end
)

bntKi.MouseButton1Down:connect(
    function()
        _G.kiOn = not _G.kiOn
        if _G.kiOn then
            bntKi.Text = "Ki (ON)"
        else
            bntKi.Text = "Ki (OFF)"
        end

        while _G.kiOn do
            wait()
            local Event = rs.Remote.KiBlast
            Event:InvokeServer()
        end
    end
)

bntCombat.MouseButton1Down:connect(
    function()
        _G.combatOn = not _G.combatOn
        if _G.combatOn then
            bntCombat.Text = "Agi (ON)"
        else
            bntCombat.Text = "Agi (OFF)"
        end
        
        while _G.combatOn do
            wait()
            local Event = rs.Remotes.Training.Combat
            Event:InvokeServer()
        end
    end
)

bntDefense.MouseButton1Down:connect(
    function()
        _G.defenseOn = not _G.defenseOn
        if _G.defenseOn then
            bntDefense.Text = "Defense (ON)"
        else
            bntDefense.Text = "Defense (OFF)"
        end

        while _G.defenseOn do
            wait()
            local A_1 = lplr.Stats
            local A_2 = lplr.Status
            local A_3 = lplr.Character.Humanoid
            local A_4 = lplr.Character.RightHand
            local Event = rs.Remotes.Training.Defense
            Event:InvokeServer(A_1, A_2, A_3, A_4)
        end
    end
)

bntEnergy.MouseButton1Down:connect(
    function()
        _G.energyOn = not _G.energyOn
        if _G.energyOn then
            bntEnergy.Text = "Energy (ON)"
        else
            bntEnergy.Text = "Energy (OFF)"
        end

        while _G.energyOn do
            wait()
            local A_1 = false
            local Event = rs.Remotes.Training.Charge
            Event:InvokeServer(A_1)
        end
    end
)

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)