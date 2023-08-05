loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

if lplr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
	lplr.Character.Humanoid.Name = "Humanoida"
	repeat
		wait()
	until lplr and lplr.Character and lplr.Character:findFirstChild("UpperTorso") and
		lplr.Character:findFirstChild("Humanoida")
	repeat
		wait()
	until mouse
	local torso = lplr.Character.UpperTorso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 100
	local speed = 0
	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat
			wait()
			lplr.Character.Humanoida.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed + .5 + (speed / maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed - 1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity =
					((wp.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
					((wp.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
						wp.CurrentCamera.CoordinateFrame.p)) *
					speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity =
					((wp.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
					((wp.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
						wp.CurrentCamera.CoordinateFrame.p)) *
					speed
			else
				bv.velocity = Vector3.new(0, 0.1, 0)
			end
			bg.cframe =
				wp.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		lplr.Character.Humanoida.PlatformStand = false
	end
	mouse.KeyDown:connect(
		function(key)
			if key:lower() == "e" then
				if flying then
					flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end
	)
	mouse.KeyUp:connect(
		function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
		end
	)
	Fly()
else
	repeat
		wait()
	until lplr and lplr.Character and lplr.Character:findFirstChild("Torso") and lplr.Character:findFirstChild("Humanoid")
	repeat
		wait()
	until mouse
	local lplr = lplr
	local torso = lplr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0

	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat
			wait()
			lplr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed + .5 + (speed / maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed - 1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity =
					((wp.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
					((wp.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
						wp.CurrentCamera.CoordinateFrame.p)) *
					speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity =
					((wp.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
					((wp.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
						wp.CurrentCamera.CoordinateFrame.p)) *
					speed
			else
				bv.velocity = Vector3.new(0, 0.1, 0)
			end
			bg.cframe =
				wp.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		lplr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(
		function(key)
			if key:lower() == "e" then
				if flying then
					flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end
	)
	mouse.KeyUp:connect(
		function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
		end
	)
	Fly()
end
