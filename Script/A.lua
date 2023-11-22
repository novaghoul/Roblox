loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 20
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS_Other.lua"), true))() -- WS_Other Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/NoClip.lua"), true))() -- Noclip Lua

while wait() do
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ClickService"):WaitForChild("RF"):WaitForChild("Click"):InvokeServer()

end

local args = {
    [1] = 1,
    [2] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))

wait(.2)
for i=1,11 do
    wait(.2)
    local args = {
        [1] = 1,
        [2] = i
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))

end

wait(.2)
local args = {
    [1] = 2,
    [2] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))

for i=1,2 do
    wait(.2)
    local args = {
        [1] = 2,
        [2] = i
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))

end
wait(.2)
local args = {
    [1] = 3,
    [2] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))

wait(.2)
local args = {
    [1] = 3,
    [2] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RaceService"):WaitForChild("RF"):WaitForChild("ReachedCheckpoint"):InvokeServer(unpack(args))
