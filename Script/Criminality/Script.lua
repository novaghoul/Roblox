loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

disTeleport = -5

function createESP(parent)
    createESPItem(parent.Head, 196, 40, 28, 14, parent.Name)
    for _, p in pairs(parent:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(faces) do
                createESPCharm(p, f, 196, 40, 28)
            end
        end
    end
end

for _,v in pairs(wp.Characters:GetChildren()) do
    if tostring(v.Name) ~= tostring(lplr.Name) then
        if v:FindFirstChild("Head") then
            createESP(v)
        end
    end
    if not v.Head:FindFirstChild("PLADD") then
        local plg      = Instance.new("PointLight",v.Head)
        plg.Name       = ("PLADD")
        plg.Range      = 200
        plg.Shadows    = false
        plg.Enabled    = true
        plg.Color      = Color3.fromRGB(255, 255, 255)
        plg.Brightness = 1
    end
end

wp.Characters.ChildAdded:connect(
    function(m)
        wait(.5)
        if tostring(m.Name) ~= tostring(lplr.Name) then
            if m:FindFirstChild("Head") then
                createESP(m)
            end
        end
        if not m.Head:FindFirstChild("PLADD") then
            local plg      = Instance.new("PointLight",m.Head)
            plg.Name       = ("PLADD")
            plg.Range      = 200
            plg.Shadows    = false
            plg.Enabled    = true
            plg.Color      = Color3.fromRGB(255, 255, 255)
            plg.Brightness = 1
        end
    end
)

for _,v in pairs(wp.Filter.SpawnedBread:GetChildren()) do
    createESPItem(v, 245, 205, 48, 14, "💵 " .. v.A.GUI.TextLabel.Text, 0)
end

wp.Filter.SpawnedBread.ChildAdded:connect(
    function(m)
        wait(.5)
        createESPItem(m, 245, 205, 48, 14, "💵 " .. m.A.GUI.TextLabel.Text, 0)
    end
)

-- for _,v in pairs(wp.Filter.SpawnedTools:GetChildren()) do
--     createESPItem(v.Handle, 245, 205, 48, 14, "⚙️", 0)
-- end

-- wp.Filter.SpawnedTools.ChildAdded:connect(
--     function(m)
--         wait(.5)
--         createESPItem(m.Handle, 245, 205, 48, 14, "⚙️", 0)
--     end
-- )

for _,v in pairs(wp.Map.BredMakurz:GetChildren()) do
    if v.Parts:FindFirstChild("Door") then
        if v.Values:FindFirstChild("BountV") then
            createESPItem(v.MainPart, 245, 205, 48, 14, "🔒", 0)
        end
        v.Values.ChildAdded:connect(
            function(m)
                wait(.5)
                if not v.MainPart:FindFirstChild("nameEGUI") then
                    createESPItem(v.MainPart, 245, 205, 48, 14, "🔒", 0)
                end
            end
        )
        v.Values.ChildRemoved:connect(
            function(m)
                wait(.2)
                if v.MainPart:FindFirstChild("nameEGUI") then
                    v.MainPart.nameEGUI:Destroy()
                end
            end
        )
    else
        if v.Values:FindFirstChild("BountV") then
            createESPItem(v.MainPart, 245, 205, 48, 14, "🏪", 0)
        end
        v.Values.ChildAdded:connect(
            function(m)
                wait(.5)
                if not v.MainPart:FindFirstChild("nameEGUI") then
                    createESPItem(v.MainPart, 245, 205, 48, 14, "🏪", 0)
                end
            end
        )
        v.Values.ChildRemoved:connect(
            function(m)
                wait(.2)
                if v.MainPart:FindFirstChild("nameEGUI") then
                    v.MainPart.nameEGUI:Destroy()
                end
            end
        )
    end
end

for _,v in pairs(wp.Map.VendingMachines:GetChildren()) do
    createESPItem(v.MainPart, 245, 205, 48, 14, "🍫", 0)
end

-- for _,v in pairs(wp.Map.MysteryBoxSpawns:GetChildren()) do
--     createESPItem(v.SpawnPart, 245, 205, 48, 14, "📦", 0)
-- end

for _,v in pairs(wp.Map.ATMz:GetChildren()) do
    if tostring(v.Values.Busy.Value) == "false" then
        createESPItem(v.MainPart, 245, 205, 48, 14, "🏧", 0)
    end
    v.Values.Busy:GetPropertyChangedSignal("Value"):connect(
        function()
            if tostring(v.Values.Busy.Value) == "false" then
                createESPItem(v.MainPart, 245, 205, 48, 14, "🏧", 0)
            else
                v.MainPart.nameEGUI:Destroy()
            end
        end
    )
end

-- for _,v in pairs(wp.Map.Security.Alarms:GetChildren()) do
--     if tostring(v.AlarmMain.Value.Value) == "false" then
--         createESPItem(v.MainPart, 245, 205, 48, 14, "🔔", 0)
--     end
--     v.AlarmMain.Value:GetPropertyChangedSignal("Value"):connect(
--         function()
--             if tostring(v.AlarmMain.Value.Value) == "false" then
--                 createESPItem(v.MainPart, 245, 205, 48, 14, "🔔", 0)
--             else
--                 v.MainPart.nameEGUI:Destroy()
--             end
--         end
--     )
-- end

-- for _,v in pairs(wp.Map.Security.Cameras:GetChildren()) do
--     createESPItem(v.MainPart, 245, 205, 48, 14, "📹", 0)
-- end

for _,v in pairs(wp.Map.Shopz:GetChildren()) do
    createESPItem(v.MainPart, 245, 205, 48, 14, "🔫", 0)
end

for _,v in pairs(wp.Filter.SpawnedPiles:GetChildren()) do
    createESPItem(v.MeshPart, 245, 205, 48, 14, "💩", 0)
end

wp.Filter.SpawnedPiles.ChildAdded:connect(
    function(m)
        wait(.5)
        createESPItem(m.MeshPart, 245, 205, 48, 14, "💩", 0)
    end
)

-- for _,v in pairs(wp.Filter.ToolSpawns:GetChildren()) do
--     createESPItem(v.MeshPart, 245, 205, 48, 14, "⚒️", 0)
-- end

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, disTeleport)
		end
	end
)

-- loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Point%20Light.lua"), true))() -- Point Light Lua

-- game:GetService("Workspace").Map.BredMakurz.Register_B_10.Values.Broken.Value
-- game:GetService("Workspace").Map.Shopz:GetChildren()[13].MainPart
-- game:GetService("Workspace").Map.Security.Alarms:GetChildren()[6].AlarmMain.Value
-- game:GetService("Workspace").Map.ATMz:GetChildren()[10].Values.Busy.Value
-- game:GetService("Workspace").Map.BredMakurz.Register_GS_16.Values.BountV
-- game:GetService("Workspace").Map.BredMakurz.SmallSafe_WH_28.Values.BountV
-- game:GetService("Workspace").Filter.SpawnedBread.CashDrop1
-- game:GetService("Workspace").Filter.SpawnedBread.CashDrop1.A.GUI.TextLabel.Text
-- game:GetService("Workspace").Filter.SpawnedTools.Model.Handle
-- game:GetService("Workspace").Characters.doomday247.Head
-- game:GetService("Workspace").Map.VendingMachines.VendingMachine.MainPart
-- game:GetService("Workspace").Map.MysteryBoxSpawns.Spawn1.SpawnPart
-- game:GetService("Workspace").Map.ATMz.ATM.MainPart 
-- game:GetService("Workspace").Map.BredMakurz.MediumSafe_HO_24.MainPart
-- game:GetService("Workspace").Map.BredMakurz.SmallSafe_WH_28.Parts.Door
-- game:GetService("Workspace").Map.BredMakurz.Register_TS_4.Parts.Drawer
-- game:GetService("Workspace").Map.Security.Alarms.Alarm.MainPart
-- game:GetService("Workspace").Map.Security.Cameras.Camera_BOTTOM.MainPart
-- game:GetService("Workspace").Filter.SpawnedPiles.S1.MeshPart
-- game:GetService("Workspace").Filter.ToolSpawns.SEWER_SPW