local numSpeed = 14523

local A_1 = "Speed"
local A_2 = numSpeed
local Event = game:GetService("ReplicatedStorage").Events.Msg
Event:FireServer(A_1, A_2)