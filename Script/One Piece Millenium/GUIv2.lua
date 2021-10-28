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

folderMobs = nil
folderNPCs = nil
folderChest = nil
dis = 5

enableAutoTPMobs = false

if cg:FindFirstChild("OnePieceMillenium") then
    cg.OnePieceMillenium:Destroy()
end

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local OnePieceMillenium = Instance.new("ScreenGui")
local OCB = Instance.new("TextButton")
local GUI = Instance.new("Frame")
local Main = Instance.new("TextButton")
local MainGui = Instance.new("Frame")
local TPRev = Instance.new("TextButton")
local TPSkypiean = Instance.new("TextButton")
local TPLogia = Instance.new("TextButton")
local TPBandit = Instance.new("TextButton")
local TPIce = Instance.new("TextButton")
local TPDesert = Instance.new("TextButton")
local TPBuggy = Instance.new("TextButton")
local TPHakiMonkey = Instance.new("TextButton")
local TPViceAdmiral = Instance.new("TextButton")
local TPYeti = Instance.new("TextButton")
local TPBara = Instance.new("TextButton")
local TPBuggyTheClown = Instance.new("TextButton")
local TPCrocodile = Instance.new("TextButton")
local TPEnel = Instance.new("TextButton")
local TPFishman = Instance.new("TextButton")
local TPIto = Instance.new("TextButton")
--Properties:
OnePieceMillenium.Name = "OnePieceMillenium"
OnePieceMillenium.Parent = cg
OnePieceMillenium.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

OCB.Name = "OCB"
OCB.Parent = OnePieceMillenium
OCB.BackgroundColor3 = Color3.new(1, 1, 1)
OCB.BorderSizePixel = 0
OCB.Position = UDim2.new(0, 0, 0.899999976, 0)
OCB.Size = UDim2.new(0, 50, 0, 25)
OCB.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
OCB.Font = Enum.Font.SourceSans
OCB.Text = "Open"
OCB.TextColor3 = Color3.new(0, 0, 0)
OCB.TextSize = 14

GUI.Name = "GUI"
GUI.Parent = OnePieceMillenium
GUI.BackgroundColor3 = Color3.new(1, 1, 1)
GUI.BorderColor3 = Color3.new(1, 1, 1)
GUI.BorderSizePixel = 0
GUI.Position = UDim2.new(0.00999999978, 0, 0.00999999978, 0)
GUI.Size = UDim2.new(0, 500, 0, 500)
GUI.Visible = false
GUI.Style = Enum.FrameStyle.ChatBlue
GUI.Active = true
GUI.Draggable = true

Main.Name = "Main"
Main.Parent = GUI
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.Size = UDim2.new(0, 75, 0, 25)
Main.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
Main.Font = Enum.Font.SourceSans
Main.Text = "Main"
Main.TextColor3 = Color3.new(1, 1, 1)
Main.TextSize = 14

MainGui.Name = "MainGui"
MainGui.Parent = GUI
MainGui.BackgroundColor3 = Color3.new(1, 1, 1)
MainGui.Position = UDim2.new(0.180000007, 0, 0, 0)
MainGui.Size = UDim2.new(0.819999993, 0, 1, 0)
MainGui.Style = Enum.FrameStyle.ChatBlue

TPRev.Name = "TPRev"
TPRev.Parent = MainGui
TPRev.BackgroundColor3 = Color3.new(1, 1, 1)
TPRev.BorderSizePixel = 0
TPRev.Size = UDim2.new(0, 125, 0, 30)
TPRev.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPRev.Font = Enum.Font.SourceSans
TPRev.Text = "Revolutionary Troop"
TPRev.TextColor3 = Color3.new(1, 1, 1)
TPRev.TextSize = 14

TPSkypiean.Name = "TPSkypiean"
TPSkypiean.Parent = MainGui
TPSkypiean.BackgroundColor3 = Color3.new(1, 1, 1)
TPSkypiean.BorderSizePixel = 0
TPSkypiean.Position = UDim2.new(0, 125, 0, 0)
TPSkypiean.Size = UDim2.new(0, 125, 0, 30)
TPSkypiean.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPSkypiean.Font = Enum.Font.SourceSans
TPSkypiean.Text = "Skypiean"
TPSkypiean.TextColor3 = Color3.new(1, 1, 1)
TPSkypiean.TextSize = 14

TPLogia.Name = "TPLogia"
TPLogia.Parent = MainGui
TPLogia.BackgroundColor3 = Color3.new(1, 1, 1)
TPLogia.BorderSizePixel = 0
TPLogia.Position = UDim2.new(0, 0, 0, 35)
TPLogia.Size = UDim2.new(0, 125, 0, 30)
TPLogia.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPLogia.Font = Enum.Font.SourceSans
TPLogia.Text = "Logia Bandit"
TPLogia.TextColor3 = Color3.new(1, 1, 1)
TPLogia.TextSize = 14

TPBandit.Name = "TPBandit"
TPBandit.Parent = MainGui
TPBandit.BackgroundColor3 = Color3.new(1, 1, 1)
TPBandit.BorderSizePixel = 0
TPBandit.Position = UDim2.new(0, 125, 0, 35)
TPBandit.Size = UDim2.new(0, 125, 0, 30)
TPBandit.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPBandit.Font = Enum.Font.SourceSans
TPBandit.Text = "Bandit"
TPBandit.TextColor3 = Color3.new(1, 1, 1)
TPBandit.TextSize = 14

TPIce.Name = "TPIce"
TPIce.Parent = MainGui
TPIce.BackgroundColor3 = Color3.new(1, 1, 1)
TPIce.BorderSizePixel = 0
TPIce.Position = UDim2.new(0, 0, 0, 70)
TPIce.Size = UDim2.new(0, 125, 0, 30)
TPIce.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPIce.Font = Enum.Font.SourceSans
TPIce.Text = "Ice Monster"
TPIce.TextColor3 = Color3.new(1, 1, 1)
TPIce.TextSize = 14

TPDesert.Name = "TPDesert"
TPDesert.Parent = MainGui
TPDesert.BackgroundColor3 = Color3.new(1, 1, 1)
TPDesert.BorderSizePixel = 0
TPDesert.Position = UDim2.new(0, 125, 0, 70)
TPDesert.Size = UDim2.new(0, 125, 0, 30)
TPDesert.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPDesert.Font = Enum.Font.SourceSans
TPDesert.Text = "Desert Bandit"
TPDesert.TextColor3 = Color3.new(1, 1, 1)
TPDesert.TextSize = 14

TPBuggy.Name = "TPBuggy"
TPBuggy.Parent = MainGui
TPBuggy.BackgroundColor3 = Color3.new(1, 1, 1)
TPBuggy.BorderSizePixel = 0
TPBuggy.Position = UDim2.new(0, 0, 0, 105)
TPBuggy.Size = UDim2.new(0, 125, 0, 30)
TPBuggy.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPBuggy.Font = Enum.Font.SourceSans
TPBuggy.Text = "Buggy Pirate"
TPBuggy.TextColor3 = Color3.new(1, 1, 1)
TPBuggy.TextSize = 14

TPHakiMonkey.Name = "TPHakiMonkey"
TPHakiMonkey.Parent = MainGui
TPHakiMonkey.BackgroundColor3 = Color3.new(1, 1, 1)
TPHakiMonkey.BorderSizePixel = 0
TPHakiMonkey.Position = UDim2.new(0, 125, 0, 105)
TPHakiMonkey.Size = UDim2.new(0, 125, 0, 30)
TPHakiMonkey.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPHakiMonkey.Font = Enum.Font.SourceSans
TPHakiMonkey.Text = "Haki Monkey"
TPHakiMonkey.TextColor3 = Color3.new(1, 1, 1)
TPHakiMonkey.TextSize = 14

TPViceAdmiral.Name = "TPViceAdmiral"
TPViceAdmiral.Parent = MainGui
TPViceAdmiral.BackgroundColor3 = Color3.new(1, 1, 1)
TPViceAdmiral.BorderSizePixel = 0
TPViceAdmiral.Position = UDim2.new(0, 125, 0, 140)
TPViceAdmiral.Size = UDim2.new(0, 125, 0, 30)
TPViceAdmiral.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPViceAdmiral.Font = Enum.Font.SourceSans
TPViceAdmiral.Text = "Vice-Admiral"
TPViceAdmiral.TextColor3 = Color3.new(1, 1, 1)
TPViceAdmiral.TextSize = 14

TPYeti.Name = "TPYeti"
TPYeti.Parent = MainGui
TPYeti.BackgroundColor3 = Color3.new(1, 1, 1)
TPYeti.BorderSizePixel = 0
TPYeti.Position = UDim2.new(0, 125, 0.850000024, 0)
TPYeti.Size = UDim2.new(0, 125, 0, 30)
TPYeti.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPYeti.Font = Enum.Font.SourceSans
TPYeti.Text = "Yeti(Boss)"
TPYeti.TextColor3 = Color3.new(1, 1, 1)
TPYeti.TextSize = 14

TPBara.Name = "TPBara"
TPBara.Parent = MainGui
TPBara.BackgroundColor3 = Color3.new(1, 1, 1)
TPBara.BorderSizePixel = 0
TPBara.Position = UDim2.new(0, 0, 0.850000024, 0)
TPBara.Size = UDim2.new(0, 125, 0, 30)
TPBara.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPBara.Font = Enum.Font.SourceSans
TPBara.Text = "Bara Bandit(Boss)"
TPBara.TextColor3 = Color3.new(1, 1, 1)
TPBara.TextSize = 14

TPBuggyTheClown.Name = "TPBuggyTheClown"
TPBuggyTheClown.Parent = MainGui
TPBuggyTheClown.BackgroundColor3 = Color3.new(1, 1, 1)
TPBuggyTheClown.BorderSizePixel = 0
TPBuggyTheClown.Position = UDim2.new(0, 125, 0.949999988, 0)
TPBuggyTheClown.Size = UDim2.new(0, 125, 0, 30)
TPBuggyTheClown.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPBuggyTheClown.Font = Enum.Font.SourceSans
TPBuggyTheClown.Text = "Buggy The Clown(Boss)"
TPBuggyTheClown.TextColor3 = Color3.new(1, 1, 1)
TPBuggyTheClown.TextSize = 14

TPCrocodile.Name = "TPCrocodile"
TPCrocodile.Parent = MainGui
TPCrocodile.BackgroundColor3 = Color3.new(1, 1, 1)
TPCrocodile.BorderSizePixel = 0
TPCrocodile.Position = UDim2.new(0, 0, 0.949999988, 0)
TPCrocodile.Size = UDim2.new(0, 125, 0, 30)
TPCrocodile.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPCrocodile.Font = Enum.Font.SourceSans
TPCrocodile.Text = "Crocodile(Boss)"
TPCrocodile.TextColor3 = Color3.new(1, 1, 1)
TPCrocodile.TextSize = 14

TPEnel.Name = "TPEnel"
TPEnel.Parent = MainGui
TPEnel.BackgroundColor3 = Color3.new(1, 1, 1)
TPEnel.BorderSizePixel = 0
TPEnel.Position = UDim2.new(0, 0, 0.75, 0)
TPEnel.Size = UDim2.new(0, 125, 0, 30)
TPEnel.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPEnel.Font = Enum.Font.SourceSans
TPEnel.Text = "Enel(Boss)"
TPEnel.TextColor3 = Color3.new(1, 1, 1)
TPEnel.TextSize = 14

TPFishman.Name = "TPFishman"
TPFishman.Parent = MainGui
TPFishman.BackgroundColor3 = Color3.new(1, 1, 1)
TPFishman.BorderSizePixel = 0
TPFishman.Position = UDim2.new(0, 0, 0, 140)
TPFishman.Size = UDim2.new(0, 125, 0, 30)
TPFishman.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPFishman.Font = Enum.Font.SourceSans
TPFishman.Text = "Fishman"
TPFishman.TextColor3 = Color3.new(1, 1, 1)
TPFishman.TextSize = 14

TPIto.Name = "TPIto"
TPIto.Parent = MainGui
TPIto.BackgroundColor3 = Color3.new(1, 1, 1)
TPIto.BorderSizePixel = 0
TPIto.Position = UDim2.new(0, 250, 0, 0)
TPIto.Size = UDim2.new(0, 125, 0, 30)
TPIto.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
TPIto.Font = Enum.Font.SourceSans
TPIto.Text = "Ito Bandit"
TPIto.TextColor3 = Color3.new(1, 1, 1)
TPIto.TextSize = 14
-- Scripts:
OCB.MouseButton1Down:connect(
    function()
        if GUI.Visible == false then
            OCB.Text = "Close"
            GUI.Visible = true
        else
            OCB.Text = "Open"
            GUI.Visible = false
        end
    end
)
function AutoTPMobs(nameMobs)
    -- wait(0.1)
    -- while enableAutoTPMobs == true do
    --     wait(0.25)
    for _, npc in pairs(wp.WorldMap.Enemys:GetChildren()) do
        if npc.Name == nameMobs then
            -- while npc:FindFirstChild("HumanoidRootPart") do
            --     if enableAutoTPMobs == true then
            --         break
            --     end
            local mobs = lplr.Character.HumanoidRootPart.CFrame
            wait(0.1)
            npc.HumanoidRootPart.Anchored = false
            npc.HumanoidRootPart.CanCollide = true
            npc.HumanoidRootPart.CFrame = mobs * CFrame.new(0, 1, -dis)
            npc.HumanoidRootPart.Anchored = true
            npc.HumanoidRootPart.CanCollide = false
        -- end
        end
    end
    --     wait(0.25)
    -- end
    -- ResetTPMobs()
end

function ResetTPMobs()
    for _, l in pairs(wp.Enemys:GetChildren()) do
        l.HumanoidRootPart.Anchored = false
        l.HumanoidRootPart.CanCollide = true
    end
end

TPRev.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Revolutionary Troop")
    end
)
TPSkypiean.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Skypiean")
    end
)
TPLogia.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Logia Bandit")
    end
)
TPBandit.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Bandit")
    end
)
TPIce.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Ice Monster")
    end
)
TPDesert.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Desert Bandit")
    end
)
TPBuggy.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Buggy Pirate")
    end
)
TPHakiMonkey.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Haki Monkey")
    end
)
TPViceAdmiral.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Vice-Admiral")
    end
)
TPYeti.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Yeti")
    end
)
TPBara.MouseButton1Down:connect(
    function()
        enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Bara Bandit")
    end
)
TPBuggyTheClown.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Buggy The Clown")
    end
)
TPCrocodile.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Crocodile")
    end
)
TPEnel.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Enel")
    end
)
TPFishman.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Fishman")
    end
)
TPIto.MouseButton1Down:connect(
    function()
        -- enableAutoTPMobs = not enableAutoTPMobs
        AutoTPMobs("Ito Bandit")
    end
)
function firstScript()
    wp.ChildAdded:connect(
        function(m)
            if string.find(string.lower(m.Name), string.lower("Book") or string.lower("Devil")) then
                wait(1)
                local bgui = Instance.new("BillboardGui", m.Handle)
                bgui.Name = ("EGUI")
                bgui.AlwaysOnTop = true
                bgui.ExtentsOffset = Vector3.new(0, 0, 0)
                bgui.Size = UDim2.new(1, 0, 1, 0)
                local nam = Instance.new("TextLabel", bgui)
                nam.Text = m.Name
                nam.BackgroundTransparency = 1
                nam.TextSize = 10
                nam.Font = ("Arial")
                nam.TextColor3 = Color3.fromRGB(245, 205, 48)
                nam.Size = UDim2.new(1, 0, 1, 0)
            end

            -- m.ChildAdded:connect(
            --     function(n)
            --         if tostring(n.Name) == "Handle" then
            --             wait(1)
            --             n.CFrame = lplr.Character.HumanoidRootPart.CFrame
            --         end
            --     end
            -- )
            -- if m:FindFirstChild("Handle") then --MoneyBag or HakiBook or Devil Fruit
            --     wait(1)
            --     m.Handle.CFrame = lplr.Character.HumanoidRootPart.CFrame
            -- end
        end
    )
    for i, v in pairs(wp:GetChildren()) do
        if string.find(string.lower(v.Name), string.lower("Book")) then
            local bgui = Instance.new("BillboardGui", v.Handle)
            bgui.Name = ("EGUI")
            bgui.AlwaysOnTop = true
            bgui.ExtentsOffset = Vector3.new(0, 0, 0)
            bgui.Size = UDim2.new(1, 0, 1, 0)
            local nam = Instance.new("TextLabel", bgui)
            nam.Text = v.Name
            nam.BackgroundTransparency = 1
            nam.TextSize = 10
            nam.Font = ("Arial")
            nam.TextColor3 = Color3.fromRGB(245, 205, 48)
            nam.Size = UDim2.new(1, 0, 1, 0)
        end
    end

    for i, v in pairs(wp.Chests:GetChildren()) do
        local bgui = Instance.new("BillboardGui", v)
        bgui.Name = ("EGUI")
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 0, 0)
        bgui.Size = UDim2.new(1, 0, 1, 0)
        local nam = Instance.new("TextLabel", bgui)
        nam.Text = v.Name
        nam.BackgroundTransparency = 1
        nam.TextSize = 10
        nam.Font = ("Arial")
        nam.TextColor3 = Color3.fromRGB(245, 205, 48)
        nam.Size = UDim2.new(1, 0, 1, 0)
        v:GetPropertyChangedSignal("Transparency"):connect(
            function()
                if v.Transparency == 1 then
                    nam.Text = ""
                else
                    nam.Text = v.Name
                end
            end
        )
        if v.Transparency == 1 then
            nam.Text = ""
        else
            nam.Text = v.Name
        end
    end

    wp.ChildAdded:connect(
        function(n)
            if tostring(n.Name) == "PikaTrail2" or tostring(n.Name) == "ComBat" or tostring(n.Name) == "Combat" then
                wait(0.1)
                n:Destroy()
            end
        end
    )
    for _, v in pairs(wp:GetChildren()) do
        if tostring(v.Name) == "PikaTrail2" or tostring(v.Name) == "ComBat" or tostring(v.Name) == "Combat" then
            v:Destroy()
        end
    end
end

firstScript()

-------------------------------------------------------------
----------------------------ESP------------------------------
local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

function createESP(parent)
    if parent.Name ~= lplr.Name then
        local bgui = Instance.new("BillboardGui", parent.Character.Head)
        bgui.Name = ("EGUI")
        bgui.AlwaysOnTop = true
        bgui.ExtentsOffset = Vector3.new(0, 3, 0)
        bgui.Size = UDim2.new(0, 200, 0, 50)
        local nam = Instance.new("TextLabel", bgui)
        nam.Text = parent.Name
        nam.BackgroundTransparency = 1
        nam.TextSize = 14
        nam.Font = ("Arial")
        nam.TextColor3 = Color3.fromRGB(196, 40, 28)
        nam.Size = UDim2.new(0, 200, 0, 50)
        for _, p in pairs(parent.Character:GetChildren()) do
            if p.Name == ("Head") then
                for _, f in pairs(faces) do
                    local m = Instance.new("SurfaceGui", p)
                    m.Name = ("EGUI")
                    m.Face = f
                    m.Active = true
                    m.AlwaysOnTop = true
                    local mf = Instance.new("Frame", m)
                    mf.Size = UDim2.new(1, 0, 1, 0)
                    mf.BorderSizePixel = 0
                    mf.BackgroundTransparency = 0.5
                    mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                end
            end
        end
    end
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        o.CharacterAdded:Connect(
            function(characterModel)
                wait(1)
                createESP(o)
            end
        )
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    wait(1)
                    createESP(newPlayer)
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Character ~= nil then
            createESP(o)
        end
    end
end

espFirst()

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
local jump = 50

function statsPlayerJp()
    humanoidP.JumpPower = jump
    humanoidP:GetPropertyChangedSignal("JumpPower"):connect(
        function()
            if humanoidP.JumpPower ~= jump then
                humanoidP.JumpPower = jump
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(1)
            humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
            humanoidP.JumpPower = jump
            humanoidP:GetPropertyChangedSignal("JumpPower"):connect(
                function()
                    if humanoidP.JumpPower ~= jump then
                        humanoidP.JumpPower = jump
                    end
                end
            )
        end
    )
end

statsPlayerJp()

function infJump()
    uis.JumpRequest:connect(
        function()
            if lplr.Character ~= nil then
                lplr.Character.Humanoid.JumpPower = jump
                lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end
    )
end
infJump()
function changeJP(typeJP)
    if typeJP == 0 then
        jump = jump + 5
        humanoidP.JumpPower = jump
    elseif typeJP == 1 then
        if jump >= 50 then
            jump = jump - 5
            humanoidP.JumpPower = jump
        end
        if jump < 50 then
            jump = 50
            humanoidP.JumpPower = jump
        end
    end
end
