local uis = game:GetService("UserInputService")
local sg = game:GetService("StarterGui")
local wp = game:GetService("Workspace")
local cmr = wp.Camera
local rs = game:GetService("ReplicatedStorage")
local lgt = game:GetService("Lighting")
local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local mouse = lplr:GetMouse()

mouse.Button1Down:connect(
	function()
		if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then return end
		if not mouse.Target then return end
		if mouse.Target.Locked == true then mouse.Target.Locked = false end
		print("\n\n")
		print("<------Start------->\n")
		pant = mouse.Target
		print("game." .. pant:GetFullName() .. "\n")
		print("<-------End-------->")
	end
)
