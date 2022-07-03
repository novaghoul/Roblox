loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

ws_g = 20
jp_g = 50
noclipAll = false

function checkRigType()
    if lplr.Character:FindFirstChild("Torso") then
        return r6
    else
        return r15
    end
end

-------------------------------------------------------------
--------------------------Other------------------------------
function infJump()
    lplr.Character.Humanoid.JumpPower = jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                lplr.Character.Humanoid.WalkSpeed = ws_g
            end
        end
    )
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.5)
            lplr.Character.Humanoid.WalkSpeed = ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= ws_g then
                        lplr.Character.Humanoid.WalkSpeed = ws_g
                    end
                end
            )
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        ws_g = ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = ws_g
    elseif typeWS == 1 then
        if ws_g >= 0 then
            ws_g = ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
        if ws_g < 16 then
            ws_g = 16
            lplr.Character.Humanoid.WalkSpeed = ws_g
        end
    end
end

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == " " then
            infJump()
        end

        if keyDown == "[" then
            changeWS(0)
            NotifyG("Walk Speed :", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "]" then
            changeWS(1)
            NotifyG("Walk Speed :", lplr.Character.Humanoid.WalkSpeed)
        end

        if keyDown == "e" then
            noclipAll = not noclipAll
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)
-- if keyDown == "x" then
--     for _, v in pairs(debug.getregistry()) do
--         if typeof(v) == "table" then
--             if v.GUN_NAME then
--                 v.DAMAGE_MULTI = {
--                     TORSO_DAMAGE = 5, 
--                     LIMB_DAMAGE = 5, 
--                     HEAD_DAMAGE = 5
--                 }
--                 v.RPM = 700
--                 v.PENETRATION = 1000
--                 v.BULLET_SPEED = 5000
--                 v.BULLET_LIFETIME = 1
--                 v.BULLET_MAXRANGE = 10000
--                 v.SPREAD = {
--                     DEFAULT = 1, 
--                     MIN = 1, 
--                     MAX = 1, 
--                     CROUCH_REDUCTION = 1, 
--                     AIM_REDUCTION = 1, 
--                     WALK_ADDITION = 0
--                 }
--                 -- v.AMMO = {
--                 --     MAG_CAPACITY = math.huge,
--                 --     AMMO_CAPACITY = math.huge
--                 -- }
--                 v.CAMERA_RECOIL = {
--                     IDLE = function()
--                         return Vector3.new(0, 0, 0);
--                     end, 
--                     CROUCH = function()
--                         return Vector3.new(0, 0, 0);
--                     end, 
--                     AIM = function()
--                         return Vector3.new(0, 0, 0);
--                     end
--                 }
--                 v.RIG_RECOIL = {
--                     IDLE = function()
--                         return Vector3.new(0, 0, 0);
--                     end, 
--                     CROUCH = function()
--                         return Vector3.new(0, 0, 0);
--                     end, 
--                     AIM = function()
--                         return Vector3.new(0, 0, 0);
--                     end
--                 }
--             end
--         end
--     end
-- end