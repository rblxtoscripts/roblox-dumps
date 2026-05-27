-- https://lua.expert/
local t = {
	LeopardEars = {
		P = 40,
		Strength = 40
	},
	HunterEars = {
		P = 35,
		Strength = 35
	},
	CalicoEars = {
		P = 30,
		Strength = 30
	},
	ChaoticEars = {
		P = 30,
		Strength = 30
	},
	TuftedFelineEars = {
		P = 30,
		Strength = 30
	},
	FoldedFelineEars = {
		P = 30,
		Strength = 30
	},
	FluffyFelineEars = {
		P = 30,
		Strength = 30
	},
	CurvedFelineEars = {
		P = 30,
		Strength = 30
	},
	TabbyFelineEars = {
		P = 30,
		Strength = 30
	},
	BigFelineEars = {
		P = 30,
		Strength = 30
	},
	LynxEars = {
		P = 30,
		Strength = 30
	},
	WildEars = {
		P = 30,
		Strength = 30
	},
	FabelEars = {
		DisplayName = "FableEars",
		P = 30,
		Strength = 30
	},
	FadedEars = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Ears"
end
return {
	Ears = t
}