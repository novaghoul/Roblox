loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

print("Left Control + Click is to Save Tools, Left Alt is to Load Tools, and Right Alt is to Drop Tools.")
print("Right Control is to Kill Yourself")

uis.InputBegan:Connect(
    function(input, gameProcessed)

        --Save Tools
        if input.UserInputType.Value == 0 then -- Mouse Click
            if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
                return
            end
            if not mouse.Target then
                return
            end
            for _, v in pairs(lplr.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = lplr
                end
            end
        end

        -- Load Tools
        if uis:IsKeyDown(Enum.KeyCode.LeftAlt) then
            for _, v in pairs(lplr:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = lplr.Backpack
                end
            end
        end

        -- Drop Tools
        if uis:IsKeyDown(Enum.KeyCode.RightAlt) then
            for i, v in pairs(lplr.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.CanBeDropped = true
                    v.Parent = workspace
                end
            end
        end

        -- Kill Yourself
        if uis:IsKeyDown(Enum.KeyCode.RightControl) then
            lplr.Character.Humanoid.Health = 0
        end
    end
)