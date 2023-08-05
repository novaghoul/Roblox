loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

mouse.Button1Down:connect(
	function()
		if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then return end
		if not mouse.Target then return end
		if mouse.Target.Locked == true then mouse.Target.Locked = false end
		print("\n\n")
		print("<------Start------->\n")
		pant = mouse.Target
		print("game." .. pant:GetFullName() .. "\n")
		print("<-------End-------->")
	end
)
