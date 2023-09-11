local Workspace = game:GetService("Workspace")
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 40
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESPTest.lua"), true))() -- ESPTest Lua
getgenv().aMon = nil
spawn(function()
    while wait(.5) do
        for _,v in pairs(wp.Tycoons:GetChildren()) do
            if tostring(v.StarterItems.MainCollectionArea.Main.Attachment.BillboardGui.TextLabel.Text) ~= "Collect: $0" then
                local args = {
                    [1] = v,
                    [2] = v.StarterItems.MainCollectionArea
                }
                rs.Remotes.RequestCollection:FireServer(unpack(args))
            end
        end
    end
end)

spawn(function()
    while wait(.1) do
        if aMon then
            print("0")
            if (aMon.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 50 then
                print("1")
                if lplr.Character:FindFirstChildOfClass("Tool") then
                    print("2")
                    local aTool = lplr.Character:FindFirstChildOfClass("Tool")
                    local args = {
                        [1] = aTool
                    }
                    rs.Remotes.FireWeapon:FireServer(unpack(args))
                    
                    local args1 = {
                        [1] = aTool,
                        [2] = aMon,
                        [3] = aMon.Parent:FindFirstChild("Humanoid") or aMon.Parent.Parent:FindFirstChild("Humanoid"),
                        [4] = true,
                        [5] = Vector3.new(aMon.Position.X, aMon.Position.Y, aMon.Position.Z),
                        [6] = aTool.Model.Muzzle,
                        [7] = CFrame.new(0.6101531982421875, -0.239501953125, -0.24219512939453125, -1, 0, 0, 0, 0, 1, 0, 1, 0),
                        [8] = Vector3.new(aMon.Size.X, aMon.Size.Y, aMon.Size.Z)
                    }
                    rs.Remotes.WeaponHit:FireServer(unpack(args1))
                    print("3")
                end
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

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- NoClip Lua
