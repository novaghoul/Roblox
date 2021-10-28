wp = game:GetService("Workspace")
if wp:FindFirstChild("Gates") then
    wp.Gates:Destroy()
end
local loopHack = false
local GUI = Instance.new("ScreenGui")
local dragFrame = Instance.new("Frame")
local ssButton = Instance.new("TextButton")
local LSTitle = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
GUI.Name = "Gui"
GUI.Parent = game.CoreGui
dragFrame.Name = "dragFrame"
dragFrame.Parent = GUI
dragFrame.BackgroundColor3 = Color3.new(0.172549, 0, 0.0627451)
dragFrame.BorderSizePixel = 2
dragFrame.Position = UDim2.new(0.241050124, 0, 0.177033499, 0)
dragFrame.Size = UDim2.new(0, 263, 0, 100)
dragFrame.Style = Enum.FrameStyle.RobloxRound
dragFrame.Active = true
dragFrame.Draggable = true
ssButton.Name = "ssButton"
ssButton.Parent = dragFrame
ssButton.BackgroundColor3 = Color3.new(1, 0.0392157, 0.215686)
ssButton.Position = UDim2.new(0.2570342205, 0, 0.331685402, 0)
ssButton.Size = UDim2.new(0, 107, 0, 42)
ssButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
ssButton.Font = Enum.Font.Code
ssButton.Text = "Start"
ssButton.TextColor3 = Color3.new(0, 0, 0)
ssButton.TextSize = 14
ssButton.MouseButton1Down:connect(function()
  if loopHack then
    loopHack = false
    ssButton.Text = "Start"
  else
    loopHack = true
    ssButton.Text = "Stop"
  end
end)
LSTitle.Name = "LSTitle"
LSTitle.Parent = dragFrame
LSTitle.BackgroundColor3 = Color3.new(1, 1, 1)
LSTitle.BackgroundTransparency = 1
LSTitle.Position = UDim2.new(0.022813689, 0, 0.0188706424, 0)
LSTitle.Size = UDim2.new(0, 234, 0, 23)
LSTitle.Font = Enum.Font.Code
LSTitle.Text = "Monster Hunter Simulator Gui"
LSTitle.TextColor3 = Color3.new(1, 1, 1)
LSTitle.TextSize = 17
Credit.Name = "Credit"
Credit.Parent = dragFrame
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.562813689, 0, 0.8188706424, 0)
Credit.Size = UDim2.new(0, 100, 0, 23)
Credit.Font = Enum.Font.Code
Credit.Text = "By ShivamAmin"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 17
while true do
  while loopHack do
    for _,k in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
        for __,kk in pairs(k:GetChildren()) do
            i = {}
            for w in string.gmatch(game:GetService("Players").LocalPlayer.PlayerGui.Hud.Container2.Backpack.Background.TextFrame.Amount.Text, "%S+") do
                table.insert(i, w)
            end
            if tonumber(i[1]) == tonumber(i[3]) then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.Market.Part.CFrame
                wait(2)
            end
            if kk:FindFirstChild("Monster"):FindFirstChild("MonsterName").Value == "Goolap" or kk:FindFirstChild("Monster"):FindFirstChild("MonsterName").Value == "Zarlop" then
                while k:FindFirstChild(kk.Name) ~= nil and loopHack do
					print(kk:FindFirstChild("Monster").Health.Value)
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = kk.CoordinateFrame.Value
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("DamageMonster", {[kk.Name] = kk})
                    wait(.1)
                end
            end
        end
    end
    wait(.1)
  end
  wait()
end