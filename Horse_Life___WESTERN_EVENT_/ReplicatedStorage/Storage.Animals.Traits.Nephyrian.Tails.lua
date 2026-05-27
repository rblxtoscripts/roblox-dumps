-- https://lua.expert/
local t = {
	CelestialTail = {
		P = 25,
		Strength = 25
	},
	ZephyrMakoTail = {
		P = 25,
		Strength = 25
	},
	NWhispyTail = {
		DisplayName = "Whispytail",
		P = 25,
		Strength = 25
	},
	AncientCloudTail = {
		P = 25,
		Strength = 25
	},
	DenseCloudTail = {
		P = 25,
		Strength = 25
	},
	DriftingTail = {
		P = 25,
		Strength = 25
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Tails"
end
return {
	Tails = t
}