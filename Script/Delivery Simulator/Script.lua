_G.items = "Newspaper"

for i = 1, 10 do
	spawn(
		function()
			while wait(0.1) do
				local A_1 = _G.items
				local Event = game:GetService("ReplicatedStorage").Events.ProxHome
				Event:InvokeServer(A_1)
			end
		end
	)
end