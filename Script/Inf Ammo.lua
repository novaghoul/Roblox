for _, v in pairs(debug.getregistry()) do
    if typeof(v) == "table" then
        if v.Ammo then
            v.Ammo = math.huge
        end
    end
end
for i,v in pairs(getgc(true)) do
    if type(v) == 'table' and rawget(v, 'magsize') then
        v.damage = damage1
        v.magsize = 9999
        v.storedammo = 9999
        v.rpm = 1000
        v.spread = spread1
        v.recoil = recoil1
        v.mode = "Auto"
        table.foreach(v, print)
    end
end