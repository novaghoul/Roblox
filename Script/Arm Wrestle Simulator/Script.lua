loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

ws_g = 50

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua

spawn(function()
    while wait(.1) do
        rs.Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
    end
end)

spawn(function()
    while wait() do
        rs.Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
    end
end)

spawn(function()
    while wait(.1) do
        local args = {
            [1] = lplr
        }
        
        rs.Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.equipBest:InvokeServer(unpack(args))
    end
end)
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "f" then
            noclipAll = not noclipAll
            NotifyG("NoClip", noclipAll)
        end
    end
)

game:GetService("RunService").Stepped:connect(
    function()
        if noclipAll then
            for i = 1, #checkRigType() do
                lplr.Character[checkRigType()[i]].CanCollide = false
            end
            lplr.Character.HumanoidRootPart.CanCollide = false
        end
    end
)

getgenv().aPet = true
while aPet do
    local args = {
        [1] = "Limited",
        [2] = {
            ["PurpleDragon"] = true,
            ["PinkFlamingo"] = true
        },
        [4] = false
    }

    rs.Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
    wait()
end