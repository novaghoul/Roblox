loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

--Settings--
local CommandSign = "/e "
--End--



print("[Simple Admin]: Simple Admin has loaded!")
print("[Simple Admin]: Simple Admin made by Helpful Guy")


lplr.Chatted:Connect(function(Command)
	if Command:sub(1,5):lower() == CommandSign.."tp" then
		for _,v in pairs(plrs:GetChildren()) do
			if string.match(string.lower(Command:sub(5)), string.lower(v.Name)) and wp:FindFirstChild(lplr.Name) and wp:FindFirstChild(v.Name) then
				wp:WaitForChild(lplr.Name):WaitForChild("HumanoidRootPart").CFrame = wp:WaitForChild(v.Name):WaitForChild("HumanoidRootPart").CFrame
				print("[Simple Admin]: Teleported to: "..v.Name)
				break
			end
		end
		
	elseif Command:sub(1,13):lower() == CommandSign.."changesign" then
		if Command:sub(15):lower() == CommandSign then
			error("[Simple Admin]: Unknown erorr while changing changesign")
		else
			CommandSign = Command:sub(15)
			print("[Simple Admin]: Changed Command Sign to: "..CommandSign)
		end
		
	elseif Command:sub(1,9):lower() == CommandSign.."btools" then
		sg:SetCoreGuiEnabled(2, true)
		for i=2,4 do
   			Instance.new("HopperBin", lplr.Backpack).BinType = i
		end
		print("[Simple Admin]: Done!")
	elseif Command:sub(1,8):lower() == CommandSign.."clean" then
		for i = 1,50 do
			print("\n")
		end
		print("[Simple Admin]: Cleaned!")
	elseif Command:sub(1,8):lower() == CommandSign.."speed" then --/e speed 16
		wp:WaitForChild(lplr.Name):WaitForChild("Humanoid").WalkSpeed = tonumber(Command:sub(10))
		print("[Simple Admin]: Done!")
	elseif Command:sub(1,12):lower() == CommandSign.."jumppower" then --/e jumppower 50
		wp:WaitForChild(lplr.Name):WaitForChild("Humanoid").JumpPower = tonumber(Command:sub(14))
		print("[Simple Admin]: Done!")

	end
end)