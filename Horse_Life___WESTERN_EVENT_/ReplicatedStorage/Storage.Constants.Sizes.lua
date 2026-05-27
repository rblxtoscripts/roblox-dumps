-- https://lua.expert/
local t = {
	Teacup = {
		Rarity = "Exclusive",
		P = 1,
		SizeMultiplier = 0.75
	},
	Teeny = {
		Rarity = "Legendary",
		P = 7.5,
		SizeMultiplier = 0.8
	},
	Tiny = {
		Rarity = "Epic",
		P = 25,
		SizeMultiplier = 0.85
	},
	Small = {
		Rarity = "Rare",
		P = 45,
		SizeMultiplier = 0.9
	},
	Little = {
		Rarity = "Uncommon",
		P = 60,
		SizeMultiplier = 0.95
	},
	Normal = {
		Rarity = "Common",
		P = 85,
		SizeMultiplier = 1
	},
	Big = {
		Rarity = "Uncommon",
		P = 60,
		SizeMultiplier = 1.05
	},
	Huge = {
		Rarity = "Rare",
		P = 45,
		SizeMultiplier = 1.1
	},
	Giant = {
		Rarity = "Epic",
		P = 25,
		SizeMultiplier = 1.15
	},
	Draft = {
		Rarity = "Legendary",
		P = 7.5,
		SizeMultiplier = 1.2
	},
	Mammoth = {
		Rarity = "Exclusive",
		P = 1,
		SizeMultiplier = 1.25
	}
}
local t2 = {}
for v1, v2 in t do
	v2.Name = v1
	table.insert(t2, v2)
end
table.sort(t2, function(p1, p2) --[[ Line: 79 ]]
	return p1.SizeMultiplier > p2.SizeMultiplier
end)
return {
	SizeTable = t,
	SizeArray = t2
}