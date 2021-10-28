local start = tick()
print("Rose Hub process started.")
local VERSION = "3.0.4"
local delete = {"Rose Hub 3.0.0", "Introooo", "ColorPick"}
local tweening = false
local scriptsTabText = ""
local guiTabText = ""
local darkBack = false
local lightBack = true
local tweenService = game:GetService("TweenService")
local tweenSpeed = 0.70
local colorPickerOpen = false
local backColor = Color3.fromRGB(255, 255, 255)
local lightColor = Color3.fromRGB(255, 255, 255)
local darkColor = Color3.fromRGB(150, 150, 150)
local textColor = Color3.fromRGB(255, 255, 255)
local httpService = game:GetService("HttpService")
local savingSettings = false
local mainSettings = nil
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")
local chat = game:GetService("Chat")

--Delete old GUI
function FindTable(Table, Name)
	for i,v in pairs(Table) do
		if v == Name then
			return true
		end end
	return false
 end
  
 for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
	if v:IsA("ScreenGui") then
	if FindTable(delete, v.Name) then
		v:Destroy()
	end
 end
 end

--Create Frames
local screenGui = game:GetObjects("rbxassetid://3410845588")[1]
screenGui.Parent = game:GetService("CoreGui")
screenGui.Enabled = false
screenGui.Main.Top:FindFirstChildOfClass("TextLabel").Text = "Rose Hub "..VERSION

local colourpicker = game:GetObjects("rbxassetid://3444232310")[1]
colourpicker.Parent = game:GetService("CoreGui")
colourpicker.Enabled = false    

local intro = game:GetObjects("rbxassetid://3394996507")[1]
intro.Parent = game:GetService("CoreGui")

local function round(num)
    return math.floor(num * 10^3 + 0.5) / 10^3
end

local function createFrame(Active, BackgroundColor3, BackgroundTransparency, BorderSizePixel, ClipsDescendants, Name, Parent, Position, Size)
    local Frame = Instance.new("Frame")
    Frame.Active = Active
    Frame.BackgroundColor3 = BackgroundColor3
    Frame.BackgroundTransparency = BackgroundTransparency
    Frame.BorderSizePixel = BorderSizePixel
    Frame.ClipsDescendants = ClipsDescendants
    Frame.Name = Name
    Frame.Parent = Parent
    Frame.Position = Position
    Frame.Size = Size
    return Frame
end

local function createTextLabel(BackgroundColor3, BackgroundTransparency, BorderSizePixel, Font, Name, Parent, Position, Size, Text, TextColor3, TextSize, TextWrapped, TextXAlignment, TextYAlignment, ZIndex)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.BackgroundColor3 = BackgroundColor3
    TextLabel.BackgroundTransparency = BackgroundTransparency
    TextLabel.BorderSizePixel = BorderSizePixel
    TextLabel.Font = Font
    TextLabel.Name = Name
    TextLabel.Parent = Parent
    TextLabel.Position = Position
    TextLabel.Size = Size
    TextLabel.Text = Text
    TextLabel.TextColor3 = TextColor3
    TextLabel.TextSize = TextSize
    TextLabel.TextWrapped = TextWrapped
    TextLabel.TextXAlignment = TextXAlignment
    TextLabel.TextYAlignment = TextYAlignment
    TextLabel.ZIndex = ZIndex
    return TextLabel
end

local function createTextBox(BackgroundColor3, BackgroundTransparency, BorderSizePixel, Font, Name, Parent, PlaceholderText, Position, Size, Text, TextColor3, TextSize, TextWrapped, TextXAlignment, TextYAlignment)
    local TextBox = Instance.new("TextBox")
    TextBox.BackgroundColor3 = BackgroundColor3
    TextBox.BackgroundTransparency = BackgroundTransparency
    TextBox.BorderSizePixel = BorderSizePixel
    TextBox.Font = Font
    TextBox.Name = Name
    TextBox.Parent = Parent
    TextBox.PlaceholderText = PlaceholderText
    TextBox.Position = Position
    TextBox.Size = Size
    TextBox.Text = Text
    TextBox.TextColor3 = TextColor3
    TextBox.TextSize = TextSize
    TextBox.TextWrapped = TextWrapped
    TextBox.TextXAlignment = TextXAlignment
    TextBox.TextYAlignment = TextYAlignment
    return TextBox
end

local function createTextButton(BackgroundColor3, BackgroundTransparency, BorderSizePixel, Font, Name, Parent, Position, Size, Text, TextColor3, TextSize, ZIndex, func)
    local TextButton = Instance.new("TextButton")
    TextButton.BackgroundColor3 = BackgroundColor3
    TextButton.BackgroundTransparency = BackgroundTransparency
    TextButton.BorderSizePixel = BorderSizePixel
    TextButton.Font = Font
    TextButton.Name = Name
    TextButton.Parent = Parent
    TextButton.Position = Position
    TextButton.Size = Size
    TextButton.Text = Text
    TextButton.TextColor3 = TextColor3
    TextButton.TextSize = TextSize
    TextButton.ZIndex = ZIndex
    TextButton.MouseButton1Up:Connect(func)
    return TextButton
end

local function createImageLabel(BackgroundTransparency, Image, Name, Parent, Position, Selectable, Size, ZIndex)
    local ImageLabel = Instance.new("ImageLabel")
    ImageLabel.BackgroundTransparency = BackgroundTransparency
    ImageLabel.Image = Image
    ImageLabel.Name = Name
    ImageLabel.Parent = Parent
    ImageLabel.Position = Position
    ImageLabel.Selectable = Selectable
    ImageLabel.Size = Size
    ImageLabel.ZIndex = ZIndex
    return ImageLabel
end

local function createScrollingFrame(BackgroundColor3, BackgroundTransparency, BorderSizePixel, BottomImage, CanvasSize, MidImage, Name, Parent, Position, Rotation, ScrollBarThickness, Selectable, Size, TopImage, Visible)
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.BackgroundColor3 = BackgroundColor3
    ScrollingFrame.BackgroundTransparency = BackgroundTransparency
    ScrollingFrame.BorderSizePixel = BorderSizePixel
    ScrollingFrame.BottomImage = BottomImage
    ScrollingFrame.CanvasSize = CanvasSize
    ScrollingFrame.MidImage = MidImage
    ScrollingFrame.Name = Name
    ScrollingFrame.Parent = Parent
    ScrollingFrame.Position = Position
    ScrollingFrame.Rotation = Rotation
    ScrollingFrame.ScrollBarThickness = ScrollBarThickness
    ScrollingFrame.Selectable = Selectable
    ScrollingFrame.Size = Size
    ScrollingFrame.TopImage = TopImage
    ScrollingFrame.Visible = Visible
    return ScrollingFrame
end

local defaultSettings = {
	["BackgroundColorR"] = 59,
	["BackgroundColorG"] = 59,
	["BackgroundColorB"] = 59,
	["PickerColorR"] = 59,
	["PickerColorG"] = 59,
	["PickerColorB"] = 59,
	["ChangePickerBackground"] = true,
	["Transparency"] = 0.7,
	["RainbowOn"] = false,
	["RainbowSpeed"] = 75,
 }

 local function round(num)
	return math.floor(num *10^3 + 0.5) / 10^3
 end

 if writefile and readfile and pcall(function() readfile("RoseHubSettings.txt") end) then
	local file = readfile("RoseHubSettings.txt")
	local continue = true
	local write = false
	if pcall(function() httpService:JSONDecode(file) end) then
		file = httpService:JSONDecode(readfile("RoseHubSettings.txt"))
		mainSettings = file
	else
		mainSettings = defaultSettings
		writefile("RoseHubSettings.txt", httpService:JSONEncode(defaultSettings))
		warn("Settings file corrupted, creating new.")
		continue = false
	end
	if continue then
		for setting,value in pairs(defaultSettings) do
			if file[setting] == nil then
				writefile("RoseHubSettings.txt", httpService:JSONEncode(defaultSettings))
				warn(setting.." is missing, setting to default.")
				file[setting] = defaultSettings[setting]
				write = true
			elseif file[setting] ~= nil then
				if type(file[setting]) ~= type(defaultSettings[setting]) then
					warn(setting.." is invalid, overwriting.")
					write = true
					file[setting] = defaultSettings[setting]
				end
			end
		end
		if write == true then
			warn("Fixing settings file.")
			mainSettings = file
			writefile("RoseHubSettings.txt", httpService:JSONEncode(mainSettings))
			write = false
		end
	end
 else
	mainSettings = defaultSettings
	if writefile then
		warn("Rose Hub settings missing, creating new.")
		writefile("RoseHubSettings.txt", httpService:JSONEncode(defaultSettings))
	end
 end
  
 local savedColor = Color3.fromRGB(mainSettings.BackgroundColorR, mainSettings.BackgroundColorG, mainSettings.BackgroundColorB)
 local mainTransparency = mainSettings.Transparency
 local enableRainbow = mainSettings.RainbowOn
 local rainbowCount = mainSettings.RainbowSpeed
 local mainTrans = mainSettings.Transparency
 local changeColorPickerBack = mainSettings.ChangePickerBackground
 local colorPickerBack = Color3.fromRGB(mainSettings.PickerColorR, mainSettings.PickerColorG, mainSettings.PickerColorB)
  
 local function saveSetting(backColor, pickerColor, changeBack, tranparency, rainbowOn, rainbowSpeed)
	local settingsTab = {
		["BackgroundColorR"] = round(backColor.r*255),
		["BackgroundColorG"] = round(backColor.g*255),
		["BackgroundColorB"] = round(backColor.b*255),
		["PickerColorR"] = round(pickerColor.r*255),
		["PickerColorG"] = round(pickerColor.g*255),
		["PickerColorB"] = round(pickerColor.b*255),
		["ChangePickerBackground"] = changeBack,
		["Transparency"] = round(tranparency),
		["RainbowOn"] = rainbowOn,
		["RainbowSpeed"] = rainbowSpeed,
	}
	writefile("RoseHubSettings.txt", httpService:JSONEncode(settingsTab))
 end
  
 if darkBack then
	backColor = Color3.fromRGB(150, 150, 150)
 end

local scripttabList = {
    {"VSimFucker", "dtHywXGM", 1},
    {"Arsenal Aim", "3ZWRrB9t", 1},
    {"Counter Blox GUI", "xc9gy1Hi", 1},
    {"Arsenal Haxx (Syn X)", "2hnkK6Th", 1},
    {"Jailbreak TPs", "re6cmXaJ", 1},
    {"Arsenal Kill All", "EJEqCS8k", 1},
    {"FE Kill", "gL8aeXke", 1},
}

local modulestabList = {
    {"Work In progress", 0, 2}
	--{"Modules GUI", 03107712466, 2},
}

local guistabList = {
	{"c00lgui", "Rz2EFsLU", 1},
	{"Topkek 4.0", "d0CJRrcg", 1},
	{"Topkek 3.0", "SikGfE9u", 1},
	{"Ro-Xploit 4.0", 175137115, 2},
	{"Ro-Xploit 5.0", 288646117, 2},
	{"Ro-Xploit 6.0", 364364477, 2},
	{"Dex 2.0", 492005721, 2},
	{"Dex 3.0", 418957341, 2},
	{"Clown Van", "a5UZuuiT", 1},
	{"Hell Elevator GUI", "8NYWpf2T", 1},
	{"Chams / Aimlock", "Yi7fzELj", 1},
	{"YourMom GUI", "289110135", 2},
	{"Pepe GUI", "277881926", 2},
	{"Brack Hub", "PT9Gf7d5", 1},
	{"Vesprin FE GUI", "1231351616", 2},
	{"Music GUI", "U352cdsv", 1},
	{"Dark Dex 2.0", "YzdzxuRX", 1},
    {"GabX", "FTf9uem2", 1},
    {"Fathom Hub", "UmhaEvTT", 1},
 }

 local mapstabList = {
	{"Clockwork Arena", "EvnXCXhP", 1},
	{"Town Map", 1345094164, 2},
	{"Cave Island", "t29C42rm", 1},
	{"Nature Map", "gmF4Kq5B", 1},
	{"Nazi Map", "az8sLCLT", 1},
	{"Ritual Room", "hYCTFiAC", 1},
	{"Stripper", "jztW5Vuy", 1},
	{"Witch Map", "R9epW292", 1},
	{"Rainbow Tunnel", "8bznLitn", 1},
	{"Scary Map", "fNw46f74", 1},
	{"Nazi Camp", "KJNk4STm", 1},
	{"Night Club", 1281063730, 2},
	{"Da Club", "6UyLJheX", 1},
 }

 local lists = {
	{scripttabList, "Scripts"},
	{modulestabList, "Modules"},
	{guistabList, "GUIs"},
    {mapstabList, "Maps"},
 }

 local tabs = {
    "Home",
    "Scripts",
    "Modules",
    "Purchased Scripts",
    "GUIs",
    "Executor",
    "Server Side",
    "Maps",
    "Audios",
    "Economy",
    "Settings",
    "Credits",
}
 
function CreateInstance(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
        inst[i] = v
    end
    return inst
end

--Copy Discord Invite
screenGui.Main.Top.Important.HomeTab.Discord.MouseButton1Up:Connect(function()
local copy = true
if pcall(function() Synapse:Copy("http://discord.io/rosehub") end) then
	
else
	local copy2 = setclipboard or Clipboard.set
	copy2("http://discord.io/rosehub")

end

screenGui.Main.Top.Important.HomeTab.Discord.Text = "Copied!"
wait(2)
screenGui.Main.Top.Important.HomeTab.Discord.Text = "Discord Server:\nhttps://discord.io/rosehub"
end)

--[[All Script Tabs,
Sort lists and insert them--]]
for _,list in pairs(lists) do
    local toSort = {}
    local sortedList = {}
    local pos = 0
    
    for _,v in pairs(list[1]) do
        table.insert(toSort, v[1])
    end
    
    table.sort(toSort)
    
    for i,name in pairs(toSort) do
        for i,actualTable in pairs(list[1]) do
            if name == actualTable[1] then
                table.insert(sortedList, {actualTable[1], actualTable[2], actualTable[3]})
            end
        end
    end
    
    --Function to create the buttons
    local function createButons(text)
        pos = 5
        for _,button in pairs(sortedList) do
            if text == "" or string.match(string.lower(button[1]), string.lower(text)) then
                createTextButton(backColor, mainTrans, 0, Enum.Font.SourceSans, button[1], screenGui.Main.Top.Important[list[2].."Tab"].Holder, UDim2.new(0, 5, 0, pos), UDim2.new(0, 181, 0, 20), button[1], textColor, 14, 1, function()
                    if button[3] == 1 then
                        loadstring(game:HttpGet("https://pastebin.com/raw/"..button[2], true))()
                    elseif button[3] == 2 then
                        loadstring(game:GetObjects("rbxassetid://"..button[2])[1].Source)()
                    end
                end)
                pos = pos + 23
            end
        end
    end
    
    --Remove Buttons and create new on search
    local function removeButtons()
        for _,button in pairs(screenGui.Main.Top.Important[list[2].."Tab"].Holder:GetChildren()) do
            button:Destroy()
        end
    end
    
    --Search Function
    screenGui.Main.Top.Important[list[2].."Tab"].Search.PlaceholderColor3 = textColor
    screenGui.Main.Top.Important[list[2].."Tab"].Search.PlaceholderText = "Search "..list[2]
    local function searchBar(chosenList)	
        local search = screenGui.Main.Top.Important[chosenList.."Tab"].Search
        local currentSearch = ""
        search.Changed:connect(function(property)
            if property == "Text" then
                if search.Text ~= "" and search.Text ~= currentSearch then
                    currentSearch = search.Text
                    removeButtons()
                    createButons(search.Text)
                elseif search.Text == "" and currentSearch.Text ~= "" then
                    currentSearch = search.Text
                    removeButtons()
                    createButons("")
                end
            end
        end)
    end	
    
    searchBar(list[2])
    
    --Create Buttons with no search
    createButons("")
    
    screenGui.Main.Top.Important[list[2].."Tab"].Holder.CanvasSize = UDim2.new(1, 0, 0, pos + 2)
end

--Tab Changer
local underline = screenGui.Main.Top.SelectedTab
local tabs = screenGui.Main.Top.Tabs:GetChildren()
local LastTab = tabs[1]
local tweening = false
local OrigSize = underline.Size
local tabPos = 0
local tweenPos = tabPos + 20
local oldTab = screenGui.Main.Top.Tabs.Home

for _,tab in next, tabs do
	if tab:IsA("TextButton") then
		local tweenPos = tabPos + 22
		tab.MouseButton1Up:Connect(function()
			if tweening == false and tab ~= oldTab then
				tweening = true
				underline:TweenSizeAndPosition(UDim2.new(0, 2, 0, 0), UDim2.new(0.5, 0, underline.Position.Y.Scale, underline.Position.Y.Offset), "Out", "Quad", tweenSpeed)
				local newUnderline = createFrame(false, backColor, 0, 0, false, "Frame", screenGui.Main.Top.Tabs, UDim2.new(0.5, 0, 1, -3), UDim2.new(0, 0, 0, 2))
				newUnderline:TweenSize(UDim2.new(0, tab.TextBounds.X, 0, 2), --[[UDim2.new(0, 55 - tab.TextBounds.X/2, 0, tweenPos),]] "Out", "Quad", tweenSpeed)
				screenGui.Main.Top.Important[tostring(oldTab).."Tab"]:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", tweenSpeed)
				screenGui.Main.Top.Important[tostring(tab).."Tab"]:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", tweenSpeed)
				screenGui.Main.Top.CurrentTab:TweenSize(UDim2.new(0, 0, 0, 31), "Out", "Quad", tweenSpeed/2)
                newUnderline.LayoutOrder = tab.LayoutOrder
                newUnderline.AnchorPoint = Vector2.new(0.5, 1)
                newUnderline.Parent = tab
                wait(tweenSpeed/2)
				screenGui.Main.Top.CurrentTab.Label.Text = tab.Name
				screenGui.Main.Top.CurrentTab:TweenSize(UDim2.new(0, 109, 0, 31), "Out", "Quad", tweenSpeed/2)
                wait(tweenSpeed/2)
				screenGui.Main.Top.Important[tostring(oldTab).."Tab"].Position = UDim2.new(-1, 0, 0, 0)
				underline:Destroy()
				underline = newUnderline
				oldTab = tab
				tweening = false
			end
		end)
		tabPos = tabPos + 26
	end
end

--Server Side
screenGui.Serverside.Active = true
screenGui.Serverside.Draggable = true

--Execute
screenGui.Main.Top.Important.ServerSideTab.ExecuteButton.MouseButton1Up:Connect(function()
    local e = game:GetService("JointsService")
    local rem = e.RemoteFunction
    assert(rem, "Remote is missing.")
    rem:InvokeServer(true, screenGui.Main.Top.Important.ServerSideTab.KeyInput.Text, screenGui.Main.Top.Important.ServerSideTab.ScriptHolder.ScriptInput.Text, {})
end)

--Clear Serverside Input
screenGui.Main.Top.Important.ServerSideTab.ClearButton.MouseButton1Up:Connect(function()
	screenGui.Main.Top.Important.ServerSideTab.ScriptHolder.ScriptInput.Text = ""
end)

-- Temp Toggle Script Editor
screenGui.Main.Top.Important.ServerSideTab.settings.MouseButton1Up:Connect(function()
	screenGui.Serverside.Visible = true
end)

--Execute In Script Editor
screenGui.Serverside.execute.MouseButton1Up:Connect(function()
    local e = game:GetService("JointsService")
    local rem = e.RemoteFunction
    assert(rem, "Remote is missing.")
    rem:InvokeServer(true, screenGui.Main.Top.Important.ServerSideTab.KeyInput.Text, screenGui.Serverside.scriptinput.Text, {})
end)

--Clear In Script Editor
screenGui.Serverside.clear.MouseButton1Up:Connect(function()
	screenGui.Serverside.scriptinput.Text = ""
end)

--Close Script Editor
screenGui.Serverside.close.MouseButton1Up:Connect(function()
    screenGui.Serverside.Visible = false
end)


--Executor
--Execute Button
screenGui.Main.Top.Important.ExecutorTab.execute.MouseButton1Up:Connect(function()
    loadstring(screenGui.Main.Top.Important.ExecutorTab.Holder.input.Text)
end)

--Clear Button
screenGui.Main.Top.Important.ExecutorTab.clear.MouseButton1Up:Connect(function()
    screenGui.Main.Top.Important.ExecutorTab.Holder.input.Text = ""
end)

--Audios Tab
local volume = 1
local audioPage = 1

local function stopSounds()
    for _,obj in pairs(lighting:GetChildren()) do
        if obj:IsA("Sound") then
            obj:Destroy()
        end
    end
    
    for i,v in pairs(chat:GetChildren()) do
        if v:IsA("Sound") then
            v:Destroy()
        end
    end

    for _,obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Sound") then
            obj:Destroy()
        end
    end
end

local function playSong(id)
    stopSounds()
    local sound = Instance.new("Sound")
    sound.Parent = lighting
    sound.SoundId = "rbxassetid://"..tostring(id)
    sound.Volume = volume
    sound.Name = "RoseHubSound"
    sound.Looped = true
    sound.Playing = true
end

local audioHolder = screenGui.Main.Top.Important.AudiosTab.Holder
local audioInputBox = screenGui.Main.Top.Important.AudiosTab.audioinput
audioInputBox.PlaceholderColor3 = textColor

screenGui.Main.Top.Important.AudiosTab.Stop.MouseButton1Up:Connect(function()
    stopSounds()
end)

local volumeBox = screenGui.Main.Top.Important.AudiosTab.VolumeBox

screenGui.Main.Top.Important.AudiosTab.Set.MouseButton1Up:Connect(function()
    if tonumber(volumeBox.Text) then
        volume =  tonumber(volumeBox.Text)
        pcall(function()
            lighting.RoseHubSound.Volume = volume
        end)
    end
end)

local currentSong = screenGui.Main.Top.Important.AudiosTab.CurrentSong

screenGui.Main.Top.Important.AudiosTab.PreviousPage.MouseButton1Up:Connect(function()
    if audioPage > 1 then
        audioPage = audioPage - 1
    createAudios(audioPage)
    end
end)

screenGui.Main.Top.Important.AudiosTab.NextPage.MouseButton1Up:Connect(function()
    audioPage = audioPage + 1
    createAudios(audioPage)
end)

function createAudios(audioPage)
    local audioKeyword = audioInputBox.Text
    --local json = "https://search.roblox.com/catalog/json?Category=Audio&Keyword="..audioKeyword.."&ResultsPerPage=25&PageNumber="..tostring(audioPage)
    local json = "https://search.roblox.com/catalog/contents?CatalogContext=&Keyword="..audioKeyword.."&SortAggregation=5&LegendExpanded=true&Category=9&ResultsPerPage=25&PageNumber="..tostring(audioPage)
    local gotJson = game:HttpGet(json, true)
    local rawResult = httpService:JSONDecode(gotJson)
    local pos = 5
    for _,button in pairs(audioHolder:GetChildren()) do
        button:Destroy()
    end
    for _,tab in pairs(rawResult) do
        local scale = false
        local button = createTextButton(backColor, mainTrans, 0, Enum.Font.SourceSans, tab.Name, screenGui.Top.Important.AudiosTab.Holder, UDim2.new(0, 5, 0, pos), UDim2.new(0, 181, 0, 20), tab.Name, textColor, 14, 1, function()
            playSong(tab.AssetId)
            currentSong.Text = tab.Name
            currentSong.TextScaled = scale
        end)
        if button.TextBounds.X > button.Size.X.Offset then
            button.TextScaled = true
            scale = true
        end
        pos = pos + 23
    end
    audioHolder.CanvasSize = UDim2.new(0, 0, 0, pos + 2)
end

screenGui.Main.Top.Important.AudiosTab.search.MouseButton1Up:Connect(function()
    createAudios(1)
end)

--Remove pcall
pcall(function()
    createAudios(1)
end)

--[[local ColorPicker = {}

ColorPicker.new = function()
    pickerCreated = true
    local newMt = setmetatable({},{})
    
    local rootGui = colourpicker
    rootGui.Parent = coreGui
    rootGui.Enabled = true
    pickerGui = rootGui.ColorPicker
    local pickerTopBar = pickerGui.TopBar
    backDrop = pickerGui.Backdrop
    local pickerFrame = pickerGui.Backdrop.Content
    local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
    local colorStrip = pickerFrame.ColorStrip
    local previewFrame = pickerFrame.Preview
    local basicColorsFrame = pickerFrame.BasicColors
    local customColorsFrame = pickerFrame.CustomColors
    local okButton = pickerFrame.Ok
    local cancelButton = pickerFrame.Cancel
    local closeButton = pickerTopBar.Close
    local colorScope = colorSpace.Scope
    local colorArrow = pickerFrame.ArrowFrame.Arrow
    local hueInput = pickerFrame.Hue.Input
    local satInput = pickerFrame.Sat.Input
    local valInput = pickerFrame.Val.Input
    local redInput = pickerFrame.Red.Input
    local greenInput = pickerFrame.Green.Input
    local blueInput = pickerFrame.Blue.Input
    local user = game:GetService("UserInputService")
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    
    local hue,sat,val = Color3.toHSV(savedColor)
    local red,green,blue = savedColor.r, savedColor.g, savedColor.b
    local chosenColor = savedColor
    local basicColors = {Color3.new(0,0,0),Color3.new(0.66666668653488,0,0),Color3.new(0,0.33333334326744,0),Color3.new(0.66666668653488,0.33333334326744,0),Color3.new(0,0.66666668653488,0),Color3.new(0.66666668653488,0.66666668653488,0),Color3.new(0,1,0),Color3.new(0.66666668653488,1,0),Color3.new(0,0,0.49803924560547),Color3.new(0.66666668653488,0,0.49803924560547),Color3.new(0,0.33333334326744,0.49803924560547),Color3.new(0.66666668653488,0.33333334326744,0.49803924560547),Color3.new(0,0.66666668653488,0.49803924560547),Color3.new(0.66666668653488,0.66666668653488,0.49803924560547),Color3.new(0,1,0.49803924560547),Color3.new(0.66666668653488,1,0.49803924560547),Color3.new(0,0,1),Color3.new(0.66666668653488,0,1),Color3.new(0,0.33333334326744,1),Color3.new(0.66666668653488,0.33333334326744,1),Color3.new(0,0.66666668653488,1),Color3.new(0.66666668653488,0.66666668653488,1),Color3.new(0,1,1),Color3.new(0.66666668653488,1,1),Color3.new(0.33333334326744,0,0),Color3.new(1,0,0),Color3.new(0.33333334326744,0.33333334326744,0),Color3.new(1,0.33333334326744,0),Color3.new(0.33333334326744,0.66666668653488,0),Color3.new(1,0.66666668653488,0),Color3.new(0.33333334326744,1,0),Color3.new(1,1,0),Color3.new(0.33333334326744,0,0.49803924560547),Color3.new(1,0,0.49803924560547),Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Color3.new(1,0.33333334326744,0.49803924560547),Color3.new(0.33333334326744,0.66666668653488,0.49803924560547),Color3.new(1,0.66666668653488,0.49803924560547),Color3.new(0.33333334326744,1,0.49803924560547),Color3.new(1,1,0.49803924560547),Color3.new(0.33333334326744,0,1),Color3.new(1,0,1),Color3.new(0.33333334326744,0.33333334326744,1),Color3.new(1,0.33333334326744,1),Color3.new(0.33333334326744,0.66666668653488,1),Color3.new(1,0.66666668653488,1),Color3.new(0.33333334326744,1,1),Color3.new(1,1,1)}
    local customColors = {}
    local function updateColor(noupdate)
        local relativeX,relativeY,relativeStripY = 219 - hue*219, 199 - sat*199, 199 - val*199
        local hsvColor = Color3.fromHSV(hue,sat,val)

        if noupdate == 2 or not noupdate then
            hueInput.Text = tostring(math.ceil(359*hue))
            satInput.Text = tostring(math.ceil(255*sat))
            valInput.Text = tostring(math.floor(255*val))
        end
        if noupdate == 1 or not noupdate then
            redInput.Text = tostring(math.floor(255*red))
            greenInput.Text = tostring(math.floor(255*green))
            blueInput.Text = tostring(math.floor(255*blue))
        end

        chosenColor = Color3.new(red,green,blue)

        colorScope.Position = UDim2.new(0,relativeX-9,0,relativeY-9)
        colorStrip.ImageColor3 = Color3.fromHSV(hue,sat,1)
        colorArrow.Position = UDim2.new(0,-2,0,relativeStripY-4)
        previewFrame.BackgroundColor3 = chosenColor

        updateBack(chosenColor, backDrop)
        
        newMt.Color = chosenColor
        if newMt.Changed then 
            newMt:Changed(chosenColor)
        end
    end
    local function colorSpaceInput()
        local relativeX = mouse.X - colorSpace.AbsolutePosition.X
        local relativeY = mouse.Y - colorSpace.AbsolutePosition.Y
            
        if relativeX < 0 then relativeX = 0 elseif relativeX > 219 then relativeX = 219 end
        if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end
            
        hue = (219 - relativeX)/219
        sat = (199 - relativeY)/199

        local hsvColor = Color3.fromHSV(hue,sat,val)
        red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

        updateColor()
    end
    local function colorStripInput()
        local relativeY = mouse.Y - colorStrip.AbsolutePosition.Y

        if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end	

        val = (199 - relativeY)/199

        local hsvColor = Color3.fromHSV(hue,sat,val)
        red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

        updateColor()
    end
    local function hookButtons(frame,func)
        frame.ArrowFrame.Up.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                frame.ArrowFrame.Up.BackgroundTransparency = 0.5
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                local releaseEvent,runEvent
        
                local startTime = tick()
                local pressing = true
                local startNum = tonumber(frame.Text)
        
                if not startNum then return end
        
                releaseEvent = user.InputEnded:Connect(function(input)
                    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                    releaseEvent:Disconnect()
                    pressing = false
                end)
        
                startNum = startNum + 1
                func(startNum)
                while pressing do
                    if tick()-startTime > 0.3 then
                        startNum = startNum + 1
                        func(startNum)
                    end
                    wait(0.1)
                end
            end
        end)

        frame.ArrowFrame.Up.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                frame.ArrowFrame.Up.BackgroundTransparency = 1
            end
        end)

        frame.ArrowFrame.Down.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                frame.ArrowFrame.Down.BackgroundTransparency = 0.5
            elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                local releaseEvent,runEvent
        
                local startTime = tick()
                local pressing = true
                local startNum = tonumber(frame.Text)
        
                if not startNum then return end
        
                releaseEvent = user.InputEnded:Connect(function(input)
                    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                    releaseEvent:Disconnect()
                    pressing = false
                end)
        
                startNum = startNum - 1
                func(startNum)
                while pressing do
                    if tick()-startTime > 0.3 then
                        startNum = startNum - 1
                        func(startNum)
                    end
                    wait(0.1)
                end
            end
        end)

        frame.ArrowFrame.Down.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                frame.ArrowFrame.Down.BackgroundTransparency = 1
            end
        end)
    end
    colorSpace.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local releaseEvent,mouseEvent
    
            releaseEvent = user.InputEnded:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                releaseEvent:Disconnect()
                mouseEvent:Disconnect()
            end)
    
            mouseEvent = user.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    colorSpaceInput()
                end
            end)
    
            colorSpaceInput()
        end
    end)
    colorStrip.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local releaseEvent,mouseEvent
    
            releaseEvent = user.InputEnded:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                releaseEvent:Disconnect()
                mouseEvent:Disconnect()
            end)
    
            mouseEvent = user.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    colorStripInput()
                end
            end)
    
            colorStripInput()
        end
    end)
    local function updateHue(str)
        local num = tonumber(str)
        if num then
            hue = math.clamp(math.floor(num),0,359)/359
            local hsvColor = Color3.fromHSV(hue,sat,val)
            red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
            hueInput.Text = tostring(hue*359)
            updateColor(1)
        end
    end
    hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput,updateHue)
    local function updateSat(str)
        local num = tonumber(str)
        if num then
            sat = math.clamp(math.floor(num),0,255)/255
            local hsvColor = Color3.fromHSV(hue,sat,val)
            red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
            satInput.Text = tostring(sat*255)
            updateColor(1)
        end
    end
    satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput,updateSat)
    local function updateVal(str)
        local num = tonumber(str)
        if num then
            val = math.clamp(math.floor(num),0,255)/255
            local hsvColor = Color3.fromHSV(hue,sat,val)
            red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
            valInput.Text = tostring(val*255)
            updateColor(1)
        end
    end
    valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput,updateVal)
    
    local function updateRed(str)
        local num = tonumber(str)
        if num then
            red = math.clamp(math.floor(num),0,255)/255
            local newColor = Color3.new(red,green,blue)
            hue,sat,val = Color3.toHSV(newColor)
            redInput.Text = tostring(red*255)
            updateColor(2)
        end
    end
    redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput,updateRed)
    
    local function updateGreen(str)
        local num = tonumber(str)
        if num then
            green = math.clamp(math.floor(num),0,255)/255
            local newColor = Color3.new(red,green,blue)
            hue,sat,val = Color3.toHSV(newColor)
            greenInput.Text = tostring(green*255)
            updateColor(2)
        end
    end
    greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput,updateGreen)
    
    local function updateBlue(str)
        local num = tonumber(str)
        if num then
            blue = math.clamp(math.floor(num),0,255)/255
            local newColor = Color3.new(red,green,blue)
            hue,sat,val = Color3.toHSV(newColor)
            blueInput.Text = tostring(blue*255)
            updateColor(2)
        end
    end
    blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput,updateBlue)
    
    local colorChoice = Instance.new("TextButton")
    colorChoice.Name = "Choice"
    colorChoice.Size = UDim2.new(0,25,0,18)
    colorChoice.BorderColor3 = Color3.new(96/255,96/255,96/255)
    colorChoice.Text = ""
    colorChoice.AutoButtonColor = false
    
    local row = 0
    local column = 0
    for i,v in pairs(basicColors) do
        local newColor = colorChoice:Clone()
        newColor.BackgroundColor3 = v
        newColor.Position = UDim2.new(0,1 + 30*column,0,21 + 23*row)
        
        newColor.MouseButton1Click:Connect(function()
            red,green,blue = v.r,v.g,v.b
            local newColor = Color3.new(red,green,blue)
            hue,sat,val = Color3.toHSV(newColor)
            updateColor()
        end)	
        
        newColor.Parent = basicColorsFrame
        column = column + 1
        if column == 6 then row = row + 1 column = 0 end
    end
    
    row = 0
    column = 0
    for i = 1,12 do
        local color = customColors[i] or Color3.new(0,0,0)
        local newColor = colorChoice:Clone()
        newColor.BackgroundColor3 = color
        newColor.Position = UDim2.new(0,1 + 30*column,0,20 + 23*row)
        
        newColor.MouseButton1Click:Connect(function()
            local curColor = customColors[i] or Color3.new(0,0,0)
            red,green,blue = curColor.r,curColor.g,curColor.b
            hue,sat,val = Color3.toHSV(curColor)
            updateColor()
        end)
        
        newColor.MouseButton2Click:Connect(function()
            customColors[i] = chosenColor
            newColor.BackgroundColor3 = chosenColor
        end)
        
        newColor.Parent = customColorsFrame
        column = column + 1
        if column == 6 then row = row + 1 column = 0 end
    end
    
    pickerTopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local releaseEvent,mouseEvent
            local dragOffX,dragOffY = mouse.X-pickerTopBar.AbsolutePosition.X,mouse.Y-pickerTopBar.AbsolutePosition.Y
            
            releaseEvent = user.InputEnded:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                releaseEvent:Disconnect()
                mouseEvent:Disconnect()
            end)
            
            mouseEvent = user.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    pickerGui.Position = UDim2.new(0,mouse.X-dragOffX,0,mouse.Y-dragOffY)
                end
            end)
        end
    end)
    
    okButton.MouseButton1Click:Connect(function() if newMt.Confirm then newMt:Confirm(chosenColor) end pickerGui.Visible = false savedColor = chosenColor colorPickerOpen = false end)
    okButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then okButton.BackgroundTransparency = 0.4 end end)
    okButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then okButton.BackgroundTransparency = 0 end end)
    
    cancelButton.MouseButton1Click:Connect(function() if newMt.Cancel then newMt:Cancel() end pickerGui.Visible = false updateBack(savedColor, backDrop) colorPickerOpen = false end)
    cancelButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then cancelButton.BackgroundTransparency = 0.4 end end)
    cancelButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then cancelButton.BackgroundTransparency = 0 end end)
    
    closeButton.MouseButton1Click:Connect(function() pickerGui.Visible = false updateBack(savedColor, backDrop) colorPickerOpen = false end)
    
    updateColor()
    
    newMt.SetColor = function(self,color)
        red,green,blue = color.r,color.g,color.b
        hue,sat,val = Color3.toHSV(color)
        updateColor()
    end
    
    newMt.Gui = rootGui
    
    return newMt
end
--end

local ColorPickInstance = ColorPicker.new()

local rainbowColors = {
    Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0),
    Color3.fromRGB(0, 255, 255),
}

local rainbow = false
local customRainbow = false
local rainbowReset = false
local rainbowStart = 1
local currentRainbow = nil

spawn(function()
    while wait() do
        if rainbow == true then
            for i,v in pairs(rainbowColors) do
                local start = rainbowColors[i]
                local rEnd = i + 1
                if not rainbowColors[rEnd] then
                    rEnd = 1
                end
                if customRainbow == true then
                    local back = screenGui.Top.Main.BackgroundColor3
                    start = back
                end
                for num = rainbowCount, 1, -1 do
                    currentRainbow = start:Lerp(rainbowColors[rEnd], (rainbowCount - num)/rainbowCount)
                    if rainbow == true then
                        updateBack(currentRainbow)
                    else
                        break
                    end
                    wait()
                end
                customRainbow = false
            end
            if rainbowReset == true then
                rainbowReset = false
                rainbow = false
                currentRainbow = screenGui.Top.Main.BackgroundColor3
                for num = rainbowCount, 1, -1 do
                    currentRainbow = currentRainbow:Lerp(savedColor, (rainbowCount - num)/rainbowCount)
                    updateBack(currentRainbow)
                    if rainbow == true then
                        rainbowReset = false
                        break
                    end
                    wait()
                end
                wait()
            end
        end
    end
end)--]]

--Settings Tab
--Open Colour Picker
screenGui.Main.Top.Important.SettingsTab.colorpickopen.MouseButton1Up:Connect(function()
    colourpicker.Enabled = true
end)

--Reset GUI
screenGui.Main.Top.Important.SettingsTab.ResetGui.MouseButton1Up:Connect(function()

end)

--Save Settings
screenGui.Main.Top.Important.SettingsTab.SaveSettings.MouseButton1Up:Connect(function()

end)

--Colour Picker Background On
screenGui.Main.Top.Important.SettingsTab.PickerBackgroundOn.MouseButton1Up:Connect(function()

end)

--Colour Picker Background Off
screenGui.Main.Top.Important.SettingsTab.PickerBackgroundOff.MouseButton1Up:Connect(function()

end)

--Close
screenGui.Main.Top.Close.MouseButton1Up:connect(function()
    screenGui.Main:TweenSize(UDim2.new(0, 361, 0, 31), "Out", "Quad", 0.5)
    wait(0.5)
    screenGui.Main:TweenSize(UDim2.new(0, 0, 0, 31), "Out", "Quad", 0.5)
    wait(0.5)
    wait()
    screenGui.Open:TweenPosition(UDim2.new(0, 0, 0.75, 0), "Out", "Quad", 0.25)
    wait(0.25)
end)

--Open
screenGui.Open.MouseButton1Up:connect(function()
    screenGui.Open:TweenPosition(UDim2.new(0, -75, 0.75, 0), "Out", "Quad", 0.25)
    wait(0.25)
    screenGui.Main:TweenSize(UDim2.new(0, 361, 0, 31), "Out", "Quad", 0.5)
    wait(0.5)
    wait()
    screenGui.Main:TweenSize(UDim2.new(0, 361, 0, 347), "Out", "Quad", 0.5)
    wait(0.5)
end)

--Start Intro
intro.Intro.Size = UDim2.new(0, 0, 0, 25)

intro.Intro.Top.Visible = false
intro.Intro.Loading.Visible = false
intro.Intro.Motto.Visible = false
intro.Intro.Background.Visible = false

wait(0)

intro.Enabled = true

intro.Intro:TweenSize(UDim2.new(0, 376, 0, 25), "Out", "Quad", 0.5)

wait(0.6)
intro.Intro.Top.Visible = true
intro.Intro:TweenSize(UDim2.new(0, 376, 0, 169), "Out", "Quad", 0.5)
wait(0.1)
intro.Intro.Motto.Visible = true
wait(0.1)
intro.Intro.Background.Visible = true
wait(0.2)
intro.Intro.Loading.Visible = true
wait(0.5)

intro.Intro.Background.Bar:TweenSize(UDim2.new(1, 0, 0, 33), "Out", "Quad", 3)

--End Intro
wait(1)

screenGui.Main.Size = UDim2.new(0, 0, 0, 31)
screenGui.Open.Position = UDim2.new(0, -75, 0.75, 0)

wait(3)

wait(0.5)
intro.Intro:TweenSize(UDim2.new(0, 376, 0, 25), "Out", "Quad", 0.5)
wait()
intro.Intro.Loading.Visible = false
wait(0.1)
intro.Intro.Background.Visible = false
wait(0.2)
intro.Intro.Motto.Visible = false
wait(0.5)
intro.Intro:TweenSize(UDim2.new(0, 0, 0, 25), "Out", "Quad", 0.4)
intro.Intro.Top.Visible = false
wait(1)
intro:Destroy()

wait(0.5)

screenGui.Enabled = true

screenGui.Open:TweenPosition(UDim2.new(0, 0, 0.75, 0), "Out", "Quad", 0.5)
wait(0.5)

print("Rose Hub process finished at " .. round(tick()-start) .. " milliseconds.")