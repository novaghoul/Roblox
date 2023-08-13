loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
toggleWS = false
ws_g = 50
disTeleport = 10
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
-- game:GetService("Workspace").SpawnedItems:GetChildren()[27].Handle
-- game:GetService("Workspace").SpawnedItems.Cryastem.Handle
for _,v in pairs(wp.SpawnedItems:GetChildren()) do
    createESPItem(v.Handle, 245, 205, 48, 14, tostring(v.Name), 0)
end
wp.SpawnedItems.ChildAdded:connect(
    function(m)
        wait(1)
        createESPItem(m.Handle, 245, 205, 48, 14, tostring(m.Name), 0)
    end
)
mouse.KeyDown:connect(function(keyDown)
    if keyDown == "v" then
        lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -disTeleport)
    end
end)

spawn(function()
    while wait() do
        local args = {
            [1] = {
                [1] = true,
                [2] = true
            },
            [2] = "DodgeMinigame"
        }
        
        rs:WaitForChild("Remotes"):WaitForChild("Information"):WaitForChild("RemoteFunction"):FireServer(unpack(args))
    end
end)

spawn(function()
    while wait() do
        local args = {
            [1] = true,
            [2] = "SwordQTE"
        }
    
        rs:WaitForChild("Remotes"):WaitForChild("Information"):WaitForChild("RemoteFunction"):FireServer(unpack(args))
    end
end)

spawn(function()
    while wait() do
        local args = {
            [1] = true,
            [2] = "DaggerQTE"
        }
        
        rs:WaitForChild("Remotes"):WaitForChild("Information"):WaitForChild("RemoteFunction"):FireServer(unpack(args))
    end
end)


spawn(function()
    while wait() do
        local args = {
            [1] = true
        }
        
        lplr:WaitForChild("Guard"):FireServer(unpack(args))
    end
end)