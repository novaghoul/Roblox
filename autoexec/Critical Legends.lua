loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if tostring(game.GameId) == "3281670400" then

    getgenv().deletePassive = false
    getgenv().bugDamage = false
    getgenv().autoMode = false
    getgenv().autoFarm = false
    getgenv().nameEnemy = "Challenger"

    local Notify = Instance.new("ScreenGui")
    local MainNotify = Instance.new("Frame")
    local lbltitle = Instance.new("TextLabel")
    local lblbossmes = Instance.new("TextLabel")

    Notify.Name = "Notify"
    Notify.Parent = cg
    Notify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainNotify.Name = "MainNotify"
    MainNotify.Parent = Notify
    MainNotify.BackgroundColor3 = Color3.new(0, 0, 0)
    MainNotify.Position = UDim2.new(0.93599999, 0, 0.800000012, 0)
    MainNotify.Size = UDim2.new(0, 100, 0, 50)
    MainNotify.Visible = true

    lbltitle.Name = "lbltitle"
    lbltitle.Parent = MainNotify
    lbltitle.BackgroundColor3 = Color3.new(0, 0, 0)
    lbltitle.BorderColor3 = Color3.new(1, 1, 1)
    lbltitle.Position = UDim2.new(0, 2, 0, 2)
    lbltitle.Size = UDim2.new(0, 96, 0, 23)
    lbltitle.Font = Enum.Font.SourceSans
    lbltitle.Text = "Boss Appears"
    lbltitle.TextColor3 = Color3.new(1, 1, 1)
    lbltitle.TextSize = 14

    lblbossmes.Name = "lblbossmes"
    lblbossmes.Parent = MainNotify
    lblbossmes.BackgroundColor3 = Color3.new(0, 0, 0)
    lblbossmes.BorderColor3 = Color3.new(1, 1, 1)
    lblbossmes.Position = UDim2.new(0, 2, 0, 25)
    lblbossmes.Size = UDim2.new(0, 96, 0, 23)
    lblbossmes.Font = Enum.Font.SourceSans
    lblbossmes.Text = "Eto"
    lblbossmes.TextColor3 = Color3.new(1, 1, 1)
    lblbossmes.TextSize = 14
    -- Scripts:
    jp_g = 65
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESP%20Test.lua"), true))()
    wait()
    -- function funcKill()
    --     -- game:GetService("Workspace").Enemies["Void Boss"].Enemy["His Eye"].TargetingList.WAOKyoHana
    --     -- game:GetService("Workspace").Enemies.Challenger.Enemy.InCombat.Value
    --     -- game:GetService("Workspace").Enemies.Challenger.Enemy.Challenger["Health Fix"]
    --     -- game:GetService("Workspace").Enemies["Luna Boss"].Enemy["Luna Mage"].Dialog
    --     -- game:GetService("Workspace").Enemies["Skeleton King"].Enemy["Skeleton King"].Range

    --     -- game:GetService("Workspace").WAOKyoHana.ActiveItems

    --     for _,v in pairs(wp.Enemies:GetChildren()) do
    --         v.Enemy.ChildAdded:connect(
    --             function(m)
    --                 wait(.5)
    --                 if tostring(skillActiveToggel) == true and m:FindFirstChild("TargetingList") and m.TargetingList:FindFirstChild(tostring(lplr.Name)) then
    --                     repeat wait() until not m:FindFirstChild("Dialog")
    --                     for i = 1, #loopActive do
    --                         local arrayActive = lplr.Character.ActiveItems:GetChildren()
    --                         for i = 1, #activeNum do
    --                             if activeNum[i] == 1 then
    --                                 for i = 1, active1 do
    --                                     local userdata_1 = arrayActive[i]
    --                                     local Target = lplr.Character.ItemActivate
    --                                     Target:FireServer(userdata_1)
    --                                     wait(.01)
    --                                 end
    --                                 wait(.4)
    --                             elseif activeNum[i] == 2  then
    --                                 for i = 1, active2 do
    --                                     local userdata_1 = arrayActive[i]
    --                                     local Target = lplr.Character.ItemActivate
    --                                     Target:FireServer(userdata_1)
    --                                     wait(.01)
    --                                 end
    --                                 wait(.4)
    --                             elseif activeNum[i] == 3 then
    --                                 for i = 1, active3 do
    --                                     local userdata_1 = arrayActive[i]
    --                                     local Target = lplr.Character.ItemActivate
    --                                     Target:FireServer(userdata_1)
    --                                     wait(.01)
    --                                 end
    --                                 wait(.4)
    --                             end
    --                         end
    --                     end
    --                 end
    --             end
    --         )
    --     end
    -- end
    function firstFun()
        if wp.Stalls["Black Market"]:FindFirstChild("Grani") then
            lbltitle.Text = tostring(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart"))
            lblbossmes.Text = tostring(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart").Cost.Value) .. " Gold"
            createESPItem(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart"), 255, 255, 255, 14, "⭐", 0)
        else
            lbltitle.Text = ""
            lblbossmes.Text = ""
        end

        wp.Stalls["Black Market"].ChildAdded:connect(
            function(m)
                wait(1)
                lbltitle.Text = tostring(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart"))
                lblbossmes.Text = tostring(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart").Cost.Value) .. " Gold"
                createESPItem(wp.Stalls["Black Market"].Grani.Shop:FindFirstChildOfClass("MeshPart"), 255, 255, 255, 14, "⭐", 0)
            end
        )

        wp.Stalls["Black Market"].ChildRemoved:connect(
            function(m)
                wait()
                lbltitle.Text = ""
                lblbossmes.Text = ""
            end
        )

		lplr.PlayerGui.Adventure.Inventory["Inventory Setup"]:GetPropertyChangedSignal("Disabled"):connect(
			function()
				wait(.5)
				lplr.PlayerGui.Adventure.Inventory["Inventory Setup"].Disabled = false
			end
		)
        
        lplr.Character.PassiveItems.ChildAdded:connect(
            function(m)
                wait()
                if tostring(deletePassive) == "true" then
                    wait()
                    m:Destroy()
                end
            end
        )
        lplr.CharacterAdded:Connect(function(characterModel)
            wait(1)
            characterModel.PassiveItems.ChildAdded:connect(
            function(m)
                wait()
                if tostring(deletePassive) == "true" then
                    wait()
                    m:Destroy()
                end
            end
        )
        end)
    end
    firstFun()
    -- funcKill()
    mouse.KeyDown:connect(function(keyDown)
        if keyDown == "." then
            deletePassive = not deletePassive
            NotifyG("Del Passive", deletePassive)
        end
        if keyDown == "," then
            local string_1 = "ClearPassiveItems";
            local Target = rs.Remotes.ItemSetup;
            Target:FireServer(string_1);
        end
    end)
	
	uis.InputBegan:Connect(
		function(input, gameProcessed)
			if input.UserInputType.Value == 8 then
				if input.KeyCode.Value == 268 then -- Num *
					autoMode = not autoMode
					NotifyG("Auto Mode", autoMode)
					if tostring(autoMode) == "true" then
						for _,v in pairs(wp.Enemies:GetChildren()) do
							spawn(function()
								while tostring(autoMode) == "true" do
									wait(.1)
									if v.Enemy:FindFirstChildOfClass("Model") then
										local string_1 = lplr.PlayerGui.EncounterMode.Mode.Value
										local Target = v.Enemy.CombatTrigger
										Target:FireServer(string_1)
									end
								end
							end)
						end
					end
				end

				if input.KeyCode.Value == 270 then -- Num +
					bugDamage = not bugDamage
					NotifyG("Bug Damage", bugDamage)
					if bugDamage then
						deletePassive = true
						NotifyG("Del Passive", deletePassive)
					else
						deletePassive = false
						NotifyG("Del Passive", deletePassive)
					end
					while tostring(bugDamage) == "true" do
						for i = 1, 2 do
							local string_1 = "Devil's Scythe"
							local Target = rs.Remotes.ItemSetup
							Target:FireServer(string_1)
						end
						wait(.3)
						local string_1 = "ClearPassiveItems";
						local Target = rs.Remotes.ItemSetup;
						Target:FireServer(string_1);
					end
				end

				if input.KeyCode.Value == 269 then -- Num -
					bugDamage = not bugDamage
					NotifyG("Bug Damage", bugDamage)
					if bugDamage then
						deletePassive = true
						NotifyG("Del Passive", deletePassive)
					else
						deletePassive = false
						NotifyG("Del Passive", deletePassive)
					end
					while tostring(bugDamage) == "true" do
						for i = 1, 2 do
							local string_1 = "Chaos Shield"
							local Target = rs.Remotes.ItemSetup
							Target:FireServer(string_1)
						end
						wait(.3)
						local string_1 = "ClearPassiveItems";
						local Target = rs.Remotes.ItemSetup;
						Target:FireServer(string_1);
					end
				end

				if input.KeyCode.Value == 59 then -- ;
					autoFarm = not autoFarm
					NotifyG("Auto Farm", autoFarm)
					if autoFarm then
						deletePassive = true
						NotifyG("Del Passive", deletePassive)
					else
						deletePassive = false
						NotifyG("Del Passive", deletePassive)
					end
					while tostring(autoFarm) == "true" do
                        wait(.1)
                        if lplr.Character then
                            if lplr.Character:FindFirstChild("Combat Border") then
                                -- local arrayActive = lplr.Character.ActiveItems:GetChildren()
                                -- for i = 1, active1 do
                                --     local userdata_1 = arrayActive[i]
                                --     local Target = lplr.Character.ItemActivate
                                --     Target:FireServer(userdata_1)
                                --     wait(.01)
                                -- end
                                -- wait(.4)
                                -- for i = 1, active2 do
                                --     local userdata_1 = arrayActive[i]
                                --     local Target = lplr.Character.ItemActivate
                                --     Target:FireServer(userdata_1)
                                --     wait(.01)
                                -- end
                                -- wait(.4)
                                -- for i = 1, active3 do
                                --     local userdata_1 = arrayActive[i]
                                --     local Target = lplr.Character.ItemActivate
                                --     Target:FireServer(userdata_1)
                                --     wait(.01)
                                -- end
                                -- wait(.4)
                            else
                                lplr.Character.HumanoidRootPart.CFrame = wp.Arsenals["Blubbs Kingdom"].Base.CFrame  * CFrame.new(0, 5, 0)
                                if lplr.Character.ActiveItems:FindFirstChild("Shot of Imagination") then
                                   lplr.Character.Humanoid.Health = 0
                                end
                                for i = 1, 1 do
                                    for i = 1, 2 do
                                        local string_1 = "Heart Fruit"
                                        local Target = rs.Remotes.ItemSetup
                                        Target:FireServer(string_1)
                                    end
                                    wait(.3)
                                    local string_1 = "ClearPassiveItems"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                end
                                for i = 1, 13 do
                                    for i = 1, 2 do
                                        local string_1 = "Devil's Scythe"
                                        local Target = rs.Remotes.ItemSetup
                                        Target:FireServer(string_1)
                                    end
                                    wait(.3)
                                    local string_1 = "ClearPassiveItems"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                end
                                if nameEnemy == "Challenger" then
                                    lplr.Character.HumanoidRootPart.CFrame = wp.Enemies[nameEnemy].Enemy.EnemyLocation.CFrame  * CFrame.new(0, 10, 0)
                                    nameEnemy = "His Eye"
                                else
                                    lplr.Character.HumanoidRootPart.CFrame = wp.Enemies[nameEnemy].Enemy.EnemyLocation.CFrame  * CFrame.new(0, 10, 0)
                                    nameEnemy = "Challenger"
                                end
                                wait(1)
                            end
                        end
					end
				end
			end
		end
	)
	loadstring(game:HttpGet(("https://pastebinp.com/raw/eccv9pgu"), true))()
end

-- game:GetService("Workspace").WAOKyoHana["Combat Border"]
-- game:GetService("Workspace").Stalls["Black Market"].Grani.Shop["Icy Disable Scroll"]
-- game:GetService("Workspace").Stalls["Black Market"].Grani.Shop["Icy Disable Scroll"].Cost
-- game:GetService("Workspace").Stalls["Black Market"]

-- game.ReplicatedStorage.Remotes.Damage:FireServer(u3, p3.Parent)