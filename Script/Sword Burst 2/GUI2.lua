-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local _Kreeper_RUv31 = Instance.new("ScreenGui")
local Open = Instance.new("ImageButton")
local Menu = Instance.new("ImageLabel")
local OF = Instance.new("ImageButton")
local OTP = Instance.new("ImageButton")
local Bar = Instance.new("ImageLabel")
local MaxUpgrade = Instance.new("ImageButton")
local DismantleAll = Instance.new("ImageButton")
local ItemUpgrade = Instance.new("TextBox")
local ItemDismantle = Instance.new("TextBox")
local _Kreeper_RUv31_2 = Instance.new("ImageLabel")
local Teleports = Instance.new("ImageLabel")
local MinibossesThis = Instance.new("ImageLabel")
local ImageLabel = Instance.new("ImageLabel")
local Bar_2 = Instance.new("ImageLabel")
local _Kreeper_RUv31_3 = Instance.new("ImageLabel")
local F1 = Instance.new("ImageLabel")
local F2 = Instance.new("ImageLabel")
local F3 = Instance.new("ImageLabel")
local F4 = Instance.new("ImageLabel")
local F5 = Instance.new("ImageLabel")
local F7 = Instance.new("ImageLabel")
local F8 = Instance.new("ImageLabel")
local F9 = Instance.new("ImageLabel")
local F10 = Instance.new("ImageLabel")
local F2B = Instance.new("ImageButton")
local F3B = Instance.new("ImageButton")
local F4B = Instance.new("ImageButton")
local F7B = Instance.new("ImageButton")
local F5B = Instance.new("ImageButton")
local F8B = Instance.new("ImageButton")
local F10B = Instance.new("ImageButton")
local F9B = Instance.new("ImageButton")
local F1B = Instance.new("ImageButton")
local Close1 = Instance.new("ImageButton")
local BossesThis = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local F10M = Instance.new("ImageButton")
local F9M = Instance.new("ImageButton")
local F8M = Instance.new("ImageButton")
local F7M = Instance.new("ImageButton")
local F5M = Instance.new("ImageButton")
local F4M = Instance.new("ImageButton")
local F3M = Instance.new("ImageButton")
local F2M = Instance.new("ImageButton")
local F1M = Instance.new("ImageButton")
local Functions = Instance.new("ImageLabel")
local Close2 = Instance.new("ImageButton")
local Bar_3 = Instance.new("ImageLabel")
local _Kreeper_RUv31_4 = Instance.new("ImageLabel")
local Run = Instance.new("ImageLabel")
local Jump = Instance.new("ImageLabel")
local MaxSpeed = Instance.new("ImageButton")
local NormalJump = Instance.new("ImageButton")
local MaxJump = Instance.new("ImageButton")
local NormalSpeed = Instance.new("ImageButton")
local Critical = Instance.new("ImageLabel")
local ANTIAFK1 = Instance.new("ImageLabel")
local Position1 = Instance.new("ImageLabel")
local Position = Instance.new("ImageButton")
local ANTIAFK = Instance.new("ImageButton")
local ALLABYLITES = Instance.new("ImageButton")
local AUTOFARM1 = Instance.new("ImageLabel")
local AUTOFARM = Instance.new("ImageButton")
local Box = Instance.new("ImageButton")
local MOBINBOX = Instance.new("ImageLabel")
local InfStamina = Instance.new("ImageButton")
local Run_2 = Instance.new("ImageLabel")
local Close = Instance.new("ImageButton")
--Properties:
_Kreeper_RUv31.Name = "_Kreeper_RUv3.1"
_Kreeper_RUv31.Parent = game.CoreGui

Open.Name = "Open"
Open.Parent = _Kreeper_RUv31
Open.BackgroundColor3 = Color3.new(1, 1, 1)
Open.BackgroundTransparency = 1
Open.Position = UDim2.new(0.934799671, 0, 0.948402941, 0)
Open.Size = UDim2.new(0, 70, 0, 30)
Open.AutoButtonColor = false
Open.Image = "rbxassetid://2693367433"

Menu.Name = "Menu"
Menu.Parent = _Kreeper_RUv31
Menu.BackgroundColor3 = Color3.new(1, 1, 1)
Menu.BorderColor3 = Color3.new(0, 0, 0)
Menu.BorderSizePixel = 5
Menu.Position = UDim2.new(0.738413215, 0, 0.691646218, 0)
Menu.Size = UDim2.new(0, 320, 0, 200)
Menu.Visible = false
Menu.Image = "rbxassetid://2693400355"
Menu.Active=true
Menu.Draggable=true

OF.Name = "OF"
OF.Parent = Menu
OF.BackgroundColor3 = Color3.new(1, 1, 1)
OF.BackgroundTransparency = 0.80000001192093
OF.BorderColor3 = Color3.new(1, 1, 0)
OF.BorderSizePixel = 5
OF.Position = UDim2.new(0.0281249993, 0, 0.720000029, 0)
OF.Size = UDim2.new(0, 145, 0, 50)
OF.Image = "rbxassetid://2693413690"

OTP.Name = "OTP"
OTP.Parent = Menu
OTP.BackgroundColor3 = Color3.new(1, 1, 1)
OTP.BackgroundTransparency = 0.80000001192093
OTP.BorderColor3 = Color3.new(1, 1, 0)
OTP.BorderSizePixel = 5
OTP.Position = UDim2.new(0.528124988, 0, 0.720000029, 0)
OTP.Size = UDim2.new(0, 145, 0, 50)
OTP.Image = "rbxassetid://2693413920"

Bar.Name = "Bar"
Bar.Parent = Menu
Bar.BackgroundColor3 = Color3.new(1, 1, 1)
Bar.BackgroundTransparency = 0.80000001192093
Bar.BorderColor3 = Color3.new(0, 0, 0)
Bar.BorderSizePixel = 5
Bar.Size = UDim2.new(0, 320, 0, 30)
Bar.Image = "rbxassetid://2693475807"

MaxUpgrade.Name = "MaxUpgrade"
MaxUpgrade.Parent = Menu
MaxUpgrade.BackgroundColor3 = Color3.new(1, 1, 1)
MaxUpgrade.BackgroundTransparency = 0.80000001192093
MaxUpgrade.BorderColor3 = Color3.new(0.215686, 1, 0)
MaxUpgrade.BorderSizePixel = 5
MaxUpgrade.Position = UDim2.new(0.0281249993, 0, 0.430000007, 0)
MaxUpgrade.Size = UDim2.new(0, 145, 0, 40)
MaxUpgrade.Image = "rbxassetid://2693451337"
MaxUpgrade.MouseButton1Click:Connect(function()
   local SelectedWeaponData = ItemUpgrade.Text
     for i,v in pairs(game.ReplicatedStorage.Profiles[PlayerName].Inventory:GetChildren()) do
           if v.Name == (SelectedWeaponData) then
               for i=1,100 do
                   game.ReplicatedStorage.Event:FireServer("Equipment", {"Upgrade", v, false})
               print("Upgraded " .. SelectedWeaponData .. " to Max.")
           end
       end
   end
end)


DismantleAll.Name = "DismantleAll"
DismantleAll.Parent = Menu
DismantleAll.BackgroundColor3 = Color3.new(1, 1, 1)
DismantleAll.BackgroundTransparency = 0.80000001192093
DismantleAll.BorderColor3 = Color3.new(1, 0, 0)
DismantleAll.BorderSizePixel = 5
DismantleAll.Position = UDim2.new(0.528124988, 0, 0.430000007, 0)
DismantleAll.Size = UDim2.new(0, 145, 0, 40)
DismantleAll.Image = "rbxassetid://2693451511"
DismantleAll.MouseButton1Down:connect(function() 
   local log = false
   local SelectedWeaponData = ItemDismantle.Text
   for i,v in pairs(game.ReplicatedStorage.Profiles[PlayerName].Inventory:GetChildren()) do
   if v.Name == (SelectedWeaponData) then
   game.ReplicatedStorage.Event:FireServer("Equipment", {"Dismantle", v})
   local check = v:FindFirstChild(SelectedWeaponData)
   if not check then
       log = true
       if check then
           log = false
       end
       if log == true then
       print("Dismantled every " .. SelectedWeaponData ..".")
   end
end
end
end
end)

ItemUpgrade.Name = "ItemUpgrade"
ItemUpgrade.Parent = Menu
ItemUpgrade.BackgroundColor3 = Color3.new(1, 1, 1)
ItemUpgrade.BackgroundTransparency = 0.80000001192093
ItemUpgrade.BorderColor3 = Color3.new(0.215686, 1, 0)
ItemUpgrade.BorderSizePixel = 5
ItemUpgrade.Position = UDim2.new(0.0281249993, 0, 0.229999989, 0)
ItemUpgrade.Size = UDim2.new(0, 145, 0, 40)
ItemUpgrade.Font = Enum.Font.SourceSans
ItemUpgrade.Text = ""
ItemUpgrade.TextColor3 = Color3.new(0, 0, 0)
ItemUpgrade.TextScaled = true
ItemUpgrade.TextSize = 25
ItemUpgrade.TextWrapped = true

ItemDismantle.Name = "ItemDismantle"
ItemDismantle.Parent = Menu
ItemDismantle.BackgroundColor3 = Color3.new(1, 1, 1)
ItemDismantle.BackgroundTransparency = 0.80000001192093
ItemDismantle.BorderColor3 = Color3.new(1, 0, 0)
ItemDismantle.BorderSizePixel = 5
ItemDismantle.Position = UDim2.new(0.528124988, 0, 0.229999989, 0)
ItemDismantle.Size = UDim2.new(0, 145, 0, 40)
ItemDismantle.Font = Enum.Font.SourceSans
ItemDismantle.Text = ""
ItemDismantle.TextColor3 = Color3.new(0, 0, 0)
ItemUpgrade.TextScaled = true
ItemUpgrade.TextSize = 25
ItemUpgrade.TextWrapped = true

_Kreeper_RUv31_2.Name = "_Kreeper_RU v3.1"
_Kreeper_RUv31_2.Parent = Menu
_Kreeper_RUv31_2.BackgroundColor3 = Color3.new(0, 0, 0)
_Kreeper_RUv31_2.BackgroundTransparency = 0.5
_Kreeper_RUv31_2.BorderColor3 = Color3.new(1, 0, 0)
_Kreeper_RUv31_2.BorderSizePixel = 3
_Kreeper_RUv31_2.Position = UDim2.new(0.265625, 0, -0.234999999, 0)
_Kreeper_RUv31_2.Size = UDim2.new(0, 150, 0, 40)
_Kreeper_RUv31_2.Image = "rbxassetid://2693487245"

Teleports.Name = "Teleports"
Teleports.Parent = _Kreeper_RUv31
Teleports.BackgroundColor3 = Color3.new(1, 1, 1)
Teleports.BorderColor3 = Color3.new(0, 0, 0)
Teleports.BorderSizePixel = 5
Teleports.Position = UDim2.new(0.738413215, 0, 0.690417767, 0)
Teleports.Size = UDim2.new(0, 320, 0, 200)
Teleports.Visible = false
Teleports.Image = "rbxassetid://2693400355"
Teleports.Active=true
Teleports.Draggable=true

MinibossesThis.Name = "MinibossesThis"
MinibossesThis.Parent = Teleports
MinibossesThis.BackgroundColor3 = Color3.new(1, 1, 1)
MinibossesThis.BackgroundTransparency = 0.80000001192093
MinibossesThis.Position = UDim2.new(0.34375006, 0, 0.775000036, 0)
MinibossesThis.Size = UDim2.new(0, 30, 0, 30)
MinibossesThis.Image = "rbxassetid://2693565914"

ImageLabel.Parent = MinibossesThis
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(1, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 79, 0, 30)
ImageLabel.Image = "rbxassetid://2693606878"

Bar_2.Name = "Bar"
Bar_2.Parent = Teleports
Bar_2.BackgroundColor3 = Color3.new(1, 1, 1)
Bar_2.BackgroundTransparency = 0.80000001192093
Bar_2.BorderColor3 = Color3.new(0, 0, 0)
Bar_2.BorderSizePixel = 5
Bar_2.Size = UDim2.new(0, 320, 0, 30)
Bar_2.Image = "rbxassetid://2693475807"

_Kreeper_RUv31_3.Name = "_Kreeper_RU v3.1"
_Kreeper_RUv31_3.Parent = Teleports
_Kreeper_RUv31_3.BackgroundColor3 = Color3.new(0, 0, 0)
_Kreeper_RUv31_3.BackgroundTransparency = 0.5
_Kreeper_RUv31_3.BorderColor3 = Color3.new(1, 0, 0)
_Kreeper_RUv31_3.BorderSizePixel = 3
_Kreeper_RUv31_3.Position = UDim2.new(0.265625, 0, -0.234999999, 0)
_Kreeper_RUv31_3.Size = UDim2.new(0, 150, 0, 40)
_Kreeper_RUv31_3.Image = "rbxassetid://2693487245"

F1.Name = "F1"
F1.Parent = Teleports
F1.BackgroundColor3 = Color3.new(1, 1, 1)
F1.BackgroundTransparency = 0.80000001192093
F1.Position = UDim2.new(0, 0, 0.185000002, 0)
F1.Size = UDim2.new(0, 30, 0, 30)
F1.Image = "rbxassetid://2693543437"

F2.Name = "F2"
F2.Parent = Teleports
F2.BackgroundColor3 = Color3.new(1, 1, 1)
F2.BackgroundTransparency = 0.80000001192093
F2.Position = UDim2.new(0.112500004, 0, 0.185000002, 0)
F2.Size = UDim2.new(0, 30, 0, 30)
F2.Image = "rbxassetid://2693543589"

F3.Name = "F3"
F3.Parent = Teleports
F3.BackgroundColor3 = Color3.new(1, 1, 1)
F3.BackgroundTransparency = 0.80000001192093
F3.Position = UDim2.new(0.228124991, 0, 0.185000002, 0)
F3.Size = UDim2.new(0, 30, 0, 30)
F3.Image = "rbxassetid://2693543727"

F4.Name = "F4"
F4.Parent = Teleports
F4.BackgroundColor3 = Color3.new(1, 1, 1)
F4.BackgroundTransparency = 0.80000001192093
F4.Position = UDim2.new(0.34375, 0, 0.185000002, 0)
F4.Size = UDim2.new(0, 30, 0, 30)
F4.Image = "rbxassetid://2693543911"

F5.Name = "F5"
F5.Parent = Teleports
F5.BackgroundColor3 = Color3.new(1, 1, 1)
F5.BackgroundTransparency = 0.80000001192093
F5.Position = UDim2.new(0.453125, 0, 0.185000002, 0)
F5.Size = UDim2.new(0, 30, 0, 30)
F5.Image = "rbxassetid://2693544112"

F7.Name = "F7"
F7.Parent = Teleports
F7.BackgroundColor3 = Color3.new(1, 1, 1)
F7.BackgroundTransparency = 0.80000001192093
F7.Position = UDim2.new(0.568750024, 0, 0.185000002, 0)
F7.Size = UDim2.new(0, 30, 0, 30)
F7.Image = "rbxassetid://2693546142"

F8.Name = "F8"
F8.Parent = Teleports
F8.BackgroundColor3 = Color3.new(1, 1, 1)
F8.BackgroundTransparency = 0.80000001192093
F8.Position = UDim2.new(0.681249976, 0, 0.185000002, 0)
F8.Size = UDim2.new(0, 30, 0, 30)
F8.Image = "rbxassetid://2693545450"

F9.Name = "F9"
F9.Parent = Teleports
F9.BackgroundColor3 = Color3.new(1, 1, 1)
F9.BackgroundTransparency = 0.80000001192093
F9.Position = UDim2.new(0.796875, 0, 0.185000002, 0)
F9.Size = UDim2.new(0, 30, 0, 30)
F9.Image = "rbxassetid://2693545644"

F10.Name = "F10"
F10.Parent = Teleports
F10.BackgroundColor3 = Color3.new(1, 1, 1)
F10.BackgroundTransparency = 0.80000001192093
F10.Position = UDim2.new(0.90625, 0, 0.185000002, 0)
F10.Size = UDim2.new(0, 30, 0, 30)
F10.Image = "rbxassetid://2693546528"

F2B.Name = "F2B"
F2B.Parent = Teleports
F2B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F2B.BackgroundTransparency = 0.5
F2B.Position = UDim2.new(0.115625001, 0, 0.379999995, 0)
F2B.Size = UDim2.new(0, 30, 0, 30)
F2B.Image = "rbxassetid://2693566378"

F3B.Name = "F3B"
F3B.Parent = Teleports
F3B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F3B.BackgroundTransparency = 0.5
F3B.Position = UDim2.new(0.228125006, 0, 0.379999995, 0)
F3B.Size = UDim2.new(0, 30, 0, 30)
F3B.Image = "rbxassetid://2693566378"

F4B.Name = "F4B"
F4B.Parent = Teleports
F4B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F4B.BackgroundTransparency = 0.5
F4B.Position = UDim2.new(0.34375, 0, 0.379999995, 0)
F4B.Size = UDim2.new(0, 30, 0, 30)
F4B.Image = "rbxassetid://2693566378"

F7B.Name = "F7B"
F7B.Parent = Teleports
F7B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F7B.BackgroundTransparency = 0.5
F7B.Position = UDim2.new(0.571874976, 0, 0.379999995, 0)
F7B.Size = UDim2.new(0, 30, 0, 30)
F7B.Image = "rbxassetid://2693566378"

F5B.Name = "F5B"
F5B.Parent = Teleports
F5B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F5B.BackgroundTransparency = 0.5
F5B.Position = UDim2.new(0.456250012, 0, 0.379999995, 0)
F5B.Size = UDim2.new(0, 30, 0, 30)
F5B.Image = "rbxassetid://2693566378"

F8B.Name = "F8B"
F8B.Parent = Teleports
F8B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F8B.BackgroundTransparency = 0.5
F8B.Position = UDim2.new(0.681249976, 0, 0.379999995, 0)
F8B.Size = UDim2.new(0, 30, 0, 30)
F8B.Image = "rbxassetid://2693566378"

F10B.Name = "F10B"
F10B.Parent = Teleports
F10B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F10B.BackgroundTransparency = 0.5
F10B.Position = UDim2.new(0.909375012, 0, 0.379999995, 0)
F10B.Size = UDim2.new(0, 30, 0, 30)
F10B.Image = "rbxassetid://2693566378"

F9B.Name = "F9B"
F9B.Parent = Teleports
F9B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F9B.BackgroundTransparency = 0.5
F9B.Position = UDim2.new(0.796875, 0, 0.379999995, 0)
F9B.Size = UDim2.new(0, 30, 0, 30)
F9B.Image = "rbxassetid://2693566378"

F1B.Name = "F1B"
F1B.Parent = Teleports
F1B.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F1B.BackgroundTransparency = 0.5
F1B.Position = UDim2.new(0, 0, 0.379999995, 0)
F1B.Size = UDim2.new(0, 30, 0, 30)
F1B.Image = "rbxassetid://2693566378"

Close1.Name = "Close1"
Close1.Parent = Teleports
Close1.BackgroundColor3 = Color3.new(1, 0, 0.0156863)
Close1.BackgroundTransparency = 0.5
Close1.BorderSizePixel = 3
Close1.Position = UDim2.new(0.756250024, 0, 0.819999993, 0)
Close1.Size = UDim2.new(0, 72, 0, 30)
Close1.Image = "rbxassetid://2693451130"

BossesThis.Name = "BossesThis"
BossesThis.Parent = Teleports
BossesThis.BackgroundColor3 = Color3.new(1, 1, 1)
BossesThis.BackgroundTransparency = 0.80000001192093
BossesThis.Position = UDim2.new(0.00312501192, 0, 0.775000036, 0)
BossesThis.Size = UDim2.new(0, 30, 0, 30)
BossesThis.Image = "rbxassetid://2693566378"

ImageLabel_2.Parent = BossesThis
ImageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.Position = UDim2.new(0.966666639, 0, 0, 0)
ImageLabel_2.Size = UDim2.new(0, 80, 0, 31)
ImageLabel_2.Image = "rbxassetid://2693607123"

F10M.Name = "F10M"
F10M.Parent = Teleports
F10M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F10M.BackgroundTransparency = 0.5
F10M.Position = UDim2.new(0.90625, 0, 0.560000002, 0)
F10M.Size = UDim2.new(0, 30, 0, 30)
F10M.Image = "rbxassetid://2693565914"

F9M.Name = "F9M"
F9M.Parent = Teleports
F9M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F9M.BackgroundTransparency = 0.5
F9M.Position = UDim2.new(0.796875, 0, 0.560000002, 0)
F9M.Size = UDim2.new(0, 30, 0, 30)
F9M.Image = "rbxassetid://2693565914"

F8M.Name = "F8M"
F8M.Parent = Teleports
F8M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F8M.BackgroundTransparency = 0.5
F8M.Position = UDim2.new(0.681249976, 0, 0.560000002, 0)
F8M.Size = UDim2.new(0, 30, 0, 30)
F8M.Image = "rbxassetid://2693565914"

F7M.Name = "F7M"
F7M.Parent = Teleports
F7M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F7M.BackgroundTransparency = 0.5
F7M.Position = UDim2.new(0.568750024, 0, 0.560000002, 0)
F7M.Size = UDim2.new(0, 30, 0, 30)
F7M.Image = "rbxassetid://2693565914"

F5M.Name = "F5M"
F5M.Parent = Teleports
F5M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F5M.BackgroundTransparency = 0.5
F5M.Position = UDim2.new(0.456250012, 0, 0.560000002, 0)
F5M.Size = UDim2.new(0, 30, 0, 30)
F5M.Image = "rbxassetid://2693565914"

F4M.Name = "F4M"
F4M.Parent = Teleports
F4M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F4M.BackgroundTransparency = 0.5
F4M.Position = UDim2.new(0.34375, 0, 0.560000002, 0)
F4M.Size = UDim2.new(0, 30, 0, 30)
F4M.Image = "rbxassetid://2693565914"

F3M.Name = "F3M"
F3M.Parent = Teleports
F3M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F3M.BackgroundTransparency = 0.5
F3M.Position = UDim2.new(0.228124976, 0, 0.560000002, 0)
F3M.Size = UDim2.new(0, 30, 0, 30)
F3M.Image = "rbxassetid://2693565914"

F2M.Name = "F2M"
F2M.Parent = Teleports
F2M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F2M.BackgroundTransparency = 0.5
F2M.Position = UDim2.new(0.115625024, 0, 0.560000002, 0)
F2M.Size = UDim2.new(0, 30, 0, 30)
F2M.Image = "rbxassetid://2693565914"

F1M.Name = "F1M"
F1M.Parent = Teleports
F1M.BackgroundColor3 = Color3.new(0.45098, 0.45098, 0.45098)
F1M.BackgroundTransparency = 0.5
F1M.Position = UDim2.new(0, 0, 0.560000002, 0)
F1M.Size = UDim2.new(0, 30, 0, 30)
F1M.Image = "rbxassetid://2693565914"

Functions.Name = "Functions"
Functions.Parent = _Kreeper_RUv31
Functions.BackgroundColor3 = Color3.new(1, 1, 1)
Functions.BorderColor3 = Color3.new(0, 0, 0)
Functions.BorderSizePixel = 5
Functions.Position = UDim2.new(0.739198804, 0, 0.691646159, 0)
Functions.Size = UDim2.new(0, 320, 0, 200)
Functions.Visible = false
Functions.Image = "rbxassetid://2693400355"

Close2.Name = "Close2"
Close2.Parent = Functions
Close2.BackgroundColor3 = Color3.new(1, 0, 0)
Close2.BackgroundTransparency = 0.55000001192093
Close2.BorderColor3 = Color3.new(0, 0, 0)
Close2.BorderSizePixel = 5
Close2.Position = UDim2.new(0.387499988, 0, 1, 0)
Close2.Size = UDim2.new(0, 79, 0, 24)
Close2.Image = "rbxassetid://2693451130"

Bar_3.Name = "Bar"
Bar_3.Parent = Functions
Bar_3.BackgroundColor3 = Color3.new(1, 1, 1)
Bar_3.BackgroundTransparency = 0.80000001192093
Bar_3.BorderColor3 = Color3.new(0, 0, 0)
Bar_3.BorderSizePixel = 5
Bar_3.Size = UDim2.new(0, 320, 0, 30)
Bar_3.Image = "rbxassetid://2693475807"

_Kreeper_RUv31_4.Name = "_Kreeper_RU v3.1"
_Kreeper_RUv31_4.Parent = Functions
_Kreeper_RUv31_4.BackgroundColor3 = Color3.new(0, 0, 0)
_Kreeper_RUv31_4.BackgroundTransparency = 0.5
_Kreeper_RUv31_4.BorderColor3 = Color3.new(1, 0, 0)
_Kreeper_RUv31_4.BorderSizePixel = 3
_Kreeper_RUv31_4.Position = UDim2.new(0.265625, 0, -0.234999999, 0)
_Kreeper_RUv31_4.Size = UDim2.new(0, 150, 0, 40)
_Kreeper_RUv31_4.Image = "rbxassetid://2693487245"

Run.Name = "Run"
Run.Parent = Functions
Run.BackgroundColor3 = Color3.new(1, 1, 1)
Run.BackgroundTransparency = 0.80000001192093
Run.Position = UDim2.new(-0.00109729171, 0, 0.177162081, 0)
Run.Size = UDim2.new(0, 30, 0, 30)
Run.Image = "rbxassetid://2693643760"
Run.ImageColor3 = Color3.new(0, 0, 0)

Jump.Name = "Jump"
Jump.Parent = Functions
Jump.BackgroundColor3 = Color3.new(1, 1, 1)
Jump.BackgroundTransparency = 0.80000001192093
Jump.Position = UDim2.new(-0.00109729171, 0, 0.372162074, 0)
Jump.Size = UDim2.new(0, 30, 0, 30)
Jump.Image = "rbxassetid://2693634751"
Jump.ImageColor3 = Color3.new(0, 0, 0)

MaxSpeed.Name = "MaxSpeed"
MaxSpeed.Parent = Functions
MaxSpeed.BackgroundColor3 = Color3.new(1, 1, 1)
MaxSpeed.BackgroundTransparency = 0.80000001192093
MaxSpeed.BorderColor3 = Color3.new(1, 1, 1)
MaxSpeed.Position = UDim2.new(0.115625001, 0, 0.17716217, 0)
MaxSpeed.Size = UDim2.new(0, 80, 0, 30)
MaxSpeed.Image = "rbxassetid://2693693128"

NormalJump.Name = "NormalJump"
NormalJump.Parent = Functions
NormalJump.BackgroundColor3 = Color3.new(1, 1, 1)
NormalJump.BackgroundTransparency = 0.80000001192093
NormalJump.Position = UDim2.new(0.115625001, 0, 0.372162163, 0)
NormalJump.Size = UDim2.new(0, 80, 0, 30)
NormalJump.Visible = false
NormalJump.Image = "rbxassetid://2693692856"

MaxJump.Name = "MaxJump"
MaxJump.Parent = Functions
MaxJump.BackgroundColor3 = Color3.new(1, 1, 1)
MaxJump.BackgroundTransparency = 0.80000001192093
MaxJump.Position = UDim2.new(0.115625001, 0, 0.372162163, 0)
MaxJump.Size = UDim2.new(0, 80, 0, 30)
MaxJump.Image = "rbxassetid://2693693555"

NormalSpeed.Name = "NormalSpeed"
NormalSpeed.Parent = Functions
NormalSpeed.BackgroundColor3 = Color3.new(1, 1, 1)
NormalSpeed.BackgroundTransparency = 0.80000001192093
NormalSpeed.BorderColor3 = Color3.new(1, 1, 1)
NormalSpeed.Position = UDim2.new(0.115625001, 0, 0.17716217, 0)
NormalSpeed.Size = UDim2.new(0, 80, 0, 30)
NormalSpeed.Visible = false
NormalSpeed.Image = "rbxassetid://2693694096"

Critical.Name = "Critical"
Critical.Parent = Functions
Critical.BackgroundColor3 = Color3.new(1, 1, 1)
Critical.BackgroundTransparency = 0.80000001192093
Critical.BorderColor3 = Color3.new(1, 1, 1)
Critical.Position = UDim2.new(0.508277655, 0, 0.177162081, 0)
Critical.Size = UDim2.new(0, 30, 0, 30)
Critical.Image = "rbxassetid://2693717363"

ANTIAFK1.Name = "ANTIAFK1"
ANTIAFK1.Parent = Functions
ANTIAFK1.BackgroundColor3 = Color3.new(1, 1, 1)
ANTIAFK1.BackgroundTransparency = 0.80000001192093
ANTIAFK1.BorderColor3 = Color3.new(1, 1, 1)
ANTIAFK1.Position = UDim2.new(0.508277655, 0, 0.372162074, 0)
ANTIAFK1.Size = UDim2.new(0, 30, 0, 30)
ANTIAFK1.Image = "rbxassetid://2693719215"

Position1.Name = "Position1"
Position1.Parent = Functions
Position1.BackgroundColor3 = Color3.new(1, 1, 1)
Position1.BackgroundTransparency = 0.80000001192093
Position1.BorderColor3 = Color3.new(1, 1, 1)
Position1.Position = UDim2.new(0.508277655, 0, 0.577162087, 0)
Position1.Size = UDim2.new(0, 30, 0, 30)
Position1.Image = "rbxassetid://2693718031"

Position.Name = "Position"
Position.Parent = Functions
Position.BackgroundColor3 = Color3.new(1, 1, 1)
Position.BackgroundTransparency = 0.80000001192093
Position.Position = UDim2.new(0.634375036, 0, 0.577162147, 0)
Position.Size = UDim2.new(0, 80, 0, 30)
Position.Image = "rbxassetid://2693744721"

ANTIAFK.Name = "ANTIAFK"
ANTIAFK.Parent = Functions
ANTIAFK.BackgroundColor3 = Color3.new(1, 1, 1)
ANTIAFK.BackgroundTransparency = 0.80000001192093
ANTIAFK.Position = UDim2.new(0.634375036, 0, 0.372162133, 0)
ANTIAFK.Size = UDim2.new(0, 80, 0, 30)
ANTIAFK.Image = "rbxassetid://2693743959"

ALLABYLITES.Name = "ALLABYLITES"
ALLABYLITES.Parent = Functions
ALLABYLITES.BackgroundColor3 = Color3.new(1, 1, 1)
ALLABYLITES.BackgroundTransparency = 0.80000001192093
ALLABYLITES.Position = UDim2.new(0.634375036, 0, 0.177162141, 0)
ALLABYLITES.Size = UDim2.new(0, 80, 0, 30)
ALLABYLITES.Image = "rbxassetid://2693744114"

AUTOFARM1.Name = "AUTOFARM1"
AUTOFARM1.Parent = Functions
AUTOFARM1.BackgroundColor3 = Color3.new(1, 1, 1)
AUTOFARM1.BackgroundTransparency = 0.80000001192093
AUTOFARM1.BorderColor3 = Color3.new(1, 1, 1)
AUTOFARM1.Position = UDim2.new(-0.00109732151, 0, 0.577162087, 0)
AUTOFARM1.Size = UDim2.new(0, 30, 0, 30)
AUTOFARM1.Image = "rbxassetid://2693760136"

AUTOFARM.Name = "AUTOFARM"
AUTOFARM.Parent = Functions
AUTOFARM.BackgroundColor3 = Color3.new(1, 1, 1)
AUTOFARM.BackgroundTransparency = 0.80000001192093
AUTOFARM.Position = UDim2.new(0.12500006, 0, 0.577162147, 0)
AUTOFARM.Size = UDim2.new(0, 80, 0, 30)
AUTOFARM.Image = "rbxassetid://2693759850"

Box.Name = "Box"
Box.Parent = Functions
Box.BackgroundColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 0.80000001192093
Box.Position = UDim2.new(0.12500006, 0, 0.772162139, 0)
Box.Size = UDim2.new(0, 80, 0, 30)
Box.Image = "rbxassetid://2693774129"

MOBINBOX.Name = "MOB IN BOX"
MOBINBOX.Parent = Functions
MOBINBOX.BackgroundColor3 = Color3.new(1, 1, 1)
MOBINBOX.BackgroundTransparency = 0.80000001192093
MOBINBOX.BorderColor3 = Color3.new(1, 1, 1)
MOBINBOX.Position = UDim2.new(-0.00109732151, 0, 0.77216208, 0)
MOBINBOX.Size = UDim2.new(0, 30, 0, 30)
MOBINBOX.Image = "rbxassetid://2693773750"

InfStamina.Name = "InfStamina"
InfStamina.Parent = Functions
InfStamina.BackgroundColor3 = Color3.new(1, 1, 1)
InfStamina.BackgroundTransparency = 0.80000001192093
InfStamina.Position = UDim2.new(0.634375036, 0, 0.772162139, 0)
InfStamina.Size = UDim2.new(0, 80, 0, 30)
InfStamina.Image = "rbxassetid://2693820512"

Run_2.Name = "Run"
Run_2.Parent = Functions
Run_2.BackgroundColor3 = Color3.new(1, 1, 1)
Run_2.BackgroundTransparency = 0.80000001192093
Run_2.Position = UDim2.new(0.505152702, 0, 0.77216208, 0)
Run_2.Size = UDim2.new(0, 30, 0, 30)
Run_2.Image = "rbxassetid://2693643760"
Run_2.ImageColor3 = Color3.new(0, 0, 0)

Close.Name = "Close"
Close.Parent = _Kreeper_RUv31
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.934799671, 0, 0.948402941, 0)
Close.Size = UDim2.new(0, 70, 0, 30)
Close.Visible = false
Close.AutoButtonColor = false
Close.Image = "rbxassetid://2694024251"
-- Scripts:
--Opens
Close.MouseButton1Down:connect(function()
       Menu.Visible=false
       Open.Visible=true
       Close.Visible=false
end)

Open.MouseButton1Down:connect(function()
Menu.Visible=true
       Open.Visible=false
       Close.Visible=true
end)

OTP.MouseButton1Down:connect(function()
Menu.Visible=false
Teleports.Visible=true
end)

OF.MouseButton1Down:connect(function()
Menu.Visible=false
Functions.Visible=true
end)

Close1.MouseButton1Down:connect(function()
Menu.Visible=true
Teleports.Visible=false
end)

Close2.MouseButton1Down:connect(function()
Menu.Visible=true
Functions.Visible=false
end)

--Functions
MaxSpeed.MouseButton1Down:connect(function()
NormalSpeed.Visible=true
MaxSpeed.Visible=false
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 65
end)

NormalSpeed.MouseButton1Down:connect(function()
NormalSpeed.Visible=false
MaxSpeed.Visible=true
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

MaxJump.MouseButton1Down:connect(function()
NormalJump.Visible=true
MaxJump.Visible=false
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

NormalJump.MouseButton1Down:connect(function()
NormalJump.Visible=false
MaxJump.Visible=true
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

ALLABYLITES.MouseButton1Down:connect(function()
for i,v in pairs(game.ReplicatedStorage.Database.Skills:children()) do
if v:FindFirstChild("Class") then
   v.Class:Remove()
end
if v:FindFirstChild("Anytime") then
   v.Anytime:Remove()
end
if v:FindFirstChild("Cost") then
   v.Cost.Value = -999999999
end
if v:FindFirstChild("Cooldown") then
   v.Cooldown.Value = -999999999
end
if v:FindFirstChild("Level") then
   v.Level.Value = -999999999
end
end
end)

Position.MouseButton1Click:connect(function()
print(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
end)

ANTIAFK.MouseButton1Click:connect(function()
local getrawmetatable = getrawmetatable or debug.getmetatable
local make_writeable = make_writeable or setreadonly or changereadonly or change_writeable
make_writeable(getrawmetatable(game), false)
local backup = getrawmetatable(game).__namecall
getrawmetatable(game).__namecall = function(u, ...)
  local m = ({...})[select('#', ...)]
  local packed = {...}
  local a = {}
  for i = 1, #packed - 1 do
      a[i] = packed[i]
  end
  if m == 'Kick' then
      warn('Kick attempt at ' .. os.time() .. ' (' .. tostring(unpack(a)) .. ')')
      return true
  end
  return backup and backup(u, ...) or u[m](u, unpack(a))
end
end)

InfStamina.MouseButton1Down:connect(function()
local client = game:GetService("Players").LocalPlayer
while wait() do
if client.Character then
client.Character:WaitForChild("Entity").Stamina.Value = 100
end
end
end)

Box.MouseButton1Click:Connect(function()
for i,v in pairs(game.Workspace.Mobs:children()) do -- By Mortalkombatman2
if v:FindFirstChild("Head") then
v.HumanoidRootPart.Transparency = 0.5
v.HumanoidRootPart.Size = Vector3.new(30, 30, 30)
end
end
end)

AUTOFARM.MouseButton1Down:connect(function()
local Rawr = {}
local Api = {}
local Log = {}

local function Service(name)
return game:GetService(name)
end

local function SecondsToClock(seconds)
-- https://gist.github.com/jesseadams/791673
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00:00";
else
local hours = string.format("%02.f", math.floor(seconds/3600));
local mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
local secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return hours..":"..mins..":"..secs
end
end

function Log:Init()
local Profile = game:GetService("ReplicatedStorage").Profiles[Api.GetPlayer().Name]
local Vel = Profile.Stats.Vel
local LastVel = Vel.Value
Log.Earned = {
Vel = 0,
Items = {},
}
Profile.Inventory.ChildAdded:Connect(function(item)
table.insert(Log.Earned.Items, item.Name)
if(Api.GetSetting("auto_dismantle") == true)then
Api.Dismantle(item.Name)
end
end)
Vel.Changed:Connect(function()
local earn = Vel.Value - LastVel
LastVel = Vel.Value
Log.Earned.Vel = Log.Earned.Vel + earn
end)
end

function Log.Save()
Log.Earned.RunTime = SecondsToClock(tick()-Api.Start)
Synapse:WriteFile(tick() .. "_log.dat", game:GetService("HttpService"):JSONEncode(Log.Earned))
end

function Rawr:Check(...) --secret sauce
local player = Api.GetPlayer()
local character = Api.GetCharacter()
local args = {...}

if(character and character.PrimaryPart and args[1]:lower()=="cframe")then
--player.Character = Api.FakeCharacter
player.Character.RobloxLocked = true
wait(Api.GetSetting("rawr_bypass_speed"))
character:SetPrimaryPartCFrame(args[2])
wait(Api.GetSetting("rawr_bypass_speed"))
--player.Character = character
player.Character.RobloxLocked = false
end
end

function Api.GetPlayer()
return game:GetService("Players").LocalPlayer
end

function Api.Dismantle(name)
game.ReplicatedStorage.Event:FireServer("Equipment", {
"Dismantle",
game:GetService("ReplicatedStorage").Profiles[Api.GetPlayer().Name].Inventory[name]
})
end

function Api.Replicate(object)
local Model = Instance.new("Model")
Model.Name = object.Name
for index, child in pairs(object:GetChildren()) do
local c = child:Clone()
c.Parent = Model
end
if(object.PrimaryPart)then
Model.PrimaryPart = Model[object.PrimaryPart.Name]
end
return Model
end

function Api.GetCharacter()
return Api.Character or Api.GetPlayer().Character
end

function Api.GetEntity(model)
return model:FindFirstChild("Entity")
end

function Api.Settings(...)
Api.Settings = {}
for name, value in pairs(...) do
Api.Settings[name] = value
end
end

function Api.GetSetting(name)
return Api.Settings[name]
end

function Api.IsValid(model)
if(model.PrimaryPart and model:FindFirstChild("Entity") and model.Entity:FindFirstChild("Health") and model.Parent~=nil and model:FindFirstChild("Nameplate"))then
return true
end
end

function Api.GetPlayerDistances(model)
local localPlayer = Api.GetPlayer()
local distances = {}
for index, player in pairs(Service("Players"):GetChildren()) do
if(player~=localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and model:FindFirstChild("HumanoidRootPart"))then
distances[player.Name] = (model.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
end
end
return distances
end

function Api.CheckNear(monster)
if(Api.GetSetting("avoid_players_nearby")["Enabled"] == true)then
local max_distance = Api.GetSetting("avoid_players_nearby")["Distance"]
local distances = Api.GetPlayerDistances(monster)
for player, distance in pairs(distances)do
if(distance <= max_distance)then
return false
end
end
end
return true
end

function Api.CheckBlacklist(monster)
for index, blacklist in pairs(Api.Blacklist) do
if(monster == blacklist)then
return false
end
end
return true
end

function Api.GetMonsters()
local targets = {}
for index, monster in pairs(Service("Workspace").Mobs:GetChildren()) do
local entity = monster:FindFirstChildOfClass("Folder")
local filterApplied = false
local distanceCheck = Api.CheckNear(monster)
if(monster.PrimaryPart and Api.IsValid(monster) and distanceCheck and Api.CheckBlacklist(monster))then
if(Api.GetSetting("monster_filter")["Enabled"] == true)then
if(entity.Health.Value >= Api.GetSetting("monster_filter")["max_monster_health"] and entity.Exp.Value >= Api.GetSetting("monster_filter")["min_exp_earned"])then
table.insert(targets, monster)
end
filterApplied = true
elseif(Api.GetSetting("target_specific_enemy").Enabled == true)then
if(Api.GetSetting("target_specific_enemy").Names[monster.Nameplate.SurfaceGui.TextLabel.Text] == true)then
table.insert(targets, monster)
end
filterApplied = true
end
if(filterApplied == false)then
table.insert(targets, monster)
end
end
end
return targets
end

function Api:Connect()
local player = Api.GetPlayer()
local character = Api.GetCharacter()
local setupCharacter = function(character)
Api.FakeCharacter = Api.Replicate(character)
end

setupCharacter(character)
player.CharacterAdded:Connect(setupCharacter)
end

function Api:SetKeys()
game:GetService("UserInputService").InputBegan:connect(function(Key)
if(Key.KeyCode == Api.GetSetting("stop_key"))then
Api.Enabled = false
elseif(Key.KeyCode == Api.GetSetting("pause_key"))then
Api.Paused = true
elseif(Key.KeyCode == Api.GetSetting("unpause_key"))then
Api.Paused = false
end
end)
end

function Api:Init()
Api.Blacklist = {}
Api.Start = tick()
Api.Paused = false
Api.CanClick = false
Api.Enabled = true
wait(Api.GetSetting("StartDelay"))
spawn(function()
while wait(Api.GetSetting("click_break_speed")) and Api.Enabled do
if(Api.Paused == false and Api.CanClick == true)then
if(mouse1click)then
mouse1click()
end
else
wait()
end
end
end)
while wait() and Api.Enabled do
if(Api.Paused == false)then
for index, monster in pairs(Api.GetMonsters()) do
local distanceCheck = Api.CheckNear(monster)
if(distanceCheck and Api.IsValid(monster) and Api.Enabled)then -- recheck
Rawr:Check("CFrame", monster:GetPrimaryPartCFrame() * CFrame.new(0, 0, 3)) -- bypass
wait(Api.GetSetting("swap_monster_speed"))
local entity = Api.GetEntity(monster)
local base = entity.Health.Value
entity.Health.Changed:Connect(function()
if(entity.Health.Value == base)then
dontBreak = false
end
end)
dontBreak = true
local timer = 0
while dontBreak and Api.Enabled do
if(Api.Paused == false)then
local thisTime = wait()
wait(thisTime)
timer = timer + thisTime
if(timer >= Api.GetSetting("timeout")["time"])then
warn('Timeout exceeded!')
if(Api.GetSetting("timeout")["blacklist_monster_after_timeout"] == true)then
table.insert(Api.Blacklist, monster)
end
break
end
if(Api.IsValid(monster) and entity.Health.Value > 0)then
local character = Api.GetCharacter()
if(character)then
Api.CanClick = true
character:SetPrimaryPartCFrame(monster:GetPrimaryPartCFrame() * CFrame.new(0, 0, 3))
else
character = Api.GetCharacter()
if(character)then
Rawr:Check("CFrame", monster:GetPrimaryPartCFrame() * CFrame.new(0, 0, 3)) -- bypass
wait(Api.GetSetting("swap_monster_speed"))
end
end
else
Api.CanClick = false
break
end
else
wait()
end
end
wait(Api.GetSetting("swap_monster_speed"))
end
end
end
end
Log.Save()
end

Api.Settings({
["start_delay"] = 2,
["stop_key"] = Enum.KeyCode.Escape,
["pause_key"] = Enum.KeyCode.LeftControl,
["unpause_key"] = Enum.KeyCode.RightControl,
["rawr_bypass_speed"] = 0.5, -- 0.65
["swap_monster_speed"] = 0.2, -- 0.7,
["click_break_speed"] = .01,
["auto_dismantle"] = false,
["timeout"] = {
["time"] = 15,
["blacklist_monster_after_timeout"] = true
},
["monster_filter"] = {
["Enabled"] = false,
["max_monster_health"] = 0,
["min_exp_earned"] = 0,
},
["avoid_players_nearby"] = {
["Enabled"] = true,
["Distance"] = 200
},
["target_specific_enemy"] = {
["Enabled"] = false,
["Names"] = {
["Giant Ruins Hornet"] = false,
["Enraged Lingerer"] = true,
["Undead Berserker"] = true,
["Undead Warrior"] = true,
["Gargoyle Reaper"] = false,
["Mortis the Flaming Sear"] = false,
}
}
})

Api:SetKeys()
Api:Connect()
Log:Init()
Api:Init()
end)

--Teleports
F1B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-3059.16, -225, 1126.32))
end)

F2B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-2952.43, 116.3, -9375))
end)

F3B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-375.99, 4168.04, -694))
end)

F4B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-2380.2, 2153.35, -124.97))
end)

F5B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(2175.68872, 1250.95618, -388.3125))
end)


F7B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(3315.13281, 729.625977, -617.601624))
end)

F8B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1642, 4078, 7721))
end)

F9B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(12538, 430, -3165))
end)

F10B.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(111.694115, 930.560669, 23729.7676))
end)

F1M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new())
end)

F2M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new())
end)

F3M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new())
end)

F4M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-3087, 3163, -6509))
end)

F5M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1610.15137, 1463.90161, -4964.9126))
end)

F7M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(132.215118, 1232.08813, -208.806961))
end)

F8M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(12317, 430, -3505))
end)

F9M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-3451, 2800, -7762))
end)

F10M.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-88.9016495, 260.269806, 18107.625))
end)

PlayerName = tostring(game.Players.LocalPlayer.Name)