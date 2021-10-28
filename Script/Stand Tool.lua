local uis = game:GetService("UserInputService")
local wp = game:GetService("Workspace")
local rs =  game:GetService("ReplicatedStorage")
local lgt = game:GetService("Lighting")
local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()
local backpack = lplr:WaitForChild("Backpack")

function round(num,range)
	return (((num%range)*2)+num)-((((num%range)*2)+num)%range)
end

repeat
	wait(0.1)
until lplr.Character ~= nil

local tool = Instance.new("Tool")
tool.RequiresHandle = false
local brp = nil

function WH()
	brp = Instance.new("Part", wp)
	brp.Size = Vector3.new(4,4,4)
	brp.CanCollide = false
	brp.Anchored = true
	brp.Transparency = 0.5
	brp.Material = Enum.Material.Plastic
	brp.BrickColor = BrickColor.Blue()
	repeat
		brp.Position = Vector3.new(mouse.Hit.X - 4,round(mouse.Hit.Y,4),round(mouse.Hit.Z,4) - 4)
		wait(0.1)
	until tool.Parent.Parent ~= wp
	brp:Destroy()
end
tool.Equipped:connect(WH)

function acti()
	local cl2 = brp:Clone()
	cl2.Parent = wp
	cl2.Position = brp.Position
	cl2.CanCollide = true
	cl2.Transparency = 0
end
tool.Activated:connect(acti)

tool.Name = "Stand Tool"
tool.CanBeDropped = false
tool.Parent = backpack