--[[
	[\<=|Simple Admin|=>/]
	Made by Helpful Guy
--]]

--[[
	Commands List:
		Command:
			-tp [Player Name]
			Info: Teleport you to the target
		
		Command:
			-changesign [New Sign]
			Info: Change the command sign
		
		Command:
			-ChatMode/on  OR ChatMode/off
			Info: If you got muted you can press F9 to see players messages while this is on OR
			you can see players private messages!
			
		More coming soon...
	
	
--]]


local Players = game:GetService("Players"):GetPlayers()
local Player = game:GetService("Players").LocalPlayer

--Settings--
local CommandSign = "-"
--End--



print("[Simple Admin]: Simple Admin has loaded!")
print("[Simple Admin]: Simple Admin made by Helpful Guy")


Player.Chatted:Connect(function(Command)
	if Command:sub(1,3):lower() == CommandSign.."tp" then
		for i,v in pairs(game:GetService("Players"):GetChildren()) do
			if string.match(string.lower(Command:sub(5)), string.lower(v.Name)) and game:GetService("Workspace"):FindFirstChild(Player.Name) and game:GetService("Workspace"):FindFirstChild(v.Name) then
				game:GetService("Workspace"):WaitForChild(Player.Name):WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace"):WaitForChild(v.Name):WaitForChild("HumanoidRootPart").CFrame
				print("[Simple Admin]: Teleported to: "..v.Name)
				break
			end
		end
		
	elseif Command:sub(1,11):lower() == CommandSign.."changesign" then
		if Command:sub(13):lower() == CommandSign then
			error("[Simple Admin]: Unknown erorr while changing changesign")
		else
			CommandSign = Command:sub(13) 
			print("[Simple Admin]: Changed Command Sign to: "..CommandSign)
		end
		
	elseif Command:sub(1,7):lower() == CommandSign.."btools" then
		game.StarterGui:SetCoreGuiEnabled(2, true)
		for I=2,4 do
   			Instance.new("HopperBin", game:GetService'Players'.LocalPlayer.Backpack).BinType = I
		end
		print("[Simple Admin]: Done!")
	elseif Command:sub(1,6):lower() == CommandSign.."clean" then
		for I = 1,50 do
			print("\n")
		end
		print("[Simple Admin]: Cleaned!")
	elseif Command:sub(1,6):lower() == CommandSign.."speed" then
		game:GetService("Workspace"):WaitForChild(Player.Name):WaitForChild("Humanoid").WalkSpeed = tonumber(Command:sub(7))
		print("[Simple Admin]: Done!")
	elseif Command:sub(1,10):lower() == CommandSign.."jumppower" then
		game:GetService("Workspace"):WaitForChild(Player.Name):WaitForChild("Humanoid").JumpPower = tonumber(Command:sub(12))
		print("[Simple Admin]: Done!")

	end
end)