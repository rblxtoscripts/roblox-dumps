-- https://lua.expert/
local t = {
	Races = {
		Title = "\240\159\143\135 Races",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	Trails = {
		Name = "\240\159\145\163 Trail",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	TameContest = {
		Name = "\240\159\143\134 Taming Contest",
		NameColor = Color3.fromRGB(254, 156, 76)
	},
	BreedContest = {
		Name = "\240\159\143\134 Cosmetic Contest",
		NameColor = Color3.fromRGB(255, 140, 221)
	},
	ResetMissions = {
		Name = "\240\159\142\175 Missions",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	ResetEventMissions = {
		Name = "\240\159\142\175 Event Missions",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	Leaderboards = {
		Name = "\240\159\143\134 Leaderboard",
		NameColor = Color3.fromRGB(254, 156, 76)
	},
	Boss = {
		Name = "\240\159\143\185 Spirit Tame",
		NameColor = Color3.fromRGB(85, 255, 127)
	},
	HorseShop = {
		Name = "\240\159\144\180 Stables",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	EventHorseShop = {
		Name = "\240\159\142\131 Haunted Stables",
		NameColor = Color3.fromRGB(255, 49, 73)
	},
	MutationHorse = {
		Name = "\240\159\167\172 Mutated",
		NameColor = Color3.fromRGB(25, 224, 255)
	},
	SpeciesHorse = {
		Name = "\240\159\144\180 Species",
		NameColor = Color3.fromRGB(255, 55, 55)
	},
	EventMutationHorse = {
		Name = "\240\159\144\163 Easter",
		NameColor = Color3.fromRGB(252, 196, 226)
	}
}
for v1, v2 in t do
	v2.Id = v1
	v2.Type = v1
end
return t