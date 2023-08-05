loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Create%20GUI/Humanoid%20Teleport.lua"), true))() -- 1st Lua
toggleWS = false
ws_g = 20

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
_G.common = {
    "6.66461277, 7.42029572, -23.7619305, -0.711790204, 0.638659596, -0.292350411, 4.02033329e-05, 0.416258037, 0.909246504, 0.70239222, 0.647180974, -0.29631412",
    "3.61111212, 7.73739338, -24.0082302, -0.726424456, 0.660957336, -0.188264266, -3.54647636e-06, 0.273936152, 0.961748004, 0.68724674, 0.698637724, -0.198991895",
    "10.0768661, 9.57563496, -27.9250183, -0.702374935, -0.685595453, 0.191385448, -1.40070915e-05, 0.268885851, 0.963172078, -0.711807191, 0.676505208, -0.188868284",
    "4.68390894, 9.29024792, -24.5895767, 0.731510639, 0.669075847, -0.131261647, -3.66568565e-06, 0.192517638, 0.981293499, 0.681829989, -0.717826188, 0.140831172",
    "11.2307739, 6.92033005, -29.5732441, -0.645564675, -0.747016788, 0.158784926, 1.82688236e-05, 0.207898498, 0.978150487, -0.763705909, 0.631462097, -0.134198427",
    "9.32098293, 7.22341299, -30.1982346, -0.692399263, -0.69070226, 0.208600223, 3.28421593e-05, 0.289084017, 0.957303822, -0.721514821, 0.662843168, -0.200139046",
    "0.215019584, 5.63303041, -25.5770245, 0.677000046, 0.509433627, -0.531176388, 1.76727772e-05, 0.72171247, 0.692192972, 0.735982955, -0.468624055, 0.488590419",
    "2.92780352, 5.5108881, -35.52668, -0.806800842, 0.474352032, -0.352225184, 3.0964613e-05, 0.596193671, 0.80284065, 0.590823531, 0.647721589, -0.481024265",
    "11.0790129, 9.29818535, -35.9445229, -0.687155008, -0.676916301, 0.263822854, -1.90138817e-05, 0.363153517, 0.931729376, -0.726510942, 0.640237391, -0.249555588"
}
_G.uncommon = {
    "-5.80884647, 10.9468355, -21.9055042, 0.731317759, -0.671257019, 0.120782375, -4.33623791e-05, 0.177044928, 0.984202802, -0.682036877, -0.719770253, 0.129446983",
    "-8.67510891, 9.12861347, -27.7600403, -0.716699839, 0.681385219, -0.148512483, -3.58819962e-05, 0.212921023, 0.977069497, 0.697382092, 0.700270653, -0.152576208",
    "-8.99897003, 12.4458065, -33.2741547, -0.661062837, 0.74108696, -0.117413551, -4.10377979e-05, 0.156446695, 0.987686396, 0.750330567, 0.652927637, -0.103390694",
    "-2.01894665, 5.98251486, -29.1536293, 0.781345248, -0.326123536, 0.532111943, 5.56111336e-05, 0.852644444, 0.522491574, -0.624099076, -0.408216745, 0.666227818",
    "-10.7298241, 4.73892021, -33.0721207, 0.878125846, 0.208250254, -0.430728257, 6.70552254e-08, 0.900295734, 0.435278803, 0.478429735, -0.382229596, 0.790572882",
    "-0.249749929, 5.11158752, -42.9586258, 0.538553119, -0.40978384, 0.736232102, 1.85370445e-05, 0.873776793, 0.486327082, -0.842591584, -0.261899322, 0.470582783"
}
_G.rare = {
    "-14.8154163, 6.07066441, -16.2740326, 0.834675908, -0.299971104, 0.461880356, -5.46872616e-06, 0.838647425, 0.544674695, -0.550741434, -0.454629391, 0.699997187",
    "-14.4602804, 4.15228844, -21.7621746, 0.696959376, -0.38112545, 0.607446313, 2.66283751e-05, 0.847088575, 0.531451762, -0.717110634, -0.370384067, 0.590396404",
    "-14.6998549, 3.69388294, -23.6864395, 0.781338751, -0.274598628, 0.560451031, -5.87105751e-06, 0.898001254, 0.439992934, -0.624107122, -0.343786806, 0.70164156",
    "-21.891571, 10.5634537, -29.4889126, 0.736260533, 0.627880752, -0.252361357, 2.24709511e-05, 0.372907519, 0.927868664, 0.676698208, -0.683158815, 0.274542928",
    "-14.5419817, 5.36648035, -30.7910461, 0.716651976, -0.424562871, 0.553313911, -2.4497509e-05, 0.793344855, 0.608772516, -0.697430909, -0.436291575, 0.568541765",
    "-11.177784, 6.75430775, -32.197876, 0.666307569, -0.37619102, 0.643828094, -2.83420086e-05, 0.863401294, 0.504517794, -0.745677054, -0.336182237, 0.57528019"
}
_G.legendary = {
    "-23.9762516, 5.63483858, -18.8576565, 0.763638496, -0.325770557, 0.557431459, 3.63439322e-05, 0.86339438, 0.504529655, -0.645644069, -0.385258019, 0.659332991",
    "-31.0826664, 10.6033211, -28.1577988, 0.645632446, 0.744385421, -0.170437843, 6.7949295e-06, 0.223183334, 0.974776506, 0.763648272, -0.629348516, 0.144089341",
    "-25.1708794, 5.08147907, -28.5988483, 0.716745317, -0.395014197, 0.57466507, 1.31428242e-05, 0.82409513, 0.56645149, -0.697335005, -0.405993938, 0.59067148"
}
_G.immortal = {
    "-42.984066, 5.09691143, -23.4051418, 0.838810086, 0.289359272, -0.461160272, -1.8671155e-05, 0.847076058, 0.531471729, 0.544424117, -0.445795238, 0.710541368",
    "-35.8906517, 9.51034641, -33.4181671, 0.79425478, -0.563753128, 0.226587519, -5.9902668e-06, 0.37292403, 0.927862048, -0.607584953, -0.736960173, 0.296193242",
    "7.39603186, 5.22486639, -34.1560745, 0.999265313, -0.00120620849, -0.038305711, 1.92847801e-06, 0.999506176, -0.0314231403, 0.0383246951, 0.0313999839, 0.998771846"
}
_G.spectrum = {
    "-43.2572784, 6.77990913, -20.9580612, 0.88768822, -0.206919789, 0.411331803, 8.91834497e-06, 0.893342972, 0.449375451, -0.460445076, -0.398901641, 0.793011904",
    "-43.2572784, 6.77990913, -20.9580612, 0.88768822, -0.206919789, 0.411331803, 8.91834497e-06, 0.893342972, 0.449375451, -0.460445076, -0.398901641, 0.793011904",
    "-9.1779747, 9.7460537, -30.7732525, -0.754654408, 0.628110766, -0.189667732, -3.1799078e-05, 0.289038479, 0.957317472, 0.656122684, 0.72244978, -0.218104243"
}

function createESP(parent)
    createESPItem(parent.Character.Head, 75, 151, 75, 24, "☠", 2)
    if parent.Character:FindFirstChild("Knife") then
        parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
        parent.Character.Head.nameEGUI.nameESP.Text = "👹"
    end
    parent.Character.ChildAdded:connect(function(m)
        if m.Name == "Knife" then
            parent.Character.Head.nameEGUI.nameESP.TextColor3 = Color3.fromRGB(196, 40, 28)
            parent.Character.Head.nameEGUI.nameESP.Text = "👹"
        end
        if m.Name == "Head" then
            createESP(parent)
        end
    end)
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(function(characterModel)
                if characterModel:WaitForChild("Head") then
                    wait(0.5)
                    createESP(o)
                end
            end)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        newPlayer.CharacterAdded:Connect(function(characterModel)
            if characterModel:WaitForChild("Head") then
                wait(0.5)
                createESP(newPlayer)
            end
        end)
    end)
end
enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            if o.Character:FindFirstChild("Head") then
                wait(0.1)
                createESP(o)
            end
        end
    end
end

function lightCode()
    lgt.Brightness = 1
    lgt.GlobalShadows = false
    lgt.TimeOfDay = "12:00:00"
    lgt.ClockTime = 12
    lgt.FogStart = 0
    lgt.FogEnd = 100000
    lgt.Changed:connect(function(property)
        if property == "Brightness" or property == "FogEnd" then
            lgt.Brightness = 1
            lgt.GlobalShadows = false
            lgt.TimeOfDay = "12:00:00"
            lgt.ClockTime = 12
            lgt.FogStart = 0
            lgt.FogEnd = 100000
        end
    end)
end
espFirst()
lightCode()
-- game:GetService("ReplicatedStorage").Assets.Game.Loot.present.CameraData.CamCFrame.Value
function eventESPItem(parent)
	for i = 1, #_G.common do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.common[i] then
			createESPItem(parent:FindFirstChild("Border"), 242, 243, 243, 10, "🤍", 2)
		end
	end
	for i = 1, #_G.uncommon do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.uncommon[i] then
			createESPItem(parent:FindFirstChild("Border"), 13, 105, 172, 11, "💚", 2)
		end
	end
	for i = 1, #_G.rare do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.rare[i] then
			createESPItem(parent:FindFirstChild("Border"), 146, 57, 120, 13, "💜", 2)
		end
	end
	for i = 1, #_G.legendary do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.legendary[i] then
			createESPItem(parent:FindFirstChild("Border"), 245, 205, 48, 14, "💛", 2)
		end
	end
	for i = 1, #_G.immortal do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.immortal[i] then
			createESPItem(parent:FindFirstChild("Border"), 196, 40, 28, 14, "❤", 2)
		end
	end
	for i = 1, #_G.spectrum do
		if tostring(parent.CameraData.CamCFrame.Value) == _G.spectrum[i] then
			createESPItem(parent:FindFirstChild("Border"), 13, 105, 172, 14, "💝", 2)
		end
	end
    if parent then
        for _,v in pairs(parent:GetChildren()) do
            if tostring(v.Name) == "CameraData" or tostring(v.Name) == "Border" then
    
            else
                if v:IsA("Model") then
                    for _,n in pairs(v:GetChildren()) do
                        n:GetPropertyChangedSignal("Transparency"):connect(
                            function()
                                for _,l in pairs(parent:GetChildren()) do
                                    if l:FindFirstChild("nameEGUI") then
                                        l.nameEGUI:Destroy()
                                    end
                                end
                            end
                        )
                    end
                else
                    v:GetPropertyChangedSignal("Transparency"):connect(
                        function()
                            for _,l in pairs(parent:GetChildren()) do
                                if l:FindFirstChild("nameEGUI") then
                                    l.nameEGUI:Destroy()
                                end
                            end
                        end
                    )
                end
            end
        end
    end
end

function firstScript()
    wp._Lobby.InvisibleWalls:Destroy()
    for _,v in pairs(wp:GetChildren()) do
        if v:FindFirstChild("Coins") and v:FindFirstChild("LootSpawns") then
            for _, l in pairs(v.LootSpawns:GetChildren()) do
                eventESPItem(l.Model)
            end
        end
    end
    wp.ChildAdded:connect(function(m)
        wait(5)
        if m:IsA("Model") then
            if m:FindFirstChild("Coins")  then
                print("1")
                if m:WaitForChild("LootSpawns") then
                    for _, v in pairs(m:GetChildren()) do
                        if tostring(v.Name) == "Invisible Walls" then
                            v:Destroy()
                        end
                    end
                    print("2")
                    for _, v in pairs(m.LootSpawns:GetChildren()) do
                        eventESPItem(v.Model)
                    end
                    print("3")
                end
            end
        end
    end)
end
firstScript()

function tpCoin()
    local e = lplr.Character:FindFirstChild("HumanoidRootPart")
    local s = nil
    for _,v in pairs(wp:GetChildren()) do
        if v:FindFirstChild("Coins") then
            s = v.Coins
        end
    end
    if e and s then
        for _, v in pairs(s:GetChildren()) do
            v.CFrame = lplr.Character.HumanoidRootPart.CFrame
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == " " then
        infJump()
    end
    -- if keyDown == "l" then
    --     tpCoin()
    -- end
    if keyDown == "v" then
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
    end
end)