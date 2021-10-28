plrs = game:GetService("Players")
lplr = plrs.LocalPlayer
virtualUser = game:GetService("VirtualUser")
lplr.Idled:connect(
    function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
)

