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

_G.faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}
_G.ws_g = 17
_G.jp_g = 30
_G.hitBoxSize = {5, 5, 5}
_G.hitBoxBody = "Head"
_G.hitBoxColor = "Really blue"
_G.hitBoxTransparency = 1
-- HumanoidRootPart

_G.myTool = lplr.Backpack:FindFirstChild("Check Target") or lplr.Character:FindFirstChild("Check Target")
_G.myFace = lplr.Character.Head:FindFirstChildOfClass("Decal")

function SendChat(String) -- Send a chat to the game chat
    game.StarterGui:SetCore(
        "ChatMakeSystemMessage",
        {
            Text = "[OUTPUT]: " .. String
        }
    )
end

function firstScript()
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.1)
            _G.myTool = lplr.Backpack:FindFirstChild("Check Target") or lplr.Character:FindFirstChild("Check Target")
            lplr.Backpack.ChildAdded:connect(
                function(m)
                    if m.Name == "Check Target" then
                        _G.myTool = m
                    end
                end
            )

            lplr.Character.ChildAdded:connect(
                function(m)
                    if m.Name == "Check Target" then
                        _G.myTool = m
                    end
                end
            )
        end
    )
end
firstScript()

function changeColor(parent, item, type, target)
    if type == "b" then
        if parent.Name == "Police Badge" then
            item.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
        elseif parent.Name == "Check Target" then
            if target == true then
                item.BackgroundColor3 = Color3.fromRGB(203, 132, 66)
            else
                item.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    elseif type == "t" then
        if parent.Name == "Police Badge" then
            item.TextColor3 = Color3.fromRGB(13, 105, 172)
        elseif parent.Name == "Check Target" then
            if target == true then
                item.TextColor3 = Color3.fromRGB(203, 132, 66)
            else
                item.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    end
end

function createESP(parent)
    local target = false
    local otherTool = parent.Backpack:FindFirstChild("Check Target") or parent.Character:FindFirstChild("Check Target")
    local otherFace = parent.Character.Head:FindFirstChildOfClass("Decal")
    local bgui = Instance.new("BillboardGui", parent.Character.Head)
    bgui.Name = ("EGUI")
    bgui.AlwaysOnTop = true
    bgui.ExtentsOffset = Vector3.new(0, 3, 0)
    bgui.Size = UDim2.new(0, 200, 0, 50)
    local nam = Instance.new("TextLabel", bgui)
    nam.Text = parent.Name
    nam.BackgroundTransparency = 1
    nam.TextSize = 14
    nam.Font = ("Arial")
    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    nam.Size = UDim2.new(0, 200, 0, 50)
    for _, p in pairs(parent.Character:GetChildren()) do
        if p.Name == ("Head") then
            for _, f in pairs(_G.faces) do
                local m = Instance.new("SurfaceGui", p)
                m.Name = ("EGUI")
                m.Face = f
                m.Active = true
                m.AlwaysOnTop = true
                local mf = Instance.new("Frame", m)
                mf.Size = UDim2.new(1, 0, 1, 0)
                mf.BorderSizePixel = 0
                mf.BackgroundTransparency = 0.5
                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)

                if parent.Backpack:FindFirstChild("Police Badge") or parent.Character:FindFirstChild("Police Badge") then
                    mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                else
                    mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                end

                parent.Backpack.ChildAdded:connect(
                    function(m)
                        changeColor(m, mf, "b", target)
                    end
                )

                parent.Character.ChildAdded:connect(
                    function(m)
                        changeColor(m, mf, "b", target)
                    end
                )
                spawn(
                    function()
                        repeat
                            wait()
                        until _G.myTool

                        if _G.myTool then
                            if
                                parent.Backpack:FindFirstChild("Police Badge") or
                                    parent.Character:FindFirstChild("Police Badge")
                             then
                                mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                            elseif _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage.Image == otherFace.Texture then
                                mf.BackgroundColor3 = Color3.fromRGB(203, 132, 66)
                                target = true
                            elseif parent.RedHanded.Value == true then
                                mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                            else
                                mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                            end
                            _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage:GetPropertyChangedSignal("Image"):connect(
                                function()
                                    if
                                        parent.Backpack:FindFirstChild("Police Badge") or
                                            parent.Character:FindFirstChild("Police Badge")
                                     then
                                        mf.BackgroundColor3 = Color3.fromRGB(13, 105, 172)
                                    elseif
                                        _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage.Image ==
                                            otherFace.Texture
                                     then
                                        mf.BackgroundColor3 = Color3.fromRGB(203, 132, 66)
                                        target = true
                                    elseif parent.RedHanded.Value == true then
                                        mf.BackgroundColor3 = Color3.fromRGB(196, 40, 28)
                                    else
                                        mf.BackgroundColor3 = Color3.fromRGB(75, 151, 75)
                                    end
                                end
                            )
                        end
                    end
                )
            end
        end
    end

    if parent.Backpack:FindFirstChild("Police Badge") or parent.Character:FindFirstChild("Police Badge") then
        nam.TextColor3 = Color3.fromRGB(13, 105, 172)
    else
        nam.TextColor3 = Color3.fromRGB(75, 151, 75)
    end

    parent.Backpack.ChildAdded:connect(
        function(m)
            changeColor(m, nam, "t", target)
        end
    )

    parent.Character.ChildAdded:connect(
        function(m)
            changeColor(m, nam, "t", target)
        end
    )

    parent.RedHanded:GetPropertyChangedSignal("Value"):connect(
        function()
            if parent.Backpack:FindFirstChild("Police Badge") or parent.Character:FindFirstChild("Police Badge") then
                nam.TextColor3 = Color3.fromRGB(13, 105, 172)
            elseif parent.RedHanded.Value == true then
                nam.TextColor3 = Color3.fromRGB(196, 40, 28)
            elseif target == true then
                nam.TextColor3 = Color3.fromRGB(203, 132, 66)
            else
                nam.TextColor3 = Color3.fromRGB(75, 151, 75)
            end
        end
    )
    spawn(
        function()
            repeat
                wait()
            until _G.myTool
            if _G.myTool then
                if parent.Backpack:FindFirstChild("Police Badge") or parent.Character:FindFirstChild("Police Badge") then
                    nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                elseif _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage.Image == otherFace.Texture then
                    nam.TextColor3 = Color3.fromRGB(203, 132, 66)
                    target = true
                elseif parent.RedHanded.Value == true then
                    nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                else
                    nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                end

                _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage:GetPropertyChangedSignal("Image"):connect(
                    function()
                        if
                            parent.Backpack:FindFirstChild("Police Badge") or
                                parent.Character:FindFirstChild("Police Badge")
                         then
                            nam.TextColor3 = Color3.fromRGB(13, 105, 172)
                        elseif _G.myTool.PistolPart.SurfaceGui.Phone.FaceColor.FaceImage.Image == otherFace.Texture then
                            nam.TextColor3 = Color3.fromRGB(203, 132, 66)
                            target = true
                        elseif parent.RedHanded.Value == true then
                            nam.TextColor3 = Color3.fromRGB(196, 40, 28)
                        else
                            nam.TextColor3 = Color3.fromRGB(75, 151, 75)
                        end
                    end
                )
            end
        end
    )
end

function enableESPCode()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            o.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait()
                        createESP(o)
                    end
                end
            )
        end
    end

    plrs.PlayerAdded:Connect(
        function(newPlayer)
            newPlayer.CharacterAdded:Connect(
                function(characterModel)
                    if characterModel:WaitForChild("Head") then
                        wait()
                        createESP(newPlayer)
                    end
                end
            )
        end
    )
end

enableESPCode()

function espFirst()
    for _, o in pairs(plrs:GetPlayers()) do
        if o.Name ~= lplr.Name then
            spawn(
                function()
                    if o.Character:FindFirstChild("Head") then
                        wait(0.1)
                        createESP(o)
                    end
                end
            )
        end
    end
end

function infJump()
    lplr.Character.Humanoid.JumpPower = _G.jp_g
    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end

function statsPlayerWs()
    lplr.Character.Humanoid.WalkSpeed = _G.ws_g

    lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
        function()
            if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            end
        end
    )
    lplr.CharacterAdded:Connect(
        function(characterModel)
            wait(0.1)
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
            lplr.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):connect(
                function()
                    if lplr.Character.Humanoid.WalkSpeed ~= _G.ws_g then
                        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
                    end
                end
            )
            if sg:GetCoreGuiEnabled(0) == false then
                sg:SetCoreGuiEnabled(0, true)
            end
        end
    )
end
statsPlayerWs()

function changeWS(typeWS)
    if typeWS == 0 then
        _G.ws_g = _G.ws_g + 5
        lplr.Character.Humanoid.WalkSpeed = _G.ws_g
    elseif typeWS == 1 then
        if _G.ws_g >= 0 then
            _G.ws_g = _G.ws_g - 5
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
        if _G.ws_g < 17 then
            _G.ws_g = 17
            lplr.Character.Humanoid.WalkSpeed = _G.ws_g
        end
    end
end

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

espFirst()

lplr.Idled:connect(
    function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
