-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local t2 = {
	MapIcon = {
		{
			Level = 1,
			Value = true
		}
	},
	SpawnChance = {
		{
			Level = 1,
			Value = 1.25
		},
		{
			Level = 2,
			Value = 1.5
		}
	},
	TraitSpawn = {
		{
			Level = 1,
			Value = {
				Pattern = 1,
				Cosmetic = 1
			}
		},
		{
			Level = 2,
			Value = {
				Pattern = 2,
				Cosmetic = 2
			}
		},
		{
			Level = 3,
			Value = {
				Pattern = 3,
				Cosmetic = 3,
				Paint = 1
			}
		},
		{
			Level = 4,
			Value = {
				Pattern = 4,
				Cosmetic = 4,
				Paint = 2
			}
		}
	},
	MutationLuck = {
		{
			Level = 1,
			Value = 1.25
		},
		{
			Level = 2,
			Value = 1.5
		},
		{
			Level = 3,
			Value = 1.75
		},
		{
			Level = 4,
			Value = 2
		}
	}
}
for v1 in require(ReplicatedStorage.Sonar)("ItemDataService").GetType("Animals") do
	if not t[v1] then
		t[v1] = {}
	end
end
for v2, v3 in t do
	for v4, v5 in t2 do
		if not v3[v4] then
			v3[v4] = v5
		end
	end
end
return t