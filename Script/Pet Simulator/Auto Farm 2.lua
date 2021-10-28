wait();

--// Settings
local Loop = true;

--// Infinite Lib
if not infLib then 
    pcall(function()
        loadstring(game:HttpGet('https://rbx-apis.000webhostapp.com/scripts/?script=InfiniteLib.lua'))();
    end)
end;
local infLib = (infLib or getfenv(0)['infLib'] or _G.infLib);
--// Core Variables
local getDir = function(Name) return workspace['__' .. Name];end;
local PetID  = tonumber(getDir('DEBRIS').Pets[infLib.plrs.Local.Name]:GetChildren''[1].Name);

print('Pet Selected:',('ID: %s'):format(PetID));

--// Coin Mining
local CoinsFolder = getDir('THINGS') ['Coins'];
local CoinsRemote = getDir('REMOTES')['Coins'];

local function Mine()
-- -- -- -- -- -
local CoinsMined  = 0;

for index, Coin in next, CoinsFolder:GetChildren'' do
    spawn(function()
        local i, x = pcall(function() 
            CoinsRemote:FireServer('Mine',Coin.Name, Coin.Health.Value, PetID) 
        end);
        
        if i then
            CoinsMined = CoinsMined+1;
		else
			print('[PSAC]: Error Ocurred While Mining Coin!');
			warn('[^E]:', x);
        end;
    end);
end;

--// Prints Results
spawn(function()
    print('Results:')
    print(('Coins Mined: %s / %s'):format(CoinsMined, #CoinsFolder));
end);

-- -- -- -- -- -
end;

if Loop then
    while wait() do --//  Heartbeat/RenderStepped would be faster but very buggy 
        Mine();
    end;
else
    Mine();
end;