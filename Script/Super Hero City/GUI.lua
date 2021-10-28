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

_G.Disabled = false
_G.stats = {"Strength", "Endurance", "Agility", "Jump", "Mind"}
_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.enESP = true
_G.hitBoxSize = {20, 20, 20}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 1
-- HumanoidRootPart

-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local lblTitle = Instance.new("TextLabel")
local bntAutoFarm = Instance.new("TextButton")
local bntCodes = Instance.new("TextButton")
local bntHitbox = Instance.new("TextButton")
local bntESP = Instance.new("TextButton")
--Properties:
ScreenGui.Parent = cg
ScreenGui.Name = "SuperheroCityGui"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainGUI.Parent = ScreenGui
MainGUI.BackgroundColor3 = Color3.new(0, 0, 0)
MainGUI.BorderSizePixel = 0
MainGUI.Position = UDim2.new(0.0368906446, 0, 0.0421686731, 0)
MainGUI.Size = UDim2.new(0.132411063, 0, 0.188253015, 0)
MainGUI.Active = true
MainGUI.Draggable = true

lblTitle.Parent = MainGUI
lblTitle.BackgroundColor3 = Color3.new(1, 1, 1)
lblTitle.BackgroundTransparency = 1
lblTitle.Size = UDim2.new(0.99502486, 0, 0.400000006, 0)
lblTitle.Font = Enum.Font.GothamBold
lblTitle.Text = "Superhero City"
lblTitle.TextColor3 = Color3.new(1, 1, 1)
lblTitle.TextScaled = true
lblTitle.TextSize = 14
lblTitle.TextWrapped = true

bntAutoFarm.Parent = MainGUI
bntAutoFarm.BackgroundColor3 = Color3.new(1, 1, 1)
bntAutoFarm.BackgroundTransparency = 0.89999997615814
bntAutoFarm.Position = UDim2.new(0, 0, 0.744000018, 0)
bntAutoFarm.Size = UDim2.new(0.333333343, 0, 0.256000012, 0)
bntAutoFarm.Font = Enum.Font.GothamBold
bntAutoFarm.Text = "Auto-Farm"
bntAutoFarm.TextColor3 = Color3.new(1, 1, 1)
bntAutoFarm.TextScaled = true
bntAutoFarm.TextSize = 14
bntAutoFarm.TextWrapped = true

bntCodes.Parent = MainGUI
bntCodes.BackgroundColor3 = Color3.new(1, 1, 1)
bntCodes.BackgroundTransparency = 0.89999997615814
bntCodes.Position = UDim2.new(0, 0, 0.488000005, 0)
bntCodes.Size = UDim2.new(0.333333343, 0, 0.256000012, 0)
bntCodes.Font = Enum.Font.GothamBold
bntCodes.Text = "Use all codes"
bntCodes.TextColor3 = Color3.new(1, 1, 1)
bntCodes.TextScaled = true
bntCodes.TextSize = 14
bntCodes.TextWrapped = true

bntHitbox.Parent = MainGUI
bntHitbox.BackgroundColor3 = Color3.new(1, 1, 1)
bntHitbox.BackgroundTransparency = 0.89999997615814
bntHitbox.Position = UDim2.new(0.666666687, 0, 0.744000018, 0)
bntHitbox.Size = UDim2.new(0.333333343, 0, 0.256000012, 0)
bntHitbox.Font = Enum.Font.GothamBold
bntHitbox.Text = "Bigger hitbox's"
bntHitbox.TextColor3 = Color3.new(1, 1, 1)
bntHitbox.TextScaled = true
bntHitbox.TextSize = 14
bntHitbox.TextWrapped = true

bntESP.Parent = MainGUI
bntESP.BackgroundColor3 = Color3.new(1, 1, 1)
bntESP.BackgroundTransparency = 0.89999997615814
bntESP.Position = UDim2.new(0.666666687, 0, 0.488000005, 0)
bntESP.Size = UDim2.new(0.333333343, 0, 0.256000012, 0)
bntESP.Font = Enum.Font.GothamBold
bntESP.Text = "ESP"
bntESP.TextColor3 = Color3.new(1, 1, 1)
bntESP.TextScaled = true
bntESP.TextSize = 14
bntESP.TextWrapped = true
-- Scripts:
bntAutoFarm.MouseButton1Down:connect(
    function()
        _G.Disabled = not _G.Disabled
        spawn(
            function()
                while _G.Disabled do
                    wait()
                    local A_1 = "Stat_" .. _G.stats[1]
                    local Event = rs.TrainStat
                    Event:InvokeServer(A_1, true)
                end
            end
        )
        spawn(
            function()
                while _G.Disabled do
                    wait()
                    local A_1 = "Stat_" .. _G.stats[2]
                    local Event = rs.TrainStat
                    Event:InvokeServer(A_1, true)
                end
            end
        )
        spawn(
            function()
                while _G.Disabled do
                    wait()
                    local A_1 = "Stat_" .. _G.stats[3]
                    local Event = rs.TrainStat
                    Event:InvokeServer(A_1, true)
                end
            end
        )
        spawn(
            function()
                while _G.Disabled do
                    wait()
                    local A_1 = "Stat_" .. _G.stats[4]
                    local Event = rs.TrainStat
                    Event:InvokeServer(A_1)
                end
            end
        )
        spawn(
            function()
                while _G.Disabled do
                    wait()
                    local A_1 = "Stat_" .. _G.stats[5]
                    local Event = rs.TrainStat
                    Event:InvokeServer(A_1)
                end
            end
        )
    end
)

bntCodes.MouseButton1Down:connect(
    function()
        for _, v in pairs(lplr.PlayerInfo.Code:GetChildren()) do
            local A_1 = {
                ["bool"] = true,
                ["TextSent"] = v.Name
            }
            local Event = rs.Assets.Communication.UvT3kZRbd7P48Dr5.C3MmTC
            Event:InvokeServer(A_1)
            wait(1)
        end
    end
)

enHitbox = true
bntHitbox.MouseButton1Down:connect(
    function()
        if enHitbox then
            enHitbox = false
            spawn(
                function()
                    loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
                end
            )
        end
    end
)

bntESP.MouseButton1Down:connect(
    function()
        spawn(
            function()
                loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
            end
        )
    end
)

function infJump()
    --lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

uis.InputBegan:Connect(
    function(input, gameProcessed)
        if input.UserInputType.Value == 8 then
            if input.KeyCode.Value == 32 then
                infJump()
            end

        -- if input.KeyCode.Value == 91 then
        --     for _, o in pairs(plrs:GetPlayers()) do
        --         if tostring(o.Name) ~= tostring(lplr.Name) then
        --             if o.Character:FindFirstChild(_G.hitBoxBody) then
        --                 wait(0.1)
        --                 createHitBox(o)
        --             end
        --         end
        --     end
        -- end

        -- if input.KeyCode.Value == 93 then
        --     for _, o in pairs(plrs:GetPlayers()) do
        --         if tostring(o.Name) ~= tostring(lplr.Name) then
        --             if o.Character:FindFirstChild("Head") then
        --                 wait(0.1)
        --                 createESP(o)
        --             end
        --         end
        --     end
        -- end
        end
    end
)

wait(3)

local VirtualUser = game:GetService("VirtualUser")

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
