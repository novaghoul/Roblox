loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTestTeam.lua"), true))() -- 1st Lua

mouse.Button1Down:connect(
    function()
        if tostring(lplr.Team) == "Humans" then
            local toolPlayer = lplr.Character:FindFirstChildOfClass("Tool")
            if toolPlayer then
                for _,v in pairs(wp:GetChildren()) do
                    if v:IsA("Model") then
                        local args = {
                            [1] = lplr.Character:FindFirstChildOfClass("Tool"),
                            [2] = v,
                            [3] = Vector3.new(v.HumanoidRootPart.CFrame.x, v.HumanoidRootPart.CFrame.y, v.HumanoidRootPart.CFrame.z),
                            [4] = Vector3.new(v.HumanoidRootPart.CFrame.x, v.HumanoidRootPart.CFrame.y, v.HumanoidRootPart.CFrame.z)
                        }
                        
                        rs.Remotes.Weapon.Sword.Damage:FireServer(unpack(args))
                    end
                end
            end
        end
    end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "q" then
            if tostring(lplr.Team) == "Robots" then
                rs.Remotes.Robot.Explode:InvokeServer()
            end
        end
    end
)