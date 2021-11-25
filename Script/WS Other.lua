loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.ws_g = 20

_G.down = false
_G.velocity = Instance.new("BodyVelocity")
_G.velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
_G.gyro = Instance.new("BodyGyro")
_G.gyro.maxTorque = Vector3.new(100000, 0, 100000)

function onButton1Down(v, g, d)
    d = false
    wait(1)
    d = true
    if lplr.Character then
        if lplr.Character:FindFirstChild("Torso") then
            v.Parent = lplr.Character.Torso
            g.Parent = lplr.Character.Torso
        else
            v.Parent = lplr.Character.UpperTorso
            g.Parent = lplr.Character.UpperTorso
        end
        v.velocity = (lplr.Character.Humanoid.MoveDirection) * _G.ws_g
        while d do
            if not d then
                break
            end
            if lplr.Character then
                if lplr.Character:FindFirstChild("UpperTorso") then
                    v.velocity = (lplr.Character.Humanoid.MoveDirection) * _G.ws_g
                    local refpos = g.Parent.Position + (g.Parent.Position - wp.CurrentCamera.CoordinateFrame.p).unit * 5
                    g.cframe = CFrame.new(g.Parent.Position, Vector3.new(refpos.x, g.Parent.Position.y, refpos.z))
                end
            end
            wait(0.1)
        end
    end
end

function onButton1Up(v, g, d)
    v.Parent = nil
    g.Parent = nil
    d = false
end

lplr.CharacterAdded:Connect(function(characterModel)
    _G.down = false
    wait(2)
    _G.velocity = Instance.new("BodyVelocity")
    _G.velocity.maxForce = Vector3.new(100000, 0, 100000)
    _G.velocity.Parent = nil
    ---vv Use that to change the speed v
    _G.gyro = Instance.new("BodyGyro")
    _G.gyro.maxTorque = Vector3.new(100000, 0, 100000)
    _G.gyro.Parent = nil
    wait(1)
    onButton1Down(_G.velocity, _G.gyro, _G.down)
end)

function changeDA(typeDA)
    if typeDA == 0 then
        _G.ws_g = _G.ws_g + 5
    elseif typeDA == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
        end
        if _G.ws_g < 0 then
            _G.ws_g = 0
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
    if keyDown == "c" then
        changeDA(0)
        notify("Dash :" .. _G.ws_g)
    end
    if keyDown == "v" then
        changeDA(1)
        notify("Dash :" .. _G.ws_g)
    end
    if keyDown == "x" then
        if _G.ws_g == 20 then
            _G.ws_g = 17
            SendChat("Dash :" .. _G.ws_g)
        else
            _G.ws_g = 20
            SendChat("Dash :" .. _G.ws_g)
        end
    end
    if keyDown == "q" then
    end
end)
spawn(
	function()
        onButton1Down(_G.velocity, _G.gyro, _G.down)
	end
)