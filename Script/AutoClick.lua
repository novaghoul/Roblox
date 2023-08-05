loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

_G.onClick = false
_G.keyClick = "p"
_G.delay = 0.1

function autoClick()
    while _G.onClick do
        wait(_G.delay)
        virtualUser:ClickButton1(Vector2.new())
    end
end

mouse.KeyDown:connect(
	function(keyDown)
        if keyDown == _G.keyClick then
            _G.onClick = not _G.onClick
            wait(0.1)
			autoClick()
		end
	end
)