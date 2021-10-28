-- Variables --

local Script = "Sphynx"
local gFont = "SourceSans"
local Visi = true

-- Functions -- 

function Log(text, r, g, b, font)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "{" .. tostring(Script) .. "} - " .. text;
    Color = Color3.new(r, g, b);
    Font = Enum.Font[font];
    FontSize = Enum.FontSize.Size10;
    })
end

function CheckForExistingUI()
	for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
		if v.Name == "UILibrary" then
			v:Destroy()
		elseif v.Name == "RobloxLoadingGui" then
			v:Destroy()
		end
	end
end

function Visible(Status)
	for i,v in pairs(game:GetService("CoreGui").UILibrary:GetChildren()) do
		v.Visible = Status
	end
end

-- Init Script -- 

Log("Initiating Sphynx", 0,255,255, tostring(gFont))

Log("Checking Roblox...", 0,255,255, tostring(gFont))
CheckForExistingUI()
Log("Successfully Checked Roblox!", 0, 255, 0, tostring(gFont))

Log("Loading framework...", 0,255,255, tostring(gFont))
local library = loadstring(game:HttpGet("https://itaintmyfault.000webhostapp.com/WFW", true))()
Log("Loaded framework successfully!", 0, 255, 0, tostring(gFont))

-- Init Tabs -- 

local SphynxInfo = library:CreateWindow({ 
    text = "Sphynx Information"
})

local GameManipulation = library:CreateWindow({ 
    text = "Game Manipulation"
})

local PlayerManipulation = library:CreateWindow({ 
    text = "Player Manipulation"
})

local GuiScripts = library:CreateWindow({ 
    text = "Gui Scripts"
})

local MiscellaneousScripts = library:CreateWindow({ 
    text = "Miscellaneous Scripts"
})

local OtherFunctions = library:CreateWindow({ 
    text = "Other Functions"
})

-- Sphynx Information -- 

SphynxInfo:AddLabel("Press Q to toggle Gui")
SphynxInfo:AddLabel("-- Credits -- ")
SphynxInfo:AddLabel("- Syntilla (Scripter)")
SphynxInfo:AddLabel("- Vaermina (Scripter)")
SphynxInfo:AddLabel("- Azura (Emotional Support)")
SphynxInfo:AddLabel("- Wally (Framework)")
SphynxInfo:AddLabel("- Whoever's Script's in here")

-- Game Manipulation --

GameManipulation:AddLabel("Game Identity = " .. game.PlaceId)
GameManipulation:AddLabel("Game Name = " .. game:service'MarketplaceService':GetProductInfo(game.PlaceId).Name)
GameManipulation:AddLabel("Game Creator = " .. game:GetService('Players'):GetNameFromUserIdAsync(game.CreatorId))

-- Player Manipulation --

PlayerManipulation:AddLabel("Name = " .. game:GetService("Players").LocalPlayer.Name)
PlayerManipulation:AddLabel("ID = " .. game:GetService("Players").LocalPlayer.UserId)
PlayerManipulation:AddButton("Kill LocalPlayer", function()
    game:GetService("Players").LocalPlayer.Character.Humanoid:TakeDamage(1000000)
end)

-- Gui Scripts --

GuiScripts:AddButton("Infinite Yield FE", function()
    Log("Infinite Yield FE Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet(('https://pastebin.com/raw/tzTXmYf2'),true))()
end)

GuiScripts:AddButton("Reviz Admin v2", function()
    Log("Reviz Admin v2 Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet("https://itaintmyfault.000webhostapp.com/reviz", true))()
end)

GuiScripts:AddButton("Topkek v3", function()
    Log("Topkek v3 Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet("https://itaintmyfault.000webhostapp.com/topkek3", true))()
end)

GuiScripts:AddButton("Topkek v4", function()
    Log("Topkek v4 Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet(('https://itaintmyfault.000webhostapp.com/topkek4'),true))()
end)

GuiScripts:AddButton("Dark Dex", function()
    Log("Dark Dex Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet(('https://itaintmyfault.000webhostapp.com/darkdex'),true))()
end)

GuiScripts:AddButton("Dex v4", function()
	Log("Dex v4 Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet(('https://itaintmyfault.000webhostapp.com/slick%20dex'),true))()
end)

GuiScripts:AddButton("MrSpy v3", function()
    Log("MrSpy v3 Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet('http://scripthosts.ga/mrspy/main'))()
end)

-- Miscellaneous Scripts -- 

MiscellaneousScripts:AddButton("Chat Swear Bypass", function()
	Log("Chat Bypass Loaded!", 255, 0, 0, tostring(gFont))
    loadstring(game:HttpGet('https://pastebin.com/raw/TYv496k8'))()
end)

-- Other Functions --
OtherFunctions:AddLabel("-- Gravity Modifier --")
OtherFunctions:AddBox("Gravity Value Here", function(object, focus)
  if focus then
        game:GetService("Workspace").Gravity = tonumber(object.Text) or 196.2
  end
end)
OtherFunctions:AddLabel("-- HttpGet --")
OtherFunctions:AddBox("Url Here", function(object, focus)
  if focus then
    loadstring(game:HttpGet(object.Text, true))()
  end
end)
OtherFunctions:AddLabel("-- GetObjects --")
OtherFunctions:AddBox("Asset ID Here", function(object, focus)
  if focus then
    loadstring(game:GetObjects("rbxassetid://" .. tostring(object.Text))[1].Source)()
  end
end)
OtherFunctions:AddLabel("-- Execute Script --")
OtherFunctions:AddBox("Script Here", function(object, focus)
  if focus then
    loadstring(object.Text)()
  end
end)
OtherFunctions:AddLabel("-- Save Instance --")
OtherFunctions:AddBox("Table Here", function(object, focus)
  if focus then
    saveinstance(object.Text)
  end
end)

-- Visible Toggle --

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
    if key:lower() == "q" or key:upper() == "Q" then
		if Visi == true then
			Visi = false
        	Visible(false)
		elseif Visi == false then 
			Visi = true
			Visible(true)
		end
    end
end)