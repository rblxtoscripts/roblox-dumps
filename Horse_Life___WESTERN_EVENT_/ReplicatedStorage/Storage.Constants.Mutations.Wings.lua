-- https://lua.expert/
local tbl = {
	StarryWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Alces = true
		}
	},
	BlizzardWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Alces = true
		}
	},
	WyvernWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Alces = true
		}
	},
	ExtraterrestrialAnomalyWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Equenari = true
		}
	},
	EldritchWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Equenari = true
		}
	},
	MutatedTendrilWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Equenari = true
		}
	},
	FishEyedWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Equenari = true
		}
	},
	FrozenTitanWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Alces = true
		}
	},
	ReaperWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.35,
		P = 7.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	CreatureWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.5,
		P = 10,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	SkeletonWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.5,
		P = 10,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 200,
			FlySpeed = 28,
			FlySprintMultiplier = 1.35
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	SkeletalDragonWing = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.5,
		P = 10,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	TornDragonWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.5,
		P = 10,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	DemonWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0.5,
		P = 10,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Ghoulsteed = true
		}
	},
	ButterflyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Fae = true
		}
	},
	DragonflyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Fae = true
		}
	},
	CutlassWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Fae = true
		}
	},
	BirdWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	NarrowWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 200,
			FlySpeed = 25,
			FlySprintMultiplier = 1.35
		}
	},
	BarredWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 400,
			FlySpeed = 20,
			FlySprintMultiplier = 1.3
		}
	},
	RavenWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 25,
			FlySprintMultiplier = 1.25
		}
	},
	RoundWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.25
		}
	},
	RaptorWing = {
		MaxLevel = 5,
		Strength = 2,
		ExcludeFromDrops = "Peryton",
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.25
		}
	},
	PeacraneWings = {
		MaxLevel = 5,
		Strength = 2,
		ExcludeFromDrops = "Peryton",
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.25
		}
	},
	FlaredWing = {
		MaxLevel = 5,
		Strength = 2,
		ExcludeFromDrops = "Peryton",
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.25
		}
	},
	HummingbirdWings = {
		MaxLevel = 5,
		Strength = 2,
		P = 0.5,
		Stats = {
			FlyStamina = 175,
			FlySpeed = 30,
			FlySprintMultiplier = 1.4
		}
	},
	FantasyWings = {
		ExcludeFromDrops = true,
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	SakuraWings = {
		ExcludeFromDrops = true,
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1.5,
		P = 0,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	PlusherflyWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Plush = true
		}
	},
	GlamPlushWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Plush = true
		}
	},
	DIYPlushWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0.25,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Plush = true
		}
	},
	LilyWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Flora = true
		}
	},
	CloverWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Flora = true
		}
	},
	MantaRayWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Hippocampus = true
		}
	},
	SeahorseWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Hippocampus = true
		}
	},
	MermaidWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Hippocampus = true
		}
	},
	PetalLeafWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Flora = true
		}
	},
	BloomingWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Flora = true
		}
	},
	CloudWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Kirin = true
		}
	},
	ThornWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Kirin = true
		}
	},
	AuricWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Kirin = true
		}
	},
	ScaledWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Kirin = true
		}
	},
	CelestialNovaWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Celestial = true
		}
	},
	LocustWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cactaline = true
		}
	},
	CactusWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cactaline = true
		}
	},
	MidnightDragonWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Celestial = true
		}
	},
	CrescentStardustWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Celestial = true
		}
	},
	SteampunkBatWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cybred = true
		}
	},
	AeroFlapWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cybred = true
		}
	},
	FuturisticWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cybred = true
		}
	},
	FierceWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Felorse = true
		}
	},
	FelineWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Felorse = true
		}
	},
	PlayfulWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Felorse = true
		}
	},
	FluffyPterosaurWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Saurequine = true
		}
	},
	MicroraptorWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Saurequine = true
		}
	},
	AmberMothWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Saurequine = true
		}
	},
	EasterEggWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Wolper = true
		}
	},
	PetalWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Wolper = true
		}
	},
	ElegantScrollWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Carousel = true
		}
	},
	JesterWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Carousel = true
		}
	},
	LookingGlassWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Crystallion = true
		}
	},
	AdornedWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Crystallion = true
		}
	},
	GeodeWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Crystallion = true
		}
	},
	ChandelierWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Crystallion = true
		}
	},
	CircusTentWings = {
		AnimationSet = "Dragon",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Carousel = true
		}
	},
	CarnivalWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Carousel = true
		}
	},
	SpringFairyWings = {
		AnimationSet = "Bug",
		MaxLevel = 5,
		Strength = 1,
		P = 0,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Wolper = true
		}
	},
	CyberWings = {
		MaxLevel = 5,
		Strength = 1,
		P = 1,
		Stats = {
			FlyStamina = 350,
			FlySpeed = 25,
			FlySprintMultiplier = 1.3
		},
		SpeciesWhitelist = {
			Cybred = true
		}
	},
	DrizzleflyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Pastrequine = true
		}
	},
	FrostedWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Pastrequine = true
		}
	},
	DropletWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	BloxfestWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	OvergrownWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	VaporwaveWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LemonadeWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	RainyWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	ShatteredIceWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	DawnFireWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	LEGOWings = {
		DisplayName = "LEGO\194\174Wings",
		ForcedDisplayName = "LEGO\194\174Wings",
		MaxLevel = 5,
		AnimationSet = "Lego",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	ThornedRosettesWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 30,
			FlySprintMultiplier = 1.25
		}
	},
	AngelicWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	RunicWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LunarMothWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	SweetHeartBatWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	GummyDragonWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LovelyFairyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	JewelButterflyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	PhoenixGhostWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Hauntmare = true
		}
	},
	SoulBirdWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Hauntmare = true
		}
	},
	SkeletonSpiderWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Hauntmare = true
		}
	},
	DivineWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Seraph = true
		}
	},
	AngelicalFairyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Seraph = true
		}
	},
	CorruptDivinityWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Seraph = true
		}
	},
	EyeWardenWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Seraph = true
		}
	},
	CorruptedFlameWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Anticorn = true
		}
	},
	FriedChickenWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	MapleMonarchWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	MapleWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	WarWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Anticorn = true
		}
	},
	DarkMagicWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Anticorn = true
		}
	},
	CandyFlossWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	SoftcloudWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	FestiveFeatherWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	CorruptedWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	TwinkleStarWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	FestiveDoubleWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	BorealisWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	AuroraDragonWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	FireworkDragonWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LunarNewYearWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	DangoWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	HeartBreakWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LoveDoveWings = {
		MaxLevel = 5,
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	TatteredGothicWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	HoneybeeWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Honeytrot = true
		}
	},
	EmberhiveWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Honeytrot = true
		}
	},
	FlowingHoneyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Honeytrot = true
		}
	},
	PollinatorWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 1.5,
		P = 0.5,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		},
		SpeciesWhitelist = {
			Honeytrot = true
		}
	},
	BunnyWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		DoNotPassDown = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	FlutteringArcaneWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	FeatheredArcaneWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	LuxuriousButterflyWings = {
		MaxLevel = 5,
		AnimationSet = "Bug",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	WildWings = {
		MaxLevel = 5,
		AnimationSet = "Dragon",
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	},
	SheriffWings = {
		MaxLevel = 5,
		Strength = 0,
		P = 0,
		ExcludeFromDrops = true,
		Stats = {
			FlyStamina = 300,
			FlySpeed = 22,
			FlySprintMultiplier = 1.25
		}
	}
}
local t = {
	Default = {
		Idle = "rbxassetid://16621787910",
		FlyForward = "rbxassetid://16621430533",
		FlyIdle = "rbxassetid://16621704305",
		Dive = "rbxassetid://16621728997",
		Jump = "rbxassetid://16621811733",
		Glide = "rbxassetid://16621863820",
		Stretch = "rbxassetid://16873909911",
		Shuffle = "rbxassetid://16886622794",
		Ruffle = "rbxassetid://16911873660",
		Reach = "rbxassetid://16902028980"
	},
	Bug = {
		Idle = "rbxassetid://18923455492",
		FlyForward = "rbxassetid://18923472453",
		FlyIdle = "rbxassetid://112783181134468",
		Dive = "rbxassetid://79865136029864",
		Jump = "rbxassetid://96990903295178",
		Glide = "rbxassetid://18923486361",
		Stretch = "rbxassetid://90309738285851",
		Shuffle = "rbxassetid://88192046764888",
		Ruffle = "rbxassetid://77129579843111",
		Reach = "rbxassetid://16902028980",
		UPLIFTED_WING_IDLE_ANIMATION = "rbxassetid://96639527463544"
	},
	Dragon = {
		Idle = "rbxassetid://97271997523021",
		FlyForward = "rbxassetid://108259866772395",
		FlyIdle = "rbxassetid://133003301714085",
		Dive = "rbxassetid://140416551552347",
		Jump = "rbxassetid://89066460754697",
		Glide = "rbxassetid://88913255680181",
		Stretch = "rbxassetid://135250516585167",
		Shuffle = "rbxassetid://77667343692418",
		Ruffle = "rbxassetid://86883718191144",
		Reach = "rbxassetid://112888686516929",
		UPLIFTED_WING_IDLE_ANIMATION = "rbxassetid://92817553719394"
	},
	Lego = {
		Idle = "rbxassetid://95816723292197",
		FlyForward = "rbxassetid://116544650748656",
		FlyIdle = "rbxassetid://116544650748656",
		Dive = "rbxassetid://116544650748656",
		Jump = "rbxassetid://120355059880807",
		Glide = "rbxassetid://116544650748656",
		Stretch = "rbxassetid://120355059880807",
		Shuffle = "rbxassetid://120355059880807",
		Ruffle = "rbxassetid://120355059880807",
		Reach = "rbxassetid://120355059880807",
		UPLIFTED_WING_IDLE_ANIMATION = "rbxassetid://120355059880807"
	}
}
for k, v in pairs(tbl) do
	v.Name = k
	v.Type = "Wings"
	v.Animations = t[v.AnimationSet] or t.Default
end
return tbl