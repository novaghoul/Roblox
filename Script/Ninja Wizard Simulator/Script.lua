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

_G.autoFarmEN = false
_G.mouseClick = false
_G.nameSword = "Katana1"
_G.jp_g = 50
_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 1
-- HumanoidRootPart
wp.Gravity = 100

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

function notify(msg)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Ninja Assassin",
            Text = msg,
            Duration = 5
        }
    )
end

function firstScript()
    for _, v in pairs(wp:GetChildren()) do
        if v.Name == "EarthExplosion" then
            v:Destroy()
        end
    end
    spawn(
        function()
            for _, o in pairs(wp:GetChildren()) do
                if o.Name == "XpOrb" then
                    wait(0.1)
                    o.Part.CFrame = lplr.Character.HumanoidRootPart.CFrame
                end
            end
        end
    )

    lplr.Backpack.ChildAdded:connect(
        function(m)
            if m.Name == "SpellSword" then
                for _, v in pairs(m:GetChildren()) do
                    if v:IsA("Accoutrement") or v:IsA("Animation") then
                        v:Destroy()
                    end
                end
            end
        end
    )

    lplr.Character.ChildAdded:connect(
        function(m)
            if m.Name == "SpellSword" then
                wait(0.1)
                for _, v in pairs(m:GetChildren()) do
                    if v:IsA("Accoutrement") then
                        _G.nameSword = v:GetChildren()[1].Name
                    end
                end
            end
        end
    )

    wp.ChildAdded:connect(
        function(m)
            if m.Name == "XpOrb" then
                wait(0.1)
                m.Part.CFrame = lplr.Character.HumanoidRootPart.CFrame
            end
        end
    )

    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.1)
            lplr.Backpack.ChildAdded:connect(
                function(m)
                    if m.Name == "SpellSword" then
                        for _, v in pairs(m:GetChildren()) do
                            if v:IsA("Accoutrement") or v:IsA("Animation") then
                                v:Destroy()
                            end
                        end
                    end
                end
            )

            lplr.Character.ChildAdded:connect(
                function(m)
                    if m.Name == "SpellSword" then
                        wait(0.1)
                        for _, v in pairs(m:GetChildren()) do
                            if v:IsA("Accoutrement") then
                                _G.nameSword = v:GetChildren()[1].Name
                            end
                        end
                    end
                end
            )
            autoFarm()
        end
    )
end
firstScript()

-------------------------------------------------------------
--------------------------CMDS-------------------------------
function etool()
    for _, v in pairs(lplr.Backpack:GetChildren()) do
        v.Parent = lplr.Character
    end
end

local function executeChat(code)
    if string.lower(string.sub(code, 1, 2)) == "/e" then
        local split = {}

        for part in code:gmatch("%S+") do
            table.insert(split, part)
        end

        table.remove(split, 1)

        local command = string.lower(string.sub(split[1], 1))

        local first = split[2]

        if string.find("etoolall", command) then
            etool()
        end
    end
end
lplr.Chatted:Connect(executeChat)

-------------------------------------------------------------
--------------------------Auto Farm--------------------------
function autoFarm()
    while _G.autoFarmEN do
        wait()
        etool()
        if lplr.Character:FindFirstChild("TrainningSword") then
            lplr.Character.UpperTorso:Remove()
        end
        local t = lplr.Character.TrainingSword["_TrainingSword"]
        t:FireServer()
    end
end

-------------------------------------------------------------
--------------------------Other------------------------------

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
    end
)

wait(0.5)

spawn(
    function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
    end
)

function infJump()
    if wp:FindFirstChild(lplr.Name) then
        lplr.Character.Humanoid.JumpPower = _G.jp_g
        lplr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "p" then
            _G.autoFarmEN = not _G.autoFarmEN

            if _G.autoFarmEN then
                notify("Auto Farm : Enable")
            else
                notify("Auto Farm : Disable")
            end

            autoFarm()
        end

        if keyDown == "f" then
            _G.noclipAll = not _G.noclipAll
        end

        if keyDown == " " then
            infJump()
        end
    end
)

mouse.Button1Down:connect(
    function()
        _G.mouseClick = true
        while _G.mouseClick do
            if lplr.Character:FindFirstChild("SpellSword") then
                local hum = lplr.Character.Head.CFrame * CFrame.new(0, 5, 0)
                local p = Vector3.new(hum.x, hum.y, hum.z)
                local q = Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
                local r = rs.Assets.Swords[_G.nameSword]
                local s = "173"
                local t = lplr.Character.SpellSword["_Sword"]
                t:FireServer(p, q, r, s)
            end
            wait(0.01)
        end
    end
)

mouse.Button1Up:connect(
    function()
        _G.mouseClick = false
    end
)

lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new(mouse.X, mouse.y))
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if _G.noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)

-- local GoldSwords = {
--     wp.GoldWeaponStandScimitar.StandClicker.CFrame,
--     wp.GoldWeaponStandHero.StandClicker.CFrame,
--     wp.GoldWeaponStandFirelance.StandClicker.CFrame,
--     wp.GoldWeaponStandCyber.StandClicker.CFrame,
--     wp.GoldWeaponStandVanquisher.StandClicker.CFrame,
--     wp.GoldWeaponStandBreaker.StandClicker.CFrame,
--     wp.GoldWeaponStandKatana.StandClicker.CFrame,
--     wp.GoldWeaponStandTribal.StandClicker.CFrame
-- }

-- for _, v in pairs(GoldSwords) do
--     wait(.5)
--     lplr.Character.HumanoidRootPart.CFrame = v
-- end
