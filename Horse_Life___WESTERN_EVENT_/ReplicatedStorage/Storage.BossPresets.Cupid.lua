-- https://lua.expert/
return {
	DisplayName = "CUPID",
	Scale = 10,
	AttackColor = Color3.new(1, 0, 0.298039),
	Cosmetics = {
		CoatTop = {
			Colors = "D35BE5",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "A863F1",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "EBC8FE",
			Materials = Enum.Material.Neon
		},
		Hair = {
			Colors = "CFB8FC",
			Materials = Enum.Material.Neon
		},
		Nose = {
			Colors = "FF00B2",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "7B2BBE",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "FFBCDC",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "E0AAFE",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "E21D69",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "C67DFF",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "EBC8FE",
			Materials = Enum.Material.Neon
		}
	},
	Particles = {
		ByParticle = {
			{
				Particle = "FireGlow",
				"FireSparks",
				Parts = { "Head", "MiddleBody", "Foot", "Hand", "Paw" }
			}
		}
	}
}