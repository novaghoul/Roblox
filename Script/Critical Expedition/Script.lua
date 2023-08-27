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

local humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")

_G.ws_g = 50
_G.jp_g = 60
_G.noclipAll = false

_G.r6 = {"Head", "Torso"}
_G.r15 = {"Head", "UpperTorso", "LowerTorso"}

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return _G.r6
    else
        return _G.r15
    end
end

function SendChat(String) -- Send a chat to the game chat
    sg:SetCore("ChatMakeSystemMessage", {
        Text = "[OUTPUT]: " .. String
    })
end

function notify(msg)
    sg:SetCore("SendNotification", {
        Title = "Walk Speed and Jump Power",
        Text = msg,
        Duration = 3
    })
end

function checkReturn(String)
    if sg:GetCoreGuiEnabled(3) == false then
        return notify(String)
    else
        return SendChat(String)
    end
end

function HeyDevs(c)
    c:WaitForChild("Stats"):WaitForChild("DefenseBuff"):Destroy()
end
HeyDevs(lplr.Character)
lplr.CharacterAdded:Connect(HeyDevs)

local r = lplr.Character.HumanoidRootPart
local old = r.CFrame
for i, v in pairs(wp.Chests:GetChildren()) do
    if v:FindFirstChild("Giver") and v.Giver:FindFirstChild("TouchInterest") and not v:FindFirstChild("Open") then
        repeat
            r.CFrame = v.Giver.CFrame + Vector3.new(0, 3, 0)
            wait()
            firetouchinterest(r, v.Giver, 0)
            firetouchinterest(r, v.Giver, 1)
        until v:FindFirstChild("Open")
    end
end
r.CFrame = old

-- Variable
local de = game:GetService("Debris")

-- Function
function InfCombo(c)
    local head = c:WaitForChild("Head")
    head.DescendantAdded:Connect(function(v)
        if v:IsA("Script") then
            de:AddItem(v, 0.1)
        end
    end)
end

-- Connect
lplr.CharacterAdded:Connect(function(characterModel)
    wait(0.5)
    InfCombo(characterModel)
end)
InfCombo(lplr.Character)

local ts = game:GetService("TweenService")
local tp = {
    CFrame = New_CFrame
}

function tp(CFrametp)
    ts:Create(lplr.Character.HumanoidRootPart, TweenInfo.new(
        (CFrametp.Position - lplr.Character.HumanoidRootPart.Position).magnitude / 44, Enum.EasingStyle.Quad), {
        CFrame = CFrametp.CFrame
    }):Play()
end

function statsPlayerWs()
    humanoidP.WalkSpeed = _G.ws_g

    humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(function()
        if humanoidP.WalkSpeed ~= _G.ws_g then
            humanoidP.WalkSpeed = _G.ws_g
        end
    end)

    lplr.CharacterAdded:Connect(function(characterModel)
        wait(1)
        humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
        humanoidP.WalkSpeed = _G.ws_g
        humanoidP:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                if humanoidP.WalkSpeed ~= _G.ws_g then
                    humanoidP.WalkSpeed = _G.ws_g
                end
            end)
    end)
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        humanoidP.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
            humanoidP.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 16 then
            _G.ws_g = 16
            humanoidP.WalkSpeed = _G.ws_g
        end
    end
end

function statsPlayerJp()
    humanoidP.JumpPower = _G.jp_g
    humanoidP:GetPropertyChangedSignal("JumpPower"):connect(function()
        if humanoidP.JumpPower ~= _G.jp_g then
            humanoidP.JumpPower = _G.jp_g
        end
    end)

    lplr.CharacterAdded:Connect(function(characterModel)
        wait(1)
        humanoidP = lplr.Character:FindFirstChildOfClass("Humanoid")
        humanoidP.JumpPower = _G.jp_g
        humanoidP:GetPropertyChangedSignal("JumpPower"):connect(
            function()
                if humanoidP.JumpPower ~= _G.jp_g then
                    humanoidP.JumpPower = _G.jp_g
                end
            end)
    end)
end
statsPlayerJp()

function changeJP(typeJP)
    if typeJP == 0 then
        _G.jp_g = _G.jp_g + 5
        humanoidP.JumpPower = _G.jp_g
    elseif typeJP == 1 then
        if _G.jp_g >= 50 then
            _G.jp_g = _G.jp_g - 5
            humanoidP.JumpPower = _G.jp_g
        end
        if _G.jp_g < 50 then
            _G.jp_g = 50
            humanoidP.JumpPower = _G.jp_g
        end
    end
end

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == " " then
        infJump()
    end

    if keyDown == "k" then
        changeWS(0)
        checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == "l" then
        changeWS(1)
        checkReturn("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
    end

    if keyDown == "[" then
        changeJP(0)
        checkReturn("Jump Power :" .. humanoidP.JumpPower)
    end

    if keyDown == "]" then
        changeJP(1)
        checkReturn("Jump Power :" .. humanoidP.JumpPower)
    end

    if keyDown == "f" then
        _G.noclipAll = not _G.noclipAll
    end
end)

lplr.Idled:connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)

game:GetService("RunService").Stepped:connect(function()
    if _G.noclipAll then
        for i = 1, #checkRigType() do
            lplr.Character[checkRigType()[i]].CanCollide = false
        end
        lplr.Character.HumanoidRootPart.CanCollide = false
    end
end)

_G.testing = true
while _G.testing do
    wait(.1)
    if wp:FindFirstChild("CombatFolder") then
        if lplr.Character then
            if wp.CombatFolder:FindFirstChild(lplr.Name) and lplr.Character:FindFirstChild("HumanoidRootPart") then
                for _, v in pairs(wp.CombatFolder[lplr.Name]:GetChildren()) do
                    tp(v:FindFirstChildOfClass("Part"))
                end
            end
        end
    end
end
