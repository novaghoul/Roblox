local plrs = game:GetService("Players")
for _, player in pairs(plrs:GetPlayers()) do
	print(player.Team)
end