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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.ws_g = 50
_G.jp_g = 50
_G.onClick = false
_G.delay = 0.2
_G.autoRebirthPet = false
_G.numRebirths = {0, 1}
_G.nameGhostRebirths = "Ghost"

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

if cg:FindFirstChild("ShitAssGame") then
    cg["ShitAssGame"]:Destroy()
end

local ShitAssGame = Instance.new("ScreenGui")
local back = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AF = Instance.new("TextButton")
local AAF = Instance.new("TextButton")
local BOSS = Instance.new("TextButton")
local PLR = Instance.new("TextButton")
local TP = Instance.new("TextButton")
local MISC = Instance.new("TextButton")
local MiscF = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local SpeedVal = Instance.new("TextBox")
local Speed = Instance.new("TextButton")
local Jump = Instance.new("TextButton")
local JumpVal = Instance.new("TextBox")
local AFK = Instance.new("TextButton")
local KillAllPlayers = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local STARTOREND = Instance.new("TextButton")
local AdvancedAutoFarm = Instance.new("Frame")
local Title_4 = Instance.new("TextLabel")
local Min = Instance.new("TextBox")
local Max = Instance.new("TextBox")
local AdvancedAutoFarmB = Instance.new("TextButton")
local BossF = Instance.new("Frame")
local Title_5 = Instance.new("TextLabel")
local BossB = Instance.new("TextButton")
local Title_6 = Instance.new("TextLabel")
local AutoFarmF = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TEMPLATE = Instance.new("TextButton")
local Teleport = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local TEMPLATEB = Instance.new("TextButton")
ShitAssGame.Name = "ShitAssGame"
ShitAssGame.Parent = cg
ShitAssGame.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

back.Name = "back"
back.Parent = ShitAssGame
back.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
back.BackgroundTransparency = 0.30000001192093
back.BorderSizePixel = 0
back.Position = UDim2.new(0.0416666679, 0, 0.188253015, 0)
back.Size = UDim2.new(0, 211, 0, 306)
back.Active = true
back.Draggable = true

Title.Name = "Title"
Title.Parent = back
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 211, 0, 58)
Title.Font = Enum.Font.Highway
Title.Text = "Dm Not a Trap#6258 on discord with any issues"
Title.TextColor3 = Color3.new(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14
Title.TextWrapped = true

AF.Name = "AF"
AF.Parent = back
AF.BackgroundColor3 = Color3.new(1, 1, 1)
AF.BackgroundTransparency = 0.5
AF.BorderSizePixel = 0
AF.Position = UDim2.new(0, 0, 0.181949973, 0)
AF.Size = UDim2.new(0, 211, 0, 42)
AF.Font = Enum.Font.Highway
AF.Text = "AutoFarm"
AF.TextColor3 = Color3.new(0, 0, 0)
AF.TextScaled = true
AF.TextSize = 14
AF.TextWrapped = true

AAF.Name = "AAF"
AAF.Parent = back
AAF.BackgroundColor3 = Color3.new(1, 1, 1)
AAF.BackgroundTransparency = 0.5
AAF.BorderSizePixel = 0
AAF.Position = UDim2.new(0, 0, 0.316968888, 0)
AAF.Size = UDim2.new(0, 211, 0, 42)
AAF.Font = Enum.Font.Highway
AAF.Text = "Advanced AutoFarm"
AAF.TextColor3 = Color3.new(0, 0, 0)
AAF.TextScaled = true
AAF.TextSize = 14
AAF.TextWrapped = true

BOSS.Name = "BOSS"
BOSS.Parent = back
BOSS.BackgroundColor3 = Color3.new(1, 1, 1)
BOSS.BackgroundTransparency = 0.5
BOSS.BorderSizePixel = 0
BOSS.Position = UDim2.new(0, 0, 0.451987803, 0)
BOSS.Size = UDim2.new(0, 211, 0, 42)
BOSS.Font = Enum.Font.Highway
BOSS.Text = "Best Boss AFK Farm"
BOSS.TextColor3 = Color3.new(0, 0, 0)
BOSS.TextScaled = true
BOSS.TextSize = 14
BOSS.TextWrapped = true

PLR.Name = "PLR"
PLR.Parent = back
PLR.BackgroundColor3 = Color3.new(1, 1, 1)
PLR.BackgroundTransparency = 0.5
PLR.BorderSizePixel = 0
PLR.Position = UDim2.new(0, 0, 0.590274692, 0)
PLR.Size = UDim2.new(0, 211, 0, 42)
PLR.Font = Enum.Font.Highway
PLR.Text = "Kill All Players"
PLR.TextColor3 = Color3.new(0, 0, 0)
PLR.TextScaled = true
PLR.TextSize = 14
PLR.TextWrapped = true

TP.Name = "TP"
TP.Parent = back
TP.BackgroundColor3 = Color3.new(1, 1, 1)
TP.BackgroundTransparency = 0.5
TP.BorderSizePixel = 0
TP.Position = UDim2.new(0, 0, 0.730797648, 0)
TP.Size = UDim2.new(0, 211, 0, 42)
TP.Font = Enum.Font.Highway
TP.Text = "Teleport Menu"
TP.TextColor3 = Color3.new(0, 0, 0)
TP.TextScaled = true
TP.TextSize = 14
TP.TextWrapped = true

MISC.Name = "MISC"
MISC.Parent = back
MISC.BackgroundColor3 = Color3.new(1, 1, 1)
MISC.BackgroundTransparency = 0.5
MISC.BorderSizePixel = 0
MISC.Position = UDim2.new(0, 0, 0.861516595, 0)
MISC.Size = UDim2.new(0, 211, 0, 42)
MISC.Font = Enum.Font.Highway
MISC.Text = "Misc"
MISC.TextColor3 = Color3.new(0, 0, 0)
MISC.TextScaled = true
MISC.TextSize = 14
MISC.TextWrapped = true

MiscF.Name = "MiscF"
MiscF.Parent = back
MiscF.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
MiscF.BackgroundTransparency = 0.30000001192093
MiscF.BorderSizePixel = 0
MiscF.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
MiscF.Size = UDim2.new(0, 211, 0, 306)
MiscF.Visible = false

Title_2.Name = "Title"
Title_2.Parent = MiscF
Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
Title_2.BackgroundTransparency = 1
Title_2.Size = UDim2.new(0, 211, 0, 58)
Title_2.Font = Enum.Font.Highway
Title_2.Text = "Misc"
Title_2.TextColor3 = Color3.new(0, 0, 0)
Title_2.TextScaled = true
Title_2.TextSize = 14
Title_2.TextWrapped = true

SpeedVal.Name = "SpeedVal"
SpeedVal.Parent = MiscF
SpeedVal.BackgroundColor3 = Color3.new(1, 1, 1)
SpeedVal.BackgroundTransparency = 0.99000000953674
SpeedVal.Position = UDim2.new(0, 0, 0.163398698, 0)
SpeedVal.Size = UDim2.new(0, 211, 0, 37)
SpeedVal.Font = Enum.Font.Highway
SpeedVal.PlaceholderText = "Speed amount"
SpeedVal.Text = ""
SpeedVal.TextColor3 = Color3.new(0, 0, 0)
SpeedVal.TextScaled = true
SpeedVal.TextSize = 14
SpeedVal.TextWrapped = true

Speed.Name = "Speed"
Speed.Parent = MiscF
Speed.BackgroundColor3 = Color3.new(1, 1, 1)
Speed.BackgroundTransparency = 0.5
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0, 0, 0.283085167, 0)
Speed.Size = UDim2.new(0, 211, 0, 42)
Speed.Font = Enum.Font.Highway
Speed.Text = "Set Speed"
Speed.TextColor3 = Color3.new(0, 0, 0)
Speed.TextScaled = true
Speed.TextSize = 14
Speed.TextWrapped = true

Jump.Name = "Jump"
Jump.Parent = MiscF
Jump.BackgroundColor3 = Color3.new(1, 1, 1)
Jump.BackgroundTransparency = 0.5
Jump.BorderSizePixel = 0
Jump.Position = UDim2.new(0, 0, 0.537987113, 0)
Jump.Size = UDim2.new(0, 211, 0, 42)
Jump.Font = Enum.Font.Highway
Jump.Text = "Set Jump"
Jump.TextColor3 = Color3.new(0, 0, 0)
Jump.TextScaled = true
Jump.TextSize = 14
Jump.TextWrapped = true

JumpVal.Name = "JumpVal"
JumpVal.Parent = MiscF
JumpVal.BackgroundColor3 = Color3.new(1, 1, 1)
JumpVal.BackgroundTransparency = 0.99000000953674
JumpVal.Position = UDim2.new(0, 0, 0.418300688, 0)
JumpVal.Size = UDim2.new(0, 211, 0, 37)
JumpVal.Font = Enum.Font.Highway
JumpVal.PlaceholderText = "Jump amount"
JumpVal.Text = ""
JumpVal.TextColor3 = Color3.new(0, 0, 0)
JumpVal.TextScaled = true
JumpVal.TextSize = 14
JumpVal.TextWrapped = true

AFK.Name = "AFK"
AFK.Parent = MiscF
AFK.BackgroundColor3 = Color3.new(1, 1, 1)
AFK.BackgroundTransparency = 0.5
AFK.BorderSizePixel = 0
AFK.Position = UDim2.new(0, 0, 0.671974123, 0)
AFK.Size = UDim2.new(0, 211, 0, 101)
AFK.Font = Enum.Font.Highway
AFK.Text = "Anti-AFK"
AFK.TextColor3 = Color3.new(0, 0, 0)
AFK.TextScaled = true
AFK.TextSize = 14
AFK.TextWrapped = true

KillAllPlayers.Name = "KillAllPlayers"
KillAllPlayers.Parent = back
KillAllPlayers.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
KillAllPlayers.BackgroundTransparency = 0.30000001192093
KillAllPlayers.BorderSizePixel = 0
KillAllPlayers.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
KillAllPlayers.Size = UDim2.new(0, 211, 0, 306)
KillAllPlayers.Visible = false

Title_3.Name = "Title"
Title_3.Parent = KillAllPlayers
Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
Title_3.BackgroundTransparency = 1
Title_3.Size = UDim2.new(0, 211, 0, 58)
Title_3.Font = Enum.Font.Highway
Title_3.Text = "Kill All Players Menu"
Title_3.TextColor3 = Color3.new(0, 0, 0)
Title_3.TextScaled = true
Title_3.TextSize = 14
Title_3.TextWrapped = true

STARTOREND.Name = "STARTOREND"
STARTOREND.Parent = KillAllPlayers
STARTOREND.BackgroundColor3 = Color3.new(1, 1, 1)
STARTOREND.BackgroundTransparency = 0.5
STARTOREND.BorderSizePixel = 0
STARTOREND.Position = UDim2.new(0, 0, 0.279817283, 0)
STARTOREND.Size = UDim2.new(0, 211, 0, 220)
STARTOREND.Font = Enum.Font.Highway
STARTOREND.Text = "Start"
STARTOREND.TextColor3 = Color3.new(0, 0, 0)
STARTOREND.TextScaled = true
STARTOREND.TextSize = 14
STARTOREND.TextWrapped = true

AdvancedAutoFarm.Name = "AdvancedAutoFarm"
AdvancedAutoFarm.Parent = back
AdvancedAutoFarm.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
AdvancedAutoFarm.BackgroundTransparency = 0.30000001192093
AdvancedAutoFarm.BorderSizePixel = 0
AdvancedAutoFarm.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
AdvancedAutoFarm.Size = UDim2.new(0, 211, 0, 306)
AdvancedAutoFarm.Visible = false

Title_4.Name = "Title"
Title_4.Parent = AdvancedAutoFarm
Title_4.BackgroundColor3 = Color3.new(1, 1, 1)
Title_4.BackgroundTransparency = 1
Title_4.Size = UDim2.new(0, 211, 0, 58)
Title_4.Font = Enum.Font.Highway
Title_4.Text = "Advanced AutoFarm"
Title_4.TextColor3 = Color3.new(0, 0, 0)
Title_4.TextScaled = true
Title_4.TextSize = 14
Title_4.TextWrapped = true

Min.Name = "Min"
Min.Parent = AdvancedAutoFarm
Min.BackgroundColor3 = Color3.new(1, 1, 1)
Min.BackgroundTransparency = 0.99000000953674
Min.Position = UDim2.new(0, 0, 0.163398698, 0)
Min.Size = UDim2.new(0, 211, 0, 61)
Min.Font = Enum.Font.Highway
Min.PlaceholderText = "Min Health"
Min.Text = ""
Min.TextColor3 = Color3.new(0, 0, 0)
Min.TextScaled = true
Min.TextSize = 14
Min.TextWrapped = true

Max.Name = "Max"
Max.Parent = AdvancedAutoFarm
Max.BackgroundColor3 = Color3.new(1, 1, 1)
Max.BackgroundTransparency = 0.99000000953674
Max.Position = UDim2.new(0, 0, 0.362745106, 0)
Max.Size = UDim2.new(0, 211, 0, 61)
Max.Font = Enum.Font.Highway
Max.PlaceholderText = "Max Health"
Max.Text = ""
Max.TextColor3 = Color3.new(0, 0, 0)
Max.TextScaled = true
Max.TextSize = 14
Max.TextWrapped = true

AdvancedAutoFarmB.Name = "AdvancedAutoFarmB"
AdvancedAutoFarmB.Parent = AdvancedAutoFarm
AdvancedAutoFarmB.BackgroundColor3 = Color3.new(1, 1, 1)
AdvancedAutoFarmB.BackgroundTransparency = 0.5
AdvancedAutoFarmB.BorderSizePixel = 0
AdvancedAutoFarmB.Position = UDim2.new(0, 0, 0.562091529, 0)
AdvancedAutoFarmB.Size = UDim2.new(0, 211, 0, 134)
AdvancedAutoFarmB.Font = Enum.Font.Highway
AdvancedAutoFarmB.Text = "Start"
AdvancedAutoFarmB.TextColor3 = Color3.new(0, 0, 0)
AdvancedAutoFarmB.TextScaled = true
AdvancedAutoFarmB.TextSize = 14
AdvancedAutoFarmB.TextWrapped = true

BossF.Name = "BossF"
BossF.Parent = back
BossF.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
BossF.BackgroundTransparency = 0.30000001192093
BossF.BorderSizePixel = 0
BossF.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
BossF.Size = UDim2.new(0, 211, 0, 306)
BossF.Visible = false

Title_5.Name = "Title"
Title_5.Parent = BossF
Title_5.BackgroundColor3 = Color3.new(1, 1, 1)
Title_5.BackgroundTransparency = 1
Title_5.Size = UDim2.new(0, 211, 0, 58)
Title_5.Font = Enum.Font.Highway
Title_5.Text = "Best Boss AutoFarm"
Title_5.TextColor3 = Color3.new(0, 0, 0)
Title_5.TextScaled = true
Title_5.TextSize = 14
Title_5.TextWrapped = true

BossB.Name = "BossB"
BossB.Parent = BossF
BossB.BackgroundColor3 = Color3.new(1, 1, 1)
BossB.BackgroundTransparency = 0.5
BossB.BorderSizePixel = 0
BossB.Position = UDim2.new(0, 0, 0.562091529, 0)
BossB.Size = UDim2.new(0, 211, 0, 134)
BossB.Font = Enum.Font.Highway
BossB.Text = "Start"
BossB.TextColor3 = Color3.new(0, 0, 0)
BossB.TextScaled = true
BossB.TextSize = 14
BossB.TextWrapped = true

Title_6.Name = "Title"
Title_6.Parent = BossF
Title_6.BackgroundColor3 = Color3.new(1, 1, 1)
Title_6.BackgroundTransparency = 1
Title_6.Position = UDim2.new(0, 0, 0.189542487, 0)
Title_6.Size = UDim2.new(0, 211, 0, 114)
Title_6.Font = Enum.Font.Highway
Title_6.Text =
    "An auto clicker is required to AFK this script ( or use the afk script in Misc ) the lvl 1000 sword is best used for this because its a long weapon. Thanks for using"
Title_6.TextColor3 = Color3.new(0, 0, 0)
Title_6.TextScaled = true
Title_6.TextSize = 14
Title_6.TextWrapped = true

AutoFarmF.Name = "AutoFarmF"
AutoFarmF.Parent = back
AutoFarmF.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
AutoFarmF.BackgroundTransparency = 0.30000001192093
AutoFarmF.BorderSizePixel = 0
AutoFarmF.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
AutoFarmF.Size = UDim2.new(0, 211, 0, 306)
AutoFarmF.Visible = false
AutoFarmF.CanvasSize = UDim2.new(0, 0, 5, 0)

UIListLayout.Parent = AutoFarmF

TEMPLATE.Name = "TEMPLATE"
TEMPLATE.Parent = UIListLayout
TEMPLATE.BackgroundColor3 = Color3.new(1, 1, 1)
TEMPLATE.BackgroundTransparency = 0.5
TEMPLATE.BorderSizePixel = 0
TEMPLATE.Position = UDim2.new(0, 0, 0.869342089, 0)
TEMPLATE.Size = UDim2.new(0, 211, 0, 40)
TEMPLATE.Font = Enum.Font.Highway
TEMPLATE.Text = "Start"
TEMPLATE.TextColor3 = Color3.new(0, 0, 0)
TEMPLATE.TextScaled = true
TEMPLATE.TextSize = 14
TEMPLATE.TextWrapped = true

Teleport.Name = "Teleport"
Teleport.Parent = back
Teleport.BackgroundColor3 = Color3.new(0.988235, 1, 0.184314)
Teleport.BackgroundTransparency = 0.30000001192093
Teleport.BorderSizePixel = 0
Teleport.Position = UDim2.new(0.999012649, 0, -0.00128947198, 0)
Teleport.Size = UDim2.new(0, 211, 0, 306)
Teleport.Visible = false

UIListLayout_2.Parent = Teleport

TEMPLATEB.Name = "TEMPLATEB"
TEMPLATEB.Parent = UIListLayout_2
TEMPLATEB.BackgroundColor3 = Color3.new(1, 1, 1)
TEMPLATEB.BackgroundTransparency = 0.5
TEMPLATEB.BorderSizePixel = 0
TEMPLATEB.Position = UDim2.new(0, 0, 0.869342089, 0)
TEMPLATEB.Font = Enum.Font.Highway
TEMPLATEB.Text = "Start"
TEMPLATEB.TextColor3 = Color3.new(0, 0, 0)
TEMPLATEB.TextScaled = true
TEMPLATEB.TextSize = 14
TEMPLATEB.TextWrapped = true

AF.MouseButton1Click:Connect(
    function()
        if AutoFarmF.Visible == false then
            AutoFarmF.Visible = true
        else
            AutoFarmF.Visible = false
        end
    end
)

AAF.MouseButton1Click:Connect(
    function()
        if AdvancedAutoFarm.Visible == false then
            AdvancedAutoFarm.Visible = true
        else
            AdvancedAutoFarm.Visible = false
        end
    end
)

BOSS.MouseButton1Click:Connect(
    function()
        if BossF.Visible == false then
            BossF.Visible = true
        else
            BossF.Visible = false
        end
    end
)

PLR.MouseButton1Click:Connect(
    function()
        if KillAllPlayers.Visible == false then
            KillAllPlayers.Visible = true
        else
            KillAllPlayers.Visible = false
        end
    end
)

local on = false
STARTOREND.MouseButton1Click:Connect(
    function()
        if on == false then
            on = true
            STARTOREND.Text = "STOP"
        else
            on = false
            STARTOREND.Text = "START"
        end
        repeat
            wait()
            for _, v in pairs(plrs:GetChildren()) do
                if v.Name ~= lplr.Name then
                    if wp:FindFirstChild(v.Name) ~= nil then
                        v.Character:WaitForChild("HumanoidRootPart").Anchored = true
                        v.Character:WaitForChild("HumanoidRootPart").CFrame =
                            lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end
        until on == false
    end
)

MISC.MouseButton1Click:Connect(
    function()
        if MiscF.Visible == false then
            MiscF.Visible = true
        else
            MiscF.Visible = false
        end
    end
)

for _, v in pairs(wp.Zones:GetChildren()) do
    if Teleport:FindFirstChild(v.Name) == nil then
        local copy = TEMPLATEB:Clone()
        copy.Text = v.Name
        copy.Name = v.Name
        copy.Parent = Teleport
        copy.MouseButton1Down:Connect(
            function()
                lplr.Character.HumanoidRootPart.CFrame = wp.Zones[copy.Text].CFrame
            end
        )
    end
end

local advon = false
AdvancedAutoFarmB.MouseButton1Click:Connect(
    function()
        if advon == false then
            advon = true
            AdvancedAutoFarmB.Text = "STOP"
        else
            advon = false
            AdvancedAutoFarmB.Text = "START"
        end
        repeat
            wait()
            local amount = 5
            for _, v in pairs(wp.Enemies:GetChildren()) do
                for _, v in pairs(v:GetChildren()) do
                    if v:FindFirstChild("Humanoid") ~= nil then
                        if v.Humanoid.MaxHealth > tonumber(Min.Text) and v.Humanoid.MaxHealth < tonumber(Max.Text) then
                            v.HumanoidRootPart.Anchored = true
                            local mobs = lplr.Character.HumanoidRootPart.CFrame
                            v.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 0, -4)
                        end
                    end
                end
            end
        until advon == false
    end
)

for _, v in pairs(wp.Enemies:GetChildren()) do
    if AutoFarmF:FindFirstChild(v.Name) == nil then
        local on = false
        local attack = v.Name
        local copy = TEMPLATE:Clone()
        copy.Name = v.Name
        copy.Parent = AutoFarmF
        copy.Text = v.Name
        copy.MouseButton1Click:Connect(
            function()
                if on == false then
                    on = true
                    copy.Text = "STOP"
                elseif on == true then
                    on = false
                    copy.Text = attack
                end
                while on do
                    for _, v in pairs(wp.Enemies[attack]:GetChildren()) do
                        if v:FindFirstChild("HumanoidRootPart") then
                            if on == false then
                                break
                            end
                            wait(0.5)
                            if v:FindFirstChildOfClass("Tool") ~= nil then
                                v:FindFirstChildOfClass("Tool"):Destroy()
                            end
                            v.HumanoidRootPart.Anchored = true
                            local mobs = lplr.Character.HumanoidRootPart.CFrame
                            v.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 0, -3.5)
                            if v:FindFirstChild("LeftUpperArm") then
                                v.LeftUpperArm:Destroy()
                                v.LeftLowerArm:Destroy()
                                v.LeftHand:Destroy()
                                v.RightUpperArm:Destroy()
                                v.RightLowerArm:Destroy()
                                v.RightHand:Destroy()
                            end
                        end
                    end
                    wait(1)
                end
            end
        )
    end
end

TP.MouseButton1Click:Connect(
    function()
        if Teleport.Visible == false then
            Teleport.Visible = true
        else
            Teleport.Visible = false
        end
    end
)

Speed.MouseButton1Click:Connect(
    function()
        lplr.Character.Humanoid.WalkSpeed = SpeedVal.Text
    end
)

Jump.MouseButton1Click:Connect(
    function()
        lplr.Character.Humanoid.JumpPower = JumpVal.Text
    end
)

local tppost = Instance.new("Part")
tppost.CanCollide = false
tppost.Position = Vector3.new(272.139069, 2.46540403, 1787.15747)
tppost.Anchored = true
tppost.Transparency = 1

local bosson = false
BossB.MouseButton1Click:Connect(
    function()
        -- if bosson == false then
        --     bosson = true
        --     BossB.Text = "STOP"
        -- else
        --     bosson = false
        --     BossB.Text = "START"
        -- end
        -- repeat
        --     wait()
        --     if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) ~= nil then
        --         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = tppost.CFrame
        --         if game.Workspace.Enemies:FindFirstChild("Frost Guard") ~= nil then
        --             for _, v in pairs(game.Workspace.Enemies["Frost Guard"]:GetChildren()) do
        --                 v:WaitForChild("HumanoidRootPart").Anchored = true
        --                 local mobs = lplr.Character.HumanoidRootPart.CFrame
        --                 v:WaitForChild("HumanoidRootPart").CFrame = mobs * CFrame.new(0, 0, -4)
        --             end
        --         end
        --     end
        -- until bosson == false
    end
)

AFK.MouseButton1Click:Connect(
    function()
        AFK.Text = "ENABLED"
        local VirtualUser = game:service "VirtualUser"
        game:service "Players".LocalPlayer.Idled:connect(
            function()
                print("gay ass anti afk shit ")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        )
    end
)

function firstScript()
    if wp:FindFirstChild("EnemyBorders") then
        wp["EnemyBorders"]:Destroy()
    end
    if wp:FindFirstChild("Zones") then
        wp["Zones"]:Destroy()
    end
end
-- firstScript()

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

function autoClick()
    while _G.onClick do
        wait(_G.delay)
        game:GetService("VirtualUser"):ClickButton1(Vector2.new())
    end
end

function rebirthPet(name, num)
    local Remote = rs.Events["RebirthPet"]
    local Pet = lplr.PlayerGui.MainGui.PetsFrame.ScrollingFrame:FindFirstChild(name)
    local Arguments = {
        [1] = {
            ["Name"] = name,
            ["Button"] = Pet,
            ["Selected"] = false,
            ["Equipped"] = false,
            ["Rebirths"] = num
        }
    }
    Remote:InvokeServer(unpack(Arguments))
end

function purchaseEgg(name)
    local Remote = game.ReplicatedStorage.Events["PurchaseEgg"]
    local Arguments = {
        [1] = name,
        [2] = 1
    }
    Remote:InvokeServer(unpack(Arguments))
end

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = _G.ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            end
        end
    )
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 16 then
            _G.ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "k" then
            changeWS(0)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "l" then
            changeWS(1)
            SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "n" then
            _G.autoRebirthPet = not _G.autoRebirthPet
            for i = 1, #_G.numRebirths do
                if tonumber(_G.numRebirths[i]) then
                    spawn(
                        function()
                            while _G.autoRebirthPet do
                                rebirthPet(_G.nameGhostRebirths, _G.numRebirths[i])
                                wait(0.2)
                            end
                        end
                    )
                end
            end
        end

        if keyDown == "m" then
            purchaseEgg("Ghostly Egg")
            purchaseEgg("Ghostly Egg")
            purchaseEgg("Ghostly Egg")
            purchaseEgg("Ghostly Egg")
            purchaseEgg("Ghostly Egg")
        end

        if keyDown == "b" then
            purchaseEgg("Ghostly Egg")
        end

        if keyDown == "p" then
            _G.onClick = not _G.onClick
            wait(0.1)
			autoClick()
		end
    end
)