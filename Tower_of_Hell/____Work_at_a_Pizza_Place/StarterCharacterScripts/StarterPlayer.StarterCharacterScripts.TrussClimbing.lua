-- https://lua.expert/
local v1 = false
local CollectionService = game:GetService("CollectionService")
local Humanoid = script.Parent:WaitForChild("Humanoid")
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
local v2 = Instance.new("BindableEvent")
(script.Parent:WaitForChild("UpperTorso", 3) or script.Parent:WaitForChild("Torso")).Touched:Connect(function(p1) --[[ Line: 7 | Upvalues: CollectionService (copy), v1 (ref), Humanoid (copy), v2 (copy) ]]
	if not CollectionService:HasTag(p1, "Truss") then
		return
	end
	if v1 then
		return
	end
	v1 = true
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
	local v12 = nil
	v12 = Humanoid.StateChanged:Connect(function(p1, p2) --[[ Line: 13 | Upvalues: v12 (ref), v2 (ref) ]]
		if p1 ~= Enum.HumanoidStateType.Climbing then
			return
		end
		v12:Disconnect()
		v2:Fire()
	end)
	v2.Event:Wait()
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	v1 = false
end)