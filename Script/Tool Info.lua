uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs = game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr.Backpack
mouse = lplr:GetMouse()

pcall(
	function()
		if sg:GetCoreGuiEnabled(2) == false then
			sg:SetCoreGuiEnabled(2, true)
		end
		if bp:FindFirstChild("Info Tool") then
			bp:FindFirstChild("Info Tool"):Destroy()
		end
		local tool = Instance.new("Tool")
		tool.RequiresHandle = false
		tool.Name = "Info Tool"
		tool.CanBeDropped = false
		tool.Parent = bp
		tool.Activated:connect(
			function()
				local pant = nil
				local ppant = nil
				if not mouse.Target then
					return
				end
				if mouse.Target.Locked == true then
					mouse.Target.Locked = false
				end
				print("\n\n")
				print("<------Start------->\n")
				pant = mouse.Target
				print("[Name:" .. pant.Name .. "]----------[ClassName : " .. pant.ClassName .. "]\n")
				repeat
					ppant = pant.Name
					pant = pant.Parent
					if pant ~= nil then
						print(
							"[Name:" ..
								pant.Name .. "]----------[" .. ppant .. "'s parent]" .. "----------[ClassName : " .. pant.ClassName .. "]\n"
						)
					end
				until pant == nil
				print("<-------End-------->")
			end
		)
	end
)
