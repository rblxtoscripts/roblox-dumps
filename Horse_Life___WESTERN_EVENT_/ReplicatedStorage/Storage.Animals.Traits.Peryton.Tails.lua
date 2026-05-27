-- https://lua.expert/
local t = {
	PFlowingTail = {
		DisplayName = "FlowingTail",
		P = 50,
		Strength = 50
	},
	LayeredFeatherTail = {
		P = 50,
		Strength = 50
	},
	ElegantFeatherTail = {
		P = 50,
		Strength = 50
	},
	RoadRunnerTail = {
		P = 50,
		Strength = 50
	},
	SecretaryBirdTail = {
		P = 50,
		Strength = 50
	},
	Fantail = {
		P = 50,
		Strength = 50
	},
	MysticCloudTail = {
		P = 35,
		Strength = 35
	},
	CandyTail = {
		P = 0,
		Strength = 10
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}