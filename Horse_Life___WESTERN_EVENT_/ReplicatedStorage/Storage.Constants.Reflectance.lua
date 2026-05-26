-- https://lua.expert/
local t = {
	Radiant = {
		Rarity = "Legendary",
		P = 7.5,
		Reflectance = 0.9
	},
	Blinding = {
		Rarity = "Legendary",
		P = 10,
		Reflectance = 0.8
	},
	Shiny = {
		Rarity = "Exclusive",
		P = 20,
		Reflectance = 0.7
	},
	Gleaming = {
		Rarity = "Legendary",
		P = 35,
		Reflectance = 0.6
	},
	Glossy = {
		Rarity = "Legendary",
		P = 50,
		Reflectance = 0.5
	},
	Polished = {
		Rarity = "Legendary",
		P = 35,
		Reflectance = 0.4
	},
	Lustrous = {
		Rarity = "Legendary",
		P = 20,
		Reflectance = 0.3
	},
	Dull = {
		Rarity = "Epic",
		P = 10,
		Reflectance = 0.2
	},
	Matte = {
		Rarity = "Legendary",
		P = 7.5,
		Reflectance = 0.1
	}
}
local t2 = {}
for v1, v2 in t do
	v2.Name = v1
	table.insert(t2, v2)
end
table.sort(t2, function(p1, p2) --[[ Line: 55 ]]
	return p1.Reflectance > p2.Reflectance
end)
return {
	ReflectanceTable = t,
	ReflectanceArray = t2
}