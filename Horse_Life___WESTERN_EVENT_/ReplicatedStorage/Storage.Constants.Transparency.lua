-- https://lua.expert/
local t = {
	Ghostly = {
		Rarity = "Legendary",
		P = 7.5,
		Transparency = 0.8
	},
	Wisp = {
		Rarity = "Exclusive",
		P = 10,
		Transparency = 0.7
	},
	Hazy = {
		Rarity = "Legendary",
		P = 20,
		Transparency = 0.6
	},
	Faint = {
		Rarity = "Legendary",
		P = 30,
		Transparency = 0.5
	},
	Foggy = {
		Rarity = "Legendary",
		P = 35,
		Transparency = 0.4
	},
	Misty = {
		Rarity = "Legendary",
		P = 40,
		Transparency = 0.3
	},
	Veiled = {
		Rarity = "Epic",
		P = 45,
		Transparency = 0.2
	},
	Solid = {
		Rarity = "Legendary",
		P = 50,
		Transparency = 0.1
	}
}
local t2 = {}
for v1, v2 in t do
	v2.Name = v1
	table.insert(t2, v2)
end
table.sort(t2, function(p1, p2) --[[ Line: 49 ]]
	return p1.Transparency > p2.Transparency
end)
return {
	TransparencyTable = t,
	TransparencyArray = t2
}