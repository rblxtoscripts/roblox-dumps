-- https://lua.expert/
return {
	DisplayName = "WINTER SPIRIT",
	Scale = 10,
	AttackColor = Color3.new(102/255, 204/255, 255/255),
	Cosmetics = {
		CoatTop = {
			Colors = "bfe9ff",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "7dd3fc",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "38bdf8",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "60a5fa",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "bae6fd",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "0ea5e9",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "e0f2fe",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "93c5fd",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "7dd3fc",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "a5f3fc",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "3b82f6",
			Materials = Enum.Material.ForceField
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