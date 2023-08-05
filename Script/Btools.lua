loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

for _, v in pairs(lplr.Backpack:GetChildren()) do
	if tostring(v.ClassName) == "HopperBin" then
		v:Destroy()
	end
end

for i = 2, 4 do
	Instance.new("HopperBin", lplr.Backpack).BinType = i
end
