CreateConsole("ConsoleSpy by Club Dark")
local meta = getrawmetatable(game)
--setreadonly(meta, false)
local old = meta.__namecall
_G.Count = 0

local function format(args)
    local ret = ""
    for _, arg in next, args do
        if type(arg) == "string" then
            ret = ret .. " || " .. tostring(arg)
        elseif type(arg) == "Instance" then
            local full = arg:GetFullName()
            ret = ret .. " || " .. "game." .. full
        elseif type(arg) == "boolean" or type(arg) == "number" then
            ret = ret .. " || " .. tostring(arg)
        elseif type(arg) == "table" then
            for i = 1, #arg do
                ret = ret .. " { " .. arg[i] .. " } "
            end
        else
            ret = "Unknown!"
        end
    end
    return ret
end

meta.__namecall = function(...)
    local Args = {...}
    local Key = Args[#Args]
    local Self = Args[1]
    if Key == "FireServer" or Key == "InvokeServer" then
        _G.Count = _G.Count + 1
        WriteLog("---------------------Remote_" .. _G.Count .. "---------------------")
        WriteLog("Path: game." .. Self:GetFullName())
        WriteLog("Method: " .. Key)
        table.remove(Args, #Args)
        WriteLog("Arguments: " .. format(Args))
        WriteLog("-------------------------------------------------")
    end
    return old(...)
end

print "Loaded!"
