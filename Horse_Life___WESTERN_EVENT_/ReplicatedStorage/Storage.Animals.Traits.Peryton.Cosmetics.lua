-- https://lua.expert/
local t = {
	Nothing = {
		P = 25,
		Strength = 25
	},
	FrontLegScales = {
		P = 40,
		Strength = 40
	},
	ChinFeathers = {
		P = 40,
		Strength = 40
	},
	BackLegScales = {
		P = 40,
		Strength = 40
	},
	HeadFeatherTufts = {
		P = 40,
		Strength = 40
	},
	LegFeathers = {
		P = 40,
		Strength = 40
	},
	EarFeatherTufts = {
		P = 40,
		Strength = 40
	},
	AnkleFeatherTuft = {
		P = 40,
		Strength = 40
	},
	PChestFur = {
		DisplayName = "ChestFur",
		P = 40,
		Strength = 40
	},
	Beak = {
		P = 35,
		Strength = 35
	},
	SecretaryBeak = {
		P = 35,
		Strength = 35
	},
	Lashes = {
		P = 35,
		Strength = 35
	},
	EyeFeathers = {
		P = 35,
		Strength = 35
	},
	OwlTuft = {
		P = 35,
		Strength = 35
	},
	SecretaryHeadFeathers = {
		P = 25,
		Strength = 25
	},
	PuffyLegFeathers = {
		P = 25,
		Strength = 25
	},
	LimbFeatherTufts = {
		P = 25,
		Strength = 25
	},
	HindFeathers = {
		P = 25,
		Strength = 25
	},
	LimbFeathers = {
		P = 25,
		Strength = 25
	},
	HeadFeathers = {
		P = 25,
		Strength = 25
	},
	MysticalCloudAnkleFluff = {
		P = 25,
		Strength = 25
	},
	CandySweptHoof = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = v2.Type or "Cosmetics"
end
return {
	Cosmetics = t
}