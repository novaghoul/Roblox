uis = game:GetService("UserInputService")
cg = game:GetService("CoreGui")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

if _G.hitBoxSize == nil then
    _G.hitBoxSize = {3, 3, 3}
    _G.hitBoxBody = "Head"
    _G.hitBoxColor = "Really blue"
    _G.hitBoxTransparency = 0.9
-- HumanoidRootPart
end

function createHitBox(parent)
    local sizeBody = parent[_G.hitBoxBody].Size.x
    parent[_G.hitBoxBody].Size =
        Vector3.new(sizeBody * _G.hitBoxSize[1], sizeBody * _G.hitBoxSize[2], sizeBody * _G.hitBoxSize[3])
    parent[_G.hitBoxBody].Transparency = _G.hitBoxTransparency
    parent[_G.hitBoxBody].BrickColor = BrickColor.new(_G.hitBoxColor)
    parent[_G.hitBoxBody].Material = "Neon"
    parent[_G.hitBoxBody].CanCollide = false

    parent[_G.hitBoxBody].Changed:connect(
        function(property)
            wait(0.1)
            if property == "Size" or property == "CanCollide" then
                parent[_G.hitBoxBody].Size = Vector3.new(_G.hitBoxSize[1], _G.hitBoxSize[2], _G.hitBoxSize[3])
                parent[_G.hitBoxBody].CanCollide = false
            end
        end
    )
end

function hitBox()
    for _, v in pairs(wp.MapAreas:GetChildren()) do
        for _, l in pairs(v.Mobs:GetChildren()) do
            createHitBox(l)
        end
        v.Mobs.ChildAdded:connect(
            function(m)
                wait(1)
                createHitBox(m)
            end
        )
    end
end
hitBox()
