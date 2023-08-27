loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

hitBoxSize = {7, 7, 7}
hitBoxBody = "HumanoidRootPart"
toggleJP = false
ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESPTest Lua

getgenv().aMon = nil
getgenv().atOn = true

spawn(function()
    while wait(0.3) do
        if tostring(atOn) == "true" then
            local args = {
                [1] = "LoadSpell",
                [2] = "incendio"
            }
            rs.Modules.Network.RemoteEvent:FireServer(unpack(args))
            for i=1,5 do
                wait(.1)
                local args1 = {
                    [1] = "ReplicateCast",
                    [2] = {
                        ["TargetPart"] = aMon,
                        ["TargetPosition"] = Vector3.new(0, 0, 0),
                        ["AutoTargetCharacter"] = true,
                        ["LookDirection"] = Vector3.new(0, 0, 0),
                        ["Perfect"] = true,
                        ["Spam"] = true,
                        ["TargetNormal"] = Vector3.new(0, 0, 0)
                    }
                }
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args1))

                local args2 = {
                    [1] = "IncendioHit",
                    [2] = Vector3.new(0, 0, 0),
                    [3] = aMon,
                    [4] = Vector3.new(0, 0, 0)
                }
                
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args2))
            end
            wait(.3)
            args = {
                [1] = "LoadSpell",
                [2] = "stupefy"
            }
            rs.Modules.Network.RemoteEvent:FireServer(unpack(args))
            for i=1,5 do
                wait(.1)
                local args1 = {
                    [1] = "ReplicateCast",
                    [2] = {
                        ["TargetPart"] = aMon,
                        ["TargetPosition"] = Vector3.new(0, 0, 0),
                        ["AutoTargetCharacter"] = true,
                        ["LookDirection"] = Vector3.new(0, 0, 0),
                        ["Perfect"] = true,
                        ["Spam"] = true,
                        ["TargetNormal"] = Vector3.new(0, 0, 0)
                    }
                }
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args1))

                local args2 = {
                    [1] = "StupefyHit",
                    [2] = Vector3.new(0, 0, 0),
                    [3] = aMon,
                    [4] = Vector3.new(0, 0, 0)
                }
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args2))
            end
            wait(.3)
            args = {
                [1] = "LoadSpell",
                [2] = "diffindo"
            }
            rs.Modules.Network.RemoteEvent:FireServer(unpack(args))
            for i=1,5 do
                wait(.1)
                local args1 = {
                    [1] = "ReplicateCast",
                    [2] = {
                        ["TargetPart"] = aMon,
                        ["TargetPosition"] = Vector3.new(0, 0, 0),
                        ["AutoTargetCharacter"] = true,
                        ["LookDirection"] = Vector3.new(0, 0, 0),
                        ["Perfect"] = true,
                        ["Spam"] = true,
                        ["TargetNormal"] = Vector3.new(0, 0, 0)
                    }
                }
                
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args1))
                local args2 = {
                        [1] = "DiffindoHit",
                        [2] = aMon
                }
                
                rs.Modules.Network.RemoteEvent:FireServer(unpack(args2))
            end
            wait(.3)
            -- args = {
            --     [1] = "LoadSpell",
            --     [2] = "persector"
            -- }
            -- rs.Modules.Network.RemoteEvent:FireServer(unpack(args))

            -- for i=1,5 do
            --     wait(.1)
            --     local args1 = {
            --         [1] = "ReplicateCast",
            --         [2] = {
            --             ["TargetPart"] = aMon,
            --             ["TargetPosition"] = Vector3.new(0, 0, 0),
            --             ["AutoTargetCharacter"] = true,
            --             ["LookDirection"] = Vector3.new(0, 0, 0),
            --             ["Perfect"] = true,
            --             ["Spam"] = true,
            --             ["TargetNormal"] = Vector3.new(0, 0, 0)
            --         }
            --     }
                
            --     rs.Modules.Network.RemoteEvent:FireServer(unpack(args1))
            --     local args2 = {
            --             [1] = "PersectorHit",
            --             [2] = Vector3.new(0, 0, 0),
            --             [3] = aMon
            --     }
            --     rs.Modules.Network.RemoteEvent:FireServer(unpack(args2))
            -- end
            -- wait(.3)
            -- args = {
            --     [1] = "LoadSpell",
            --     [2] = "bublio"
            -- }
            -- rs.Modules.Network.RemoteEvent:FireServer(unpack(args))
            -- for i=1,10 do
            --     wait(.1)
            --     local args1 = {
            --         [1] = "ReplicateCast",
            --         [2] = {
            --             ["TargetPart"] = aMon,
            --             ["TargetPosition"] = Vector3.new(0, 0, 0),
            --             ["AutoTargetCharacter"] = true,
            --             ["LookDirection"] = Vector3.new(0, 0, 0),
            --             ["Perfect"] = true,
            --             ["Spam"] = true,
            --             ["TargetNormal"] = Vector3.new(0, 0, 0)
            --         }
            --     }
            --     rs.Modules.Network.RemoteEvent:FireServer(unpack(args1))

            --     local args2 = {
            --             [1] = "BublioHit",
            --             [2] = nameHit.Parent,
            --             [3] = Vector3.new(0, 0, 0)
            --     }
            --     rs.Modules.Network.RemoteEvent:FireServer(unpack(args2))
            -- end
            -- wait(.3)
        end
    end
end)
spawn(function()
    while wait(1) do
        for _,v in pairs(wp.Mobs:GetChildren()) do
            if v:FindFirstChild("HumanoidRootPart") then
                createHitBox(v)
            end
        end
    end
end)

mouse.Button1Down:connect(
	function()
		if not mouse.Target then
			return
		end
		aMon = mouse.Target
	end
)

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "z" then
            if tostring(atOn) == "false" then
                atOn = "true"
                NotifyG("Attack", tostring(atOn))
            else
                atOn = "false"
                NotifyG("Attack", tostring(atOn))
            end
        end
    end
)
