loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if tostring(game.GameId) == "3281670400" or tostring(game.GameId) == "3342103394" then

    getgenv().deletePassive = false
    getgenv().bugDamage = false
    getgenv().autoMode = false
    getgenv().autoFarm = false
    getgenv().nameEnemy = "Virus Boss"
    getgenv().nameItemBM = nil
    getgenv().nameItem = "Pizza"
    getgenv().idItem = nil
    getgenv().playerDie = false

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
    jp_g = 75
    ws_g = 75
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESP%20Test.lua"), true))()
    wait()

    local skillOn = false
    local resetOn = false
    local buyItemBM = false
    local buyItem = false
    function firstFun()
        if wp.Stalls["Black Market"]:FindFirstChild("Grani") then
            for _,v in pairs(wp.Stalls["Black Market"].Grani.Shop:GetChildren()) do
                if v:FindFirstChild("ClickDetector") then
                    lbltitle.Text = tostring(v)
                    lblbossmes.Text = tostring(v.Cost.Value) .. " Gold"
                    nameItemBM = v
                    createESPItem(v, 255, 255, 255, 14, "⭐", 0)
                end
            end
        else
            lbltitle.Text = ""
            lblbossmes.Text = ""
        end

        wp.Stalls["Black Market"].ChildAdded:connect(
            function(m)
                wait(1)
                for _,v in pairs(wp.Stalls["Black Market"].Grani.Shop:GetChildren()) do
                    if v:FindFirstChild("ClickDetector") then
                        lbltitle.Text = tostring(v)
                        lblbossmes.Text = tostring(v.Cost.Value) .. " Gold"
                        nameItemBM = v
                        createESPItem(v, 255, 255, 255, 14, "⭐", 0)
                    end
                end
            end
        )

        wp.Stalls["Black Market"].ChildRemoved:connect(
            function(m)
                wait()
                lbltitle.Text = ""
                lblbossmes.Text = ""
            end
        )
        
        -- lplr.Character.PassiveItems.ChildAdded:connect(
        --     function(m)
        --         wait()
        --         if tostring(deletePassive) == "true" then
        --             wait()
        --             m:Destroy()
        --         end
        --     end
        -- )
        lplr.Character.ChildRemoved:connect(
            function(m)
                if tostring(m.Name) == "Combat Border" then
                    resetOn = true
                end
            end
        )
        lplr.CharacterAdded:Connect(function(characterModel)
            wait(1)
            -- characterModel.PassiveItems.ChildAdded:connect(
            -- function(m)
            --     wait()
            --     if tostring(deletePassive) == "true" then
            --         wait()
            --         m:Destroy()
            --     end
            -- end)
            lplr.Character.ChildRemoved:connect(
                function(m)
                    if tostring(m.Name) == "Combat Border" then
                        resetOn = true
                    end
                end
            )
            -- playerDie = false
            -- characterModel.Humanoid.Died:Connect(function()
            --     playerDie = true
            -- end)
        end)
    end
    firstFun()
    
    local acSkill1 = 1
    local acSkill2 = 1
    local acSkill3 = 1
    local mode = "Solo"
    local nameAcSkill1 = "The Elements"
    local nameAcSkill2 = "Dark Burn Scroll"
    local nameAcSkill3 = "Shield Breaker"
    local namePaSkill1 = "Heart Fruit"
    local namePaSkill2 = "Devil's Scythe"
    local namePaSkill3 = "Jacks Knife"
    local function executeChat(code)
        if string.lower(string.sub(code, 1, 2)) == "/e" then
            local split = {}
    
            for part in code:gmatch("%S+") do
                table.insert(split, part)
            end
    
            table.remove(split, 1)
    
            local command = string.lower(string.sub(split[1], 1))
    
            local first = split[2]
            local two = split[3]
    
            if string.find("a1", command) then
                acSkill1 = tonumber(first)
            elseif string.find("a2", command) then
                acSkill2 = tonumber(first)
            elseif string.find("a3", command) then
                acSkill3 = tonumber(first)
            elseif string.find("na1", command) then
                if two == nil then
                    nameAcSkill1 = tostring(first)
                else
                    nameAcSkill1 = tostring(first .. " " .. two)
                end
            elseif string.find("na2", command) then
                if two == nil then
                    nameAcSkill2 = tostring(first)
                else
                    nameAcSkill2 = tostring(first .. " " .. two)
                end
            elseif string.find("na3", command) then
                if two == nil then
                    nameAcSkill3 = tostring(first)
                else
                    nameAcSkill3 = tostring(first .. " " .. two)
                end
            elseif string.find("np1", command) then
                if two == nil then
                    namePaSkill1 = tostring(first)
                else
                    namePaSkill1 = tostring(first .. " " .. two)
                end
            elseif string.find("np2", command) then
                if two == nil then
                    namePaSkill2 = tostring(first)
                else
                    namePaSkill2 = tostring(first .. " " .. two)
                end
            elseif string.find("np3", command) then
                if two == nil then
                    namePaSkill3 = tostring(first)
                else
                    namePaSkill3 = tostring(first .. " " .. two)
                end
            elseif string.find("mode", command) then
                mode = tonumber(first)
            elseif string.find("buy", command) then
                if two == nil then
                    nameItem = tostring(first)
                else
                    nameItem = tostring(first .. " " .. two)
                end
            elseif string.find("chest", command) then
                for _,v in pairs(wp.Chests:GetChildren()) do
                    if v:IsA("Model") then
                        v.Giver.CFrame = lplr.Character.HumanoidRootPart.CFrame
                    end
                    -- game:GetService("Workspace").Chests["Metal Plate"].Giver
                end
            end
        end
    end
    lplr.Chatted:Connect(executeChat)

    -- mouse.KeyDown:connect(function(keyDown)
    --     if keyDown == "." then
    --         deletePassive = not deletePassive
    --         NotifyG("Del Passive", deletePassive)
    --     end
    --     if keyDown == "," then
    --         local string_1 = "ClearPassiveItems";
    --         local Target = rs.Remotes.ItemSetup;
    --         Target:FireServer(string_1);
    --     end
    -- end)

    function FuncServerItem(str)
        if str == "ClearPassive" or str == "ClearActive" then
            rs.Server:FireServer(str)
        else
            rs.Server:FireServer("SetupItem", str)
        end
    end

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
                                        for i=1,5 do
                                            -- local string_1 = lplr.PlayerGui.EncounterMode.Mode.Value
                                            local string_1 = mode
                                            local Target = v.Enemy.CombatTrigger
                                            Target:FireServer(string_1)
                                        end
									end
								end
							end)
						end
					end
				end

				if input.KeyCode.Value == 270 then -- Num + (Buff Stats)
					bugDamage = not bugDamage
					NotifyG("Bug Damage", bugDamage)
					if bugDamage then
						deletePassive = true
						NotifyG("Del Passive", deletePassive)
					else
						deletePassive = false
						NotifyG("Del Passive", deletePassive)
					end

                    FuncServerItem("ClearPassive")
                    
                    for i=1,3 do
                        FuncServerItem("Devil's Scythe")
						wait(.3)
                        FuncServerItem("ClearPassive")
                    end
					while tostring(bugDamage) == "true" do
                        FuncServerItem("Heart Fruit")
						for i = 1, 2 do
                            FuncServerItem("Chaos Shield")
						end
						wait(.3)
                        FuncServerItem("ClearPassive")
                        FuncServerItem("Gravity Shards")
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
                        local string_1 = "Gravity Shards"
                        local Target = rs.Server.ItemSetup
                        Target:FireServer(string_1)
                        local string_1 = "Dragos Knife"
                        local Target = rs.Server.ItemSetup
                        Target:FireServer(string_1)
						for i = 1, 2 do
							local string_1 = "Chaos Shield"
							local Target = rs.Server.ItemSetup
							Target:FireServer(string_1)
						end
						wait(.3)
						local string_1 = "ClearPassiveItems";
						local Target = rs.Server.ItemSetup;
						Target:FireServer(string_1);
					end
				end

				if input.KeyCode.Value == 257 then -- Num 1
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
                        wait()
                        if lplr.Character and tostring(playerDie) == "false" then
                            if lplr.Character:FindFirstChild("Combat Border") then
                                for i=1,5 do
                                    local string_1 = lplr.PlayerGui.EncounterMode.Mode.Value
                                    local Target = wp.Enemies[nameEnemy].Enemy.CombatTrigger
                                    Target:FireServer(string_1)
                                    wait(.3)
                                end
                                local userdata_1 = lplr.Character.ActiveItems:GetChildren()[1]
                                local Target = lplr.Character.ItemActivate
                                Target:FireServer(userdata_1)
                                wait(.2)
                            else
                                local userdata_1 = lplr.Character.ActiveItems:GetChildren()[2]
                                local Target = lplr.Character.ItemActivate
                                Target:FireServer(userdata_1)
                                lplr.Character.HumanoidRootPart.CFrame = wp.Arsenals["Blubbs Kingdom"].Base.CFrame  * CFrame.new(0, 10, 0)
                                if tostring(autoFarm) == "false" then
                                    break
                                end
                                if not lplr.Character.ActiveItems:FindFirstChild("Chop") then
                                    local string_1 = "ClearActive"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                    local string_1 = "Chop";
                                    local Target = rs.Remotes.ItemSetup;
                                    Target:FireServer(string_1);
                                    local string_1 = "Eternal Flame";
                                    local Target = rs.Remotes.ItemSetup;
                                    Target:FireServer(string_1);
                                end
                                for i=1,3 do
                                    local string_1 = "Devil's Scythe"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                    wait(.3)
                                    local string_1 = "ClearPassiveItems";
                                    local Target = rs.Remotes.ItemSetup;
                                    Target:FireServer(string_1);
                                end
                                wait(.3)
                                if tostring(autoFarm) == "false" then
                                    break
                                end
                                for i = 1, 5 do
                                    local string_1 = "Strength Saga"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                    local string_1 = "Heart Fruit"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                    for i = 1, 2 do
                                        local string_1 = "His Eye"
                                        local Target = rs.Remotes.ItemSetup
                                        Target:FireServer(string_1)
                                    end
                                    wait(.3)
                                    local string_1 = "ClearPassiveItems"
                                    local Target = rs.Remotes.ItemSetup
                                    Target:FireServer(string_1)
                                end
                                wait(.3)
                                if tostring(autoFarm) == "false" then
                                    break
                                end
                                local string_1 = "Devil's Scythe"
                                local Target = rs.Remotes.ItemSetup
                                Target:FireServer(string_1)
                                if nameEnemy == "Virus Boss" then
                                    lplr.Character.HumanoidRootPart.CFrame = wp.Enemies[nameEnemy].Enemy.EnemyLocation.CFrame  * CFrame.new(0, 20, 0)
                                    nameEnemy = "Void Boss"
                                elseif nameEnemy == "Void Boss" then
                                    lplr.Character.HumanoidRootPart.CFrame = wp.Enemies[nameEnemy].Enemy.EnemyLocation.CFrame  * CFrame.new(0, 20, 0)
                                    nameEnemy = "Challenger"
                                else
                                    lplr.Character.HumanoidRootPart.CFrame = wp.Enemies[nameEnemy].Enemy.EnemyLocation.CFrame  * CFrame.new(0, 20, 0)
                                    nameEnemy = "Virus Boss"
                                end
                                wait(1)
                            end
                        end
                    end
				end
                
				if input.KeyCode.Value == 258 then -- Num 2
                    FuncServerItem("ClearActive")
                    wait(.3)
                    
                    FuncServerItem("ClearPassive")
                    wait(.3)

                    for _,v in pairs(lplr.Character.ActiveItems:GetChildren()) do
                        v:Destroy()
                    end
                    wait(.3)

                    local string_1 = "SetupItem"
                    local string_2 = namePaSkill1
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
                    wait(.3)
                    local string_1 = "SetupItem"
                    local string_2 = namePaSkill2
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
                    wait(.3)
                    local string_1 = "SetupItem"
                    local string_2 = namePaSkill3
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
                    wait(.3)

                    local string_1 = "SetupItem"
                    local string_2 = nameAcSkill1
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
                    wait(.3)
                    local string_1 = "SetupItem"
                    local string_2 = nameAcSkill2
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
                    wait(.3)
                    local string_1 = "SetupItem"
                    local string_2 = nameAcSkill3
                    local Target = rs.Server
                    Target:FireServer(string_1, string_2)
				end

				if input.KeyCode.Value == 259 then -- Num 3
                    local string_1 = "ClearActiveItems";
                    local Target = rs.Remotes.ItemSetup;
                    Target:FireServer(string_1);
                    wait(.3)
                    local string_1 = "Chop";
                    local Target = rs.Remotes.ItemSetup;
                    Target:FireServer(string_1);
                    local string_1 = "Eternal Flame";
                    local Target = rs.Remotes.ItemSetup;
                    Target:FireServer(string_1);
				end

				if input.KeyCode.Value == 260 then -- Num 4
                    skillOn = not skillOn
					NotifyG("Auto Skill", skillOn)
                    if condition then
                        resetOn = true
                    else

                    end
                    
                    while tostring(skillOn) == "true" do
                        wait()
                        if lplr.Character:FindFirstChild("Combat Border") then
                            if tostring(resetOn) == "true" then
                                spawn(function()
                                    while lplr.Character:FindFirstChild("Combat Border") do
                                        wait()
                                        local string_1 = "ResetPoints";
                                        local Target = rs.Server;
                                        Target:FireServer(string_1);
                                    end
                                end)
                                spawn(function()
                                    while lplr.Character:FindFirstChild("Combat Border") do
                                        wait()
                                        local numAc = lplr.Character.ActiveItems:GetChildren()
                                        for i=4,#numAc do
                                            numAc[i]:Destroy()
                                        end
                                    end
                                end)
                            end
                            resetOn = false
                            if acSkill1 > 0 then
                                for i = 1, acSkill1 do
                                    local userdata_1 = lplr.Character.ActiveItems:GetChildren()[1]
                                    local Target = lplr.Character.ItemActivate
                                    Target:FireServer(userdata_1)
                                    wait(.1)
                                end
                            end
                            wait(.3)
                            if acSkill2 > 0 then
                                for i = 1, acSkill2 do
                                    local userdata_1 = lplr.Character.ActiveItems:GetChildren()[2]
                                    local Target = lplr.Character.ItemActivate
                                    Target:FireServer(userdata_1)
                                    wait(.1)
                                end
                            end
                            wait(.3)
                            if acSkill3 > 0 then
                                for i = 1, acSkill3 do
                                    local userdata_1 = lplr.Character.ActiveItems:GetChildren()[3]
                                    local Target = lplr.Character.ItemActivate
                                    Target:FireServer(userdata_1)
                                    wait(.1)
                                end
                            end
                            wait(.3)
                        end
                    end
				end

				if input.KeyCode.Value == 261 then -- Num 5
                    -- buyItemBM = not buyItemBM
					NotifyG("Black Market", "Buy it!")
                    -- while tostring(buyItemBM) == "true" do
                        -- wait()
                        local string_1 = "Buy1" -- Buy1
                        local userdata_1 = nameItemBM
                        local Target = rs.Remotes.Effected
                        Target:FireServer(string_1, userdata_1)
                    -- end
				end

				if input.KeyCode.Value == 262 then -- Num 6
                    buyItem = not buyItem
					NotifyG(nameItem, buyItem)
                    for _,v in pairs(wp.Stalls:GetChildren()) do
                        if v:IsA("Folder") then
                            for _,l in pairs(v:GetChildren()) do
                                for _,n in pairs(l.Shop:GetChildren()) do
                                    if tostring(n.Name) == nameItem then
                                        idItem = n
                                    end
                                end
                            end
                        end
                    end
                    while tostring(buyItem) == "true" do
                        wait()
                        local string_1 = "Buy1" -- Buy1
                        local userdata_1 = idItem
                        local Target = rs.Remotes.Effected
                        Target:FireServer(string_1, userdata_1)
                    end
				end
			end
		end
	)
	loadstring(game:HttpGet"https://thedragonslayer2.github.io")()
end