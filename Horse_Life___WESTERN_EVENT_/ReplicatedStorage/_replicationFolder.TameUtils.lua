-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("ItemDataService")
local SnapChances = Sonar("Constants").SnapChances
function t.IsRequiredLasso(p1, p2) --[[ IsRequiredLasso | Line: 17 | Upvalues: v1 (copy), v2 (copy) ]]
	local v12 = v1.GetByName(p1)
	local v22 = v2.GetByName(p2)
	local v3
	if v12 and (v22 and v22.ToolType == "Lasso") then
		if p1 == "Fairy" and v22.TargetSpecies ~= "Fairy" then
			return false
		end
		if p1 ~= "Fairy" and v22.TargetSpecies == "Fairy" then
			return false
		end
		local v4 = if v22.Name == "MasterLasso" then true else false
		v3 = (if v4 then v4 else not v12.Event) or v12.Event and v12.Rarity.Name == v22.Rarity.Name
	else
		v3 = false
	end
	return v3
end
function t.CanToolSnap(p1, p2) --[[ CanToolSnap | Line: 49 | Upvalues: v1 (copy), v2 (copy) ]]
	local v12 = v1.GetByName(p1)
	local v22 = v2.GetByName(p2)
	local isToolType = v22.ToolType == "Lasso"
	return (if isToolType then if v22.Name == "MasterLasso" then false elseif v22.Rarity.Name == "Event" then false else true else isToolType) and v12.Rarity.Name ~= v22.Rarity.Name
end
function t.GetSnapChanceLimit(p1, p2) --[[ GetSnapChanceLimit | Line: 67 | Upvalues: v1 (copy), v2 (copy), t (copy), SnapChances (copy) ]]
	local v12 = 0
	local v22 = v1.GetByName(p1).Rarity.Name
	local v3 = v2.GetByName(p2).Rarity.Name
	if t.CanToolSnap(p1, p2) then
		local v4 = SnapChances[v3]
		if v4 then
			local v5 = v4[v22]
			if v5 then
				v12 = v5
			end
		end
	end
	return v12
end
return t