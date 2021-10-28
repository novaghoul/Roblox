--> piterleopards <--
local onoffkey = "k"
local coins = game.Workspace:WaitForChild("__REMOTES"):WaitForChild("Coins")
local save = game.Workspace:WaitForChild("__REMOTES"):WaitForChild("Get Other Stats"):InvokeServer()
local plr = game:GetService("Players").LocalPlayer
local petids = {}
local petba = {}
local petstotal = #save[plr.Name]["Save"]["Pets"]
local CoinList = {"7 Coin","7 Coin Stack","7 Small Coin","7 Chest","7 Small Chest","8 Small Chest","8 Chest","8 Good Chest","9 Chest","9 Coin","9 Coin Stack","9 Small Chest","9 Small Coin","10 Chest","10 Coin","10 Coin Stack","10 Small Chest","10 Small Coin"}

local VirtualUser=game:service'VirtualUser' --Anti AFK credit to : cxx
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

local onoff = false
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)
	if key:lower() == onoffkey then
		onoff = not onoff
		print(tostring(onoff))
	end
end)

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

for i=1,petstotal do
  if(save[plr.Name]["Save"]["Pets"][petstotal].e == true) then
      table.insert(petids, save[plr.Name]["Save"]["Pets"][petstotal].id)
	  table.insert(petba, save[plr.Name]["Save"]["Pets"][petstotal].ba)
  end
  petstotal = petstotal - 1
end

while wait() do
	if onoff then
		for __,iCoins in next, workspace.__THINGS.Coins:GetChildren() do
			if iCoins:FindFirstChild("CoinName") ~= nil and has_value(CoinList,iCoins:FindFirstChild("CoinName").Value) and onoff then
				if (iCoins:FindFirstChild("Health") ~= nil and iCoins:FindFirstChild("Health").Value > 0) and onoff then
					repeat wait(0.1)
						for i=1,#petids do
								coins:FireServer("Mine",iCoins.Name, petba[i]*4-1, petids[i])
						end
					until iCoins:FindFirstChild("Health") == nil or iCoins:FindFirstChild("Health").Value <= 0 or not onoff
				end
			end
		end
	end	
end