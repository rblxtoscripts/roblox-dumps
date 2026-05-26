-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("MathUtils")
local v3 = Sonar("StorageUtils")
local RequiredFertilityLevel = Sonar("Constants").RequiredFertilityLevel
local v4 = Sonar(v3.Get("ModifierData"))
function t.GetBreedCooldown(p1) --[[ GetBreedCooldown | Line: 20 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetByName(p1.Species.Value)
	local TemporaryBreedCooldown = p1.TemporaryBreedCooldown.Value
	local BreedCooldown = v12.Stats.BreedCooldown
	if TemporaryBreedCooldown > 0 then
		BreedCooldown = TemporaryBreedCooldown
	end
	return BreedCooldown
end
function t.GetSlotFamily(p1, p2) --[[ GetSlotFamily | Line: 33 | Upvalues: t (copy) ]]
	local Serial = p1.Serial.Value
	local v1 = false
	local t2 = {}
	for v2, v3 in p2.Children do
		v1 = v3.Serial.Value == Serial
		if v1 then
			break
		end
	end
	if v1 then
		for v4, v5 in {
			father = p1.Father.Value,
			mother = p1.Mother.Value
		} do
			local v6 = nil
			for v7, v8 in p2.Animals do
				if v8.Serial.Value == v5 then
					v6 = v8
					break
				end
			end
			if v6 then
				t2[v4] = v6
			end
		end
		t2.child = p1
	else
		local Child = p1.Child.Value
		local v9 = nil
		for v10, v11 in p2.Children do
			if v11.Serial.Value == Child then
				v9 = v11
				break
			end
		end
		if v9 then
			t2 = t.GetSlotFamily(v9, p2)
		end
	end
	return t2
end
function t.GetSlotFertilityReductionPercentage(p1) --[[ GetSlotFertilityReductionPercentage | Line: 95 | Upvalues: t (copy), RequiredFertilityLevel (copy), v2 (copy) ]]
	return v2.map(if RequiredFertilityLevel <= t.GetTotalSkillLevel(p1) then p1.Upgrades.Fertility.Value else 0, 0, 10, 1, 0.5)
end
function t.GetTotalSkillLevel(p1) --[[ GetTotalSkillLevel | Line: 107 ]]
	local sum = 0
	for v1, v2 in p1.Upgrades do
		sum = sum + v2.Value
	end
	return sum
end
function t.GetFoalData(p1, p2) --[[ GetFoalData | Line: 118 | Upvalues: v1 (copy) ]]
	local t = {
		parents = {},
		rarity = v1.GetByName(p1.Species.Value).Rarity.Index
	}
	for v12, v2 in {
		mother = p1.Mother.Value,
		father = p1.Father.Value
	} do
		local v3 = nil
		for v4, v5 in p2.Animals do
			if v5.Serial.Value == v2 then
				v3 = v5
				break
			end
		end
		t.parents[v12] = v3
	end
	local v6 = false
	for v7, v8 in t.parents do
		v6 = v8.Favorite.Value
		if v6 then
			break
		end
	end
	t.anyParentsFavorites = v6
	return t
end
function t.GetSlotGestationTimeMultiplier(p1) --[[ GetSlotGestationTimeMultiplier | Line: 158 | Upvalues: v4 (copy) ]]
	local t = {}
	for v1, v2 in p1.ActiveBoosts do
		t[v2.Name] = true
	end
	local OriginBuff = p1.OriginBuff.Value
	if OriginBuff and string.len(OriginBuff) > 0 then
		t[OriginBuff] = true
	end
	local Eldering = p1.Eldering
	if Eldering.Completed and Eldering.Completed.Value then
		t.ElderModifier = true
	end
	for v42, v5 in p1.Mutations do
		t[v5.Value] = true
	end
	local v6 = 1
	for v7 in t do
		local v8 = v4[v7]
		if v8 then
			local v9 = table.find(v8.ModifierTargets, "GestationTimeMultiplier")
			local OnGet = v8.OnGet
			if v8.GestationTimeMultiplier and (v9 and OnGet) then
				v6 = OnGet("GestationTimeMultiplier", v6, nil)
			end
		end
	end
	return v6
end
function t.GetPlayerFoalsTimeUntilBirth(p1) --[[ GetPlayerFoalsTimeUntilBirth | Line: 212 | Upvalues: t (copy) ]]
	local UnixTimestamp = DateTime.now().UnixTimestamp
	local t2 = {}
	for v1, v2 in p1.Children do
		local v3 = t.GetSlotFamily(v2, p1)
		local TimeReceived = v2.TimeReceived.Value
		print(v3, TimeReceived)
		if v3.child == v2 and (v3.mother and v3.father) then
			local v4 = t.GetBreedCooldown(v3.mother)
			local v5 = t.GetSlotFertilityReductionPercentage(v3.mother)
			table.insert(t2, {
				timeUntilBirth = math.clamp(TimeReceived + v4 * t.GetSlotGestationTimeMultiplier(v3.mother) * v5 - UnixTimestamp, 0, (1 / 0)),
				slot = v2
			})
		end
	end
	table.sort(t2, function(p1, p2) --[[ Line: 245 ]]
		return p1.timeUntilBirth < p2.timeUntilBirth
	end)
	return t2
end
function t.GetFavoriteHorses(p1) --[[ GetFavoriteHorses | Line: 253 ]]
	return {}
end
function t.GetRarityRankedHorses(p1) --[[ GetRarityRankedHorses | Line: 260 ]]
	return {}
end
function t.GetTimeSinceLastLogin(p1) --[[ GetTimeSinceLastLogin | Line: 267 ]]
	return DateTime.now().UnixTimestamp - p1.Metadata.LastLogin.Value
end
return t