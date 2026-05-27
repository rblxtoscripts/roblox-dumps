-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("ItemDataService")
local v2 = game:GetService("RunService"):IsServer()
local tbl = {
	{
		Name = "CandyCane",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 50
	},
	{
		Name = "Stars",
		Amount = 100
	},
	{
		Name = "SnowLasso",
		Amount = 1
	},
	{
		Name = "MistletoeEarclip",
		Amount = 1
	},
	{
		Name = "PeppermintEarclip",
		Amount = 2
	},
	{
		Name = "IceLasso",
		Amount = 2
	},
	{
		Name = "Stars",
		Amount = 250
	},
	{
		Name = "AlcesBasicSocks",
		Theme = "Candycane",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 250
	},
	{
		Name = "CandyCane",
		Amount = 1
	},
	{
		Name = "SnowLantern",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 200
	},
	{
		Name = "MouthStocking",
		Amount = 1
	},
	{
		Name = "SnowLasso",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 100
	},
	{
		Name = "FestiveTopHat",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 250
	},
	{
		Name = "HindPresent",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 150
	},
	{
		Name = "HollyWreath",
		Amount = 1
	},
	{
		Name = "PolarPlush",
		Amount = 1
	},
	{
		Name = "Stars",
		Amount = 200
	},
	{
		Name = "SnowLasso",
		Amount = 6
	},
	{
		Amount = 1,
		Horse = {
			Species = "Hollyhoof",
			Origin = "Developer",
			Infertile = true,
			Preset = {
				"PlushNeapolitan",
				"PlushNeapolitan2",
				"PlushMatchaBoba",
				"PlushRainbowSherbet",
				"MoonL",
				"MoonD",
				"Demon",
				"Nightmare",
				"Vampire",
				"Poison",
				"Morpho",
				"LunarMoth",
				"DartFrog",
				"Vaporwave",
				"Magma",
				"JewelBeetle",
				"CottonCandy"
			},
			MutationSlotChances = {
				[0] = 0,
				[1] = 0,
				[2] = 0,
				[3] = 1
			},
			MutationChances = {
				Nothing = 0,
				Wings = 100
			},
			MutationsToGuarantee = {},
			SkillLevels = {
				All = 0.5
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	}
}
for k, v in pairs(tbl) do
	local v3 = v1.GetByName(v.Name)
	if type(v) then
		v3 = v
	end
	if not v3 then
		if v2 then
			warn("Item removed from Advent Tree", v.Name)
		end
		tbl[k] = nil
	end
end
return tbl