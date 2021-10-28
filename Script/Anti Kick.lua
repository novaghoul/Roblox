local mt = getrawmetatable(game)
local mt_namecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = function(...)
    local args = {...}
    local method = table.remove(args)
    if method == "Kick" then
        return true
    end
    return mt_namecall(...)
end
