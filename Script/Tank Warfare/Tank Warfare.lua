loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

function createESP(parent)
    if not parent.Character.Hitbox:GetChildren()[1]:FindFirstChild("nameEGUI") then
        createESPItem(parent.Character.Hitbox:GetChildren()[1], 192, 192, 192, 14, parent.Name)
        for _, p in pairs(parent.Character.Hitbox:GetChildren()) do
            if p:IsA("MeshPart") then
                for _, f in pairs(faces) do
                    wait(.1)
                    createESPCharm(p, f, 192, 192, 192)
                end
            end
        end
    end
end


function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:WaitForChild("Hitbox") then
                        wait(0.1)
                        createESP(o)
                        o.Character.ChildAdded:connect(
                            function(m)
                                if tostring(m) == "Hitbox" then
                                    createESP(o)
                                end
                            end
                        )
                    end
                end
            )
        end
    end
end

function firstFun()
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Magazine') then
    		v.Reserve = 100
    		v.ReloadTime = 0.1
    		v.FireRate = 0.0666666666666667
    		v.VibrationScale = 0.01
        end
    end
    for i,v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Armour') then
    		v.Armour = 10000
    		v.Health = 5000
    		v.Acceleration = 1000
    		v.TopSpeed = 1000
            if v.VehicleType == 1 then
                v.HullRotation = 500
            end
        end
    end
end
firstFun()

mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "e" then
            lplr.Character.Hitbox:ClearAllChildren()
            lplr.Character.Collider:Destroy()
        end
    end
)

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)

while wait(1) do
    espFirst()
end