uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
bp = lplr:WaitForChild("Backpack")
mouse = lplr:GetMouse()

local Event = rs.Events.destryObj
local Change = rs.Events.changeValue

coin = 5000000

coinP = 0

function enableCode()
	for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
		    local PlayerC = rs.PlayerMoney:findFirstChild(o.Name)
            Change:InvokeServer(PlayerC, coin)
        end
    end

    plrs.PlayerAdded:Connect(function(newPlayer)
        if newPlayer.Name ~= lplr.Name then
            local PlayerN = rs.PlayerMoney:findFirstChild(newPlayer.Name)
            Change:InvokeServer(PlayerN, coin)
        end
    end)
end

enableCode()

mouse.KeyDown:connect(function(Key)
	if Key == "z" then
		if mouse.Target then
			Event:FireServer(mouse.Target)
		end
	elseif Key == "e" then
        local PlayerL = rs.PlayerMoney:findFirstChild(lplr.Name)
        Change:InvokeServer(PlayerL, coinP)
	elseif Key == "x" then
		local T = mouse.Target
		if Players:GetPlayerFromCharacter(T.Parent) then
			local Player = Players:GetPlayerFromCharacter(T.Parent)
			Event:FireServer(Player)
		end
	end
end)