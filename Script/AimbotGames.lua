loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"),true))() -- 1st Lua

getgenv().nameGame = function(name, char)
    if tostring(name) == "Prison Life v2" then
        if char.Team == lplr.Team then
            return true
        end
    elseif tostring(name) == "Prison Life v3" then
        if (((tostring(char.Team)  == "Criminals" or tostring(char.Team)  == "Inmates") and (tostring(lplr.Team)  == "Criminals" or tostring(lplr.Team)  == "Inmates")) or (tostring(char.Team)  == "Guards" and tostring(lplr.Team)  == "Guards")) then
            return true
        end
    else
        return false
    end
end
