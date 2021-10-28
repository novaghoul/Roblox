-- Originally made by Racist Dolphin / Racist Penguin on V3RM
-- Edited and used by TechnicallyCode
-- Heavy credits to Racist Dolphin for base code.

if getgenv().pl_haxx then return end -- Prevent script being executed multiple times.

local ps = game:GetService("Players")
local i = game:GetService("UserInputService")
local r = game:GetService("RunService")
local cg = game:GetService("CoreGui")
local sg = game:GetService("StarterGui")
local ts = game:GetService("TweenService")
local rs = game:GetService("ReplicatedStorage")
local sc = game:GetService("ScriptContext")
local ms = game:GetService("MarketplaceService")
local tms = game:GetService("Teams")
local http = game:GetService("HttpService")
local light = game:GetService("Lighting")
local pathservice = game:GetService("PathfindingService")
local p = ps.LocalPlayer
local c = p.Character
local mo = p:GetMouse()
local b = p:FindFirstChild("Backpack") or p:WaitForChild("Backpack")
local g = p:FindFirstChild("PlayerGui") or p:WaitForChild("PlayerGui")
local ca = workspace.CurrentCamera

local loadtime = tick()

local gamePlaceId = game.PlaceId
if gamePlaceId ~= 155615604 then
	p:Kick("PLHaxx does not work here.")
end

local hint = Instance.new("Hint", cg)
hint.Text = "PLHaxx: Initializing GUI, please wait!"
wait(1)

local getupval = debug.getupvalue or getupval
local getupvals = debug.getupvalues or getupvals
local getreg = debug.getregistry or getreg
local setupval = debug.setupvalue or setupval
local getlocal = debug.getlocal or getlocal
local getlocals = debug.getlocals or getlocals
local setlocal = debug.setlocal or setlocal
local getconst = debug.getconstant or getconst
local getconsts = debug.getconstants or getconsts
local setconst = debug.setconstant or setconst
local setreadonly = make_writeable or setreadonly

-- if syn == nil then
-- 	return p:Kick("PLHaxx does not support your exploit. Please use Synapse X.")
-- end

local allWorkspace = { }

local client = { }
local patterns = { }
local funcs = { }
local scripts = { }
local backups = { }
local main = { }

local fullbrightStuff = { }
local gunStuff = { }
local charStuff = { }
local miscStuff = { }
local teleStuff = { }
local gui = { }
local loops = { }

getgenv().services = { }

local myVersion = "0.0.3"

local creatorAccounts = { }

do -- funcs
	funcs = {
		data = http:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/iamcal/emoji-data/master/emoji.json"))
	}

	-- IDK who the original creator of this is but credit to that dude
	function funcs.parseEmoji(emoji)
		for _, v in next, funcs.data do
			if string.lower(emoji) == v["short_name"] then
				return utf8.char(tonumber(v["unified"], 16))
			end
		end
	end

	function funcs.split(self, sep)
		local sep, fields = sep or ":", {}
		local pattern = string.format("([^%s]+)", sep)
		string.gsub(self, pattern, function(c) fields[#fields+1] = c end)
		return fields
	end

	function funcs.detectEmoji(str)
		for i = 1, #str do
			if string.sub(str, i, i) == ":" then
				local substr = string.sub(str, i + 1, #str)
				local pos = string.find(substr, ":")
				if pos then
					return pos
				end
			end
		end

		return nil
	end

	function funcs.parseSemicolon(rawStr)
		local tbl = funcs.split(rawStr, " ")
		local newtbl = { }

		for i, v in next, tbl do
			local pos = funcs.detectEmoji(v)
			if pos then
				v = string.sub(v, 2, pos)
				v = funcs.parseEmoji(v)
			end
			newtbl[i] = v
		end

		return table.concat(newtbl, ' ')
	end

	function funcs:LoopRunning(name)
		return loops[name].Running
	end

	function funcs:CreateLoop(name, func, waitt, ...)
		if loops[name] ~= nil then return end

		loops[name] = { }
		loops[name].Running = false
		loops[name].Destroy = false
		loops[name].Loop = coroutine.create(function(...)
			while true do
				if loops[name].Running then
					func(...)
				end

				if loops[name].Destroy then
					break
				end

				if type(wait) == "userdata" then
					waitt:wait()
				else
					wait(waitt)
				end
			end
		end)
	end

	function funcs:RunLoop(name, waitt, func, ...)
		if loops[name] == nil then
			if func ~= nil then
				self:CreateLoop(name, func, waitt, ...)
			end
		end

		loops[name].Running = true
		local succ, out = coroutine.resume(loops[name].Loop)
		if not succ then
			warn("Loop: " .. tostring(name) .. " ERROR: " .. tostring(out))
		end
	end

	function funcs:StopLoop(name)
		if loops[name] == nil then return end

		loops[name].Running = false
	end

	function funcs:DestroyLoop(name)
		if loops[name] == nil then return end

		self:StopLoop(name)
		loops[name].Destroy = true

		loops[name] = nil
	end

	function funcs:AddComma(str) -- stole from Mining Simulator :)
		local f, k = str, nil
		while true do
			f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", "%1,%2")
			if k == 0 then
				break
			end
		end
		return f
	end

	function funcs:deepcopy(orig) -- http://lua-users.org/wiki/CopyTable
	    local orig_type = type(orig)
	    local copy
	    if orig_type == 'table' then
	        copy = {}
	        for orig_key, orig_value in next, orig, nil do
	            copy[funcs:deepcopy(orig_key)] = funcs:deepcopy(orig_value)
	        end
	        setmetatable(copy, funcs:deepcopy(getmetatable(orig)))
	    else -- number, string, boolean, etc
	        copy = orig
	    end
	    return copy
	end

	function funcs:GetSizeOfObj(obj)
		if obj:IsA("BasePart") then
			return obj.Size
		elseif obj:IsA("Model") then
			return obj:GetExtentsSize()
		end
	end

	function funcs:GetTeamColor(plr)
		if p.Team == plr.Team then
			return Color3.new(0, 1, 0)
		end

		return Color3.new(1, 0, 0)
	end

	function funcs:GetClosestPlayer()
		local players = { }
		local current_closest_player = nil
		local selected_player = nil

		for i, v in pairs(ps:GetPlayers()) do
			if v ~= p and v.Team ~= p.Team then
				local char = v.Character
				if c and char then
					local my_head, my_tor, my_hum = c:FindFirstChild("Head"), c:FindFirstChild("HumanoidRootPart"), c:FindFirstChild("Humanoid")
					local their_head, their_tor, their_hum = char:FindFirstChild("Head"), char:FindFirstChild("HumanoidRootPart"), char:FindFirstChild("Humanoid")
					if my_head and my_tor and my_hum and their_head and their_tor and their_hum then
						if my_hum.Health > 1 and their_hum.Health > 1 then
							--local ray = Ray.new(ca.CFrame.p, (their_head.Position - ca.CFrame.p).unit * 2048)
							--local part = workspace:FindPartOnRayWithIgnoreList(ray, {c, ca})
							--if part ~= nil then
								--if part:IsDescendantOf(char) then
									local dist = (mo.Hit.p - their_tor.Position).magnitude
									players[v] = dist
								--end
							--end
						end
					end
				end
			end
		end

		for i, v in next, players do
			if current_closest_player ~= nil then
				if v <= current_closest_player then
					current_closest_player = v
					selected_player = i
				end
			else
				current_closest_player = v
				selected_player = i
			end
		end

		return selected_player
	end

	function funcs:TypeWriter(label, speed)
		local speed = speed or 2
		local text = label.Text
		label.Text = ""
		spawn(function()
			for i = 1, string.len(text) do
				if i % 2 == 0 then
					client.sound.play("ui_typeout", 0.2)
				end
				label.Text = string.sub(text, 1, speed * i)
				wait(0.016666666666666666)
			end
		end)
	end

	function funcs:ModifyAllVarsInTable(t, var, val)
		for i, v in pairs(t) do
			if i == var then
				t[i] = val
			end

			if type(v) == "table" then
				funcs:ModifyAllVarsInTable(t[i], var, val)
			end
		end
	end

	function funcs:GetWeapon(weaponName)
		if typeof(weaponName) == "string" then
			workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[weaponName].ITEMPICKUP)
		end
	end

	function funcs:KillPlayer(plr)
		local myBackpack = p.Backpack
		self:GetWeapon("Remington 870")
		if myBackpack:FindFirstChild("Remington 870") then
			local A_1 = {
				[1] =
				{
					["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-391.152252, 8.65560055, -83.2166901)),
					["Distance"] = 3.2524313926697,
					["Cframe"] = CFrame.new(840.310791, 101.334137, 2267.87988, 0.0636406094, 0.151434347, -0.986416459, 0, 0.988420188, 0.151741937, 0.997972965, -0.00965694897, 0.0629036576),
					["Hit"] = plr.Character.Head
				},
					 [2] =
				{
					["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-392.481476, -8.44939327, -76.7261353)),
					["Distance"] = 3.2699294090271,
					["Cframe"] = CFrame.new(840.290466, 101.184189, 2267.93506, 0.0964837447, 0.0589403138, -0.993587971, 4.65661287e-10, 0.998245299, 0.0592165813, 0.995334625, -0.00571343815, 0.0963144377),
					["Hit"] = plr.Character.Head
				},
				[3] =
				{
					["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-389.21701, -2.50536323, -92.2163162)),
					["Distance"] = 3.1665518283844,
					["Cframe"] = CFrame.new(840.338867, 101.236496, 2267.80371, 0.0166504811, 0.0941716284, -0.995416701, 1.16415322e-10, 0.995554805, 0.0941846818, 0.999861419, -0.00156822044, 0.0165764652),
					["Hit"] = plr.Character.Head
				},
				[4] =
				{
					["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-393.353973, 3.13988972, -72.5452042)),
					["Distance"] = 3.3218522071838,
					["Cframe"] = CFrame.new(840.277222, 101.285957, 2267.9707, 0.117109694, 0.118740402, -0.985994935, -1.86264515e-09, 0.992826641, 0.119563118, 0.993119001, -0.0140019981, 0.116269611),
					["Hit"] = plr.Character.Head
				},
				[5] =
				{
					["RayObject"] = Ray.new(Vector3.new(845.555908, 101.429337, 2269.43945), Vector3.new(-390.73172, 3.2097764, -85.5477524)),
					["Distance"] = 3.222757101059,
					["Cframe"] = CFrame.new(840.317993, 101.286423, 2267.86035, 0.0517584644, 0.123365127, -0.991010666, 0, 0.992340803, 0.123530701, 0.99865967, -0.00639375951, 0.0513620302),
					["Hit"] = plr.Character.Head
				}
			}
			local A_2 = myBackpack["Remington 870"]
			local Event = rs.ShootEvent
			Event:FireServer(A_1, A_2)
			Event:FireServer(A_1, A_2)
		end
	end

	function funcs:ChangeTeam(team)
		if typeof(team) == "string" then
			local remotes = workspace:FindFirstChild("Remote")
			if remotes then
				local teamEvent = remotes:FindFirstChild("TeamEvent")
				if teamEvent then
					teamEvent:FireServer(team)
				end
			end
		end
	end

	function funcs:TeleportTo(cframe)
		local myTor = c:FindFirstChild("HumanoidRootPart")
		if myTor then
			myTor.CFrame = cframe
		end
	end

	function funcs:ArrestPlayer(plr)
		local myTor = c:FindFirstChild("HumanoidRootPart")
		local oldc = myTor.CFrame
		if plr:IsA("Player") then
			local remotes = workspace:FindFirstChild("Remote")
			if remotes then
				local arrestEvent = remotes:FindFirstChild("arrest")
				if arrestEvent then
					local character = plr.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							self:TeleportTo(humanoidRootPart.CFrame * CFrame.new(0, 0, 1))
							arrestEvent:InvokeServer(humanoidRootPart)
							wait(.25)
							if myTor then
								self:TeleportTo(oldc)
							end
						end
					end
				end
			end
		end
	end

	function funcs:SuperPunch()
		local meleeRemote = rs['meleeEvent']
		local punching = false
		local cooldown = false

		function punch()
			cooldown = true
			local part = Instance.new("Part", c)
			local w1 = Instance.new("Weld", part)
			part.Transparency = 1
			part.Size = Vector3.new(5, 2, 3)
			part.CanCollide = false
			w1.Part0 = c.Torso
			w1.Part1 = part
			w1.C1 = CFrame.new(0,0,2)
			part.Touched:connect(function(hit)
			if ps:FindFirstChild(hit.Parent.Name) then
				local plr = ps:FindFirstChild(hit.Parent.Name)
					if plr ~= p then
						part:Destroy()
						for i = 1,100 do
							meleeRemote:FireServer(plr)
						end
					end
				end
			end)

			wait(1)
			cooldown = false
			part:Destroy()
		end

		i.InputBegan:connect(function(key, gameProcessedEvent)
			if cooldown == false then
				if key.KeyCode == Enum.KeyCode.F and not gameProcessedEvent then
					punch()
				end
			end
		end)
	end

	function funcs:FindPlayer(txt)
		local Plr = { }
		for _, v in pairs(ps:GetPlayers()) do
			if string.lower(string.sub(v.Name, 1, string.len(txt))) == string.lower(txt) then
				table.insert(Plr, v)
			end
		end
		if #Plr == 1 then
			return Plr[1]
		else
			return nil
		end
	end

	function funcs:CreateBackup(name, path, index, f)
		backups[name] = { }
		backups[name].func = f
		backups[name].path = path
		backups[name].index = index

		return backups[name]
	end

	function funcs:RestoreBackups()
		for i, v in next, backups do
			v.path[index] = v.func
		end
	end

	function funcs:AddScript(scr)
		scripts[scr] = decompile(scr, "new")
		return scripts[scr]
	end

	function funcs:FindPattern(scr, pattern)
		return string.match(scripts[scr], pattern)
	end

	function funcs:FindValInTable(index, t)
		for i, v in pairs(t) do
			if i == index then
				return t[i]
			else
				if type(v) == "function" and not is_synapse_function(v) then
					local check = getupval(v, index)
					if check ~= nil then
						if type(check) ~= "table" then
							return v
						end

						return check
					end
				elseif type(v) == "table" then
					return funcs:FindValInTable(index, v)
				end
			end
		end
	end

	function funcs:FindVal(name, index)
		print("Trying to find: " .. index)
		for i, v in next, getreg() do
			if type(v) == "function" and not is_synapse_function(v) then
				local check = getupval(v, index)
				if check ~= nil then
					if type(check) ~= "table" then
						client[name] = v
						return
					end

					client[name] = check
					return
				end
			end
		end

		for i, v in next, getgc() do
			if type(v) == "function" and not is_synapse_function(v) then
				local check = getupval(v, index)
				if check ~= nil then
					if type(check) ~= "table" then
						client[name] = v
						return
					end

					client[name] = check
					return
				end
			end
		end

		for i in next, scripts do
			for i2, v2 in next, getsenv(i) do
				if i2 == index then
					client[name] = v2
					return
				else
					if type(v2) == "function" and not is_synapse_function(v2) then
						local check = getupval(v2, index)
						if check ~= nil then
							if type(check) ~= "table" then
								client[name] = v2
								return
							end

							client[name] = check
							return
						end
					elseif type(v2) == "table" then
						client[name] = self:FindValInTable(index, v2)
					end
				end
			end
		end

		if client[name] == nil then
			for i, v in pairs(client) do
				if type(v) == "table" then
					client[name] = self:FindValInTable(index, v)
				end
			end
		end
	end
end

do -- gui
	gui = {
		name = "Base",
		gui_objs = {
			main = nil,
			mainframes = { },
		}
	}
  local t = 5
  local fromHSV = Color3.fromHSV
  local color
  r.RenderStepped:connect(function()
    local hue = tick() % t / t
    color = fromHSV(hue, 1, 1)
  end)

	-- Other Functions
	function gui:GiveWeapons()
		if ms:PlayerOwnsAsset(p, 96651) then
			for _,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
				if v.Name ~= "nil" then
					funcs:GetWeapon(v.Name)
				end
			end
		else
			for _,v in pairs(workspace.Prison_ITEMS.giver:GetChildren()) do
				if v.Name ~= "nil" or v.Name ~= "M4A1" or v.Name ~= "Riot Shield" then
					funcs:GetWeapon(v.Name)
				end
			end
		end
	end
	-- GUI Functions
	function gui:AddTextBox(mainframe, text)
		self.gui_objs.mainframes[mainframe].buttons[text] = { }

		self.gui_objs.mainframes[mainframe].buttons[text].main = Instance.new("Frame")
		self.gui_objs.mainframes[mainframe].buttons[text].main.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].main.Name = ""
		self.gui_objs.mainframes[mainframe].buttons[text].main.Position = UDim2.new(0, 0, 0, 5 + self.gui_objs.mainframes[mainframe].buttonsnum)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Size = UDim2.new(1, 0, 0, 15)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Parent = self.gui_objs.mainframes[mainframe].buttonsframe

		self.gui_objs.mainframes[mainframe].buttons[text].textbox = Instance.new("TextBox")
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.BackgroundColor3 = Color3.new(66 / 255, 66 / 255, 66 / 255)
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.BackgroundTransparency = 0.3
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.BorderSizePixel = 0
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.Position = UDim2.new(0, 5, 0, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.Size = UDim2.new(1, -10, 1, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.Font = Enum.Font.SourceSans
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.Text = text
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.TextScaled = true
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.TextColor3 = Color3.new(1, 1, 1)
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.TextXAlignment = Enum.TextXAlignment.Left
		self.gui_objs.mainframes[mainframe].buttons[text].textbox.Parent = self.gui_objs.mainframes[mainframe].buttons[text].main

		self.gui_objs.mainframes[mainframe].main.Size = UDim2.new(0, 200, 0, 25 + self.gui_objs.mainframes[mainframe].buttonsnum)

		self.gui_objs.mainframes[mainframe].buttonsnum = self.gui_objs.mainframes[mainframe].buttonsnum + 20

		return self.gui_objs.mainframes[mainframe].buttons[text].textbox
	end

	function gui:AddButton(mainframe, text)
		self.gui_objs.mainframes[mainframe].buttons[text] = { }

		self.gui_objs.mainframes[mainframe].buttons[text].main = Instance.new("Frame")
		self.gui_objs.mainframes[mainframe].buttons[text].main.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].main.Name = ""
		self.gui_objs.mainframes[mainframe].buttons[text].main.Position = UDim2.new(0, 0, 0, 5 + self.gui_objs.mainframes[mainframe].buttonsnum)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Size = UDim2.new(1, 0, 0, 15)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Parent = self.gui_objs.mainframes[mainframe].buttonsframe

		self.gui_objs.mainframes[mainframe].buttons[text].textbutton = Instance.new("TextButton")
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Position = UDim2.new(0, 5, 0, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Size = UDim2.new(1, -5, 1, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.ZIndex = 2
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Font = Enum.Font.SourceSans
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Text = text
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextColor3 = Color3.new(1, 1, 1)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextScaled = true
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextXAlignment = Enum.TextXAlignment.Left
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Modal = true
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Parent = self.gui_objs.mainframes[mainframe].buttons[text].main

		self.gui_objs.mainframes[mainframe].main.Size = UDim2.new(0, 200, 0, 25 + self.gui_objs.mainframes[mainframe].buttonsnum)

		self.gui_objs.mainframes[mainframe].buttonsnum = self.gui_objs.mainframes[mainframe].buttonsnum + 20

		return self.gui_objs.mainframes[mainframe].buttons[text].textbutton
	end

	function gui:AddToggleButton(mainframe, text, status)
		self.gui_objs.mainframes[mainframe].buttons[text] = { }

		self.gui_objs.mainframes[mainframe].buttons[text].main = Instance.new("Frame")
		self.gui_objs.mainframes[mainframe].buttons[text].main.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].main.Name = ""
		self.gui_objs.mainframes[mainframe].buttons[text].main.Position = UDim2.new(0, 0, 0, 5 + self.gui_objs.mainframes[mainframe].buttonsnum)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Size = UDim2.new(1, 0, 0, 15)
		self.gui_objs.mainframes[mainframe].buttons[text].main.Parent = self.gui_objs.mainframes[mainframe].buttonsframe

		self.gui_objs.mainframes[mainframe].buttons[text].textbutton = Instance.new("TextButton")
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Position = UDim2.new(0, 5, 0, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Size = UDim2.new(1, -5, 1, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.ZIndex = 2
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Font = Enum.Font.SourceSans
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Text = text
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextColor3 = Color3.new(1, 1, 1)
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextScaled = true
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.TextXAlignment = Enum.TextXAlignment.Left
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Modal = true
		self.gui_objs.mainframes[mainframe].buttons[text].textbutton.Parent = self.gui_objs.mainframes[mainframe].buttons[text].main

		self.gui_objs.mainframes[mainframe].buttons[text].textlabel = Instance.new("TextLabel")
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.BackgroundTransparency = 1
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.Position = UDim2.new(1, -25, 0, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.Size = UDim2.new(0, 25, 1, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.Font = Enum.Font.Code
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.Text = status and "ON" or "OFF"
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.TextColor3 = status and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.TextScaled = true
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.TextXAlignment = Enum.TextXAlignment.Right
		self.gui_objs.mainframes[mainframe].buttons[text].textlabel.Parent = self.gui_objs.mainframes[mainframe].buttons[text].main

		self.gui_objs.mainframes[mainframe].main.Size = UDim2.new(0, 200, 0, 25 + self.gui_objs.mainframes[mainframe].buttonsnum)

		self.gui_objs.mainframes[mainframe].buttonsnum = self.gui_objs.mainframes[mainframe].buttonsnum + 20

		return self.gui_objs.mainframes[mainframe].buttons[text].textbutton, self.gui_objs.mainframes[mainframe].buttons[text].textlabel
	end

	function gui:AddMainFrame(name)
		if self.gui_objs.mainframes.numX == nil then self.gui_objs.mainframes.numX = 0 end
		if self.gui_objs.mainframes.numY == nil then self.gui_objs.mainframes.numY = 0 end

		self.gui_objs.mainframes[name] = { }
		self.gui_objs.mainframes[name].buttons = { }

		self.gui_objs.mainframes[name].main = Instance.new("Frame")
		self.gui_objs.mainframes[name].main.BackgroundColor3 = Color3.new(0, 0, 0)
		self.gui_objs.mainframes[name].main.BackgroundTransparency = 0.3
		self.gui_objs.mainframes[name].main.BorderSizePixel = 3
		self.gui_objs.mainframes[name].main.Name = name
		self.gui_objs.mainframes[name].main.Position = UDim2.new(0, 50 + self.gui_objs.mainframes.numX, 0, 50 + self.gui_objs.mainframes.numY)
		self.gui_objs.mainframes[name].main.Size = UDim2.new(0, 200, 0, 350)
		self.gui_objs.mainframes[name].main.Active = true
		self.gui_objs.mainframes[name].main.Draggable = true

		self.gui_objs.mainframes[name].titleframe = Instance.new("Frame")
		self.gui_objs.mainframes[name].titleframe.BackgroundColor3 = Color3.new(0, 0, 0)
		self.gui_objs.mainframes[name].titleframe.BackgroundTransparency = 0.3
		self.gui_objs.mainframes[name].titleframe.BorderSizePixel = 3
		self.gui_objs.mainframes[name].titleframe.Name = "titleframe"
		self.gui_objs.mainframes[name].titleframe.Position = UDim2.new(0, 0, 0, -35)
		self.gui_objs.mainframes[name].titleframe.Size = UDim2.new(1, 0, 0, 25)
		self.gui_objs.mainframes[name].titleframe.Parent = self.gui_objs.mainframes[name].main

		self.gui_objs.mainframes[name].title = Instance.new("TextLabel")
		self.gui_objs.mainframes[name].title.BackgroundTransparency = 1
		self.gui_objs.mainframes[name].title.Name = "title"
		self.gui_objs.mainframes[name].title.Size = UDim2.new(1, 0, 1, 0)
		self.gui_objs.mainframes[name].title.Font = Enum.Font.Code
		self.gui_objs.mainframes[name].title.Text = name
		self.gui_objs.mainframes[name].title.TextColor3 = Color3.new(1, 1, 1) -- 0, 0, 1
		self.gui_objs.mainframes[name].title.TextSize = 20
		self.gui_objs.mainframes[name].title.Parent = self.gui_objs.mainframes[name].titleframe

		self.gui_objs.mainframes[name].buttonsframe = Instance.new("Frame")
		self.gui_objs.mainframes[name].buttonsframe.BackgroundTransparency = 1
		self.gui_objs.mainframes[name].buttonsframe.Name = "buttons"
		self.gui_objs.mainframes[name].buttonsframe.Size = UDim2.new(1, 0, 1, 0)
		self.gui_objs.mainframes[name].buttonsframe.Parent = self.gui_objs.mainframes[name].main

    self.gui_objs.mainframes[name].infoframe = Instance.new("Frame")
    self.gui_objs.mainframes[name].infoframe.BackgroundColor3 = Color3.new(0, 0, 0)
    self.gui_objs.mainframes[name].infoframe.BackgroundTransparency = 0.3
    self.gui_objs.mainframes[name].infoframe.BorderSizePixel = 3
    self.gui_objs.mainframes[name].infoframe.Name = "infoframe"
    self.gui_objs.mainframes[name].infoframe.Position = UDim2.new(0, 0, 1, 10)
    self.gui_objs.mainframes[name].infoframe.Size = UDim2.new(1, 0, 0, 35)
    self.gui_objs.mainframes[name].infoframe.Parent = self.gui_objs.mainframes[name].main

		self.gui_objs.mainframes[name].infotitle = self.gui_objs.mainframes[name].title:clone()
		self.gui_objs.mainframes[name].infotitle.Name = "infotitle"
		self.gui_objs.mainframes[name].infotitle.Text = "Press [P] to toggle GUI\nGUI made by: @Racist Dolphin#8943\nEdited and used by: TechnicallyCode"
		self.gui_objs.mainframes[name].infotitle.TextColor3 = Color3.new(1, 1, 1)
		self.gui_objs.mainframes[name].infotitle.TextScaled = true
		self.gui_objs.mainframes[name].infotitle.Parent = self.gui_objs.mainframes[name].infoframe

		self.gui_objs.mainframes[name].buttonsnum = 0
		self.gui_objs.mainframes.numX = self.gui_objs.mainframes.numX + 250

		if (50 + (self.gui_objs.mainframes.numX + 200)) >= ca.ViewportSize.X then
			self.gui_objs.mainframes.numX = 0
			self.gui_objs.mainframes.numY = self.gui_objs.mainframes.numY + 450
		end

		self.gui_objs.mainframes[name].main.Parent = self.gui_objs.main
    r.RenderStepped:connect(function()
			if color then
      	self.gui_objs.mainframes[name].main.BorderColor3 = color
			end
    end)
    r.RenderStepped:connect(function()
			if color then
				self.gui_objs.mainframes[name].titleframe.BorderColor3 = color
			end
    end)
    r.RenderStepped:connect(function()
			if color then
				self.gui_objs.mainframes[name].infoframe.BorderColor3 = color
			end
    end)
	end

	function gui:Init()
		self.gui_objs.main = Instance.new("ScreenGui")
		self.gui_objs.main.Name = self.name
		self.gui_objs.main.Parent = cg

		do -- Visual Cheats
			self:AddMainFrame("Visual Cheats")

			local FullbrightToggle, FullbrightStatus = self:AddToggleButton("Visual Cheats", "Fullbright", fullbrightStuff.Enabled)

			FullbrightToggle.MouseButton1Click:connect(function()
				fullbrightStuff.enabled = not fullbrightStuff.enabled
				FullbrightStatus.Text = fullbrightStuff.enabled and "ON" or "OFF"
				FullbrightStatus.TextColor3 = fullbrightStuff.enabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)

				if fullbrightStuff.enabled then
					fullbrightStuff:Enable()
				else
					fullbrightStuff:Disable()
				end
			end)
		end

		do -- Gun Cheats
			self:AddMainFrame("Gun Cheats")

			--local Aimbot, AStatus = self:AddToggleButton("Gun Cheats", "Aimbot")
			local InfAmmo, IStatus = self:AddToggleButton("Gun Cheats", "Infinite Ammo")
			local NoSpread, SStatus = self:AddToggleButton("Gun Cheats", "No Bullet Spread")
			local RapidFire, FStatus = self:AddToggleButton("Gun Cheats", "Rapid Fire")
			local IncreasedBPS, BStatus = self:AddToggleButton("Gun Cheats", "Increased Bullets Per Shot")
			local NoReload, RStatus = self:AddToggleButton("Gun Cheats", "No Reload")
			local IncreasedBR, NStatus = self:AddToggleButton("Gun Cheats", "Increased Bullet Range")
			local AllGunsAuto, GStatus = self:AddToggleButton("Gun Cheats", "All Guns Automatic")
			local IncreasedDamage, DStatus = self:AddToggleButton("Gun Cheats", "Increased Damage")
			local GiveAllWeapons = self:AddButton("Gun Cheats", "Give All Weapons")

			--Aimbot.MouseButton1Click:connect(function()
			--	gunStuff.aimbot = not gunStuff.aimbot
			--	AStatus.Text = gunStuff.infinite_ammo and "ON" or "OFF"
			--	AStatus.TextColor3 = gunStuff.infinite_ammo and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			--end)

			InfAmmo.MouseButton1Click:connect(function()
				gunStuff.infinite_ammo = not gunStuff.infinite_ammo
				IStatus.Text = gunStuff.infinite_ammo and "ON" or "OFF"
				IStatus.TextColor3 = gunStuff.infinite_ammo and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			NoSpread.MouseButton1Click:connect(function()
				gunStuff.no_spread = not gunStuff.no_spread
				SStatus.Text = gunStuff.no_spread and "ON" or "OFF"
				SStatus.TextColor3 = gunStuff.no_spread and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			RapidFire.MouseButton1Click:connect(function()
				gunStuff.rapid_fire = not gunStuff.rapid_fire
				FStatus.Text = gunStuff.rapid_fire and "ON" or "OFF"
				FStatus.TextColor3 = gunStuff.rapid_fire and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			IncreasedBPS.MouseButton1Click:connect(function()
				gunStuff.bullets_shot = not gunStuff.bullets_shot
				BStatus.Text = gunStuff.bullets_shot and "ON" or "OFF"
				BStatus.TextColor3 = gunStuff.bullets_shot and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			NoReload.MouseButton1Click:connect(function()
				gunStuff.no_reload = not gunStuff.no_reload
				RStatus.Text = gunStuff.no_reload and "ON" or "OFF"
				RStatus.TextColor3 = gunStuff.no_reload and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			IncreasedBR.MouseButton1Click:connect(function()
				gunStuff.bullet_range = not gunStuff.bullet_range
				NStatus.Text = gunStuff.bullet_range and "ON" or "OFF"
				NStatus.TextColor3 = gunStuff.bullet_range and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			IncreasedDamage.MouseButton1Click:connect(function()
				gunStuff.damage = not gunStuff.damage
				DStatus.Text = gunStuff.damage and "ON" or "OFF"
				DStatus.TextColor3 = gunStuff.damage and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			AllGunsAuto.MouseButton1Click:connect(function()
				gunStuff.automatic = not gunStuff.automatic
				GStatus.Text = gunStuff.automatic and "ON" or "OFF"
				GStatus.TextColor3 = gunStuff.automatic and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			GiveAllWeapons.MouseButton1Click:connect(function()
				self:GiveWeapons()
			end)
		end

		do -- Character Cheats
			self:AddMainFrame("Character Cheats")

			local NoClip, NStatus = self:AddToggleButton("Character Cheats", "NoClip")
			local AntiTaze, TStatus = self:AddToggleButton("Character Cheats", "Anti-Taze")
			local SuperSpeed, SStatus = self:AddToggleButton("Character Cheats", "Super Speed")
			local SuperJump, JStatus = self:AddToggleButton("Character Cheats", "Super Jump")
			local SuperPunch = self:AddButton("Character Cheats", "Super Punch")

			NoClip.MouseButton1Click:connect(function()
				charStuff.noclip = not charStuff.noclip
				NStatus.Text = charStuff.noclip and "ON" or "OFF"
				NStatus.TextColor3 = charStuff.noclip and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			SuperPunch.MouseButton1Click:connect(function()
				funcs:SuperPunch()
			end)

			AntiTaze.MouseButton1Click:connect(function()
				charStuff.taze = not charStuff.taze
				TStatus.Text = charStuff.taze and "ON" or "OFF"
				TStatus.TextColor3 = charStuff.taze and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			SuperSpeed.MouseButton1Click:connect(function()
				charStuff.speed = not charStuff.speed
				SStatus.Text = charStuff.speed and "ON" or "OFF"
				SStatus.TextColor3 = charStuff.speed and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			SuperJump.MouseButton1Click:connect(function()
				charStuff.jump = not charStuff.jump
				JStatus.Text = charStuff.jump and "ON" or "OFF"
				JStatus.TextColor3 = charStuff.jump and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)
		end

		do -- Miscellaneous Cheats
			self:AddMainFrame("Miscellaneous Cheats")

			local KillAura, KStatus = self:AddToggleButton("Miscellaneous Cheats", "Kill Aura")
			local KillAll = self:AddButton("Miscellaneous Cheats", "Kill All")
			local ArrestAllCriminals = self:AddButton("Miscellaneous Cheats", "Arrest All Criminals")
			local RemoveAllDoors = self:AddButton("Miscellaneous Cheats", "Remove All Doors")
			local Team = self:AddTextBox("Miscellaneous Cheats", "Team")
			local ChangeTeam = self:AddButton("Miscellaneous Cheats", "Change Team")
			local RevizAdmin = self:AddButton("Miscellaneous Cheats", "Reviz Admin")
			local InfiniteYield = self:AddButton("Miscellaneous Cheats", "Infinite Yield FE")
			local TopK3K = self:AddButton("Miscellaneous Cheats", "TopK3K")

			KillAura.MouseButton1Click:connect(function()
				miscStuff.kill_aura = not miscStuff.kill_aura
				KStatus.Text = miscStuff.kill_aura and "ON" or "OFF"
				KStatus.TextColor3 = miscStuff.kill_aura and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
			end)

			KillAll.MouseButton1Click:connect(function()
				funcs:ChangeTeam("Medium stone grey") -- Neutral
				funcs:GetWeapon("Remington 870")
				wait(0.5)

				for _,v in pairs(ps:GetPlayers())do
					if v ~= p then
						funcs:KillPlayer(v)
					end
				end
				funcs:ChangeTeam("Bright orange")
			end)

			ArrestAllCriminals.MouseButton1Click:connect(function()
				local humanoid = c:FindFirstChild("Humanoid")
				local cpos = c.HumanoidRootPart.CFrame
				local cteam = p.TeamColor
				funcs:ChangeTeam("Bright blue")
				for i,v in pairs(tms.Criminals:GetPlayers()) do
					if v.Name ~= p.Name then
						local i = 10
						if humanoid then
							repeat wait()
									i = i-1
									humanoid.Sit = false
									humanoid.PlatformStand = false
									funcs:ArrestPlayer(v)
							until i == 0
						end
					end
				end
				funcs:ChangeTeam("Bright orange")
				c.HumanoidRootPart.CFrame = cpos
			end)

			RemoveAllDoors.MouseButton1Click:connect(function()
				local doors = workspace:FindFirstChild("Doors")
				if doors then
					doors:Destroy()
				else
					warn("Stop trying to destroy the doors after they were already destroyed you dumbshit.")
				end
			end)

			ChangeTeam.MouseButton1Click:connect(function()
				if Team.Text ~= "" then
					if string.lower(Team.Text) == "guards" or string.lower(Team.Text) == "guard" then
						funcs:ChangeTeam("Bright blue") -- Guards
					elseif string.lower(Team.Text) == "inmates" or string.lower(Team.Text) == "inmate" then
						funcs:ChangeTeam("Bright orange") -- Inmates
					elseif string.lower(Team.Text) == "criminals" or string.lower(Team.Text) == "criminal" then
						funcs:ChangeTeam("Really red") -- Criminals
					elseif string.lower(Team.Text) == "neutral" then
						funcs:ChangeTeam("Medium stone grey") -- Neutral
					end
				end
			end)

			RevizAdmin.MouseButton1Click:connect(function()
				loadstring(game:HttpGet("https://pastebin.com/raw/KNUzQPYS", true))()
			end)

			InfiniteYield.MouseButton1Click:connect(function()
				loadstring(game:HttpGet("https://pastebin.com/raw/tzTXmYf2", true))()
			end)

			TopK3K.MouseButton1Click:connect(function()
				loadstring(game:HttpGet("https://pastebin.com/raw/r2LqpfyV", true))()
			end)
		end

		do -- Teleport Cheats
			self:AddMainFrame("Teleport Cheats")

			local CriminalBase = self:AddButton("Teleport Cheats", "Criminal Base")
			local Yard = self:AddButton("Teleport Cheats", "Yard")
			local Cafeteria = self:AddButton("Teleport Cheats", "Cafeteria")
			local Cells = self:AddButton("Teleport Cheats", "Jail Cells")
			local PoliceHQ = self:AddButton("Teleport Cheats", "Police Headquarters")
			local Sewer = self:AddButton("Teleport Cheats", "Sewer")
			local Secret = self:AddButton("Teleport Cheats", "Secret Room")

			CriminalBase.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.criminal)
			end)

			Yard.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.yard)
			end)

			Cafeteria.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.cafeteria)
			end)

			Cells.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.cells)
			end)

			PoliceHQ.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.police)
			end)

			Sewer.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.sewer)
			end)

			Secret.MouseButton1Click:connect(function()
				funcs:TeleportTo(teleStuff.secret)
			end)
		end

		do -- Player Menu
			self:AddMainFrame("Player Menu")

			local PlayerName = self:AddTextBox("Player Menu", "Enter Player Name")
			local TeleportPlayer = self:AddButton("Player Menu", "Teleport to Player")
			local KillPlayer = self:AddButton("Player Menu", "Kill Player")
			local ArrestPlayer = self:AddButton("Player Menu", "Arrest Player")

			TeleportPlayer.MouseButton1Click:connect(function()
				local nc = p.Character
				if PlayerName.Text ~= "" then
					local plr = ps:FindFirstChild(tostring(PlayerName.Text))
					if plr then
						local plrTor = plr.Character:FindFirstChild("HumanoidRootPart")
						if plrTor then
							funcs:TeleportTo(plrTor.CFrame)
						end
					end
				end
			end)

			KillPlayer.MouseButton1Click:connect(function()
				funcs:KillPlayer(ps[PlayerName.Text])
			end)

			ArrestPlayer.MouseButton1Click:connect(function()
				funcs:ArrestPlayer(ps:FindFirstChild(PlayerName.Text))
			end)
		end

		do -- ui toggle
			i.InputBegan:connect(function(input, ingui)
				if not ingui then
					if input.UserInputType == Enum.UserInputType.Keyboard then
						if input.KeyCode == Enum.KeyCode.P then
							self.gui_objs.main.Enabled = not self.gui_objs.main.Enabled
						end
					end
				end
			end)
		end
	end
end

do -- main
	main = {

	}

	function main:Init()
		hint.Text = "PLHaxx: Initializing Main Service..."
		wait()

		do -- connect character after character spawned
			p.CharacterAdded:connect(function(char)
				c = char
			end)
		end
	end
end

do -- fullbrightStuff
	fullbrightStuff = {
		enabled = false,
		backup = { },
	}

	function fullbrightStuff:Enable()
		light.Ambient = Color3.new(1, 1, 1)
		light.Brightness = 2
		light.ColorShift_Bottom = Color3.new(1, 1, 1)
		light.ColorShift_Top = Color3.new(1, 1, 1)
		light.OutdoorAmbient = Color3.new(1, 1, 1)
	end

	function fullbrightStuff:Disable()
		for i, v in pairs(self.backup) do
			light[i] = v
		end
	end

	function fullbrightStuff:Init()
		self.backup["Ambient"] = light.Ambient
		self.backup["Brightness"] = light.Brightness
		self.backup["ColorShift_Bottom"] = light.ColorShift_Bottom
		self.backup["ColorShift_Top"] = light.ColorShift_Top
		self.backup["OutdoorAmbient"] = light.OutdoorAmbient

		light:GetPropertyChangedSignal("Ambient"):connect(function()
			if self.enabled then
				light.Ambient = Color3.new(1, 1, 1)
			end
		end)

		light:GetPropertyChangedSignal("Brightness"):connect(function()
			if self.enabled then
				light.Brightness = 2
			end
		end)

		light:GetPropertyChangedSignal("ColorShift_Bottom"):connect(function()
			if self.enabled then
				light.ColorShift_Bottom = Color3.new(1, 1, 1)
			end
		end)

		light:GetPropertyChangedSignal("ColorShift_Top"):connect(function()
			if self.enabled then
				light.ColorShift_Top = Color3.new(1, 1, 1)
			end
		end)

		light:GetPropertyChangedSignal("OutdoorAmbient"):connect(function()
			if self.enabled then
				light.OutdoorAmbient = Color3.new(1, 1, 1)
			end
		end)
	end
end

do -- gunStuff
	gunStuff = {
		infinite_ammo = false,
		no_spread = false,
		rapid_fire = false,
		bullets_shot = false,
		no_reload = false,
		bullet_range = false,
		damage = false,
		automatic = false
	}

	function gunStuff:SyncGuns()
		local myBackpack = p:FindFirstChild("Backpack")
		if myBackpack then
			for _,v in pairs(myBackpack:GetChildren()) do
				if v:FindFirstChild("GunStates") then
					if self.infinite_ammo then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.MaxAmmo = math.huge
						gunStates.StoredAmmo = math.huge
						gunStates.CurrentAmmo = math.huge
					end
					if self.no_spread then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.Spread = 0
					end
					if self.rapid_fire then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.FireRate = 0
					end
					if self.bullets_shot then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.Bullets = 50
					end
					if self.no_reload then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.ReloadTime = 0
					end
					if self.bullet_range then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.Range = math.huge
					end
					if self.damage then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.Damage = math.huge
					end
					if self.automatic then
						local module = v:FindFirstChild("GunStates")
						local gunStates = require(module)
						gunStates.AutoFire = true
					end
				end
			end
		end
	end

	function gunStuff:Init()
		funcs:RunLoop("GunSync", 1, function()
			self:SyncGuns()
		end, r.RenderStepped)
	end
end

do -- charStuff
	charStuff = {
		noclip = false,
		punch = false,
		taze = false,
		speed = false,
		jump = false
	}

	local punchScript = true

	local dir = {w = 0, s = 0, a = 0, d = 0}
	local spd = 2

	i.InputBegan:connect(function(input, gameProcessedEvent)
		local key = input.KeyCode
		if key == Enum.KeyCode.W then dir.w = 1
		elseif key == Enum.KeyCode.S then dir.s = 1
		elseif key == Enum.KeyCode.A then dir.a = 1
		elseif key == Enum.KeyCode.D then dir.d = 1
		elseif key == Enum.KeyCode.Q then spd = spd + 1
		elseif key == Enum.KeyCode.E then spd = spd - 1
		end
	end)
	i.InputEnded:connect(function(input, gameProcessedEvent)
		local key = input.KeyCode
		if key == Enum.KeyCode.W and not gameProcessedEvent then dir.w = 0
		elseif key == Enum.KeyCode.S and not gameProcessedEvent then dir.s = 0
		elseif key == Enum.KeyCode.A and not gameProcessedEvent then dir.a = 0
		elseif key == Enum.KeyCode.D and not gameProcessedEvent then dir.d = 0
		end
	end)

	function charStuff:SyncCharacter()
		if self.noclip then
			local humanoid = c:FindFirstChild("Humanoid")
			local torso = c:FindFirstChild("Torso")
			local enabled = false
			local torso = c.Torso
			if torso and humanoid then
				torso.Anchored = true
				humanoid.PlatformStand = true
				torso.CFrame = CFrame.new(torso.Position, ca.CoordinateFrame.p) * CFrame.Angles(0,math.rad(180),0) * CFrame.new((dir.d-dir.a)*spd,0,(dir.s-dir.w)*spd)
			end
		else
			local humanoid = c:FindFirstChild("Humanoid")
			local torso = c:FindFirstChild("Torso")
			local enabled = false
			if torso and humanoid then
				if enabled == false then
					enabled = true
				end
				if enabled == true then
					enabled = false
					humanoid.PlatformStand = false
					c.Torso.Anchored = false
				end
			end
		end
		if self.taze then
			local inputHandler = c:FindFirstChild("ClientInputHandler")
			if inputHandler then
				inputHandler.Disabled = true
			else
				inputHandler.Disabled = false
			end
		end
		if self.speed then
			local inputHandler = c:FindFirstChild("ClientInputHandler")
			local humanoid = c:FindFirstChild("Humanoid")
			if inputHandler and humanoid then
				inputHandler.Disabled = true
				humanoid.WalkSpeed = 200
			end
		else
			local inputHandler = c:FindFirstChild("ClientInputHandler")
			local humanoid = c:FindFirstChild("Humanoid")
			if inputHandler and humanoid then
				inputHandler.Disabled = false
			end
		end
		if self.jump then
			local humanoid = c:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.JumpPower = 200
			end
		end
	end

	function charStuff:Init()
		funcs:RunLoop("CharacterSync", 0,  function()
			self:SyncCharacter()
		end, r.RenderStepped)
	end
end

do -- miscStuff
	miscStuff = {
		kill_aura = false,
	}

	function miscStuff:KillAura()
		if self.kill_aura then
			local meleeRemote = rs['meleeEvent']
			for _,v in pairs(ps:GetPlayers()) do
				if v:IsA("Player") and v ~= p and v.Character then
					local character = v.Character
					local humanoid = character:FindFirstChild("Humanoid")
					if humanoid then
						if humanoid.Health >= 0 then
							meleeRemote:FireServer(v)
						end
					end
				end
			end
		end
	end

	function miscStuff:Init()
		funcs:RunLoop("MiscStuff", 0, function()
			self:KillAura()
		end, r.RenderStepped)
	end
end

do -- teleStuff
	teleStuff = {
    criminal = CFrame.new(-943.704, 91.632, 2056.925),
    police = CFrame.new(834.972, 99.989, 2275.318),
    yard = CFrame.new(779.092, 96.001, 2451.114),
    cafeteria = CFrame.new(930, 97.54, 2291),
    cells = CFrame.new(918, 97.73, 2447),
    sewer = CFrame.new(917.174, 76.406, 2426.199),
    secret = CFrame.new(697, 97.492, 2364)
  }
end

table.insert(getgenv().services, gui)
table.insert(getgenv().services, fullbrightStuff)
table.insert(getgenv().services, gunStuff)
table.insert(getgenv().services, charStuff)
table.insert(getgenv().services, miscStuff)
table.insert(getgenv().services, main)

for _,v in pairs(getgenv().services) do
	if v then -- prevent erroring if v does not exist or is nil
		hint.Text = "PLHaxx: Initializing Service "..tostring(_)..""
		getgenv().services[_]:Init()
	end
end

warn("PLHaxx has loaded successfully, thanks for using!")
hint.Text = "PLHaxx: Completed."
wait(3)
hint:Destroy()
hint = nil

getgenv().pl_haxx = true