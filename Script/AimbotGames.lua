getgenv().nameGame = function(name, char)
    if name == "Prison Life v2" then
        if tostring(char.Team) == tostring(lplr.Team) then
            return true else return false
        end
    elseif tostring(name) == "Prison Life v3" then
        if (((tostring(char.Team)  == "Criminals" or tostring(char.Team)  == "Inmates") and (tostring(lplr.Team)  == "Criminals" or tostring(lplr.Team)  == "Inmates")) or (tostring(char.Team)  == "Guards" and tostring(lplr.Team)  == "Guards")) then
            return true else return false
        end
    else
        return true
    end
end
