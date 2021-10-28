local amount = 1000 -- experiment with this value, 1000 is maximum and for pets with high levels
local coins = game.Workspace:WaitForChild("__REMOTES"):WaitForChild("Coins")
local save = game.Workspace:WaitForChild("__REMOTES"):WaitForChild("Get Other Stats"):InvokeServer()
local plr = game:GetService("Players").LocalPlayer
local petids = {}
local pets = game:GetService("Workspace")["__REMOTES"].Pets
local a = #save[plr.Name]["Save"]["Pets"]
local done = "lol meme"
function random(t)
   local keys = {}
   for key, value in pairs(t) do
       keys[#keys+1] = key
   end
   index = keys[math.random(1, #keys)]
   return t[index]
end
for i=1,a do
   if(save[plr.Name]["Save"]["Pets"][a].e == true) then
       table.insert(petids, save[plr.Name]["Save"]["Pets"][a].id)
   end
   a = a - 1
end
function co(b)
   local done = b
   while(b:FindFirstChild"Health" ~= nil and b:FindFirstChild"Health".Value > 0) do
       wait(0.2)
       coins:FireServer("Mine",b.Name, amount, random(petids))
   end
end
for _,b in next, workspace.__THINGS.Coins:GetChildren() do
   if(done ~= b) then
       coroutine.wrap(function()co(b)end)()
   end
end 