function rebirthPet(name, num)
	local Remote = game.ReplicatedStorage.Events["RebirthPet"]
	local Pet = game:GetService("Players").WAOHoukaShu.PlayerGui.MainGui.PetsFrame.ScrollingFrame:FindFirstChild(name)
	local Arguments = {
		[1] = {
			["Name"] = name,
			["Button"] = Pet,
			["Selected"] = false,
			["Equipped"] = false,
			["Rebirths"] = num
		}
	}
	Remote:InvokeServer(unpack(Arguments))
end


function purchaseEgg(name)
	local Remote = game.ReplicatedStorage.Events["PurchaseEgg"]
	local Arguments = {
		[1] = name,
		[2] = 1
	}
	Remote:InvokeServer(unpack(Arguments))
end

spawn(
	function()
		while wait(0.2) do
			rebirthPet("Ghost", 0)
		end
	end
)
spawn(
	function()
		while wait(0.2) do
			rebirthPet("Ghost", 1)
		end
	end
)
spawn(
	function()
		while wait(0.2) do
			rebirthPet("Ghost", 2)
		end
	end
)
spawn(
	function()
		while wait(0.2) do
			rebirthPet("Ghost", 3)
		end
	end
)
spawn(
	function()
		while wait(0.2) do
			rebirthPet("Ghost", 4)
		end
	end
)


spawn(
	function()
		while wait() do
			purchaseEgg("Ghostly Egg")
			purchaseEgg("Ghostly Egg")
			purchaseEgg("Ghostly Egg")
			purchaseEgg("Ghostly Egg")
			purchaseEgg("Ghostly Egg")
		end
	end
)
