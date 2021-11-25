--v to noclip
local h,char,play
play = game.Players.LocalPlayer
local uis = game:getService("UserInputService")
game:getService("RunService"):BindToRenderStep("",0,function()
	char = play.Character
	if char then h = char:findFirstChildOfClass("Humanoid") end
	if not h then return end
	if uis:IsKeyDown(Enum.KeyCode.V) then
		h:ChangeState(11)
	end
end)