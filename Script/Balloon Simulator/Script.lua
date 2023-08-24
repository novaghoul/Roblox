loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 30
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

getgenv().numBall = 26
while wait() do
    for _,v in pairs(wp.Objects:GetChildren()) do
        for _,l in pairs(v:GetChildren()) do
            for _,n in pairs(l:GetChildren()) do
                if n:IsA("MeshPart") or n:IsA("Part") then
                    if (n.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 15 then
                        local args = {
                            [1] = n,
                            [2] = Vector3.new(0, 0, 0),
                            [3] = numBall,
                            [4] = "Normal"
                        }
                        
                        rs.Packages.Knit.Services.BalloonService.RF.ClickedForBalloon:InvokeServer(unpack(args))
                    end
                elseif n:IsA("Model") then
                    for _,m in pairs(n:GetChildren()) do
                        if m:IsA("MeshPart") or m:IsA("Part") then
                            if (m.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 15 then
                                local args = {
                                    [1] = m,
                                    [2] = Vector3.new(0, 0, 0),
                                    [3] = numBall,
                                    [4] = "Normal"
                                }
                                
                                rs.Packages.Knit.Services.BalloonService.RF.ClickedForBalloon:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            end
            -- local p = l:FindFirstChildOfClass("MeshPart") or l:FindFirstChildOfClass("Part")
            -- if p then
            -- end
        end
    end
end
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Inf_Jump Lua