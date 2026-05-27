-- https://lua.expert/
local t = {}
local function getSortedMissionIndices(p1) --[[ getSortedMissionIndices | Line: 3 ]]
	local t = {}
	for v1 in p1 do
		if type(v1) == "number" then
			table.insert(t, v1)
		end
	end
	table.sort(t)
	return t
end
function t.MissionUnlockRequired(p1) --[[ MissionUnlockRequired | Line: 16 ]]
	return p1.MissionUnlockRequired == true
end
function t.MissionUnlockSkippable(p1) --[[ MissionUnlockSkippable | Line: 21 ]]
	return p1.MissionUnlockSkippable == true
end
t.Variants = {
	Default = {
		[1] = {
			Type = "Tame",
			Amount = 15
		},
		[2] = {
			Type = "BondLevelUp",
			Amount = 1
		},
		[3] = {
			Type = "StatLevelUp",
			Amount = 5
		},
		[4] = {
			Type = "HarvestNode",
			Amount = 10
		},
		[6] = {
			Type = "Breed",
			Amount = 10
		}
	},
	Fertile = {
		[1] = {
			Type = "Tame",
			Amount = 30
		},
		[4] = {
			Type = "BondLevelUp",
			Amount = 2
		},
		[6] = {
			Type = "Foal",
			Amount = 5
		},
		[7] = {
			Type = "StatLevelUp",
			Amount = 10
		},
		[8] = {
			Type = "DefeatBoss",
			Amount = 1
		},
		[9] = {
			Type = "HarvestNode",
			Amount = 15
		},
		[10] = {
			Type = "Breed",
			Amount = 15
		}
	},
	Infertile = {
		[1] = {
			Type = "Tame",
			Amount = 20
		},
		[3] = {
			Type = "JumpObstacle",
			Amount = 10
		},
		[4] = {
			Type = "BondLevelUp",
			Amount = 1
		},
		[6] = {
			Type = "Foal",
			Amount = 3
		},
		[7] = {
			Type = "StatLevelUp",
			Amount = 5
		},
		[10] = {
			Type = "Breed",
			Amount = 10
		}
	}
}
function t.GetVariantKey(p1, p2) --[[ GetVariantKey | Line: 52 ]]
	if p1.FertileChoice then
		return p2 or "Fertile"
	else
		return "Default"
	end
end
function t.GetMissions(p1) --[[ GetMissions | Line: 59 | Upvalues: t (copy) ]]
	return t.Variants[p1]
end
function t.GetMissionIndices(p1) --[[ GetMissionIndices | Line: 63 | Upvalues: t (copy), getSortedMissionIndices (copy) ]]
	local v1 = t.GetMissions(p1)
	if v1 then
		return getSortedMissionIndices(v1)
	else
		return {}
	end
end
function t.GetFolderName(p1, p2) --[[ GetFolderName | Line: 72 ]]
	if p2 == "Default" then
		return p1
	else
		return p1 .. "_" .. p2
	end
end
return t