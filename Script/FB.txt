if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = gameGetService(Lighting).Brightness,
		ClockTime = gameGetService(Lighting).ClockTime,
		FogEnd = gameGetService(Lighting).FogEnd,
		GlobalShadows = gameGetService(Lighting).GlobalShadows,
		Ambient = gameGetService(Lighting).Ambient
	}

	gameGetService(Lighting)GetPropertyChangedSignal(Brightness)Connect(function()
		if gameGetService(Lighting).Brightness ~= 1 and gameGetService(Lighting).Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = gameGetService(Lighting).Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			gameGetService(Lighting).Brightness = 1
		end
	end)

	gameGetService(Lighting)GetPropertyChangedSignal(ClockTime)Connect(function()
		if gameGetService(Lighting).ClockTime ~= 12 and gameGetService(Lighting).ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = gameGetService(Lighting).ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			gameGetService(Lighting).ClockTime = 12
		end
	end)

	gameGetService(Lighting)GetPropertyChangedSignal(FogEnd)Connect(function()
		if gameGetService(Lighting).FogEnd ~= 786543 and gameGetService(Lighting).FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = gameGetService(Lighting).FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			gameGetService(Lighting).FogEnd = 786543
		end
	end)

	gameGetService(Lighting)GetPropertyChangedSignal(GlobalShadows)Connect(function()
		if gameGetService(Lighting).GlobalShadows ~= false and gameGetService(Lighting).GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = gameGetService(Lighting).GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			gameGetService(Lighting).GlobalShadows = false
		end
	end)

	gameGetService(Lighting)GetPropertyChangedSignal(Ambient)Connect(function()
		if gameGetService(Lighting).Ambient ~= Color3.fromRGB(178, 178, 178) and gameGetService(Lighting).Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = gameGetService(Lighting).Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			gameGetService(Lighting).Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	gameGetService(Lighting).Brightness = 1
	gameGetService(Lighting).ClockTime = 12
	gameGetService(Lighting).FogEnd = 786543
	gameGetService(Lighting).GlobalShadows = false
	gameGetService(Lighting).Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					gameGetService(Lighting).Brightness = _G.NormalLightingSettings.Brightness
					gameGetService(Lighting).ClockTime = _G.NormalLightingSettings.ClockTime
					gameGetService(Lighting).FogEnd = _G.NormalLightingSettings.FogEnd
					gameGetService(Lighting).GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					gameGetService(Lighting).Ambient = _G.NormalLightingSettings.Ambient
				else
					gameGetService(Lighting).Brightness = 1
					gameGetService(Lighting).ClockTime = 12
					gameGetService(Lighting).FogEnd = 786543
					gameGetService(Lighting).GlobalShadows = false
					gameGetService(Lighting).Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled