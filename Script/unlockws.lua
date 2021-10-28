for _,v in pairs(workspace:GetChildren()) do 
    if v:IsA("BasePart") then 
        v.Locked = false 
    end
end