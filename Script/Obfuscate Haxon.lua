Script = [[]]

customVarNames = {
  "HaxonNotAxon",
  "HaxonProtoSoon",
  "ThisIsShit",
  "LolYouWillCrackFast",
  "ThisShitIsBroken",
  "ThankUCorewave",
  "LindseyGudLua"
}  

funcrename = {
  ["print"]="print",
  ["_G"]="_G",
  ["getmetatable"]="getmetatable",
  ["warn"]="warn",
  ["error"]="error",
  ["Instance.new"]="Instance.new",
  ["loadstring"]="loadstring",
  ["UDim2.new"]="UDim2.new",
  ["false"]="false",
  ["true"]="true",
  ["Color3.new"]="Color3.new",
  ["Vector3.new"]="Vector3.new",
  ["Vector2.new"]="Vector2.new",
  ["getgenv"]="getgenv",
  ["getrenv"]="getrenv",
  ["getfenv"]="getfenv",
  ["getsenv"]="getsenv",
  ["Enum"]="Enum",
  ["getrawmetatable"]="getrawmetatable",
  ["newcclosure"]="newcclosure",
  ["CFrame.new"]="CFrame.new",
  ["next"]="next",
  ["pairs"]="pairs",
  ["Region3.new"]="Region3.new",
  ["nil"]="nil",
  ["printidentity"]="printidentity",
  ["tostring"]="tostring",
  ["unpack"]="unpack",
  ["debug"]="debug",
  ["bit"]="bit",
  ["string.char"]="string.char"
}
--CreateVarName
local chars ="1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1I1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1IlI1"
local taken = { }
taken[""] = true
local function CreateVar()
  local s = ""
  while taken[s] do
    for i = 1, math.random(5, 10) do
      local c = chars:sub(i,i)
      s = s..c
    end
  end
  taken[s] = true
  return(customVarNames[math.random(1,#customVarNames)].. s)
end
    
--WipeComments
function WipeComment(scr)
  scr = scr:gsub("(%-%-%[(=*)%[.-%]%2%])", "")
  scr = scr:gsub("(%-%-[^\r\n]*)", "")
  return scr
end

--WipeStrings
local mamadouseydou = CreateVar()
local mamadouseydou0 = CreateVar()
local mamadouseydou1 = CreateVar()
local GenStr = function(Str)
    local R = {}
    local Ran = function(n)
        local r = math.random(1, 255)
        return ((n - r)/6).. ' + ' ..(r/6)
    end

    for c in Str:gmatch('.') do 
        table.insert(R, Ran(c:byte()))
    end

    return "{"..table.concat(R, ', ').."}"
end

function WipeStrings(scrpt)
  for each in scrpt:gmatch("%b''") do
    scrpt = scrpt:gsub(each, each:gsub("'", '"'))        
  end
  for each in scrpt:gmatch('%b""') do
    each = each:gsub('"', '')  
    scrpt = scrpt:gsub('"'..each..'"', "("..mamadouseydou.."("..GenStr(each).."))")       
  end

  return scrpt
end

--CoreFuncRename
function CFR(scrpt)
  for i,v in pairs(funcrename) do
    local pp = CreateVar()
    funcrename[i]= pp
  end
  local setlist = ""
  for i,v in pairs(funcrename) do
    setlist = setlist..("local "..v.."="..i.."; ")
    scrpt = scrpt:gsub(i, v)
  end
  return(setlist..scrpt)
end

--LocalFuncRename
local library = {}
function LFR(scrpt)
  for fType in scrpt:gmatch("local%s*function%s*([%w_]+)%(") do 
		local replacement = CreateVar()
		if #fType > 5 then
			library[fType] = replacement
			scrpt = scrpt:gsub("function " .. fType, "function " .. replacement)
		end
	end
    
	for fCall in scrpt:gmatch("([%w_]+)%s*%(") do
		if library[fCall] then
			scrpt = scrpt:gsub(fCall .. '%(', library[fCall] .. '%(')
		end
	end
  return scrpt
end

--NonLocalFuncRename
function NLFR(scrpt)
  for fType in scrpt:gmatch("%s*function%s*([%w_]+)%(") do 
    local replacement = CreateVar()
		if #fType > 5 then
			library[fType] = replacement
			scrpt = scrpt:gsub("function " .. fType, "function " .. replacement)
		end
	end

  for fCall in scrpt:gmatch("([%w_]+)%s*%(") do
		if library[fCall] then
			scrpt = scrpt:gsub(fCall .. '(', library[fCall] .. '(')
		end
	end
  return scrpt
end

--RemoveWhitespace
function RW(scrpt)
  scrpt = scrpt:gsub("^%s*(.-)%s*$", "%1")
  scrpt = scrpt:gsub("(^%s*).*", "")
  scrpt = scrpt:gsub(" %s+", " ")
  scrpt = scrpt:gsub(";%c+","; ")
  return scrpt
end

--VarRename

function isKeyword(s)
  local s2 = 'and break do else elseif end false for function if in local nil not or repeat return then true until'
  for w in s2:gmatch("(%w+)") do
    if w == s then return true end
  end
  return false
end

function VR(scrpt)
	for each in scrpt:gmatch("local%s*([%w_]*)%s*=%s*") do
    if #each > 3 and not isKeyword(each) then
      local varName = CreateVar()
      scrpt = scrpt:gsub(each," "..varName)       
    end
  end
  return scrpt
end

--obfuscate
function Obfuscate(scr)
  scr = WipeComment(scr)
  scr = WipeStrings(scr)
  scr = 'function '..mamadouseydou..'('..mamadouseydou0..') local '..mamadouseydou1..' = ""; for  i,v in pairs('..mamadouseydou0..') do '..mamadouseydou1..' = '..mamadouseydou1..'..string.char(v*6); end return('..mamadouseydou1..') end;'..scr
  scr = LFR(scr)
  scr = NLFR(scr)
  scr = VR(scr)
  scr = RW(scr)
  scr = CFR(scr)

  print(scr)
end

do Obfuscate(Script) end