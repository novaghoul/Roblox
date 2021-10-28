function Script()
    a = [[print("hi")]]
    return tostring(a)
end

function LuaObfuscate()

    local Script = Script()

    -- function ObfuscateSeel(a)
    --     local c =
    --         "function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; "
    --     local d = c
    --     local e = ""
    --     local f = {"IllIllIllIllI", "IIlllIIlllIIlllIIlllII", "IIllllIIllll"}
    --     local g = [[local IlIlIlIlIlIlIlIlII = {]]
    --     local h = [[local IllIIllIIllIII = loadstring]]
    --     local i = [[local IllIIIllIIIIllI = table.concat]]
    --     local j = [[local IIIIIIIIllllllllIIIIIIII = "''"]]
    --     local k = "local " .. f[math.random(1, #f)] .. " = (7*3-9/9+3*2/0+3*3);"
    --     local l = "local " .. f[math.random(1, #f)] .. " = (3*4-7/7+6*4/3+9*9);"
    --     local m = "--// Obfuscated\n\n"
    --     for n = 1, string.len(a) do
    --         e = e .. "'\\" .. string.byte(a, n) .. "',"
    --     end
    --     local o = "function IllIIIIllIIIIIl(" .. f[math.random(1, #f)] .. ")"
    --     local p = "function " .. f[math.random(1, #f)] .. "(" .. f[math.random(1, #f)] .. ")"
    --     local q = "local " .. f[math.random(1, #f)] .. " = (5*3-2/8+9*2/9+8*3)"
    --     local r = "end"
    --     local s = "IllIIIIllIIIIIl(900283)"
    --     local t = "function IllIlllIllIlllIlllIlllIllIlllIIIlll(" .. f[math.random(1, #f)] .. ")"
    --     local q = "function " .. f[math.random(1, #f)] .. "(" .. f[math.random(1, #f)] .. ")"
    --     local u = "local " .. f[math.random(1, #f)] .. " = (9*0-7/5+3*1/3+8*2)"
    --     local v = "end"
    --     local w = "IllIlllIllIlllIlllIlllIllIlllIIIlll(9083)"
    --     local x =
    --         m ..
    --         d ..
    --             k ..
    --                 l ..
    --                     i ..
    --                         ";" ..
    --                             o ..
    --                                 " " ..
    --                                     p ..
    --                                         " " ..
    --                                             q ..
    --                                                 " " ..
    --                                                     r ..
    --                                                         " " ..
    --                                                             r ..
    --                                                                 " " ..
    --                                                                     r ..
    --                                                                         ";" ..
    --                                                                             s ..
    --                                                                                 ";" ..
    --                                                                                     t ..
    --                                                                                         " " ..
    --                                                                                             q ..
    --                                                                                                 " " ..
    --                                                                                                     u ..
    --                                                                                                         " " ..
    --                                                                                                             v ..
    --                                                                                                                 " " ..
    --                                                                                                                     v ..
    --                                                                                                                         ";" ..
    --                                                                                                                             w ..
    --                                                                                                                                 ";" ..
    --                                                                                                                                     h ..
    --                                                                                                                                         ";" ..
    --                                                                                                                                             g ..
    --                                                                                                                                                 e ..
    --                                                                                                                                                     "}" ..
    --                                                                                                                                                         "IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()"
    --     print(x)
    -- end

    function ObfuscateOther(a)
        local BooleanObf = "function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; "
        local bat = BooleanObf
      
        ---------------------
      
        local Ret = ""
        local VarNames = {"LinusWilm", "OceanMan", "NovaGhoul", "GoingThruTheLand"}
        local Beg = [[local IlIlIlIlIlIlIlIlII = {]]
      
        ----------------------
      
        local LoadstringVariable = [[local IllIIllIIllIII = loadstring]]
        local ConcatVariable = [[local IllIIIllIIIIllI = table.concat]]
        local EmptyString = [[local IIIIIIIIllllllllIIIIIIII = "''"]]
      
        ----------------------
      
        local RandomVar = VarNames[math.random(1, #VarNames)]
        local RandomInt = math.random(1, 100)*math.random(1,30)/math.random(1,10)+math.random(52,1000)*0.51
        local RandomInt2 = math.random(87, 500)*math.random(3,20)/math.random(65,175)+math.random(52,4300)*0.64
        local RandomInt3 = math.random(87, 5030)*math.random(3,620)/math.random(65,5175)+math.random(52,4000)*0.12
      
      
      
        ----------------------
        local ConfuseVarO = "local "..VarNames[math.random(1, #VarNames)].." = "..RandomInt.."^"..RandomInt3.."/"..RandomInt2..";"
        local ConfuseVarT = "local "..VarNames[math.random(1, #VarNames)].." = (3*4-7/7+6*4/3+9*9);"
      
        ----------------------
      
        for i=1, string.len(a) do
            Ret = Ret.."'\\"..string.byte(a, i).."',"
        end
      
        ---------------------
      
        local UselessFunctionStart = "function IllIIIIllIIIIIl("..VarNames[math.random(1, #VarNames)]..")"
        local UselessFunctionContent = "function "..VarNames[math.random(1, #VarNames)].."("..VarNames[math.random(1, #VarNames)]..")"
        local UselessFunctionContentT = "local "..VarNames[math.random(1, #VarNames)].." = (5*3-2/8+9*2/9+8*3)"
        local UselessFunctionEnd = "end"
        local UselessFunctionCall = "IllIIIIllIIIIIl(900283)"
      
        local UselessFunctionStartT = "function IllIlllIllIlllIlllIlllIllIlllIIIlll("..VarNames[math.random(1, #VarNames)]..")"
        local UselessFunctionContentT = "function "..VarNames[math.random(1, #VarNames)].."("..VarNames[math.random(1, #VarNames)]..")"
        local UselessFunctionContentTT = "local "..VarNames[math.random(1, #VarNames)].." = (9*0-7/5+3*1/3+8*2)"
        local UselessFunctionEndT = "end"
        local UselessFunctionCallT = "IllIlllIllIlllIlllIlllIllIlllIIIlll(9083)"
      
        ----------------------
      
        local FinalRet = bat..ConfuseVarO..ConfuseVarT..ConcatVariable..";"..UselessFunctionStart.." "..UselessFunctionContent.." "..UselessFunctionContentT.." "..UselessFunctionEnd.." "..UselessFunctionEnd.." "..UselessFunctionEnd..";"..UselessFunctionCall..";"..UselessFunctionStartT.." "..UselessFunctionContentT.." "..UselessFunctionContentTT.." "..UselessFunctionEndT.." "..UselessFunctionEndT..";"..UselessFunctionCallT..";"..LoadstringVariable..";"..Beg..Ret.."}".."IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()"
      
        ----------------------
      
        print(FinalRet)
    end
    
    do
        ObfuscateOther(Script)
    end
end

LuaObfuscate()

