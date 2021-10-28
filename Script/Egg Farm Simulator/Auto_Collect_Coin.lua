while true do
wait(0.1)
local A_1 = "\80\105\99\107\117\112"
local A_2 = 
{
   [1] = 1, 
   [2] = 0
}
local Event = game:GetService("ReplicatedStorage").Events.Money
Event:FireServer(A_1, A_2)
end