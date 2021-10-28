local plrs = game:GetService("Players")
local lplr = game:GetService("Players").LocalPlayer

for _, v in pairs(lplr.Backpack:GetChildren()) do
	if tostring(v.ClassName) == "HopperBin" then
		v:Destroy()
	end
end

for I = 2, 4 do
	Instance.new("HopperBin", lplr.Backpack).BinType = I
end
