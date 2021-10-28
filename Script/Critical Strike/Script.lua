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
_G.ws_g = 40
_G.jp_g = 60
_G.hitBoxSize = {10, 10, 10}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function notify(msg)
    sg:SetCore(
        "SendNotification",
        {
            Title = "Critical Strike",
            Text = msg,
            Duration = 3
        }
    )
end

function firstScript()
end
firstScript()

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    if wp:FindFirstChild(lplr.Name) then
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g

        lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
            function()
                if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                    lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                end
            end
        )
    end
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

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "k" then
            changeWS(0)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "l" then
            changeWS(1)
            notify("Walk Speed : " .. lplr.Character.Humanoid.WalkSpeed)
        end
    end
)

-- local Remote = game.Workspace["Class Room - Burst"]["Class - Mage"]["Button Main Skin"]["ClassArmor"]

-- local Arguments = {
--     [1] = Workspace.WAOHoukaShu.Torso
-- }

-- Remote:FireServer(unpack(Arguments))