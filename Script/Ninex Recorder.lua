--[[ | Core | ]] --

local Core = {}
 --

--[[ | Settings | ]] Core.Settings = {
    Logs = {
        MaxLogSize = 500,
        Save = true,
        FileFormat = "Game Name.lua",
        LogFormat = "Game Name.json",
        Formating = {
            Time = true,
            Remote = true,
            Path = true,
            Arguments = true,
            Return = true,
            Example = true,
            Indent = true
        }
    },
    Recorder = {
        Enabled = true,
        Notification = true
    },
    Remotes = {
        LookOutFor = {
            ["BindableEvent"] = true,
            ["BindableFunction"] = true,
            ["RemoteEvent"] = true,
            ["RemoteFunction"] = true
        },
        Ignored = setmetatable(
            {
                Parents = {
                    ["nil"] = true
                },
                Names = {
                    ["CharacterSoundEvent"] = true,
                    ["tiltEvent"] = true
                }
            },
            {
                __index = function(Ignored, Remote)
                    if Ignored.Parents[tostring(Remote.Parent)] then
                        return false
                    elseif Ignored.Names[tostring(Remote.Name)] then
                        return false
                    else
                        return true
                    end
                end
            }
        )
    },
    Version = "V.1.0.0.0 Beta"
}
 --

--[[ | Services | ]] Core.Services =
    setmetatable(
    {},
    {
        __index = function(Services, Service)
            local Found, Error =
                pcall(
                function()
                    Service = game:GetService(Service)
                end
            )
            if Found then
                return Service
            else
                return nil
            end
        end
    }
)
 --

--[[ | Temp | ]] Core.Temp = {}
 --

--[[ | Functions | ]] Core.Modules = {}
 --

--[[ | File | ]] Core.Modules.File = function()
    --[[ | File | ]] --

    local File = {}
    File.Functions = {}
     --

    --[[ | FormateName | ]] function File.Functions.FormateName(FileName)
        local FormatedFileName = string.match(FileName, "^.-%p")
        local FileExtention = string.match(FileName, "^.-%p(.+)")

        FormatedFileName = string.gsub(FormatedFileName, "%p+", "")
        FormatedFileName =
            string.gsub(
            FormatedFileName,
            "GameName",
            Core.Services.MarketplaceService:GetProductInfo(game.PlaceId).Name
        )
        FormatedFileName =
            string.gsub(
            FormatedFileName,
            "Game Name",
            Core.Services.MarketplaceService:GetProductInfo(game.PlaceId).Name
        )
        FileExtention = "." .. FileExtention

        local FullName = FormatedFileName .. FileExtention

        return FormatedFileName, FileExtention, FullName
    end
     --

    --[[ | Read | ]] function File.Functions.Read(FilePath)
        local FileFound, Error =
            pcall(
            function()
                readfile(FilePath)
            end
        )

        if FileFound then
            return readfile(FilePath)
        else
            return nil
        end
    end
     --

    --[[ | Write | ]] function File.Functions.Write(FilePath, Contents)
        return writefile(FilePath, Contents)
    end
     --

    --[[ | Save | ]] function File.Functions.Save(FilePath, Contents)
        local FileName, FileExtention = File.Functions.FormateName(FilePath)
        local FileFound, Error =
            pcall(
            function()
                readfile(FilePath)
            end
        )

        if FileFound then
            File.Functions.Write(FilePath, readfile(FilePath) .. Contents)
        else
            File.Functions.Write(FilePath, Contents)
        end
    end
     --

    --[[ | Clear | ]] function File.Functions.Clear(FilePath)
        File.Write(FilePath, "")
        local FileName, FileExtention = File.Functions.FormateName(FilePath)

        Core.Services.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Ninex Recorder",
                Text = FileName .. " has been Cleared!",
                Duration = 5
            }
        )
    end

    return File.Functions
end

Core.Modules.RbxUtility = function()
    --[[ | RbxUtility | ]] --

    local RbxUtility = {}
    RbxUtility.Functions = {}
     --

    --[[ | RbxUtility | ]] RbxUtility.Functions.Create = LoadLibrary("RbxUtility").Create
    RbxUtility.Functions.CreateSignal = LoadLibrary("RbxUtility").CreateSignal
    RbxUtility.Functions.MakeWedge = LoadLibrary("RbxUtility").MakeWedge
    RbxUtility.Functions.DecodeJSON = LoadLibrary("RbxUtility").DecodeJSON
    RbxUtility.Functions.EncodeJSON = LoadLibrary("RbxUtility").EncodeJSON
    RbxUtility.Functions.SelectTerrainRegion = LoadLibrary("RbxUtility").SelectTerrainRegion

    return RbxUtility.Functions
end
 --

--[[ | Time | ]] Core.Modules.Time = function()
    local date = {}
    local months = {
        {"January", 31},
        {"February", 28},
        {"March", 31},
        {"April", 30},
        {"May", 31},
        {"June", 30},
        {"July", 31},
        {"August", 31},
        {"September", 30},
        {"October", 31},
        {"November", 30},
        {"December", 31}
    }
    local t = tick()
    date.total = t
    date.seconds = math.floor(t % 60)
    date.minutes = math.floor((t / 60) % 60)
    date.hours = math.floor((t / 60 / 60) % 24)
    date.year = (1970 + math.floor(t / 60 / 60 / 24 / 365.25))
    date.yearShort = tostring(date.year):sub(-2)
    date.isLeapYear = ((date.year % 4) == 0)
    date.isAm = (date.hours < 12)
    date.hoursPm = (date.isAm and date.hours or (date.hours == 12 and 12 or (date.hours - 12)))
    if (date.hoursPm == 0) then
        date.hoursPm = 12
    end
    if (date.isLeapYear) then
        months[2][2] = 29
    end
    do
        date.dayOfYear = math.floor((t / 60 / 60 / 24) % 365.25)
        local dayCount = 0
        for i, month in pairs(months) do
            dayCount = (dayCount + month[2])
            if (dayCount > date.dayOfYear) then
                date.monthWord = month[1]
                date.month = i
                date.day = (date.dayOfYear - (dayCount - month[2]) + 1)
                break
            end
        end
    end
    function date:format(str)
        str =
            str:gsub("#s", ("%.2i"):format(self.seconds)):gsub("#m", ("%.2i"):format(self.minutes)):gsub(
            "#h",
            tostring(self.hours)
        ):gsub("#H", tostring(self.hoursPm)):gsub("#Y", tostring(self.year)):gsub("#y", tostring(self.yearShort)):gsub(
            "#a",
            (self.isAm and "AM" or "PM")
        ):gsub("#W", self.monthWord):gsub("#M", tostring(self.month)):gsub("#d", tostring(self.day)):gsub(
            "#D",
            tostring(self.dayOfYear)
        ):gsub("#t", tostring(self.total))
        return str
    end
    return date
end
 --

--[[ | DescendantStorage | ]] Core.Modules.DescendantStorage = function()
    --[[ | DescendantStorage | ]] --

    local DescendantStorage = {}
    DescendantStorage.Functions = {}
    DescendantStorage.Directory = {}
     --

    --[[ | Registar | ]] function DescendantStorage.Functions.Registar(object)
        DescendantStorage.Directory[object.Name] = {}
        DescendantStorage.Directory[object.Name][object.Name] = object
        local Descendants = object:GetDescendants()
        for _, descendant in pairs(Descendants) do
            DescendantStorage.Directory[object.Name][descendant.Name] = descendant
        end
        object.DescendantAdded:Connect(
            function(descendant)
                DescendantStorage.Directory[object.Name][descendant.Name] = descendant
            end
        )
        return DescendantStorage.Directory[object.Name]
    end

    return DescendantStorage.Functions
end
 --

--[[ | ArgumentCompiler | ]] Core.Modules.ArgumentCompiler = function()
    --[[ | ArgumentCompiler | ]] --

    local ArgumentCompiler = {}
    ArgumentCompiler.Functions = {}
     --

    --[[ | PathFormater | ]] function ArgumentCompiler.Functions.PathFormat(Obj)
        local Path = {
            [1] = {
                Object = Obj,
                Name = Obj.Name,
                ClassName = Obj.ClassName
            }
        }
        if not Core.Services[Obj.ClassName] then
            repeat
                wait()
                local LastObject = Path[#Path].Object

                if LastObject.Parent == nil then
                    Path[1] = {
                        Object = Obj,
                        Name = Obj.Name,
                        ClassName = "Nil"
                    }
                    break
                else
                    Path[#Path + 1] = {
                        Object = LastObject.Parent,
                        Name = LastObject.Parent.Name,
                        ClassName = LastObject.Parent.ClassName
                    }
                end
            until Core.Services[Path[#Path].ClassName] or (Path[#Path].ClassName == "Nil")
            if Path[#Path].ClassName == "Nil" then
                local FullName = "getnilinstances()" .. "['" .. Obj.Name .. "']" .. ""
                return FullName
            else
                local Service = [[game:GetService(']] .. Path[#Path].ClassName .. [[')]]
                table.remove(Path, #Path)
                local FullName = Service
                for Index = #Path, 1, -1 do
                    FullName = FullName .. [[:WaitForChild(']] .. Path[Index].Name .. [[')]]
                end

                if
                    string.sub(FullName, 42, 41 + #Core.Services.Players.LocalPlayer.Name) ==
                        Core.Services.Players.LocalPlayer.Name
                 then
                    local Last = string.sub(FullName, 44 + #Core.Services.Players.LocalPlayer.Name, #FullName)

                    FullName = "game:GetService('Players').LocalPlayer" .. Last
                elseif
                    string.sub(FullName, 44, 43 + #Core.Services.Players.LocalPlayer.Name) ==
                        Core.Services.Players.LocalPlayer.Name
                 then
                    local Last = string.sub(FullName, 46 + #Core.Services.Players.LocalPlayer.Name, #FullName)

                    FullName = "game:GetService('Players').LocalPlayer.Character" .. Last
                end

                return FullName
            end
        else
            return [[game:GetService(']] .. Path[#Path].ClassName .. [[')]]
        end
    end
     --

    --[[ | TableCompiler | ]] function ArgumentCompiler.Functions.TableCompiler(tbl, space, not_clever)
        local lua_keyword
        local get_keywords = function()
            if not lua_keyword then
                lua_keyword = {
                    ["and"] = true,
                    ["break"] = true,
                    ["do"] = true,
                    ["else"] = true,
                    ["elseif"] = true,
                    ["end"] = true,
                    ["false"] = true,
                    ["for"] = true,
                    ["function"] = true,
                    ["if"] = true,
                    ["in"] = true,
                    ["local"] = true,
                    ["nil"] = true,
                    ["not"] = true,
                    ["or"] = true,
                    ["repeat"] = true,
                    ["return"] = true,
                    ["then"] = true,
                    ["true"] = true,
                    ["until"] = true,
                    ["while"] = true
                }
            end
            return lua_keyword
        end
        local quote_if_necessary = function(v)
            if not v then
                return ""
            else
                if v:find " " then
                    v = '"' .. v .. '"'
                end
            end
            return v
        end

        local keywords
        local append = table.insert
        local concat = table.concat

        local is_identifier = function(s)
            return type(s) == "string" and s:find("^[%a_][%w_]*$") and not keywords[s]
        end

        local function quote(s)
            if type(s) == "table" then
                return ArgumentCompiler.Functions.TableCompiler(s, "")
            else
                return ("%q"):format(tostring(s))
            end
        end

        local index = function(numkey, key)
            if not numkey then
                key = quote(key)
            end
            return "[" .. key .. "]"
        end

        if type(tbl) ~= "table" then
            local res = tostring(tbl)
            if type(tbl) == "string" then
                return quote(tbl)
            end
            return res, "not a table"
        end
        if not keywords then
            keywords = get_keywords()
        end
        local set = " = "
        if space == "" then
            set = "="
        end
        space = space or "  "
        local lines = {}
        local line = ""
        local tables = {}

        local put = function(s)
            if #s > 0 then
                line = line .. s
            end
        end

        local putln = function(s)
            if #line > 0 then
                line = line .. s
                append(lines, line)
                line = ""
            else
                append(lines, s)
            end
        end

        local eat_last_comma = function()
            local n, lastch = #lines
            local lastch = lines[n]:sub(-1, -1)
            if lastch == "," then
                lines[n] = lines[n]:sub(1, -2)
            end
        end

        local writeit
        writeit = function(t, oldindent, indent)
            local tp = typeof(t)
            local ts = tostring(t)
            if tp == "string" then
                if t:find("\n") then
                    putln("[[\n" .. t .. "]];")
                else
                    putln(quote(t) .. ";")
                end
            elseif tp == "EnumItem" then
                putln(quote_if_necessary("Enum." .. tostring(t.EnumType) .. "." .. t.Name) .. ";")
            elseif tp == "Enum" then
                putln(quote_if_necessary("Enum." .. ts) .. ";")
            elseif tp == "Instance" then
                putln(quote_if_necessary(ArgumentCompiler.Functions.PathFormat(t)) .. ";")
            elseif tp == "CFrame" then
                putln(quote_if_necessary("CFrame.new(" .. ts .. ")") .. ";")
            elseif tp == "Vector3" then
                putln(quote_if_necessary("Vector3.new(" .. ts .. ")") .. ";")
            elseif tp == "Vector2" then
                putln(quote_if_necessary("Vector2.new(" .. ts .. ")") .. ";")
            elseif tp == "UDim2" then
                putln(quote_if_necessary("UDim2.new(" .. ts:gsub("[{}]", "") .. ")") .. ";")
            elseif tp == "BrickColor" then
                putln(quote_if_necessary("BrickColor.new('" .. ts .. "')") .. ";")
            elseif tp == "Color3" then
                putln(quote_if_necessary("Color3.fromRGB(" .. t.r * 255 .. "," .. t.g * 255 .. t.b * 255 .. ")") .. ";")
            elseif tp == "ColorSequence" then
                putln(
                    quote_if_necessary("ColorSequence.new(" .. ts:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")") ..
                        ";"
                )
            elseif tp == "NumberRange" then
                putln(
                    quote_if_necessary("NumberRange.new(" .. ts:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")") ..
                        ";"
                )
            elseif tp == "PhysicalProperties" then
                putln(quote_if_necessary("PhysicalProperties.new(" .. ts .. ")") .. ";")
            elseif tp == "table" then
                if tables[t] then
                    putln("<cycle>,")
                    return
                end
                tables[t] = true
                local newindent = indent .. space
                putln("{")
                local used = {}
                if not not_clever then
                    for i, val in ipairs(t) do
                        put(indent)
                        writeit(val, indent, newindent)
                        used[i] = true
                    end
                end
                for key, val in pairs(t) do
                    local numkey = type(key) == "number"
                    if not_clever then
                        key = "['" .. tostring(key) .. "']"
                        put(indent .. index(numkey, key) .. set)
                        writeit(val, indent, newindent)
                    else
                        if not numkey or not used[key] then -- non-array indices
                            if numkey or not is_identifier(key) then
                                key = index(numkey, key)
                            end
                            key = "['" .. tostring(key) .. "']"
                            put(indent .. key .. set)
                            writeit(val, indent, newindent)
                        end
                    end
                end
                tables[t] = nil
                eat_last_comma()
                putln(oldindent .. "}")
            else
                putln(tostring(t) .. ";")
            end
        end
        writeit(tbl, "", space)
        eat_last_comma()
        return concat(lines, #space > 0 and "\n" or "")
    end
     --

    --[[ | ArgumentDecompler | ]] function ArgumentCompiler.Functions.Decompile(obj)
        local objType = typeof(obj)
        local objStr = tostring(obj)
        local isKey = false
        FormatSmaller = function(a, b, notLast)
            local aByte = a:byte() or -1
            local bByte = b:byte() or -1
            if aByte == bByte then
                if notLast and #a == 1 and #b == 1 then
                    return -1
                elseif #b == 1 then
                    return false
                elseif #a == 1 then
                    return true
                else
                    return FormatSmaller(a:sub(2), b:sub(2), notLast)
                end
            else
                return aByte < bByte
            end
        end
        if objType == "table" then
            return ArgumentCompiler.Functions.TableCompiler(obj)
        else
            local returnVal = nil

            if (objType == "string" or objType == "Content") and (not isKey or tonumber(obj:sub(1, 1))) then
                local retVal = '"' .. objStr .. '"'
                if isKey then
                    retVal = "[" .. retVal .. "]"
                end

                returnVal = retVal
            elseif objType == "EnumItem" then
                returnVal = "Enum." .. tostring(obj.EnumType) .. "." .. obj.Name
            elseif objType == "Enum" then
                returnVal = "Enum." .. objStr
            elseif objType == "Instance" then
                returnVal = ArgumentCompiler.Functions.PathFormat(obj)
            elseif objType == "CFrame" then
                returnVal = "CFrame.new(" .. objStr .. ")"
            elseif objType == "Vector3" then
                returnVal = "Vector3.new(" .. objStr .. ")"
            elseif objType == "Vector2" then
                returnVal = "Vector2.new(" .. objStr .. ")"
            elseif objType == "UDim2" then
                returnVal = "UDim2.new(" .. objStr:gsub("[{}]", "") .. ")"
            elseif objType == "BrickColor" then
                returnVal = 'BrickColor.new("' .. objStr .. '")'
            elseif objType == "Color3" then
                returnVal = "Color3.fromRGB(" .. obj.r * 255 .. "," .. obj.g * 255 .. obj.b * 255 .. ")"
            elseif objType == "ColorSequence" then
                returnVal = "ColorSequence.new(" .. objStr:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
            elseif objType == "NumberRange" then
                returnVal = "NumberRange.new(" .. objStr:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
            elseif objType == "PhysicalProperties" then
                returnVal = "PhysicalProperties.new(" .. objStr .. ")"
            elseif objType == "Rect" then
            else
                returnVal = objStr
            end
            return returnVal
        end
    end

    return ArgumentCompiler.Functions
end
 --

--[[ | Functions | ]] Core.Functions = {}
 --

--[[ | Start | ]] function Core.Functions:Start()
    print("Ninex Loading...")

    local ClassMethods = {
        BindableEvent = "Fire",
        BindableFunction = "Invoke",
        RemoteEvent = "FireServer",
        RemoteFunction = "InvokeServer"
    }

    local RealMethods = {}

    local PseudoEnv = {}

    Core.Services.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Ninex Recorder",
            Text = "Has begain thanks for using Ninex Recorder!",
            Duration = 5
        }
    )

    print("Ninex Loaded!")

    local GameMeta = getrawmetatable(game)
    local FileName, FileExtention, FullName = Core.Modules.File().FormateName(Core.Settings.Logs.FileFormat)
    local LogFileName, LogFileExtention, LogFileFullName = Core.Modules.File().FormateName(Core.Settings.Logs.LogFormat)

    if Core.Settings.Logs.Formating.Indent then
        Core.Modules.File().Save(
            FullName,
            tostring(
                "\n_______________________________________________________________________________________________________________________________________________________" ..
                    "\n\n\n\n\n"
            )
        )
    else
        Core.Modules.File().Save(FullName, tostring("\n"))
    end

    Core.Modules.File().Save(FullName, tostring("\n"))

    setreadonly(GameMeta, false)

    for Name, Enabled in next, Core.Settings.Remotes.LookOutFor do
        if Enabled then
            RealMethods[ClassMethods[Name]] = Instance.new(Name)[ClassMethods[Name]]
        end
    end

    for Index, Value in next, GameMeta do
        PseudoEnv[Index] = Value
    end

    local function getValues(self, key, ...)
        return {RealMethods[key](self, ...)}
    end

    local function Split(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        i = 1
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            t[i] = str
            i = i + 1
        end
        return t
    end

    local UpdateLogs = function()
        local LogFile = Core.Modules.File().Read(LogFileFullName)
        if LogFile then
            LogFile = Core.Services.HttpService:JSONDecode(LogFile)
            for Index, Log in pairs(LogFile) do
                local Time = Log.Time
                local Remote = Log.Remote
                local Path = Log.Path
                local Arguments = Log.Arguments
                local Return = Log.Return
                local Example = Log.Example
                local Indent = Log.Indent
                Core.Temp[Path] = true
            end
        else
            Core.Modules.File().Write(LogFileFullName, Core.Services.HttpService:JSONEncode({}))
        end
    end

    UpdateLogs()

    GameMeta.__index, GameMeta.__namecall = function(Object, key)
        if not RealMethods[key] then
            return PseudoEnv.__index(Object, key)
        end
        return function(_, ...)
            local allPassed = {...}
            local returnValues = {}
            local Passed, Data = pcall(getValues, Object, key, ...)
            local TempFormat = {}
            local SaveFormat = {}

            TempFormat.Time = tostring("Time        ||     " .. Core.Modules.Time():format("#H:#m:#s #a") .. " \n")
            TempFormat.Remote =
                tostring(
                "Remote      ||     " ..
                    Object.Name .. " Has been " .. string.gsub(ClassMethods[Object.ClassName], "Server", "d") .. "!\n"
            )
            TempFormat.Path =
                tostring(
                "Path        ||     " ..
                    Core.Modules.ArgumentCompiler().PathFormat(Object) ..
                        ":" .. ClassMethods[Object.ClassName] .. "();\n"
            )
            TempFormat.Arguments =
                tostring("Arguments   ||     " .. "(" .. Core.Modules.ArgumentCompiler().Decompile(allPassed) .. ");\n")
            TempFormat.Return =
                tostring(
                "Return      ||     " .. "(" .. Core.Modules.ArgumentCompiler().Decompile(returnValues) .. ");\n"
            )
            TempFormat.Example =
                tostring(
                "Example     ||     " ..
                    Core.Modules.ArgumentCompiler().PathFormat(Object) ..
                        ":" ..
                            ClassMethods[Object.ClassName] ..
                                "(" .. Core.Modules.ArgumentCompiler().Decompile(allPassed) .. ");" .. "\n\n\n\n"
            )
            TempFormat.Indent =
                tostring(
                "_______________________________________________________________________________________________________________________________________________________" ..
                    "\n\n\n\n\n"
            )

            if Passed then
                returnValues = Data
            end

            if not Core.Temp[TempFormat.Path] then
                Core.Temp[TempFormat.Path] = true
            else
                return unpack(returnValues)
            end

            if
                Core.Settings.Recorder.Enabled and Core.Settings.Remotes.Ignored[Object] and Core.Settings.Logs.Save and
                    #TempFormat.Arguments <= Core.Settings.Logs.MaxLogSize and
                    #TempFormat.Return <= Core.Settings.Logs.MaxLogSize
             then
                pcall(
                    function()
                        for Index, Enabled in pairs(Core.Settings.Logs.Formating) do
                            local Detail = TempFormat[Index]
                            if Enabled and Detail then
                                if Index == "Time" then
                                    table.insert(SaveFormat, 1, Detail)
                                elseif Index == "Remote" then
                                    table.insert(SaveFormat, 2, Detail)
                                elseif Index == "Path" then
                                    table.insert(SaveFormat, 3, Detail)
                                elseif Index == "Arguments" then
                                    table.insert(SaveFormat, 4, Detail)
                                elseif Index == "Return" then
                                    table.insert(SaveFormat, 5, Detail)
                                elseif Index == "Example" then
                                    table.insert(SaveFormat, 6, Detail)
                                elseif Index == "Indent" then
                                    table.insert(SaveFormat, 7, Detail)
                                end
                            end
                        end

                        local LastLogFile = Core.Modules.File().Read(LogFileFullName)
                        if LastLogFile then
                            local LastLogTable = Core.Services.HttpService:JSONDecode(LastLogFile)
                            table.insert(LastLogTable, #LastLogTable + 1, TempFormat)
                            local LogFileFormat = Core.Services.HttpService:JSONEncode(LastLogTable)
                            Core.Modules.File().Write(LogFileFullName, LogFileFormat)
                        end

                        local Formated = table.concat(SaveFormat, "\n")
                        Core.Modules.File().Save(FullName, Formated)
                        Core.Services.StarterGui:SetCore(
                            "SendNotification",
                            {
                                Title = "Ninex Recorder",
                                Text = "Log Has been added!",
                                Duration = 5
                            }
                        )
                    end
                )
            end
            return unpack(returnValues)
        end
    end
end

print(Core.Settings.Version)

Core.Functions:Start()
