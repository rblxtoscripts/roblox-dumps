-- https://lua.expert/
return {
	DisplayName = "NATURE DEITY",
	Scale = 4,
	AttackColor = Color3.new(0, 1, 0.0666667),
	Cosmetics = {
		CoatTop = {
			Colors = "6eff5e",
			Transparency = 0.25,
			Materials = Enum.Material.Neon
		},
		CoatBottom = {
			Colors = "76ff6f",
			Materials = Enum.Material.Neon
		},
		Sock = {
			Colors = "a6ff98",
			Materials = Enum.Material.ForceField
		},
		Hair = {
			Colors = "8aff75",
			Materials = Enum.Material.ForceField
		},
		Nose = {
			Colors = "60ff55",
			Materials = Enum.Material.Neon
		},
		Hoof = {
			Colors = "a6ff98",
			Materials = Enum.Material.Neon
		},
		Eyes = {
			Colors = "92FF54",
			Materials = Enum.Material.Neon
		},
		Keratin = {
			Colors = "a6ff98",
			Materials = Enum.Material.Neon
		},
		Pattern = {
			Colors = "68ff57",
			Materials = Enum.Material.Neon
		},
		Paint = {
			Colors = "a6ff98",
			Materials = Enum.Material.Neon
		},
		Cosmetic = {
			Colors = "a6ff98",
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
	},
	HealthMessages = {
		[100] = "The forest stirs\226\128\166 Who dares approach this sacred place?",
		[50] = "You are not yet worthy\226\128\166 but I will test your spirit.",
		[25] = "The balance weakens\226\128\166 prove your intent!",
		[0] = "You have shown respect\226\128\166 take this blessing, and grow stronger."
	}
}