loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

ws_g = 20
disTeleport = 50

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/ESP.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Create%20GUI/Humanoid%20Teleport.lua"), true))()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))()

if cg:FindFirstChild("WorkoutIsland") then
	cg["WorkoutIsland"]:Destroy()
end
-- Gui to Lua
-- Version: 3.2

-- Instances:

local WorkoutIsland = Instance.new("ScreenGui")
local MainGUI = Instance.new("Frame")
local AutoStrength = Instance.new("Frame")
local StrengthFrameToggle = Instance.new("Frame")
local StrengthButtonToggle = Instance.new("TextButton")
local AutoStrengthText = Instance.new("TextLabel")
local AutoAttack = Instance.new("Frame")
local AttackFrameToggle = Instance.new("Frame")
local AttackButtonToggle = Instance.new("TextButton")
local AutoAttackText = Instance.new("TextLabel")
local AutoCoins = Instance.new("Frame")
local CoinFrameToggle = Instance.new("Frame")
local CoinButtonToggle = Instance.new("TextButton")
local CoinText = Instance.new("TextLabel")
local AutoBoss = Instance.new("Frame")
local BossFrameToggle = Instance.new("Frame")
local BossButtonToggle = Instance.new("TextButton")
local BossText = Instance.new("TextLabel")
local AutoAirdrop = Instance.new("Frame")
local AirdropFrameToggle = Instance.new("Frame")
local AirdropButtonToggle = Instance.new("TextButton")
local AirdropText = Instance.new("TextLabel")
local AutoGems = Instance.new("Frame")
local GemFrameToggle = Instance.new("Frame")
local GemButtonToggle = Instance.new("TextButton")
local GemText = Instance.new("TextLabel")
local AutoKing = Instance.new("Frame")
local KingFrameToggle = Instance.new("Frame")
local KingButtonToggle = Instance.new("TextButton")
local KingText = Instance.new("TextLabel")
local AutoSell = Instance.new("Frame")
local SellFrameToggle = Instance.new("Frame")
local SellButtonToggle = Instance.new("TextButton")
local SellText = Instance.new("TextLabel")
local AutoBuy = Instance.new("Frame")
local BuyFrameToggle = Instance.new("Frame")
local BuyButtonToggle = Instance.new("TextButton")
local BuyText = Instance.new("TextLabel")
local SellB = Instance.new("TextButton")
local ShopB = Instance.new("TextButton")
local ShopGemB = Instance.new("TextButton")
local ShopPetB = Instance.new("TextButton")
local SuperMarket = Instance.new("TextButton")
local ToggleB = Instance.new("TextLabel")

--Properties:

WorkoutIsland.Name = "WorkoutIsland"
WorkoutIsland.Parent = cg

MainGUI.Name = "MainGUI"
MainGUI.Parent = WorkoutIsland
MainGUI.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
MainGUI.Position = UDim2.new(0, 200, 0, 200)
MainGUI.Size = UDim2.new(0, 400, 0, 400)
MainGUI.Visible = true
MainGUI.Active = true
MainGUI.Draggable = true

AutoStrength.Name = "AutoStrength"
AutoStrength.Parent = MainGUI
AutoStrength.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoStrength.BorderSizePixel = 2
AutoStrength.Position = UDim2.new(0, 25, 0, 25)
AutoStrength.Size = UDim2.new(0, 100, 0, 50)

StrengthFrameToggle.Name = "StrengthFrameToggle"
StrengthFrameToggle.Parent = AutoStrength
StrengthFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
StrengthFrameToggle.Position = UDim2.new(0, 0, 0, 25)
StrengthFrameToggle.Size = UDim2.new(0, 100, 0, 25)

StrengthButtonToggle.Name = "StrengthButtonToggle"
StrengthButtonToggle.Parent = AutoStrength
StrengthButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
StrengthButtonToggle.BackgroundTransparency = 1.000
StrengthButtonToggle.BorderSizePixel = 7
StrengthButtonToggle.Size = UDim2.new(0, 100, 0, 50)
StrengthButtonToggle.Font = Enum.Font.SourceSans
StrengthButtonToggle.Text = ""
StrengthButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
StrengthButtonToggle.TextSize = 14.000

AutoStrengthText.Name = "AutoStrengthText"
AutoStrengthText.Parent = AutoStrength
AutoStrengthText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoStrengthText.BorderColor3 = Color3.fromRGB(27, 42, 53)
AutoStrengthText.Size = UDim2.new(0, 100, 0, 25)
AutoStrengthText.Font = Enum.Font.SourceSans
AutoStrengthText.Text = "Auto Farm Str"
AutoStrengthText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoStrengthText.TextSize = 14.000
AutoStrengthText.TextWrapped = true

AutoAttack.Name = "AutoAttack"
AutoAttack.Parent = MainGUI
AutoAttack.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoAttack.BorderSizePixel = 2
AutoAttack.Position = UDim2.new(0, 150, 0, 25)
AutoAttack.Size = UDim2.new(0, 100, 0, 50)

AttackFrameToggle.Name = "AttackFrameToggle"
AttackFrameToggle.Parent = AutoAttack
AttackFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
AttackFrameToggle.Position = UDim2.new(0, 0, 0, 25)
AttackFrameToggle.Size = UDim2.new(0, 100, 0, 25)

AttackButtonToggle.Name = "AttackButtonToggle"
AttackButtonToggle.Parent = AutoAttack
AttackButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AttackButtonToggle.BackgroundTransparency = 1.000
AttackButtonToggle.BorderSizePixel = 7
AttackButtonToggle.Size = UDim2.new(0, 100, 0, 50)
AttackButtonToggle.Font = Enum.Font.SourceSans
AttackButtonToggle.Text = ""
AttackButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
AttackButtonToggle.TextSize = 14.000

AutoAttackText.Name = "AutoAttackText"
AutoAttackText.Parent = AutoAttack
AutoAttackText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoAttackText.Size = UDim2.new(0, 100, 0, 25)
AutoAttackText.Font = Enum.Font.SourceSans
AutoAttackText.Text = "Auto Attack"
AutoAttackText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAttackText.TextSize = 14.000
AutoAttackText.TextWrapped = true

AutoCoins.Name = "AutoCoins"
AutoCoins.Parent = MainGUI
AutoCoins.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoCoins.BorderSizePixel = 2
AutoCoins.Position = UDim2.new(0, 275, 0, 25)
AutoCoins.Size = UDim2.new(0, 100, 0, 50)

CoinFrameToggle.Name = "CoinFrameToggle"
CoinFrameToggle.Parent = AutoCoins
CoinFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
CoinFrameToggle.Position = UDim2.new(0, 0, 0, 25)
CoinFrameToggle.Size = UDim2.new(0, 100, 0, 25)

CoinButtonToggle.Name = "CoinButtonToggle"
CoinButtonToggle.Parent = AutoCoins
CoinButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CoinButtonToggle.BackgroundTransparency = 1.000
CoinButtonToggle.BorderSizePixel = 7
CoinButtonToggle.Size = UDim2.new(0, 100, 0, 50)
CoinButtonToggle.Font = Enum.Font.SourceSans
CoinButtonToggle.Text = ""
CoinButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
CoinButtonToggle.TextSize = 14.000

CoinText.Name = "CoinText"
CoinText.Parent = AutoCoins
CoinText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
CoinText.Size = UDim2.new(0, 100, 0, 25)
CoinText.Font = Enum.Font.SourceSans
CoinText.Text = "Auto Farm Coins"
CoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
CoinText.TextSize = 14.000
CoinText.TextWrapped = true

AutoBoss.Name = "AutoBoss"
AutoBoss.Parent = MainGUI
AutoBoss.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoBoss.BorderSizePixel = 2
AutoBoss.Position = UDim2.new(0, 25, 0, 100)
AutoBoss.Size = UDim2.new(0, 100, 0, 50)

BossFrameToggle.Name = "BossFrameToggle"
BossFrameToggle.Parent = AutoBoss
BossFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
BossFrameToggle.Position = UDim2.new(0, 0, 0, 25)
BossFrameToggle.Size = UDim2.new(0, 100, 0, 25)

BossButtonToggle.Name = "BossButtonToggle"
BossButtonToggle.Parent = AutoBoss
BossButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BossButtonToggle.BackgroundTransparency = 1.000
BossButtonToggle.BorderSizePixel = 7
BossButtonToggle.Size = UDim2.new(0, 100, 0, 50)
BossButtonToggle.Font = Enum.Font.SourceSans
BossButtonToggle.Text = ""
BossButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
BossButtonToggle.TextSize = 14.000

BossText.Name = "BossText"
BossText.Parent = AutoBoss
BossText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
BossText.Size = UDim2.new(0, 100, 0, 25)
BossText.Font = Enum.Font.SourceSans
BossText.Text = "Auto Kill Boss"
BossText.TextColor3 = Color3.fromRGB(255, 255, 255)
BossText.TextSize = 14.000
BossText.TextWrapped = true

AutoAirdrop.Name = "AutoAirdrop"
AutoAirdrop.Parent = MainGUI
AutoAirdrop.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoAirdrop.BorderSizePixel = 2
AutoAirdrop.Position = UDim2.new(0, 150, 0, 100)
AutoAirdrop.Size = UDim2.new(0, 100, 0, 50)

AirdropFrameToggle.Name = "AirdropFrameToggle"
AirdropFrameToggle.Parent = AutoAirdrop
AirdropFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
AirdropFrameToggle.Position = UDim2.new(0, 0, 0, 25)
AirdropFrameToggle.Size = UDim2.new(0, 100, 0, 25)

AirdropButtonToggle.Name = "AirdropButtonToggle"
AirdropButtonToggle.Parent = AutoAirdrop
AirdropButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AirdropButtonToggle.BackgroundTransparency = 1.000
AirdropButtonToggle.BorderSizePixel = 7
AirdropButtonToggle.Size = UDim2.new(0, 100, 0, 50)
AirdropButtonToggle.Font = Enum.Font.SourceSans
AirdropButtonToggle.Text = ""
AirdropButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
AirdropButtonToggle.TextSize = 14.000

AirdropText.Name = "AirdropText"
AirdropText.Parent = AutoAirdrop
AirdropText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AirdropText.Size = UDim2.new(0, 100, 0, 25)
AirdropText.Font = Enum.Font.SourceSans
AirdropText.Text = "Auto Airdrop"
AirdropText.TextColor3 = Color3.fromRGB(255, 255, 255)
AirdropText.TextSize = 14.000
AirdropText.TextWrapped = true

AutoGems.Name = "AutoGems"
AutoGems.Parent = MainGUI
AutoGems.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoGems.BorderSizePixel = 2
AutoGems.Position = UDim2.new(0, 275, 0, 100)
AutoGems.Size = UDim2.new(0, 100, 0, 50)

GemFrameToggle.Name = "GemFrameToggle"
GemFrameToggle.Parent = AutoGems
GemFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
GemFrameToggle.Position = UDim2.new(0, 0, 0, 25)
GemFrameToggle.Size = UDim2.new(0, 100, 0, 25)

GemButtonToggle.Name = "GemButtonToggle"
GemButtonToggle.Parent = AutoGems
GemButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GemButtonToggle.BackgroundTransparency = 1.000
GemButtonToggle.BorderSizePixel = 7
GemButtonToggle.Size = UDim2.new(0, 100, 0, 50)
GemButtonToggle.Font = Enum.Font.SourceSans
GemButtonToggle.Text = ""
GemButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
GemButtonToggle.TextSize = 14.000

GemText.Name = "GemText"
GemText.Parent = AutoGems
GemText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
GemText.Size = UDim2.new(0, 100, 0, 25)
GemText.Font = Enum.Font.SourceSans
GemText.Text = "Auto Farm Gems"
GemText.TextColor3 = Color3.fromRGB(255, 255, 255)
GemText.TextSize = 14.000
GemText.TextWrapped = true

AutoKing.Name = "AutoKing"
AutoKing.Parent = MainGUI
AutoKing.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoKing.BorderSizePixel = 2
AutoKing.Position = UDim2.new(0, 25, 0, 175)
AutoKing.Size = UDim2.new(0, 100, 0, 50)

KingFrameToggle.Name = "KingFrameToggle"
KingFrameToggle.Parent = AutoKing
KingFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
KingFrameToggle.Position = UDim2.new(0, 0, 0, 25)
KingFrameToggle.Size = UDim2.new(0, 100, 0, 25)

KingButtonToggle.Name = "KingButtonToggle"
KingButtonToggle.Parent = AutoKing
KingButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KingButtonToggle.BackgroundTransparency = 1.000
KingButtonToggle.BorderSizePixel = 7
KingButtonToggle.Size = UDim2.new(0, 100, 0, 50)
KingButtonToggle.Font = Enum.Font.SourceSans
KingButtonToggle.Text = ""
KingButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
KingButtonToggle.TextSize = 14.000

KingText.Name = "KingText"
KingText.Parent = AutoKing
KingText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
KingText.Size = UDim2.new(0, 100, 0, 25)
KingText.Font = Enum.Font.SourceSans
KingText.Text = "Auto King"
KingText.TextColor3 = Color3.fromRGB(255, 255, 255)
KingText.TextSize = 14.000
KingText.TextWrapped = true

AutoSell.Name = "AutoSell"
AutoSell.Parent = MainGUI
AutoSell.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoSell.BorderSizePixel = 2
AutoSell.Position = UDim2.new(0, 150, 0, 175)
AutoSell.Size = UDim2.new(0, 100, 0, 50)

SellFrameToggle.Name = "SellFrameToggle"
SellFrameToggle.Parent = AutoSell
SellFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
SellFrameToggle.Position = UDim2.new(0, 0, 0, 25)
SellFrameToggle.Size = UDim2.new(0, 100, 0, 25)

SellButtonToggle.Name = "SellButtonToggle"
SellButtonToggle.Parent = AutoSell
SellButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SellButtonToggle.BackgroundTransparency = 1.000
SellButtonToggle.BorderSizePixel = 7
SellButtonToggle.Size = UDim2.new(0, 100, 0, 50)
SellButtonToggle.Font = Enum.Font.SourceSans
SellButtonToggle.Text = ""
SellButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
SellButtonToggle.TextSize = 14.000

SellText.Name = "SellText"
SellText.Parent = AutoSell
SellText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
SellText.Size = UDim2.new(0, 100, 0, 25)
SellText.Font = Enum.Font.SourceSans
SellText.Text = "Auto Sell"
SellText.TextColor3 = Color3.fromRGB(255, 255, 255)
SellText.TextSize = 14.000
SellText.TextWrapped = true

AutoBuy.Name = "AutoBuy"
AutoBuy.Parent = MainGUI
AutoBuy.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
AutoBuy.BorderSizePixel = 2
AutoBuy.Position = UDim2.new(0, 275, 0, 175)
AutoBuy.Size = UDim2.new(0, 100, 0, 50)

BuyFrameToggle.Name = "BuyFrameToggle"
BuyFrameToggle.Parent = AutoBuy
BuyFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
BuyFrameToggle.Position = UDim2.new(0, 0, 0, 25)
BuyFrameToggle.Size = UDim2.new(0, 100, 0, 25)

BuyButtonToggle.Name = "BuyButtonToggle"
BuyButtonToggle.Parent = AutoBuy
BuyButtonToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BuyButtonToggle.BackgroundTransparency = 1.000
BuyButtonToggle.BorderSizePixel = 7
BuyButtonToggle.Size = UDim2.new(0, 100, 0, 50)
BuyButtonToggle.Font = Enum.Font.SourceSans
BuyButtonToggle.Text = ""
BuyButtonToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
BuyButtonToggle.TextSize = 14.000

BuyText.Name = "BuyText"
BuyText.Parent = AutoBuy
BuyText.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
BuyText.Size = UDim2.new(0, 100, 0, 25)
BuyText.Font = Enum.Font.SourceSans
BuyText.Text = "Auto Buy"
BuyText.TextColor3 = Color3.fromRGB(255, 255, 255)
BuyText.TextSize = 14.000
BuyText.TextWrapped = true

SellB.Name = "SellB"
SellB.Parent = MainGUI
SellB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SellB.Position = UDim2.new(0, 25, 0, 250)
SellB.Size = UDim2.new(0, 100, 0, 25)
SellB.Style = Enum.ButtonStyle.RobloxRoundButton
SellB.Font = Enum.Font.SourceSans
SellB.Text = "Sell"
SellB.TextColor3 = Color3.fromRGB(255, 255, 255)
SellB.TextSize = 14.000

ShopB.Name = "ShopB"
ShopB.Parent = MainGUI
ShopB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShopB.Position = UDim2.new(0, 150, 0, 250)
ShopB.Size = UDim2.new(0, 100, 0, 25)
ShopB.Style = Enum.ButtonStyle.RobloxRoundButton
ShopB.Font = Enum.Font.SourceSans
ShopB.Text = "Shop"
ShopB.TextColor3 = Color3.fromRGB(255, 255, 255)
ShopB.TextSize = 14.000

ShopGemB.Name = "ShopGemB"
ShopGemB.Parent = MainGUI
ShopGemB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShopGemB.Position = UDim2.new(0, 275, 0, 250)
ShopGemB.Size = UDim2.new(0, 100, 0, 25)
ShopGemB.Style = Enum.ButtonStyle.RobloxRoundButton
ShopGemB.Font = Enum.Font.SourceSans
ShopGemB.Text = "Shop Gem"
ShopGemB.TextColor3 = Color3.fromRGB(255, 255, 255)
ShopGemB.TextSize = 14.000

ShopPetB.Name = "ShopPetB"
ShopPetB.Parent = MainGUI
ShopPetB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShopPetB.Position = UDim2.new(0, 25, 0, 300)
ShopPetB.Size = UDim2.new(0, 100, 0, 25)
ShopPetB.Style = Enum.ButtonStyle.RobloxRoundButton
ShopPetB.Font = Enum.Font.SourceSans
ShopPetB.Text = "Shop Pet"
ShopPetB.TextColor3 = Color3.fromRGB(255, 255, 255)
ShopPetB.TextSize = 14.000

SuperMarket.Name = "SuperMarket"
SuperMarket.Parent = MainGUI
SuperMarket.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SuperMarket.Position = UDim2.new(0, 150, 0, 300)
SuperMarket.Size = UDim2.new(0, 100, 0, 25)
SuperMarket.Style = Enum.ButtonStyle.RobloxRoundButton
SuperMarket.Font = Enum.Font.SourceSans
SuperMarket.Text = "Super Market"
SuperMarket.TextColor3 = Color3.fromRGB(255, 255, 255)
SuperMarket.TextSize = 14.000

ToggleB.Name = "ToggleB"
ToggleB.Parent = MainGUI
ToggleB.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
ToggleB.Position = UDim2.new(0, 0, 0, 375)
ToggleB.Size = UDim2.new(0, 400, 0, 25)
ToggleB.Font = Enum.Font.SourceSans
ToggleB.Text = "Nhan CTRL ben phai de ON | OFF GUI"
ToggleB.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleB.TextSize = 14.000
ToggleB.TextWrapped = true

-- Scripts:
local TGui = true
local TStr = false
local TAttack = false
local TFarmCoin = false
local TKillBoss = false
local TAirdrop = false
local HaveTAirdrop = false
local TFarmGem = false
local HaveTFarmGem = false
local TKing = false
local TSell = false
local TBuy = false

uis.InputBegan:connect(function(keyCode)
    if keyCode.keyCode == Enum.KeyCode.RightControl then
        if TGui then
            TGui = false
            MainGUI.Visible = false
        else
            TGui = true
            MainGUI.Visible = true
        end
    end
end)

StrengthButtonToggle.MouseButton1Down:connect(
	function()
		if TStr == false then
			TStr = true
			-- StrengthFrameToggle:TweenPosition(StrengthFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			StrengthFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TStr do
                wait()
                local Target = game:GetService("ReplicatedStorage").Remotes.LiftWeight;
                Target:FireServer();
            end
		else
			TStr = false
			-- StrengthFrameToggle:TweenPosition(StrengthFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			StrengthFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

AttackButtonToggle.MouseButton1Down:connect(
	function()
		if TAttack == false then
			TAttack = true
			-- AttackFrameToggle:TweenPosition(AttackFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			AttackFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TAttack do
                wait()
                local string_1 = "Punch";
                local number_1 = 1;
                local Target = game:GetService("ReplicatedStorage").Remotes.PVP.AttackAttempt;
                Target:FireServer(string_1, number_1);
                local string_1 = "Stomp";
                local Target = game:GetService("ReplicatedStorage").Remotes.PVP.AttackAttempt;
                Target:FireServer(string_1);
            end
		else
			TAttack = false
			-- AttackFrameToggle:TweenPosition(AttackFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			AttackFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

CoinButtonToggle.MouseButton1Down:connect(
	function()
		if TFarmCoin == false then
			TFarmCoin = true
			-- CoinFrameToggle:TweenPosition(CoinFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			CoinFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TFarmCoin do
                wait(.5)
                for _,v in pairs(wp.ConsumableSpawns:GetChildren()) do
                    v.Position = lplr.Character.HumanoidRootPart.Position
                end
            end
		else
			TFarmCoin = false
			-- CoinFrameToggle:TweenPosition(CoinFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			CoinFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

BossButtonToggle.MouseButton1Down:connect(
	function()
		if TKillBoss == false then
			TKillBoss = true
			-- BossFrameToggle:TweenPosition(BossFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			BossFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TKillBoss do
                wait(.1)
                for _,v in pairs(wp.BossModels:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") then
                        v.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame
                        v.HumanoidRootPart.Anchored = true
                    end
                end
            end
		else
			TKillBoss = false
			-- BossFrameToggle:TweenPosition(BossFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			BossFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

function funcCheckAirdrop()
	wp.Airdrops.ChildRemoved:connect(
		function(m)
			HaveTAirdrop = false
		end
	)
end
funcCheckAirdrop()

AirdropButtonToggle.MouseButton1Down:connect(
	function()
		if TAirdrop == false then
			TAirdrop = true
			-- AirdropFrameToggle:TweenPosition(AirdropFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			AirdropFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
			while TAirdrop do
				if wp.Airdrops:FindFirstChild("Airdrop") then
					HaveTAirdrop = true
					local Part = Instance.new("Part")
					Part.Name = "PartAirdrop"
					Part.Parent = wp
					Part.Size = Vector3.new(200, 1, 200)
					Part.CFrame = wp.Airdrops.Airdrop.Airdrop.Ring.CFrame * CFrame.new(0, 20000, 0)
					Part.Anchored = true
					PartBoss = Part
					lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 100, 0)
					wait(1)
					if Part ~= nil then
						Part:Destroy()
					end
				end
				wait()
			end
		else
			TAirdrop = false
			HaveTAirdrop = false
			-- AirdropFrameToggle:TweenPosition(AirdropFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			AirdropFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

GemButtonToggle.MouseButton1Down:connect(
	function()
		if TFarmGem == false then
			TFarmGem = true
			-- GemFrameToggle:TweenPosition(GemFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			GemFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TFarmGem do
                for _,v in pairs(wp.RingAreas.Territories:GetChildren()) do
                    -- MCLAWRENCQW3'S TERRITORY
                    -- game:GetService("Workspace").RingAreas.Territories.T2.Display.Title.Text
                    if TFarmGem == false then break end
                    if tostring(v.Display.Title.Text) ~= string.upper(lplr.Name) .. "'S TERRITORY" and HaveTAirdrop == false then
						HaveTFarmGem = true
                        local Part = Instance.new("Part")
                        Part.Name = "PartFarmGem"
                        Part.Parent = wp
                        Part.Size = Vector3.new(200, 1, 200)
                        if v.Name == "T5" then
                            Part.CFrame = v.CFrame * CFrame.new(0, 1000, 0)
                        else
                            Part.CFrame = v.CFrame * CFrame.new(0, 20000, 0)
                        end
                        Part.Anchored = true
                        lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 100, 0)
                        wait(1)
                        if Part ~= nil then
                            Part:Destroy()
                        end
					else
						HaveTFarmGem = false
                    end
                    wait()
                end
            end
		else
			TFarmGem = false
			HaveTFarmGem = false
			-- GemFrameToggle:TweenPosition(GemFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			GemFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

KingButtonToggle.MouseButton1Down:connect(
	function()
		if TKing == false then
			TKing = true
			-- KingFrameToggle:TweenPosition(KingFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			KingFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
			while TKing do
				if HaveTAirdrop == false and HaveTFarmGem == false then
					local Part = Instance.new("Part")
					Part.Name = "PartKillBoss"
					Part.Parent = wp
					Part.Size = Vector3.new(200, 1, 200)
					Part.CFrame = wp.RingAreas.RangeSystem.Server.KOTHArea.Ring.CFrame * CFrame.new(0, 20000, 0)
					Part.Anchored = true
					lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 100, 0)
					wait(1)
					if Part ~= nil then
						Part:Destroy()
					end
				end
				wait()
			end
		else
			TKing = false
			-- KingFrameToggle:TweenPosition(KingFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			KingFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

SellButtonToggle.MouseButton1Down:connect(
	function()
		if TSell == false then
			TSell = true
			-- SellFrameToggle:TweenPosition(SellFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			SellFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
            while TSell do
                if wait(10) or lplr.PlayerGui.UI.MaxStrengthHit.Visible then
                    local curentPosition = lplr.Character.HumanoidRootPart.CFrame
                    lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Server.Sell.Ring.CFrame * CFrame.new(0, 20000, 0)
                    wait(.5)
                    lplr.Character.HumanoidRootPart.CFrame = curentPosition
                end
				wait()
            end
		else
			TSell = false
			-- SellFrameToggle:TweenPosition(SellFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			SellFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

BuyButtonToggle.MouseButton1Down:connect(
	function()
		if TBuy == false then
			TBuy = true
			-- BuyFrameToggle:TweenPosition(BuyFrameToggle.Position + UDim2.new(.5,0,0,0),"In","Sine",.1)
			BuyFrameToggle.BackgroundColor3 = Color3.fromRGB(170, 255, 127)
		else
			TBuy = false
			-- BuyFrameToggle:TweenPosition(BuyFrameToggle.Position + UDim2.new(-.5,0,0,0),"In","Sine",.1)
			BuyFrameToggle.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
		end
	end
)

SellB.MouseButton1Down:connect(
	function()
		local curentPosition = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Server.Sell.Ring.CFrame * CFrame.new(0, 20000, 0)
        wait(.5)
        lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
	end
)

ShopB.MouseButton1Down:connect(
	function()
		local curentPosition = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Local.Shop.Ring.CFrame * CFrame.new(0, 20000, 0)
        wait(.5)
        lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
	end
)

ShopGemB.MouseButton1Down:connect(
	function()
		local curentPosition = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Local.GemShop.Ring.CFrame * CFrame.new(0, 20000, 0)
        wait(.5)
        lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
	end
)

ShopPetB.MouseButton1Down:connect(
	function()
		local curentPosition = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Local.EggShop.Ring.CFrame * CFrame.new(0, 20000, 0)
        wait(.5)
        lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
	end
)

SuperMarket.MouseButton1Down:connect(
	function()
		local curentPosition = lplr.Character.HumanoidRootPart.CFrame
        lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Local.ShrinkArea.Ring.CFrame
        wait(.1)
        lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
	end
)

function funAuto()
    while wait() do
        if wp.RingAreas.RangeSystem.Server.DailyReward.Ring.Tag.Title.Text == "00:00:00" then
            local curentPosition = lplr.Character.HumanoidRootPart.CFrame
            lplr.Character.HumanoidRootPart.CFrame = wp.RingAreas.RangeSystem.Server.DailyReward.Ring.CFrame * CFrame.new(0, 20000, 0)
            wait(.5)
            lplr.Character.HumanoidRootPart.CFrame = curentPosition * CFrame.new(0, 50, 0)
        end
	end
end
funAuto()
-- game:GetService("Workspace").Airdrops.Airdrop.Airdrop
-- game:GetService("Workspace").RingAreas.RangeSystem.Server.KOTHArea.Ring.Tag.Title.Text = "King: Contested", "King: BeeSwarmPro8502"
-- lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Local.Shop.Ring.CFrame * CFrame.new(0, 10000, 0)
-- lplr.Character.HumanoidRootPart.CFrame =  game:GetService("Workspace").RingAreas.RangeSystem.Local.PowerShop.Ring.CFrame --No add
-- game:GetService("Workspace").RingAreas.RangeSystem.Local.EggShop.Ring.CFrame
-- game:GetService("Workspace").RingAreas.RangeSystem.Local.Portal.Ring
-- game:GetService("Workspace").RingAreas.RangeSystem.Local.GemShop.Ring.CFrame
-- game:GetService("Workspace").RingAreas.RangeSystem.Local.ShrinkArea.Ring.CFrame --SuperMarket

-- local Part = Instance.new("Part")
-- Part.Name = "PartKillBoss"
-- Part.Parent = wp
-- Part.Size = Vector3.new(200, 1, 200)
-- Part.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
-- Part.Anchored = true
-- PartBoss = Part
-- lplr.Character.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 15, 0)
