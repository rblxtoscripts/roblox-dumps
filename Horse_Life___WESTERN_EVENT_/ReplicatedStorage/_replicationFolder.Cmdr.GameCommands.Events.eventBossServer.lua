-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GlobalBossFightService")
local v2 = Sonar("PlaceTypeService")
return function(p1, p2, p3, p4) --[[ Line: 9 | Upvalues: v2 (copy), v1 (copy) ]]
	if p3 and p3 < 0 then
		return "Custom health cannot be less than 0"
	end
	if p4 and p4 < 0 then
		return "Start delay cannot be less than 0"
	end
	local v12 = if v2.IsTestGame() then 100 else 4500
	if p3 and p3 < v12 then
		return "Custom health cannot be less than " .. v12
	end
	v1:StartFight(p2, p3, p4)
	local v3, v4
	if p3 then
		v3 = " (Health: " .. p3 .. ")"
		v4 = p2
	else
		v4 = p2
		v3 = ""
	end
	return "Global boss event started: " .. v4 .. v3
end