-- https://lua.expert/
return {
	DisplayName = "WITCH QUEEN",
	Scale = 10,
	AttackColor = Color3.new(1, 0, 0.298039),
	Cosmetics = {
		CoatTop = {
			Colors = "a855f7",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "8b32d9",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "5a1f91",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "4b0e85",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "a142f2",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "822ad6",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "b066ff",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "c084fc",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "9333ea",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "bb72ff",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "7e22ce",
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