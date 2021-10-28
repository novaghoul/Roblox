-- FloodGui by Zmann

--[[
Please do not leak this script as your own, credit the original owner

Change the 'WaitTime'(time it takes to load map) to 5-9 when using AutoFarm 
in public servers, and around 3 in private. Then click 'Reload GUI' to save changes

Use 'Reload GUI' after you die, as some functions will not work after you respawn

Enable 'NoClip' if you are getting killed when Teleporting to the exit, or if you just wanna go thru walls 

Click 'ClickTP (r)' to enable click TP, hover your mouse over where you want to TP, and press r

All other buttons are pretty self-explanatory
--]]
function GUI(seconds)
    local Player = game.Players.LocalPlayer.Character
    local on = false
    local clip = true

    local FloodGUI = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Credits = Instance.new("TextLabel")
    local ClickTP = Instance.new("TextButton")
    local GetButtons = Instance.new("TextButton")
    local DestroyExit = Instance.new("TextButton")
    local TpSpawn = Instance.new("TextButton")
    local TpExit = Instance.new("TextButton")
    local X = Instance.new("TextButton")
    local AutoFarm = Instance.new("TextButton")
    local Reload = Instance.new("TextButton")
    local NoClip = Instance.new("TextButton")
    local Waittime = Instance.new("TextBox")
    FloodGUI.Parent = game.CoreGui

    MainFrame.Parent = FloodGUI
    MainFrame.BackgroundColor3 = Color3.new(0, 0, 1)
    MainFrame.BackgroundTransparency = 0.3
    MainFrame.Position = UDim2.new(0.77, 0, 0.53, 0)
    MainFrame.Size = UDim2.new(0, 300, 0, 300)
    MainFrame.Active = true
    MainFrame.Draggable = true

    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0, 189, 0, 32)
    Title.Font = Enum.Font.SourceSansBold
    Title.FontSize = Enum.FontSize.Size36
    Title.Text = "FloodGui"
    Title.TextColor3 = Color3.new(1, 1, 1)

    Credits.Parent = MainFrame
    Credits.BackgroundTransparency = 1
    Credits.Size = UDim2.new(0, 189, 0, 32)
    Credits.Font = Enum.Font.SourceSansBold
    Credits.FontSize = Enum.FontSize.Size24
    Credits.Text = "GUI created by Zmann"
    Credits.TextColor3 = Color3.new(0, 0, 0.03)
    Credits.Position = UDim2.new(0.20, 0, 0.88, 0)

    ClickTP.Parent = MainFrame
    ClickTP.BackgroundColor3 = Color3.new(0, 0, 0.5)
    ClickTP.Position = UDim2.new(0.03, 0, 0.75, 0)
    ClickTP.Size = UDim2.new(0, 125, 0, 36)
    ClickTP.Font = Enum.Font.SourceSansBold
    ClickTP.FontSize = Enum.FontSize.Size24
    ClickTP.Text = "Click TP (r)"
    ClickTP.TextColor3 = Color3.new(1, 1, 1)
    ClickTP.MouseButton1Down:connect(
        function()
            plr = game.Players.LocalPlayer
            mouse = plr:GetMouse()
            mouse.KeyDown:connect(
                function(key)
                    if key == "r" then
                        if mouse.Target then
                            plr.Character.HumanoidRootPart.CFrame =
                                CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
                        end
                    end
                end
            )
            warn("[FloodGui] ClickTP Enabled!")
        end
    )

    function buttons(waittime)
        local Map = game.Workspace.Multiplayer.Map
        local Btns = {}
        local Desc = {}
        for i, v in pairs(Map:GetDescendants()) do
            Desc[v.Name .. "Obj"] = v
        end
        for i = 0, 30 do
            if Desc["_Button" .. tostring(i) .. "Obj"] ~= nil then
                table.insert(Btns, Desc["_Button" .. tostring(i) .. "Obj"])
            end
        end
        for i, v in pairs(Btns) do
            local Hitbox = v.Hitbox
            Player.HumanoidRootPart.CFrame = Hitbox.CFrame
            wait(waittime)
        end
    end

    GetButtons.Parent = MainFrame
    GetButtons.BackgroundColor3 = Color3.new(0, 0, 0.5)
    GetButtons.Position = UDim2.new(0.03, 0, 0.55, 0)
    GetButtons.Size = UDim2.new(0, 125, 0, 36)
    GetButtons.Font = Enum.Font.SourceSansBold
    GetButtons.FontSize = Enum.FontSize.Size24
    GetButtons.Text = "Get Buttons"
    GetButtons.TextColor3 = Color3.new(1, 1, 1)
    GetButtons.MouseButton1Down:connect(
        function()
            warn("[FloodGui] Pressing buttons...")
            buttons(0.3)
            warn("[FloodGui] Buttons Pressed!")
        end
    )

    TpSpawn.Parent = MainFrame
    TpSpawn.BackgroundColor3 = Color3.new(0, 0, 0.5)
    TpSpawn.Position = UDim2.new(0.53, 0, 0.75, 0)
    TpSpawn.Size = UDim2.new(0, 125, 0, 36)
    TpSpawn.Font = Enum.Font.SourceSansBold
    TpSpawn.FontSize = Enum.FontSize.Size24
    TpSpawn.Text = "TP Spawn"
    TpSpawn.TextColor3 = Color3.new(1, 1, 1)
    TpSpawn.MouseButton1Down:connect(
        function()
            Player.HumanoidRootPart.CFrame = CFrame.new(-25, -145, 47)
            warn("[FloodGui] Teleported!")
        end
    )

    DestroyExit.Parent = MainFrame
    DestroyExit.BackgroundColor3 = Color3.new(0, 0, 0.5)
    DestroyExit.Position = UDim2.new(0.53, 0, 0.55, 0)
    DestroyExit.Size = UDim2.new(0, 125, 0, 36)
    DestroyExit.Font = Enum.Font.SourceSansBold
    DestroyExit.FontSize = Enum.FontSize.Size24
    DestroyExit.Text = "Destroy Exit"
    DestroyExit.TextColor3 = Color3.new(1, 1, 1)
    DestroyExit.MouseButton1Down:connect(
        function()
            local Map = game.Workspace.Multiplayer.Map
            Map.ExitBlock:Destroy()
            warn("[FloodGui] Exit Destroyed!")
        end
    )

    X.Parent = MainFrame
    X.BackgroundTransparency = 1
    X.Position = UDim2.new(.93, 0, 0, 0)
    X.Size = UDim2.new(0, 20, 0, 20)
    X.Font = Enum.Font.SourceSansBold
    X.FontSize = Enum.FontSize.Size24
    X.Text = "X"
    X.TextColor3 = Color3.new(1, 1, 1)
    X.MouseButton1Down:connect(
        function()
            on = false
            clip = true
            MainFrame:Remove()
        end
    )

    function Tpexit(pos)
        local Player = game.Players.LocalPlayer.Character
        local Map = game.Workspace.Multiplayer.Map
        local ExitBlock = Map:FindFirstChild("ExitRegion")
        local posit
        if ExitBlock == nil then
            if pos == 1 then
                posit = CFrame.new(2080, 990, 2)
            elseif pos == 2 then
                posit = CFrame.new(4080, 990, 2)
            end
        else
            posit = ExitBlock.CFrame
        end
        local Ts = game:GetService("TweenService")
        local Ti = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
        local Tp = {
            CFrame = posit
        }
        local Tw = Ts:Create(Player.HumanoidRootPart, Ti, Tp)
        wait(0.1)
        Tw:Play()
    end

    TpExit.Parent = MainFrame
    TpExit.BackgroundColor3 = Color3.new(0, 0, 0.5)
    TpExit.Position = UDim2.new(0.53, 0, 0.35, 0)
    TpExit.Size = UDim2.new(0, 125, 0, 36)
    TpExit.Font = Enum.Font.SourceSansBold
    TpExit.FontSize = Enum.FontSize.Size24
    TpExit.Text = "TP Exit"
    TpExit.TextColor3 = Color3.new(1, 1, 1)
    TpExit.MouseButton1Down:connect(
        function()
            warn("[FloodGui] Teleporting...")
            exit = game.Workspace.Multiplayer.Map:FindFirstChild("ExitRegion")
            spawn = game.Workspace.Multiplayer.Map:FindFirstChild("Spawn")
            if exit then
                Tpexit()
            else
                if spawn.Position.X < 3000 then
                    Tpexit(1)
                else
                    Tpexit(2)
                end
            end
        end
    )

    AutoFarm.Parent = MainFrame
    AutoFarm.BackgroundColor3 = Color3.new(0, 0, 0.5)
    AutoFarm.Position = UDim2.new(0.03, 0, 0.15, 0)
    AutoFarm.Size = UDim2.new(0, 125, 0, 36)
    AutoFarm.Font = Enum.Font.SourceSansBold
    AutoFarm.FontSize = Enum.FontSize.Size24
    AutoFarm.Text = "AutoFarm"
    AutoFarm.TextColor3 = Color3.new(1, 1, 1)
    AutoFarm.MouseButton1Down:connect(
        function()
            if on then
                on = false
                AutoFarm.BackgroundColor3 = Color3.new(0, 0, 0.5)
                AutoFarm.Text = "AutoFarm"
                warn("[FloodGui] Autofarm off!")
            else
                on = true
                AutoFarm.BackgroundColor3 = Color3.new(0.5, 0, 0)
                AutoFarm.Text = "Stop Autofarm"
                warn("[FloodGui] Autofarm on!")
            end
            local msg = "qwertyuiop"
            while on and wait(0.5) do
                local r = false
                local history = Game:GetService("LogService"):GetLogHistory()
                for i = #history, 1, -1 do
                    if string.find(history[i].message, "2925 2925") and not string.find(history[i].message, msg) then
                        wait(seconds)
                        buttons(1)
                        local exit = game.Workspace.Multiplayer.Map:FindFirstChild("ExitRegion")
                        Player.HumanoidRootPart.CFrame =
                            CFrame.new(exit.Position.X, exit.Position.Y, exit.Position.Z + 25)
                        Tpexit()
                        r = true
                        msg = "2925 2925"
                    elseif string.find(history[i].message, "1700 1700") and not string.find(history[i].message, msg) then
                        wait(seconds)
                        buttons(0.3)
                        local spawn = game.Workspace.Multiplayer.Map:FindFirstChild("Spawn")
                        if spawn.Position.X < 3000 then
                            Tpexit(1)
                        else
                            Tpexit(2)
                        end
                        r = true
                        msg = "1700 1700"
                    elseif
                        (string.find(history[i].message, "%d%d%d%s%d%d%d") or
                            string.find(history[i].message, "%d%d%d%d%s%d%d%d%d")) and
                            not string.find(history[i].message, msg)
                     then
                        wait(seconds)
                        buttons(0.3)
                        Tpexit()
                        r = true
                        msg = history[i].message
                    elseif string.find(history[i].message, "NewMap") then
                        r = true
                    end
                    if r then
                        break
                    end
                end
            end
        end
    )

    NoClip.Parent = MainFrame
    NoClip.BackgroundColor3 = Color3.new(0, 0, 0.5)
    NoClip.Position = UDim2.new(0.53, 0, 0.15, 0)
    NoClip.Size = UDim2.new(0, 125, 0, 36)
    NoClip.Font = Enum.Font.SourceSansBold
    NoClip.FontSize = Enum.FontSize.Size24
    NoClip.Text = "NoClip (Off)"
    NoClip.TextColor3 = Color3.new(1, 1, 1)
    NoClip.MouseButton1Down:connect(
        function()
            if clip then
                clip = false
                NoClip.BackgroundColor3 = Color3.new(0, 0.5, 0)
                NoClip.Text = "NoClip (On)"
                warn("[FloodGui] NoClip Enabled!")
            else
                clip = true
                NoClip.BackgroundColor3 = Color3.new(0, 0, 0.5)
                NoClip.Text = "NoClip (Off)"
                warn("[FloodGui] NoClip Disabled!")
            end
            game:getService("RunService"):BindToRenderStep(
                "",
                0,
                function()
                    if not game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid") then
                        return
                    end
                    if not clip then
                        game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
                    end
                end
            )
        end
    )

    Reload.Parent = MainFrame
    Reload.BackgroundColor3 = Color3.new(0, 0, 0.5)
    Reload.Position = UDim2.new(0.03, 0, 0.35, 0)
    Reload.Size = UDim2.new(0, 125, 0, 36)
    Reload.Font = Enum.Font.SourceSansBold
    Reload.FontSize = Enum.FontSize.Size24
    Reload.Text = "Reload GUI"
    Reload.TextColor3 = Color3.new(1, 1, 1)
    Reload.MouseButton1Down:connect(
        function()
            local wait = Waittime.Text
            local txt = tonumber(wait)
            if txt then
                warn("[FloodGui] WaitTime Set!")
                on = false
                clip = true
                MainFrame:Remove()
                GUI(wait)
            else
                on = false
                clip = true
                MainFrame:Remove()
                GUI(seconds)
                warn("[FloodGui] GUI Reloaded!")
            end
        end
    )

    Waittime.Parent = MainFrame
    Waittime.BackgroundColor3 = Color3.new(0, 0, 0.5)
    Waittime.Position = UDim2.new(0.58, 0, 0.03, 0)
    Waittime.Size = UDim2.new(0, 90, 0, 24)
    Waittime.Font = Enum.Font.SourceSansBold
    Waittime.FontSize = Enum.FontSize.Size16
    Waittime.TextSize = 20
    Waittime.Text = "WaitTime"
    Waittime.TextColor3 = Color3.new(1, 1, 1)
end
GUI(3)
warn("FloodGui Loaded!")
