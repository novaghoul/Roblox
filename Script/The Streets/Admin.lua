local gPlayers = game:GetService("Players")
local admin = gPlayers.LocalPlayer.Name
local bannedplyrs = {'PeopleYouHate','MorePeopleYouHate'}

local admins = {'Friend, Friend'} -- names here of people who have access to your commands! (Your name doesn't need to be in here.)

-- declare services / init stuff --

local services={}
local cmds={}
local std={}

local serverLocked = false

function FIX_LIGHTING()
game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
game.Lighting.Brightness = 1
game.Lighting.GlobalShadows = true
game.Lighting.Outlines = false
game.Lighting.TimeOfDay = 14
game.Lighting.FogEnd = 100000
end

services.players=gPlayers
services.lighting=game:GetService('Lighting')
services.workspace=game:GetService('Workspace')
services.events = {}
local user = gPlayers.LocalPlayer

local cmdprefix    = '!'
local scriptprefix = '/'
local split        = " "


updateevents=function()
for i,v in pairs(services.events) do services.events:remove(i) v:disconnect() end
for i,v in pairs(gPlayers:players())do
local ev = v.Chatted:connect(function(msg) do_exec(msg,v) end)
services.events[#services.events+1] = ev
end
end

std.inTable=function(tbl,val)
if tbl==nil then return false end

for _,v in pairs(tbl)do
if v==val then return true end
end 
return false
end

std.out=function(str)
print(str)
end

std.list=function(tbl) --turns table into list with commas
local str=''
for i,v in pairs(tbl)do
str=str..tostring(v)
if i~=#tbl then str=str..', ' end
end 
return str
end

std.endat=function(str,val)
local z=str:find(val)
if z then 
return str:sub(0,z-string.len(val)),true
else 
return str,false 
end
end

std.first=function(str) return str:sub(1,1) end

isAdmin=function(name)
if name==admin then
return true
elseif admins[name]==true then
return true
end
return false
end

gPlayers.PlayerAdded:connect(function(player)
for i,v in pairs(bannedplyrs) do
game.ReplicatedStorage.Event:FireServer("TPD", 2000, gPlayers[v].Character.Humanoid)
end
end)

local exec=function(str)
spawn(function()
local script, loaderr = loadstring(str)
if not script then
error(loaderr)
else
script()
end
end)
end

local findCmd=function(cmd_name)
for i,v in pairs(cmds)do
if v.NAME:lower()==cmd_name:lower() or std.inTable(v.ALIAS,cmd_name:lower())then
return v
end
end
end

local getCmd=function(msg)
local cmd,hassplit=std.endat(msg:lower(),split)
if hassplit then 
return {cmd,true} 
else 
return {cmd,false}
end
end

local getprfx=function(strn)
if strn:sub(1,string.len(cmdprefix))==cmdprefix then return{'cmd',string.len(cmdprefix)+1}
elseif strn:sub(1,string.len(scriptprefix))==scriptprefix then return{'exec',string.len(scriptprefix)+1}
end return
end

local getArgs=function(str)
local args={}
local new_arg=nil
local hassplit=nil
local s=str
repeat
new_arg,hassplit=std.endat(s:lower(),split)
if new_arg~='' then
args[#args+1]=new_arg
s=s:sub(string.len(new_arg)+string.len(split)+1)
end
until hassplit==false
return args
end

local function execCmd(str, plr)
local s_cmd
local a
local cmd
s_cmd = getCmd(str) --separate command from string using split {command name,arg bool (for arg system)}
cmd = findCmd(s_cmd[1]) --get command object {NAME,DESC,{ALIASES},function(args)}
if cmd == nil then return end
a = str:sub(string.len(s_cmd[1]) + string.len(split) + 1)--start string "a" after command and split
local args=getArgs(a)--gets us a nice table of arguments

pcall(function()
cmd.FUNC(args, plr)
end)
end

function do_exec(str,plr)
if not isAdmin(plr.Name)then return end 

str=str:gsub('/e ','')--remove "/e " the easy way!

local t=getprfx(str)
if t==nil then return end
str=str:sub(t[2])
if t[1]=='exec' then
exec(str)
elseif t[1]=='cmd' then
execCmd(str, plr)
end
end

updateevents()
_G.exec_cmd = execCmd
--game.Players.LocalPlayer.Chatted:connect(doexec)

local _char=function(plr_name)
for i,v in pairs(game.Players:GetChildren())do
if v:IsA'Player'then
if v.Name==plr_name then return v.Character end
end
end
return
end

local _plr=function(plr_name)
for i,v in pairs(game.Players:GetChildren())do
if v:IsA'Player'then
if v.Name==plr_name then return v end
end
end
return
end

function addcmd(name,desc,alias,func)
cmds[#cmds+1]=
{
NAME=name;
DESC=desc;
ALIAS=alias;
FUNC=func;
}
end

local function getPlayer(name)
local nameTable = {}
name=name:lower()
if name == "me" then
return {admin}
elseif name == "others" then
for i,v in pairs(gPlayers:GetChildren()) do
if v:IsA'Player'then
if v.Name~=admin then
nameTable[#nameTable+1]=v.Name
end
end
end
elseif name == "all" then
for i,v in pairs(gPlayers:GetChildren()) do
if v:IsA'Player'then 
nameTable[#nameTable+1]=v.Name
end
end
else
for i,v in pairs(gPlayers:GetChildren()) do
local lname = v.Name:lower()
local i,j = lname:find(name)
if i == 1 then
return {v.Name}
end
end
end
return nameTable
end

-- commands --

addcmd('Aspeed','Increases your attack speed',nil,
function(args)
    local player = game.Players.LocalPlayer
player.Backpack:WaitForChild("Punch").Info.Cooldown.Value = 0.01
player.Backpack.Punch.Info.AnimSpeed.Value = 5
player.Backpack:WaitForChild("Knife").Info.Cooldown.Value = 0.01
player.Backpack.Knife.Info.AnimSpeed.Value = 5
if game:GetService("MarketplaceService"):PlayerOwnsAsset(player, 503266657) then
player.Backpack:WaitForChild("Pipe").Info.Cooldown.Value = 0.01
player.Backpack.Pipe.Info.AnimSpeed.Value = 5
end
end)

addcmd('SpeedGui','Increases your attack speed',nil,
function(args)
plr = game.Players.LocalPlayer
local BoogaFucker = Instance.new("ScreenGui")
local BoogaFuckerPackageFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Brandname = Instance.new("TextLabel")
local Border = Instance.new("ImageLabel")
local Border_2 = Instance.new("ImageLabel")
local Border_3 = Instance.new("ImageLabel")
local Border_4 = Instance.new("ImageLabel")
local Border_5 = Instance.new("ImageLabel")
local Border_6 = Instance.new("ImageLabel")
local Border_7 = Instance.new("ImageLabel")
local Border_8 = Instance.new("ImageLabel")
local BackGround = Instance.new("Frame")
local Border_9 = Instance.new("Frame")
local ShadowBrandName = Instance.new("TextLabel")
local KeyBindsMain = Instance.new("Frame")
local Border_10 = Instance.new("ImageLabel")
local Border_11 = Instance.new("ImageLabel")
local Border_12 = Instance.new("ImageLabel")
local Border_13 = Instance.new("ImageLabel")
local Border_14 = Instance.new("ImageLabel")
local SpeedInstaDestroytext = Instance.new("TextLabel")
local Speedkeybindtextbox = Instance.new("TextBox")
local Keybindsname = Instance.new("TextLabel")
local ShadowKeybindsname = Instance.new("TextLabel")
local Dropallitemstext = Instance.new("TextLabel")
local Dropallitemskeybindtextbox = Instance.new("TextBox")
local Redtheme = Instance.new("TextButton")
local Pinktheme = Instance.new("TextButton")
local Bluetheme = Instance.new("TextButton")
local Autopickuptext = Instance.new("TextLabel")
local Dropallitemskeybindtextbox_2 = Instance.new("TextBox")
local Speed = Instance.new("TextButton")
local TextButton = Instance.new("Frame")
local CreditsMain = Instance.new("Frame")
local Border_15 = Instance.new("ImageLabel")
local Border_16 = Instance.new("ImageLabel")
local Border_17 = Instance.new("ImageLabel")
local Border_18 = Instance.new("ImageLabel")
local Border_19 = Instance.new("ImageLabel")
local Speedchangetext = Instance.new("TextLabel")
local Changespeedtextbox = Instance.new("TextBox")
local JumpPower = Instance.new("TextButton")
local TextButtonnoyou = Instance.new("Frame")
local JumpPowernumber = Instance.new("TextBox")
local Dropallitemstext_2 = Instance.new("TextButton")
local TextButtonyougey = Instance.new("Frame")
local Dropallinventorynumber = Instance.new("TextBox")
local KeybindsOpenClose = Instance.new("TextButton")
local InfiniteJump = Instance.new("TextButton")
local TextButton_2 = Instance.new("Frame")
local CreditsOpenClose = Instance.new("TextButton")
local esptrack = Instance.new("TextButton")
local TextButtonEsp = Instance.new("Frame")
local Removealleffects = Instance.new("TextButton")
local TextButtonRAE = Instance.new("Frame")
local AutoPickup = Instance.new("TextButton")
local TextButtonAP = Instance.new("Frame")
local StartFrame = Instance.new("Frame")
local StartHeaderBorder = Instance.new("Frame")
local StartFooterBorder = Instance.new("Frame")
local StartName = Instance.new("TextLabel")
local FREEbutton = Instance.new("TextButton")
local PREMIUMbutton = Instance.new("TextButton")
local StartMidBorder = Instance.new("Frame")
local StartRightBorder = Instance.new("Frame")
local StartLeftBorder = Instance.new("Frame")
local StartFreeText = Instance.new("TextLabel")
local StartPremiumText = Instance.new("TextLabel")
local StartName_2 = Instance.new("TextLabel")
local LoginFrame = Instance.new("Frame")
local LoginHeaderBorder = Instance.new("Frame")
local LoginFooterBorder = Instance.new("Frame")
local LoginName = Instance.new("TextLabel")
local LoginConfirm = Instance.new("TextButton")
local LoginRightBorder = Instance.new("Frame")
local LoginLeftBorder = Instance.new("Frame")
local LoginBackButton = Instance.new("TextButton")
local LoginUser = Instance.new("TextBox")
local LoginPass = Instance.new("TextBox")
local KeyBind = Instance.new("Frame")
local KeyBindFinishStartupButton = Instance.new("TextButton")
local KeyBindHeather = Instance.new("Frame")
local KeyBindStartupTextBox = Instance.new("TextBox")
local KeyBindSetupText = Instance.new("TextLabel")
local KeyBindName = Instance.new("TextLabel")

-- Properties

BoogaFucker.Name = "BoogaFucker"
BoogaFucker.Parent = plr.PlayerGui

BoogaFuckerPackageFrame.Name = "BoogaFucker PackageFrame"
BoogaFuckerPackageFrame.Parent = BoogaFucker
BoogaFuckerPackageFrame.Active = true
BoogaFuckerPackageFrame.BackgroundColor3 = Color3.new(1, 1, 0.921569)
BoogaFuckerPackageFrame.BackgroundTransparency = 1
BoogaFuckerPackageFrame.BorderSizePixel = 0
BoogaFuckerPackageFrame.Position = UDim2.new(0.63731128, -275, 0.766912699, -150)
BoogaFuckerPackageFrame.Selectable = true
BoogaFuckerPackageFrame.Size = UDim2.new(0, 550, 0, 300)
BoogaFuckerPackageFrame.ZIndex = 2
BoogaFuckerPackageFrame.Draggable = true

MainFrame.Name = "MainFrame"
MainFrame.Parent = BoogaFuckerPackageFrame
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.BorderSizePixel = 0
MainFrame.NextSelectionLeft = Border_3
MainFrame.Position = UDim2.new(0, 12, 0, 12)
MainFrame.Size = UDim2.new(1, -24, 1, -24)

Brandname.Name = "Brandname"
Brandname.Parent = MainFrame
Brandname.BackgroundColor3 = Color3.new(1, 1, 1)
Brandname.BackgroundTransparency = 1
Brandname.Position = UDim2.new(0.24809885, 0, -0.0217391308, 0)
Brandname.Size = UDim2.new(0.503802299, 0, 0.177536234, 0)
Brandname.ZIndex = 2
Brandname.Font = Enum.Font.SourceSansBold
Brandname.FontSize = Enum.FontSize.Size14
Brandname.Text = "THE STREETS"
Brandname.TextColor3 = Color3.new(1, 1, 1)
Brandname.TextScaled = true
Brandname.TextSize = 14
Brandname.TextStrokeTransparency = 0
Brandname.TextWrapped = true

Border.Name = "Border"
Border.Parent = MainFrame
Border.BackgroundColor3 = Color3.new(1, 1, 1)
Border.BackgroundTransparency = 1
Border.BorderSizePixel = 0
Border.Position = UDim2.new(1, 0, 0, 0)
Border.Size = UDim2.new(0, 12, 1, 0)
Border.Image = "http://www.roblox.com/asset/?id=238725003"
Border.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border.ImageRectOffset = Vector2.new(24, 12)
Border.ImageRectSize = Vector2.new(12, 12)

Border_2.Name = "Border"
Border_2.Parent = MainFrame
Border_2.BackgroundColor3 = Color3.new(1, 1, 1)
Border_2.BackgroundTransparency = 1
Border_2.BorderSizePixel = 0
Border_2.Position = UDim2.new(1, 0, 1, 0)
Border_2.Size = UDim2.new(0, 12, 0, 12)
Border_2.Image = "http://www.roblox.com/asset/?id=238725003"
Border_2.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_2.ImageRectOffset = Vector2.new(24, 24)
Border_2.ImageRectSize = Vector2.new(12, 12)

Border_3.Name = "Border"
Border_3.Parent = MainFrame
Border_3.BackgroundColor3 = Color3.new(1, 1, 1)
Border_3.BackgroundTransparency = 1
Border_3.BorderSizePixel = 0
Border_3.Position = UDim2.new(0, -12, 0, 0)
Border_3.Size = UDim2.new(0, 12, 1, 0)
Border_3.Image = "http://www.roblox.com/asset/?id=238725003"
Border_3.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_3.ImageRectOffset = Vector2.new(0, 12)
Border_3.ImageRectSize = Vector2.new(12, 12)

Border_4.Name = "Border"
Border_4.Parent = MainFrame
Border_4.BackgroundColor3 = Color3.new(1, 1, 1)
Border_4.BackgroundTransparency = 1
Border_4.BorderSizePixel = 0
Border_4.Position = UDim2.new(0, 0, 1, 0)
Border_4.Size = UDim2.new(1, 0, 0, 12)
Border_4.Image = "http://www.roblox.com/asset/?id=238725003"
Border_4.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_4.ImageRectOffset = Vector2.new(12, 24)
Border_4.ImageRectSize = Vector2.new(12, 12)

Border_5.Name = "Border"
Border_5.Parent = MainFrame
Border_5.BackgroundColor3 = Color3.new(1, 1, 1)
Border_5.BackgroundTransparency = 1
Border_5.BorderSizePixel = 0
Border_5.Position = UDim2.new(0, 0, 0, -12)
Border_5.Size = UDim2.new(1, 0, 0, 12)
Border_5.Image = "http://www.roblox.com/asset/?id=238725003"
Border_5.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_5.ImageRectOffset = Vector2.new(12, 0)
Border_5.ImageRectSize = Vector2.new(12, 12)

Border_6.Name = "Border"
Border_6.Parent = MainFrame
Border_6.BackgroundColor3 = Color3.new(1, 1, 1)
Border_6.BackgroundTransparency = 1
Border_6.BorderSizePixel = 0
Border_6.Position = UDim2.new(0, -12, 1, 0)
Border_6.Size = UDim2.new(0, 12, 0, 12)
Border_6.Image = "http://www.roblox.com/asset/?id=238725003"
Border_6.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_6.ImageRectOffset = Vector2.new(0, 24)
Border_6.ImageRectSize = Vector2.new(12, 12)

Border_7.Name = "Border"
Border_7.Parent = MainFrame
Border_7.BackgroundColor3 = Color3.new(1, 1, 1)
Border_7.BackgroundTransparency = 1
Border_7.BorderSizePixel = 0
Border_7.Position = UDim2.new(1, 0, 0, -12)
Border_7.Size = UDim2.new(0, 12, 0, 12)
Border_7.Image = "http://www.roblox.com/asset/?id=238725003"
Border_7.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_7.ImageRectOffset = Vector2.new(24, 0)
Border_7.ImageRectSize = Vector2.new(12, 12)

Border_8.Name = "Border"
Border_8.Parent = MainFrame
Border_8.BackgroundColor3 = Color3.new(1, 1, 1)
Border_8.BackgroundTransparency = 1
Border_8.BorderSizePixel = 0
Border_8.Position = UDim2.new(0, -12, 0, -12)
Border_8.Size = UDim2.new(0, 12, 0, 12)
Border_8.Image = "http://www.roblox.com/asset/?id=238725003"
Border_8.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_8.ImageRectSize = Vector2.new(12, 12)

BackGround.Name = "BackGround"
BackGround.Parent = MainFrame
BackGround.Active = true
BackGround.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
BackGround.BackgroundTransparency = 0.20000000298023
BackGround.BorderSizePixel = 0
BackGround.Size = UDim2.new(1, 0, 1, 0)

Border_9.Name = "Border"
Border_9.Parent = MainFrame
Border_9.Active = true
Border_9.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_9.BorderColor3 = Color3.new(0.129412, 0.129412, 0.129412)
Border_9.BorderSizePixel = 0
Border_9.Position = UDim2.new(0, 0, 0.155797094, 0)
Border_9.Size = UDim2.new(1, 0, 0.0507246368, 0)

ShadowBrandName.Name = "ShadowBrandName"
ShadowBrandName.Parent = MainFrame
ShadowBrandName.BackgroundColor3 = Color3.new(1, 1, 1)
ShadowBrandName.BackgroundTransparency = 1
ShadowBrandName.Position = UDim2.new(0.281368822, 0, -0.0434782617, 0)
ShadowBrandName.Size = UDim2.new(0.437262356, 0, 0.19927536, 0)
ShadowBrandName.Font = Enum.Font.SourceSansBold
ShadowBrandName.FontSize = Enum.FontSize.Size14
ShadowBrandName.Text = "BoogaFucker"
ShadowBrandName.TextColor3 = Color3.new(0, 0, 0)
ShadowBrandName.TextScaled = true
ShadowBrandName.TextSize = 14
ShadowBrandName.TextStrokeTransparency = 0
ShadowBrandName.TextWrapped = true

KeyBindsMain.Name = "KeyBindsMain"
KeyBindsMain.Parent = MainFrame
KeyBindsMain.Active = true
KeyBindsMain.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
KeyBindsMain.BackgroundTransparency = 0.20000000298023
KeyBindsMain.BorderSizePixel = 0
KeyBindsMain.Position = UDim2.new(-0.370722443, 0, 0, 0)
KeyBindsMain.Size = UDim2.new(0.347908735, 0, 1, 0)

Border_10.Name = "Border"
Border_10.Parent = KeyBindsMain
Border_10.BackgroundColor3 = Color3.new(1, 1, 1)
Border_10.BackgroundTransparency = 1
Border_10.BorderSizePixel = 0
Border_10.Position = UDim2.new(0, 0, 0, -12)
Border_10.Size = UDim2.new(1.06557381, 0, 0, 12)
Border_10.Image = "http://www.roblox.com/asset/?id=238725003"
Border_10.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_10.ImageRectOffset = Vector2.new(12, 0)
Border_10.ImageRectSize = Vector2.new(12, 12)

Border_11.Name = "Border"
Border_11.Parent = KeyBindsMain
Border_11.BackgroundColor3 = Color3.new(1, 1, 1)
Border_11.BackgroundTransparency = 1
Border_11.BorderSizePixel = 0
Border_11.Position = UDim2.new(0, -12, 0, -12)
Border_11.Size = UDim2.new(0, 12, 0, 12)
Border_11.Image = "http://www.roblox.com/asset/?id=238725003"
Border_11.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_11.ImageRectSize = Vector2.new(12, 12)

Border_12.Name = "Border"
Border_12.Parent = KeyBindsMain
Border_12.BackgroundColor3 = Color3.new(1, 1, 1)
Border_12.BackgroundTransparency = 1
Border_12.BorderSizePixel = 0
Border_12.Position = UDim2.new(0, -12, 0, 0)
Border_12.Size = UDim2.new(0, 12, 1, 0)
Border_12.Image = "http://www.roblox.com/asset/?id=238725003"
Border_12.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_12.ImageRectOffset = Vector2.new(0, 12)
Border_12.ImageRectSize = Vector2.new(12, 12)

Border_13.Name = "Border"
Border_13.Parent = KeyBindsMain
Border_13.BackgroundColor3 = Color3.new(1, 1, 1)
Border_13.BackgroundTransparency = 1
Border_13.BorderSizePixel = 0
Border_13.Position = UDim2.new(0, -12, 1, 0)
Border_13.Size = UDim2.new(0, 12, 0, 12)
Border_13.Image = "http://www.roblox.com/asset/?id=238725003"
Border_13.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_13.ImageRectOffset = Vector2.new(0, 24)
Border_13.ImageRectSize = Vector2.new(12, 12)

Border_14.Name = "Border"
Border_14.Parent = KeyBindsMain
Border_14.BackgroundColor3 = Color3.new(1, 1, 1)
Border_14.BackgroundTransparency = 1
Border_14.BorderSizePixel = 0
Border_14.Position = UDim2.new(0, 0, 0, 276)
Border_14.Size = UDim2.new(1.06557381, 0, 0, 12)
Border_14.Image = "http://www.roblox.com/asset/?id=238725003"
Border_14.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_14.ImageRectOffset = Vector2.new(12, 0)
Border_14.ImageRectSize = Vector2.new(12, 12)

SpeedInstaDestroytext.Name = "Speed | Insta Destroy text"
SpeedInstaDestroytext.Parent = KeyBindsMain
SpeedInstaDestroytext.BackgroundColor3 = Color3.new(1, 1, 1)
SpeedInstaDestroytext.BackgroundTransparency = 1
SpeedInstaDestroytext.Position = UDim2.new(0.0437158458, 0, 0.173913032, 0)
SpeedInstaDestroytext.Size = UDim2.new(0.907103837, 0, 0.112318844, 0)
SpeedInstaDestroytext.ZIndex = 2
SpeedInstaDestroytext.Font = Enum.Font.SourceSansBold
SpeedInstaDestroytext.FontSize = Enum.FontSize.Size24
SpeedInstaDestroytext.Text = "speed"
SpeedInstaDestroytext.TextColor3 = Color3.new(1, 1, 1)
SpeedInstaDestroytext.TextSize = 20
SpeedInstaDestroytext.TextStrokeTransparency = 0
SpeedInstaDestroytext.TextWrapped = true

Speedkeybindtextbox.Name = "Speed keybind textbox"
Speedkeybindtextbox.Parent = KeyBindsMain
Speedkeybindtextbox.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Speedkeybindtextbox.Position = UDim2.new(0.0491803288, 0, 0.318840593, 0)
Speedkeybindtextbox.Selectable = false
Speedkeybindtextbox.Size = UDim2.new(0, 165, 0, 23)
Speedkeybindtextbox.Font = Enum.Font.SourceSans
Speedkeybindtextbox.FontSize = Enum.FontSize.Size24
Speedkeybindtextbox.Text = "q"
Speedkeybindtextbox.TextColor3 = Color3.new(1, 1, 1)
Speedkeybindtextbox.TextScaled = true
Speedkeybindtextbox.TextSize = 20
Speedkeybindtextbox.TextWrapped = true

Keybindsname.Name = "Keybindsname"
Keybindsname.Parent = KeyBindsMain
Keybindsname.BackgroundColor3 = Color3.new(1, 1, 1)
Keybindsname.BackgroundTransparency = 1
Keybindsname.Position = UDim2.new(0.0765027329, 0, 0.0108695654, 0)
Keybindsname.Size = UDim2.new(0.841530025, 0, 0.177536234, 0)
Keybindsname.ZIndex = 2
Keybindsname.Font = Enum.Font.SourceSansBold
Keybindsname.FontSize = Enum.FontSize.Size14
Keybindsname.Text = "Keybinds"
Keybindsname.TextColor3 = Color3.new(1, 1, 1)
Keybindsname.TextScaled = true
Keybindsname.TextSize = 14
Keybindsname.TextStrokeTransparency = 0
Keybindsname.TextWrapped = true

ShadowKeybindsname.Name = "ShadowKeybindsname"
ShadowKeybindsname.Parent = KeyBindsMain
ShadowKeybindsname.BackgroundColor3 = Color3.new(1, 1, 1)
ShadowKeybindsname.BackgroundTransparency = 1
ShadowKeybindsname.Position = UDim2.new(0.114754096, 0, 0.0108695654, 0)
ShadowKeybindsname.Size = UDim2.new(0.83606559, 0, 0.177536234, 0)
ShadowKeybindsname.Font = Enum.Font.SourceSansBold
ShadowKeybindsname.FontSize = Enum.FontSize.Size14
ShadowKeybindsname.Text = "Keybinds"
ShadowKeybindsname.TextColor3 = Color3.new(0, 0, 0)
ShadowKeybindsname.TextScaled = true
ShadowKeybindsname.TextSize = 14
ShadowKeybindsname.TextStrokeTransparency = 0
ShadowKeybindsname.TextWrapped = true

Dropallitemstext.Name = "Drop all items text"
Dropallitemstext.Parent = KeyBindsMain
Dropallitemstext.BackgroundColor3 = Color3.new(1, 1, 1)
Dropallitemstext.BackgroundTransparency = 1
Dropallitemstext.Position = UDim2.new(0.0491803251, 0, 0.432971001, 0)
Dropallitemstext.Size = UDim2.new(0.907103837, 0, 0.112318844, 0)
Dropallitemstext.ZIndex = 2
Dropallitemstext.Font = Enum.Font.SourceSansBold
Dropallitemstext.FontSize = Enum.FontSize.Size24
Dropallitemstext.Text = "Drop all items"
Dropallitemstext.TextColor3 = Color3.new(1, 1, 1)
Dropallitemstext.TextSize = 20
Dropallitemstext.TextStrokeTransparency = 0
Dropallitemstext.TextWrapped = true

Dropallitemskeybindtextbox.Name = "Drop all items keybind textbox"
Dropallitemskeybindtextbox.Parent = KeyBindsMain
Dropallitemskeybindtextbox.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Dropallitemskeybindtextbox.Position = UDim2.new(0.0464480855, 0, 0.577898502, 0)
Dropallitemskeybindtextbox.Selectable = false
Dropallitemskeybindtextbox.Size = UDim2.new(0, 166, 0, 23)
Dropallitemskeybindtextbox.Font = Enum.Font.SourceSans
Dropallitemskeybindtextbox.FontSize = Enum.FontSize.Size24
Dropallitemskeybindtextbox.Text = "h"
Dropallitemskeybindtextbox.TextColor3 = Color3.new(1, 1, 1)
Dropallitemskeybindtextbox.TextScaled = true
Dropallitemskeybindtextbox.TextSize = 20
Dropallitemskeybindtextbox.TextWrapped = true

Redtheme.Name = "Red theme"
Redtheme.Parent = KeyBindsMain
Redtheme.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Redtheme.BackgroundTransparency = 0.60000002384186
Redtheme.BorderSizePixel = 0
Redtheme.Position = UDim2.new(0.0491803065, 0, 0.884057999, 0)
Redtheme.Size = UDim2.new(0, 37, 0, 24)
Redtheme.ZIndex = 2
Redtheme.Font = Enum.Font.SourceSansBold
Redtheme.FontSize = Enum.FontSize.Size24
Redtheme.Text = "Red"
Redtheme.TextColor3 = Color3.new(1, 1, 1)
Redtheme.TextScaled = true
Redtheme.TextSize = 20
Redtheme.TextWrapped = true
Redtheme.MouseButton1Down:connect(function()
BackGround.BackgroundColor3 = Color3.fromRGB(246,16,16)
KeyBindsMain.BackgroundColor3 = Color3.fromRGB(246,16,16)
CreditsMain.BackgroundColor3 = Color3.fromRGB(246,16,16)
end)

Pinktheme.Name = "Pink theme"
Pinktheme.Parent = KeyBindsMain
Pinktheme.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Pinktheme.BackgroundTransparency = 0.60000002384186
Pinktheme.BorderSizePixel = 0
Pinktheme.Position = UDim2.new(0.748633862, 0, 0.884057999, 0)
Pinktheme.Size = UDim2.new(0, 37, 0, 24)
Pinktheme.ZIndex = 2
Pinktheme.Font = Enum.Font.SourceSansBold
Pinktheme.FontSize = Enum.FontSize.Size24
Pinktheme.Text = "Pink"
Pinktheme.TextColor3 = Color3.new(1, 1, 1)
Pinktheme.TextScaled = true
Pinktheme.TextSize = 20
Pinktheme.TextWrapped = true
Pinktheme.MouseButton1Down:connect(function()
BackGround.BackgroundColor3 = Color3.fromRGB(247,0,255)
KeyBindsMain.BackgroundColor3 = Color3.fromRGB(247,0,255)
CreditsMain.BackgroundColor3 = Color3.fromRGB(247,0,255)
end)

Bluetheme.Name = "Blue theme"
Bluetheme.Parent = KeyBindsMain
Bluetheme.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Bluetheme.BackgroundTransparency = 0.60000002384186
Bluetheme.BorderSizePixel = 0
Bluetheme.Position = UDim2.new(0.396174848, 0, 0.884057999, 0)
Bluetheme.Size = UDim2.new(0, 37, 0, 24)
Bluetheme.ZIndex = 2
Bluetheme.Font = Enum.Font.SourceSansBold
Bluetheme.FontSize = Enum.FontSize.Size24
Bluetheme.Text = "Blue"
Bluetheme.TextColor3 = Color3.new(1, 1, 1)
Bluetheme.TextScaled = true
Bluetheme.TextSize = 20
Bluetheme.TextWrapped = true
Bluetheme.MouseButton1Down:connect(function()
BackGround.BackgroundColor3 = Color3.fromRGB(0,34,255)
KeyBindsMain.BackgroundColor3 = Color3.fromRGB(0,34,255)
CreditsMain.BackgroundColor3 = Color3.fromRGB(0,34,255)
end)

Autopickuptext.Name = "Auto pickup text"
Autopickuptext.Parent = KeyBindsMain
Autopickuptext.BackgroundColor3 = Color3.new(1, 1, 1)
Autopickuptext.BackgroundTransparency = 1
Autopickuptext.Position = UDim2.new(0.0437158458, 0, 0.661231875, 0)
Autopickuptext.Size = UDim2.new(0.907103837, 0, 0.112318844, 0)
Autopickuptext.ZIndex = 2
Autopickuptext.Font = Enum.Font.SourceSansBold
Autopickuptext.FontSize = Enum.FontSize.Size24
Autopickuptext.Text = "AUTO PIPE"
Autopickuptext.TextColor3 = Color3.new(1, 1, 1)
Autopickuptext.TextSize = 20
Autopickuptext.TextStrokeTransparency = 0
Autopickuptext.TextWrapped = true

Dropallitemskeybindtextbox_2.Name = "Drop all items keybind textbox"
Dropallitemskeybindtextbox_2.Parent = KeyBindsMain
Dropallitemskeybindtextbox_2.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Dropallitemskeybindtextbox_2.Position = UDim2.new(0.0409836061, 0, 0.773550689, 0)
Dropallitemskeybindtextbox_2.Selectable = false
Dropallitemskeybindtextbox_2.Size = UDim2.new(0, 166, 0, 23)
Dropallitemskeybindtextbox_2.Font = Enum.Font.SourceSans
Dropallitemskeybindtextbox_2.FontSize = Enum.FontSize.Size24
Dropallitemskeybindtextbox_2.Text = "y"
Dropallitemskeybindtextbox_2.TextColor3 = Color3.new(1, 1, 1)
Dropallitemskeybindtextbox_2.TextScaled = true
Dropallitemskeybindtextbox_2.TextSize = 20
Dropallitemskeybindtextbox_2.TextWrapped = true

Speed.Name = "Speed"
Speed.Parent = MainFrame
Speed.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0.674904943, -350, 0.137681156, 25)
Speed.Size = UDim2.new(0, 126, 0, 39)
Speed.ZIndex = 2
Speed.Font = Enum.Font.SourceSansBold
Speed.FontSize = Enum.FontSize.Size28
Speed.Text = "Speed"
Speed.TextColor3 = Color3.new(1, 1, 1)
Speed.TextSize = 25
Speed.TextWrapped = true

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local hum = char:FindFirstChild("HumanoidRootPart")

Speed.MouseButton1Down:connect(function()
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local hum = char:FindFirstChild("HumanoidRootPart")
mouse.KeyDown:connect(function(key)
if key == Speedkeybindtextbox.Text then
    loop = true
    while loop do
        hum.CFrame = hum.CFrame + hum.CFrame.lookVector * Changespeedtextbox.Text
        wait()
    end
    end
    end)
end)

mouse.KeyUp:connect(function(key)
if key == Speedkeybindtextbox.Text then
    loop = false
end
end)

TextButton.Name = "TextButton"
TextButton.Parent = Speed
TextButton.Active = true
TextButton.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0130000003, 0, 0.0500000007, 0)
TextButton.Size = UDim2.new(1, 0, 1, 0)

CreditsMain.Name = "CreditsMain"
CreditsMain.Parent = MainFrame
CreditsMain.Active = true
CreditsMain.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
CreditsMain.BackgroundTransparency = 0.20000000298023
CreditsMain.BorderSizePixel = 0
CreditsMain.Position = UDim2.new(1.02281368, 0, 0, 0)
CreditsMain.Size = UDim2.new(0.347908735, 0, 1, 0)

Border_15.Name = "Border"
Border_15.Parent = CreditsMain
Border_15.BackgroundColor3 = Color3.new(1, 1, 1)
Border_15.BackgroundTransparency = 1
Border_15.BorderSizePixel = 0
Border_15.Position = UDim2.new(0, -12, 0, -12)
Border_15.Size = UDim2.new(1.06557381, 0, 0, 12)
Border_15.Image = "http://www.roblox.com/asset/?id=238725003"
Border_15.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_15.ImageRectOffset = Vector2.new(12, 0)
Border_15.ImageRectSize = Vector2.new(12, 12)

Border_16.Name = "Border"
Border_16.Parent = CreditsMain
Border_16.BackgroundColor3 = Color3.new(1, 1, 1)
Border_16.BackgroundTransparency = 1
Border_16.BorderSizePixel = 0
Border_16.Position = UDim2.new(0, -12, 0, 276)
Border_16.Size = UDim2.new(1.06557381, 0, 0, 12)
Border_16.Image = "http://www.roblox.com/asset/?id=238725003"
Border_16.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_16.ImageRectOffset = Vector2.new(12, 0)
Border_16.ImageRectSize = Vector2.new(12, 12)

Border_17.Name = "Border"
Border_17.Parent = CreditsMain
Border_17.BackgroundColor3 = Color3.new(1, 1, 1)
Border_17.BackgroundTransparency = 1
Border_17.BorderSizePixel = 0
Border_17.Position = UDim2.new(1, 0, 1, 0)
Border_17.Size = UDim2.new(0, 12, 0, 12)
Border_17.Image = "http://www.roblox.com/asset/?id=238725003"
Border_17.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_17.ImageRectOffset = Vector2.new(24, 24)
Border_17.ImageRectSize = Vector2.new(12, 12)

Border_18.Name = "Border"
Border_18.Parent = CreditsMain
Border_18.BackgroundColor3 = Color3.new(1, 1, 1)
Border_18.BackgroundTransparency = 1
Border_18.BorderSizePixel = 0
Border_18.Position = UDim2.new(1, 0, 0, -12)
Border_18.Size = UDim2.new(0, 12, 0, 12)
Border_18.Image = "http://www.roblox.com/asset/?id=238725003"
Border_18.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_18.ImageRectOffset = Vector2.new(24, 0)
Border_18.ImageRectSize = Vector2.new(12, 12)

Border_19.Name = "Border"
Border_19.Parent = CreditsMain
Border_19.BackgroundColor3 = Color3.new(1, 1, 1)
Border_19.BackgroundTransparency = 1
Border_19.BorderSizePixel = 0
Border_19.Position = UDim2.new(0, 183, 0, 0)
Border_19.Size = UDim2.new(0, 12, 1, 0)
Border_19.Image = "http://www.roblox.com/asset/?id=238725003"
Border_19.ImageColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Border_19.ImageRectOffset = Vector2.new(0, 12)
Border_19.ImageRectSize = Vector2.new(12, 12)

Speedchangetext.Name = "Speed change text"
Speedchangetext.Parent = CreditsMain
Speedchangetext.BackgroundColor3 = Color3.new(1, 1, 1)
Speedchangetext.BackgroundTransparency = 1
Speedchangetext.Position = UDim2.new(0.0983606577, 0, 0.612318814, 0)
Speedchangetext.Size = UDim2.new(0.808743179, 0, 0.144927531, 0)
Speedchangetext.ZIndex = 2
Speedchangetext.Font = Enum.Font.SourceSansBold
Speedchangetext.FontSize = Enum.FontSize.Size14
Speedchangetext.Text = "Change speed number"
Speedchangetext.TextColor3 = Color3.new(1, 1, 1)
Speedchangetext.TextScaled = true
Speedchangetext.TextSize = 14
Speedchangetext.TextStrokeTransparency = 0
Speedchangetext.TextWrapped = true

Changespeedtextbox.Name = "Change speed textbox"
Changespeedtextbox.Parent = CreditsMain
Changespeedtextbox.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
Changespeedtextbox.BackgroundTransparency = 0.60000002384186
Changespeedtextbox.Position = UDim2.new(0.338454872, 0, 0.788043499, 0)
Changespeedtextbox.Selectable = false
Changespeedtextbox.Size = UDim2.new(0, 59, 0, 20)
Changespeedtextbox.Font = Enum.Font.SourceSans
Changespeedtextbox.FontSize = Enum.FontSize.Size14
Changespeedtextbox.Text = "3"
Changespeedtextbox.TextColor3 = Color3.new(1, 1, 1)
Changespeedtextbox.TextSize = 14        
end)

addcmd('RadioGlitch','Invis Radio',nil,
function(args)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(" [Rares ]Play a code before using this, otherwise reset to change the code or redo this method!" ,"All")
game.Players.LocalPlayer.Character.BoomBox.Server:Destroy()
end)

addcmd('Legend','Animation..',nil,
function(args)
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.walk:GetChildren()) do
v.AnimationId = 'rbxassetid://553240602'
end 
end)

addcmd('Backflip','Animation..',nil,
function(args)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(" [Rares] To backflip, JUMP!" ,"All")
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.jump:GetChildren()) do
v.AnimationId = 'rbxassetid://229782914'
end 
end)

addcmd('Dog','Animation..',nil,
function(args)
game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId="rbxassetid://948444869"
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.jump:GetChildren()) do
v.AnimationId = 'rbxassetid://948442744'
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.idle:GetChildren()) do
v.AnimationId = 'rbxassetid://948442744'
end
end
end)

addcmd('911','Animation..',nil,
function(args)
        game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId="rbxassetid://1316487271"
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.jump:GetChildren()) do
v.AnimationId = 'rbxassetid://1316487271'
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.idle:GetChildren()) do
v.AnimationId = 'rbxassetid://1316487271'
end
end
end)

addcmd('God','Animation..',nil,
function(args)
        game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId="rbxassetid://1316478145"
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.jump:GetChildren()) do
v.AnimationId = 'rbxassetid://451686028'
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.idle:GetChildren()) do
v.AnimationId = 'rbxassetid://448026591'
end
end
end)

addcmd('ResetAnim','Animation..',nil,
function(args)
        game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId="rbxassetid://180426354"
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.jump:GetChildren()) do
v.AnimationId = 'rbxassetid://125750702'
for _,v in pairs(game.Players.LocalPlayer.Character.Animate.idle:GetChildren()) do
v.AnimationId = 'rbxassetid://180435571'
end
end
end)