loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local atOn = false
toggleJP = false
ws_g = 100
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua

spawn(function()
    while wait() do
        if tostring(atOn) == "true" then
            local args = {}
            for _,v in pairs(wp.Live.NPCs.Client:GetChildren()) do
                if (v.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 30 then
                    args = {
                        [1] = tostring(v)
                    }
                end
            end
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer(unpack(args))
        else
            rs.Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
        end
    end
end)

spawn(function()
    while wait() do
        for _,v in pairs(wp.Live.Pickups:GetChildren()) do
            if v then
                v.CFrame = lplr.Character.HumanoidRootPart.CFrame
            end
        end
    end
end)

spawn(function()
    while wait(1) do
        rs.Packages.Knit.Services.AscendService.RF.Ascend:InvokeServer()
    end
end)

spawn(function()
    while wait(.1) do
        for _,v in pairs(lplr.PlayerGui.WeaponInv.Background.ImageFrame.Window.WeaponHolder.WeaponScrolling:GetChildren()) do
            if v:IsA("Frame") then
                local args = {
                    [1] = tostring(v)
                }
                
                rs.Packages.Knit.Services.WeaponStarService.RF.AddStar:InvokeServer(unpack(args))
                rs.Packages.Knit.Services.ForgeService.RF.Forge:InvokeServer(unpack(args))
            end
        end
    end
end)
mouse.KeyDown:connect(
    function(keyDown)
        if keyDown == "f" then
            if tostring(atOn) == "false" then
                atOn = true
                NotifyG("Attack", tostring(atOn))
            else
                atOn = false
                NotifyG("Attack", tostring(atOn))
            end
        end
    end
)
-- getgenv().nEgg = "Egg 7"
-- getgenv().oEgg = true
-- spawn(function()
--     while wait(.1) do
--         if tostring(oEgg) == "true" then
--             local args = {
--                 [1] = {
--                     ["eggName"] = nEgg,
--                     ["auto"] = false,
--                     ["amount"] = 1
--                 }
--             }
            
--             rs.Packages.Knit.Services.EggService.RF.BuyEgg:InvokeServer(unpack(args))
--         end
--     end
-- end)
