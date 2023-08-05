loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = lgt.Brightness,
		ClockTime = lgt.ClockTime,
		FogEnd = lgt.FogEnd,
		GlobalShadows = lgt.GlobalShadows,
		Ambient = lgt.Ambient
	}

	lgt:GetPropertyChangedSignal(Brightness):connect(function()
		if lgt.Brightness ~= 1 and lgt.Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = lgt.Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			lgt.Brightness = 1
		end
	end)

	lgt:GetPropertyChangedSignal(ClockTime):connect(function()
		if lgt.ClockTime ~= 12 and lgt.ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = lgt.ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			lgt.ClockTime = 12
		end
	end)

	lgt:GetPropertyChangedSignal(FogEnd):connect(function()
		if lgt.FogEnd ~= 786543 and lgt.FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = lgt.FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			lgt.FogEnd = 786543
		end
	end)

	lgt:GetPropertyChangedSignal(GlobalShadows):connect(function()
		if lgt.GlobalShadows ~= false and lgt.GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = lgt.GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			lgt.GlobalShadows = false
		end
	end)

	lgt:GetPropertyChangedSignal(Ambient):connect(function()
		if lgt.Ambient ~= Color3.fromRGB(178, 178, 178) and lgt.Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = lgt.Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			lgt.Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	lgt.Brightness = 1
	lgt.ClockTime = 12
	lgt.FogEnd = 786543
	lgt.GlobalShadows = false
	lgt.Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					lgt.Brightness = _G.NormalLightingSettings.Brightness
					lgt.ClockTime = _G.NormalLightingSettings.ClockTime
					lgt.FogEnd = _G.NormalLightingSettings.FogEnd
					lgt.GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					lgt.Ambient = _G.NormalLightingSettings.Ambient
				else
					lgt.Brightness = 1
					lgt.ClockTime = 12
					lgt.FogEnd = 786543
					lgt.GlobalShadows = false
					lgt.Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled