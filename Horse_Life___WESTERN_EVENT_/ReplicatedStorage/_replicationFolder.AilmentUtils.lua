-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Ailment")
local v2 = Sonar(Sonar("StorageUtils").Get("AilmentData"))
local t = {
	GetAilmentFromName = function(p1) --[[ GetAilmentFromName | Line: 10 | Upvalues: v2 (copy) ]]
		return v2[p1]
	end
}
function t.Add(p1) --[[ Add | Line: 14 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = t.GetAilmentFromName(p1.Type)
	p1.AilmentData = v12
	p1.Image = if v12 then v12.Image else p1.Image
	return v1.new(p1)
end
function t.GetAll() --[[ GetAll | Line: 23 | Upvalues: v2 (copy) ]]
	return v2
end
function t.ClearAllDebuffs(p1, p2) --[[ ClearAllDebuffs | Line: 27 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetAilmentsFromPlayer(p1)
	if not v12 then
		return
	end
	for k, v in pairs(v12) do
		if p2 and v.AilmentData.Name == p2 then
			v:Remove()
			continue
		end
		if v.AilmentData.Type == "Debuff" and not v.AilmentData.Unblockable then
			v:Remove()
		end
	end
end
return t