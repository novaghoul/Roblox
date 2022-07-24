loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

getgenv().icreamI = {"Lemon", "Cherry", "Apple", "Banana", "Orange"}
getgenv().icreamType = "Cone"

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == "q" then
            for i=1,10 do
                for i = 1, #icreamI do
                    local string_1 = icreamType
                    local string_2 = icreamI[i]
                    local number_1 = 1
                    local Target = rs.RemoteEvents.PurchaseIceCream
                    Target:InvokeServer(string_1, string_2, number_1)
                end
            end
		end

		if keyDown == "e" then
            for _,v in pairs(wp["_NPCLocations"]:GetChildren()) do
                if v.Name == "Normal" then
                    for _,l in pairs(v.NPCs:GetChildren()) do
                        local userdata_1 = l
                        local userdata_2 = 0, 0
                        local Target = lplr.PlayerScripts.LocalIceCreamSale.Sale
                        Target:Fire(userdata_1, userdata_2)
                    end
                end
            end
		end
	end
)