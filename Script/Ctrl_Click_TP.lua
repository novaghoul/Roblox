loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

uis.InputBegan:Connect(
    function(input, gameProcessed)
        if not uis:IsKeyDown(306) then
            return
        end
        if input.UserInputType.Value == 0 then
            if not mouse.Target then
                return
            end
            if mouse.Target.Locked == true then
                mouse.Target.Locked = false
            end
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            local camLv = cmr.CFrame.lookVector
            local camRotation = math.atan2(-camLv.X, -camLv.Z)
            pos = CFrame.new(pos.x, pos.y, pos.z)
            lplr.Character.HumanoidRootPart.CFrame = pos * CFrame.Angles(0, camRotation, 0)
        end
    end
)
