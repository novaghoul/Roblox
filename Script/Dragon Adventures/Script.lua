local string_1 = "Fire";
local table_1 = {
	[1] = '1',
	[2] = true
};
local Target = game:GetService("Players").WAOKyoHana.Remote;
Target:FireServer(string_1, table_1);


local string_1 = "Feed";
local table_1 = {
	[1] = '1',
	[2] = 'Meat'
};
local Target = game:GetService("Players").WAOKyoHana.Function;
Target:InvokeServer(string_1, table_1);

local A_1 = "SellResource"
local A_2 = 
{
	[1] = "Apple", 
	[2] = 1
}
local Event = game:GetService("Players").WAOKyoHana.Remote
Event:FireServer(A_1, A_2)