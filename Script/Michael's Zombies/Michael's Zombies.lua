loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
print("...")
toggleJP = false
ws_g = 20
jp_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

-------------------------------------------------------------
--------------------------Other------------------------------

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "x" then
            for _, v in pairs(debug.getregistry()) do
                if typeof(v) == "table" then
                    if v.GUN_NAME then
                        v.DAMAGE_MULTI = {
                            TORSO_DAMAGE = 5, 
                            LIMB_DAMAGE = 5, 
                            HEAD_DAMAGE = 5
                        }
                        v.RPM = 1000
                        v.PENETRATION = 1000
                        v.BULLET_SPEED = 5000
                        v.BULLET_LIFETIME = 1
                        v.BULLET_MAXRANGE = 10000
                        v.SPREAD = {
                            DEFAULT = 1, 
                            MIN = 1, 
                            MAX = 1, 
                            CROUCH_REDUCTION = 1, 
                            AIM_REDUCTION = 1, 
                            WALK_ADDITION = 0
                        }
                        -- v.AMMO = {
                        --     MAG_CAPACITY = math.huge,
                        --     AMMO_CAPACITY = math.huge
                        -- }
                        v.CAMERA_RECOIL = {
                            IDLE = function()
                                return Vector3.new(0, 0, 0);
                            end, 
                            CROUCH = function()
                                return Vector3.new(0, 0, 0);
                            end, 
                            AIM = function()
                                return Vector3.new(0, 0, 0);
                            end
                        }
                        v.RIG_RECOIL = {
                            IDLE = function()
                                return Vector3.new(0, 0, 0);
                            end, 
                            CROUCH = function()
                                return Vector3.new(0, 0, 0);
                            end, 
                            AIM = function()
                                return Vector3.new(0, 0, 0);
                            end
                        }
                    end
                end
            end
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua