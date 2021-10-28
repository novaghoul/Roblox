local remote = Game["ReplicatedStorage"]["Buy"]
local args = {
[1] = "Gold Katana",
[2] = -99999999 --[[number]]
}
remote:FireServer(unpack(args))

while wait() do
local remote = Game["ReplicatedStorage"]["Armor"]
local args = {
[1] = 10 --[[number]]
}
remote:FireServer(unpack(args))
end