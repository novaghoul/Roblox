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

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = '[OUTPUT]: ' .. String
})
end

SendChat("Walk Speed :" .. lplr.Character.Humanoid.WalkSpeed)