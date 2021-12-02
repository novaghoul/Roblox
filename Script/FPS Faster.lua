local decalsyeeted = false
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
pcall(function()
    sethiddenproperty(l, "Technology", 2)
end)
pcall(function()
    sethiddenproperty(t, "Decoration", false)
end)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = 0
l.FogEnd = 9e9
l.Brightness = 0
-- settings().Rendering.QualityLevel = "Level01"
w.DescendantAdded:Connect(function(v)
    wait(0.1)
    if v:IsA "BasePart" and not v:IsA "MeshPart" then
        v.Material = "Plastic"
        v.Reflectance = 0
        -- elseif v:IsA"Decal" or v:IsA"Texture" and decalsyeeted then v.Transparency = 1
    elseif v:IsA "ParticleEmitter" or v:IsA "Trail" then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA "Explosion" then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA "Fire" or v:IsA "SpotLight" or v:IsA "Smoke" or v:IsA "Sparkles" then
        v.Enabled = false
    elseif v:IsA "MeshPart" and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = tonumber "10385902758728957"
    elseif v:IsA "SpecialMesh" and decalsyeeted then
        v.TextureId = 0
    elseif v:IsA "ShirtGraphic" and decalsyeeted then
        v.Graphic = 0
    elseif (v:IsA "Shirt" or v:IsA "Pants") and decalsyeeted then
        v[v.ClassName .. "Template"] = 0
    end
end)
for i, v in pairs(w:GetDescendants()) do
    if v:IsA "BasePart" and not v:IsA "MeshPart" then
        v.Material = "Plastic"
        v.Reflectance = 0
        -- elseif (v:IsA"Decal" or v:IsA"Texture") and decalsyeeted then v.Transparency = 1
    elseif v:IsA "ParticleEmitter" or v:IsA "Trail" then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA "Explosion" then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA "Fire" or v:IsA "SpotLight" or v:IsA "Smoke" or v:IsA "Sparkles" then
        v.Enabled = false
    elseif v:IsA "MeshPart" and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = tonumber "10385902758728957"
    elseif v:IsA "SpecialMesh" and decalsyeeted then
        v.TextureId = 0
    elseif v:IsA "ShirtGraphic" and decalsyeeted then
        v.Graphic = 0
    elseif (v:IsA "Shirt" or v:IsA "Pants") and decalsyeeted then
        v[v.ClassName .. "Template"] = 0
    end
    if string.find(tostring(i), "00$") then
        wait()
    end
end
for i = 1, #l:GetChildren() do
    local e = l:GetChildren()[i]
    if e:IsA "BlurEffect" or e:IsA "SunRaysEffect" or e:IsA "ColorCorrectionEffect" or e:IsA "BloomEffect" or
        e:IsA "DepthOfFieldEffect" then
        e.Enabled = false
    end
end
