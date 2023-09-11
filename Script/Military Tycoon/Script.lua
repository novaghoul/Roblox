loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

hitBoxBody = "Head"
toggleJP = false
ws_g = 40
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Ctrl_Click_TP.lua"), true))() -- Ctrl_Click_TP Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESPTest Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/HitBox.lua"), true))() -- HitBox Lua

spawn(function()
    while wait(1) do
        for _,v in pairs(wp:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                v.MaxActivationDistance = 20
            end
        end
    end
end)
spawn(function() 
-- game:GetService("Workspace").Characters.Sanford.Head
    for _,v in pairs(wp.Characters:GetChildren()) do
        if v:FindFirstChild("Head") then
            createHitBox(v)
        end
        v.ChildAdded:connect(
            function(m)
                wait(.5)
                if tostring(m.Name) == "Head" then
                    createHitBox(v)
                end
            end
        )
    end
    wp.Characters.ChildAdded:connect(
        function(m)
            wait(.5)
            if m:FindFirstChild("Head") then
                createHitBox(m)
            end
            m.ChildAdded:connect(
                function(n)
                    wait(.5)
                    if tostring(n.Name) == "Head" then
                        createHitBox(m)
                    end
                end
            )
        end
    )
end)
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "x" then
            if ws_g == 40 then
                ws_g = 100
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            else
                ws_g = 40
                lplr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = ws_g
                NotifyG("Walk Speed", lplr.Character.Humanoid.WalkSpeed)
            end
        end
        if keyDown == "z" then
            if tostring(aPlayer) == "false" then
                aPlayer = "true"
                lplr.Character.HumanoidRootPart.Anchored = true
            else
                aPlayer = "false"
                lplr.Character.HumanoidRootPart.Anchored = false
            end
        end
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, .5, -disTeleport)
		end
    end
)
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua