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

_G.ws_g = 30
_G.jp_g = 50
_G.hitBoxSize = {50, 50, 50}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

_G.autoFarmEN = false
_G.remoteList = {"WeaponAttackStart", "WeaponAnimComplete"}
_G.takeItem = false

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
    end
)

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/TTZxVeAu"), true))() --Humanoid Teleport
    end
)
wait(0.1)
spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

function autoFarm()
    while _G.autoFarm do
        wait(0.1)
        local Remote = rs.Aero.AeroRemoteServices.GameService["WeaponAttackStart"]
        local Arguments = {}
        Remote:FireServer(unpack(Arguments))

        local Remote = rs.Aero.AeroRemoteServices.GameService["WeaponAnimComplete"]
        local Arguments = {}
        Remote:FireServer(unpack(Arguments))
    end
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

        if keyDown == "p" then
            _G.autoFarmEN = not _G.autoFarmEN
            autoFarm()
        end

        if keyDown == "m" then
            if _G.takeItem == false then
                _G.takeItem = true
                for _, v in pairs(wp.Scene.ResourceNodes1:GetChildren()) do
                    wait(0.4)
                    local curLocation = v.CFrame
                    v.CFrame = lplr.Character.HumanoidRootPart.CFrame
                    v.CFrame = curLocation
                end
                _G.takeItem = false
            end
        end
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)
