uis = game:GetService("UserInputService")
cg = game:GetService("CoreGui")
sg = game:GetService("StarterGui")
wp = game:GetService("Workspace")
cmr = wp.Camera
rs = game:GetService("ReplicatedStorage")
rsd = game:GetService("RunService").RenderStepped
lgt = game:GetService("Lighting")
plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
mouse = lplr:GetMouse()
virtualUser = game:GetService("VirtualUser")

_G.speed = 100
_G.expFarm = false
_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.hitBoxSize = {50, 50, 50}
_G.hitBoxBody = "HumanoidRootPart"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 0.9
-- HumanoidRootPart

function SendChat(String) -- Send a chat to the game chat
	game.StarterGui:SetCore(
		"ChatMakeSystemMessage",
		{
			Text = "[OUTPUT]: " .. String
		}
	)
end

function createHitBoxs(parent)
	parent.HumanoidRootPart.Transparency = 1
	if parent.Name == "Gang Orca" then
		parent.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
	else
		parent.HumanoidRootPart.Size = Vector3.new(300, 300, 300)
	end
	parent.HumanoidRootPart.Size = Vector3.new(300, 300, 300)
	parent.HumanoidRootPart.Color = Color3.new(255, 255, 255)
	parent.HumanoidRootPart.CanCollide = false
end

function hitboxEnemy()
	for _, v in pairs(wp.NPCs:GetChildren()) do
		createHitBoxs(v)
	end
end

function exp()
	local nameQ = ""
	for _, v in pairs(wp[tostring(lplr.Name)]:GetChildren()) do
		if string.find(string.lower(v.Name), string.lower("Quirk")) then
			nameQ = v.Name
		end
	end
	while _G.expFarm do
		wait()
		local Event = wp[tostring(lplr.Name)][nameQ].T
		Event:FireServer()
	end
end

function infJump()
	lplr.Character.Humanoid.JumpPower = 50
	lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function Wspeed()
	lplr.Character.Humanoid.WalkSpeed = _G.speed

	lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
		function()
			if lplr.Character.Humanoid.WalkSpeed ~= _G.speed then
				lplr.Character.Humanoid.WalkSpeed = _G.speed
			end
		end
	)

	lplr.CharacterAdded:Connect(
		function(characterModel)
			wait(0.5)
			characterModel.Humanoid.WalkSpeed = _G.speed
			characterModel.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
				function()
					if characterModel.Humanoid.WalkSpeed ~= _G.speed then
						characterModel.Humanoid.WalkSpeed = _G.speed
					end
				end
			)
		end
	)
end
Wspeed()

function changeWS(typeWS)
	if typeWS == 0 then
		_G.speed = _G.speed + 5
		lplr.Character.Humanoid.WalkSpeed = _G.speed
	elseif typeWS == 1 then
		if _G.speed >= 0 then
			_G.speed = _G.speed - 5
			lplr.Character.Humanoid.WalkSpeed = _G.speed
		end
		if _G.speed < 16 then
			_G.speed = 16
			lplr.Character.Humanoid.WalkSpeed = _G.speed
		end
	end
end

spawn(
	function()
		loadstring(game:HttpGet(("https://pastebin.com/raw/pi19b6tb"), true))() --ESP ALL Players
	end
)

spawn(
	function()
		loadstring(game:HttpGet(("https://pastebin.com/raw/bYWhrnGA"), true))() --Hit Box
	end
)

mouse.KeyDown:connect(
	function(keyDown)
		if keyDown == " " then
			infJump()
		end

		if keyDown == "l" then
			expFarm = not expFarm
			exp()
		end

		if keyDown == "q" then
			hitboxEnemy()
		end

		if keyDown == "[" then
			changeWS(0)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end

		if keyDown == "]" then
			changeWS(1)
			SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)
		end
	end
)

wp.NPCs.ChildAdded:connect(
	function(m)
		hitboxEnemy()
	end
)
