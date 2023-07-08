loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/1st.lua"), true))() -- 1st Lua

loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/WS.lua"), true))() -- WS Lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/novaghoul/Roblox/main/Script/Inf_Jump.lua"), true))() -- Inf_Jump Lua


mouse.KeyDown:connect(
    function(keyDown)
		if keyDown == "v" then
			lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0, .5, disTeleport)
		end
    end
)

game:GetService("Workspace").realTrap.MeshMid --Bẫy
game:GetService("Workspace").Keys:GetChildren()[4].COLOR.Value
game:GetService("Workspace").Keys:GetChildren()[4].Handle
game:GetService("Workspace").KeyCards:GetChildren()[9].CardNumberVariable.Value
game:GetService("Workspace").KeyCards:GetChildren()[9].Handle
game:GetService("Workspace").Items.CarWheel
game:GetService("Workspace").Items.Can
game:GetService("Workspace").Items.Bag
game:GetService("Workspace").Items.BagFemale
game:GetService("Workspace").Items.Ball
game:GetService("Workspace").Items.Bass
game:GetService("Workspace").Items.Coin
game:GetService("Workspace").Items.Crowbar
game:GetService("Workspace").Items.Hammer
game:GetService("Workspace").Items.Wrench
game:GetService("Workspace").Items.Wtf
game:GetService("Workspace").Door_Basement.door_basement2.Door --Cửa thoát
game:GetService("Workspace").Door_Basement.Locks.Padlock1.RootPart --Ổ khóa
game:GetService("Workspace").Door_Basement.Locks.Padlock1.COLOR.Value --Màu của ổ khóa
game:GetService("Workspace").Map.Building.Stage2.Hallway_02.DoorMaster.CardCheckDoor_1 --Cửa cần thẻ của khu vực sảnh chính tầng 2
game:GetService("Workspace").Map.Building.Stage2.Hallway_02.DoorMaster.CardCheckDoor_1.CheckNumber --Số thẻ cần mở cửa