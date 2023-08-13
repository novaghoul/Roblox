loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

toggleJP = false
ws_g = 50
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/No%20Clip.lua"), true))() -- Inf_Jump Lua

getgenv().aPu = true
getgenv().nPu = "Meshes/Axel_Cylinder.069"
spawn(function()
    while aPu do
        wait()
        for _,v in pairs(wp:GetChildren()) do
            if tostring(v) == "BoxingBag" then
                for _,l in pairs(v:GetChildren()) do
                    if tostring(l) == nPu then
                        local args = {
                            [1] = l
                        }
                        
                        rs["events-shared/network@GlobalEvents"].train:FireServer(unpack(args))
                    end
                end
            end
        end
    end
end)
