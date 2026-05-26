-- https://lua.expert/
local t = {
	Normal = {
		ForcedDisplayName = "Clear Skies",
		P = 40,
		Emoji = "\240\159\140\164\239\184\143",
		Temp = NumberRange.new(10, 20)
	},
	Rain = {
		P = 20,
		MufflesAudio = true,
		Sound = "Rain",
		LightingMode = "Rain",
		Emoji = "\240\159\140\167\239\184\143",
		Particles = { "Rain" },
		Temp = NumberRange.new(10, 20)
	},
	Snow = {
		P = 20,
		MufflesAudio = true,
		LightingMode = "Snow",
		Emoji = "\226\157\132\239\184\143",
		Particles = { "Snow" },
		Temp = NumberRange.new(-5, 5)
	},
	Sunny = {
		P = 20,
		LightingMode = "Sunny",
		Emoji = "\226\152\128\239\184\143",
		Temp = NumberRange.new(20, 30)
	},
	["Clear Skies"] = {
		LightingMode = "Clear Skies"
	},
	Storm = {
		LightingMode = "Storm",
		Particles = { "Rain", "Storm" }
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return t