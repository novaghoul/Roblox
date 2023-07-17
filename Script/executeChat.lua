loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

local function executeChatD(code)
    if string.lower(string.sub(code, 1, 2)) == "/e" then
        local split = {}

        for part in code:gmatch("%S+") do
            table.insert(split, part)
        end

        table.remove(split, 1)

        local command = string.lower(string.sub(split[1], 1))

        local first = split[2]

        if string.find("dex", command) then
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Dark Dex.lua"), true))()
        elseif string.find("ip", command) then
            buyItems("InvisibityPotion", first)
        elseif string.find("ex", command) then
            exitMap()
        end
    end
end
lplr.Chatted:Connect(executeChatD)