-- https://lua.expert/
return {
	DisplayName = "HEART DEITY",
	Scale = 4.5,
	AttackColor = Color3.new(0.8, 0, 0.3),
	SpawnSpecies = {
		{
			Species = "Pastrequine",
			P = 1
		},
		{
			Species = "Heartbane",
			P = 1
		}
	},
	Cosmetics = {
		CoatTop = {
			Colors = "AF284D",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "C74777",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "7B2BBE",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "A863F1",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "E21D69",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "5A199B",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "FF00B2",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "7B2BBE",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "D35BE5",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "5A199B",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "824D7D",
			Materials = Enum.Material.ForceField
		}
	},
	Particles = {
		ByParticle = {
			{
				Particle = "Nature",
				Parts = { "Head", "MiddleBody", "Foot", "Hand", "Paw" }
			}
		}
	}
}