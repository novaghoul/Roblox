uis = game:GetService("UserInputService")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs =  game:GetService("ReplicatedStorage")
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()

punchBag = {}
index = 1

function  plrlist(thing)
	for _, v in pairs(plrs:GetPlayers()) do
		if string.find(string.lower(v.Name),string.lower(thing)) then
			return v
		end
	end
end

function checkPunchBag()
    for _,v in pairs(wp:GetChildren()) do
        if v.Name == "Punching Bag" then
            punchBag[index] = v
            index = index + 1
        end
    end
end
checkPunchBag()


function punrchEvent()
    for i = 1, #punchBag do
        local check = punchBag[i].Bag:FindFirstChild("Model")
        if check ~= nil and punchBag[i].Dead ~= true then
            local Remote = rs.Remotes['HitBag']
                    
            local Arguments = {
                    [1] = punchBag[i].Bag.Model.Bag
            }
            
            Remote:FireServer(unpack(Arguments))
        end
    end
end

mouse.KeyDown:connect(function(keyDown)
	
	if keyDown == "f" then
		punrchEvent()
    end
end)

function killPlayer(parent)
    local weapon = Workspace[lplr.Name]:FindFirstChildOfClass("Tool")
    if weapon ~= nil then
        local Remote = rs.Remotes['Hit']
        
        local Arguments = {
                [1] = Workspace[parent.Name].Humanoid,
                [2] = weapon.Name
        }
        
        Remote:FireServer(unpack(Arguments))
    end
end

mouse.Button1Up:connect(function()
    if not mouse.Target then return end
    local tp = mouse.Target.Parent
    if tp:FindFirstChild("Humanoid") then
        killPlayer(tp)
        print(tp)
    elseif tp.Parent:FindFirstChild("Humanoid") then
        killPlayer(tp.Parent)
        print(tp.Parent)
    end
end)