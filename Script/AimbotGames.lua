getgenv().nameGame = function(name, char)
    if gi == 73885730 then --Prison Life v2
        if tostring(char.Team) == tostring(lplr.Team) then
            return true else return false
        end
    elseif gi == 3490661993 then
        if (((tostring(char.Team)  == "Criminals" or tostring(char.Team)  == "Inmates") and (tostring(lplr.Team)  == "Criminals" or tostring(lplr.Team)  == "Inmates")) or (tostring(char.Team)  == "Guards" and tostring(lplr.Team)  == "Guards")) then
            return true else return false
        end
    elseif gi == 4348829796 then
        if tostring(char.Team) == tostring(lplr.Team) then
            return true else return false
        end
    else
        return true
    end
end
